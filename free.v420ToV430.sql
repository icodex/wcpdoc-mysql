INSERT INTO `alone_app_version` VALUES ('v4.2.0',  now(), 'USERNAME');
INSERT INTO `alone_app_version` VALUES ('v4.2.4',  now(), 'USERNAME');
CREATE INDEX RFDTF_FILEID ON FARM_RF_DOCTEXTFILE(`FILEID`) USING BTREE;
CREATE INDEX RFDTF_TEXTID ON FARM_RF_DOCTEXTFILE(`TEXTID`) USING BTREE;
CREATE INDEX DOC_TEXTID ON FARM_DOC(`TEXTID`) USING BTREE;
INSERT INTO `alone_app_version` VALUES ('v4.3.1',  now(), 'USERNAME');
INSERT INTO `alone_auth_action` VALUES ('4028b8816a8194fe016a82117bce1209', 'farmdocenjoy/list', '用户关注收藏', null, '20190504165905', '20190504165905', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '1', '1');
INSERT INTO `alone_auth_actiontree` VALUES ('4028b8816a8194fe016a82117bcf120a', '97', '40288b854a38974f014a38be1805002c', '用户关注收藏', '40288b854a38974f014a38be1805002c4028b8816a8194fe016a82117bcf000a', '', '2', '20190504165905', '20190504165905', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '4028b8816a8194fe016a82117bce0009', 'alone', 'icon-star', null, '');
create table FARM_MESSAGE_BEAN
(
   ID                   varchar(32) not null,
   BEANTITLE            varchar(128) not null,
   BEANKEY              varchar(128) not null,
   MODELID              varchar(32) not null,
   primary key (ID)
);

ALTER TABLE FARM_MESSAGE_BEAN ENGINE=InnoDB;
ALTER TABLE FARM_MESSAGE_MODEL ENGINE=InnoDB;
alter table FARM_MESSAGE_BEAN add constraint FK_Reference_851 foreign key (MODELID)
      references FARM_MESSAGE_MODEL (ID) on delete restrict on update restrict;

/*==============================================================*/
/* Table: FARM_BOOKMARK                                         */
/*==============================================================*/
create table FARM_BOOKMARK
(
   ID                   varchar(32) not null,
   PSTATE               varchar(2) not null,
   PCONTENT             varchar(128),
   TYPE                 varchar(1) not null comment '1:doc,2:fqa,3.type',
   APPID                varchar(32) not null,
   APPNAME              varchar(256) not null,
   BOOKNUM              int not null,
   primary key (ID)
);

create table FARM_BOOKMARK_USER
(
   ID                   varchar(32) not null,
   USERID               varchar(32) not null,
   USERNAME             varchar(32) not null,
   BOOKTYPE             varchar(1) not null,
   BOOKTIME             varchar(16) not null,
   BOOKMARKID           varchar(32) not null,
   primary key (ID)
);

alter table FARM_BOOKMARK_USER add constraint FK_Reference_861 foreign key (BOOKMARKID)
      references FARM_BOOKMARK (ID) on delete restrict on update restrict;
INSERT INTO `alone_app_version` VALUES ('v4.3.3',  now(), 'USERNAME');
ALTER TABLE FARM_DOCTYPE ADD MANAGEPOP VARCHAR(1) NOT NULL;
ALTER TABLE FARM_DOCTYPE ADD SHOWMODEL VARCHAR(1) NOT NULL;
UPDATE FARM_DOCTYPE SET MANAGEPOP='3';
UPDATE FARM_DOCTYPE SET SHOWMODEL='1';
ALTER TABLE FARM_DOC ADD DESCRIBETYPE VARCHAR(1) NOT NULL;
UPDATE FARM_DOC SET DESCRIBETYPE='1';
ALTER TABLE FARM_DOC ADD DOCPOPIS VARCHAR(1) NOT NULL;
UPDATE FARM_DOC SET DOCPOPIS='0';
drop table if exists FARM_DOC_POP;
create table FARM_DOC_POP
(
   ID                   varchar(32) not null,
   CTIME                varchar(16) not null,
   PSTATE               varchar(2) not null,
   USERID               varchar(32) not null,
   TYPE                 varchar(1) not null comment '1:READ',
   CUSER                varchar(32) not null,
   DOCID                varchar(32) not null,
   primary key (ID)
);
create table FARM_DOC_SPECIALTYPE
(
   ID                   varchar(32) not null,
   CTIME                varchar(16) not null,
   ETIME                varchar(16) not null,
   CUSERNAME            varchar(64) not null,
   CUSER                varchar(32) not null,
   PSTATE               varchar(2) not null,
   PCONTENT             varchar(128),
   SORT                 int not null,
   PARENTID             varchar(32) not null,
   NAME                 varchar(32) not null,
   TREECODE             varchar(256) not null,
   SPECIALID            varchar(32) not null,
   primary key (ID)
);
ALTER TABLE FARM_DOC_SPECIAL ENGINE=InnoDB;
ALTER TABLE FARM_DOC_SPECIALLIST ENGINE=InnoDB;
ALTER TABLE FARM_DOC_SPECIALTYPE ENGINE=InnoDB;
alter table FARM_DOC_SPECIALTYPE add constraint FK_Reference_s87 foreign key (SPECIALID)
      references FARM_DOC_SPECIAL (ID) on delete restrict on update restrict;
ALTER TABLE FARM_DOC_SPECIALLIST ADD TYPEID VARCHAR(32);
alter table FARM_DOC_SPECIALLIST add constraint FK_Reference_s88 foreign key (TYPEID)
      references FARM_DOC_SPECIALTYPE (ID) on delete restrict on update restrict;      
ALTER TABLE FARM_DOC_SPECIAL ADD DOCTYPEID VARCHAR(32);      

INSERT INTO `alone_auth_action` VALUES ('4028b8816b352fa8016b3660a1a601cc', 'user/chooseUser', '选择用户', '', '20190608171710', '20190608171710', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '0', '1');
INSERT INTO `alone_auth_action` VALUES ('4028b8816b366111016b3664ebb30002', 'user/query', '查询用户', '', '20190608172152', '20190608172152', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '0', '1');
INSERT INTO `alone_auth_action` VALUES ('4028b8816b366557016b3666da4b002a', 'organization/chooseOrg', '选择组织机构', '', '20190608172358', '20190608172358', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '0', '1');
INSERT INTO `alone_auth_action` VALUES ('4028b8816b366557016b3667b48a002b', 'organization/organizationTree', '查询组织机构树', '', '20190608172454', '20190608172454', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '0', '1');
INSERT INTO `alone_auth_action` VALUES ('4028b8816b366557016b36682d08002c', 'post/choosePost', '选择岗位', '', '20190608172525', '20190608172525', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '0', '1');
INSERT INTO `alone_auth_action` VALUES ('4028b8816b366557016b3668a27c002d', 'post/query', '查询岗位', '', '20190608172555', '20190608172555', '40288b854a329988014a329a12f30002', '40288b854a329988014a329a12f30002', '1', '0', '1');
update alone_auth_action set CHECKIS='0' where AUTHKEY='docgroup/query';
INSERT INTO `alone_app_version` VALUES ('v4.3.7',  now(), 'USERNAME');
ALTER TABLE FARM_DOCFILE_TEXT ADD INDEXED VARCHAR(1) NOT NULL;
UPDATE FARM_DOCFILE_TEXT SET INDEXED='2';
ALTER TABLE FARM_WDA_CONVERTLOG ADD APPID VARCHAR(32);
INSERT INTO `alone_app_version` VALUES ('v4.3.9',  now(), 'USERNAME');

Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5072C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 11:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95B3C21781
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 11:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AkXyVH6h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfK1Lqv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 06:46:51 -0500
Received: from mail-eopbgr40052.outbound.protection.outlook.com ([40.107.4.52]:50821
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726227AbfK1Lqv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 06:46:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE6MCtsm35DZAOxmNuD9wNcKhCAQrLaq2s5Y51yW/PNOsGob3Cx42HbDcnLgXgR/Xs0eKJwdlzuSRMcjZIJYqHyhDaaGmyxvEww7aV0I0Y0IUHAktWvxYTK67yYD0l95GTRHxtXOrg3uvRuHdAHv3r2yLiYgQdp+1loOGJX/UMoS27a6+SfDjdaS8Ls30QBBV8LvCQA4KrOeia9NTQQpQeiGM1H/LADWkNY3RbjjacwUb6Wda1A3L+PwTOW9aK8UtP1aQK3UJqF8IL46/PxnebUB+itIl2mX9Saj5fsQWtmm4c7I/nP+HPc9scX+c+MOxJBx/2veU8SbWIkcVwx1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkug4S0WjyWhtIATqVSRIuKToZSTKea2yXxxN3co034=;
 b=F+EM57BS3OTlpqTcV7HjctrIp3rZ8oYlFRUK0heADohIK0zNtRvWNteXI5yVF29uAxhK2BcEOjR3z8pAdO4O3T4BpuLyI2eEE8FM6VZDkpadfp7zZtAQXq2Y0fYkeDImnRF/P6xSy02CpNrJysoMQpLHpH48a8M/36oZhTY6iVe9o0pLSp24w5xkmwuVUgIeqU+ZMls7dzYSR/51yokn5fiqJfWOAFzXDkeyhvRHKoSk6MUHOAuBMZ42+RJLDcY6NUjbxEMnikEUJ1DN4AVfIQ5yOGgrrhn8TdeHELBk1zePbkMX0RDG/OGLG9S1rHVmAw+Ks4FOXiSstm/KR1rzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkug4S0WjyWhtIATqVSRIuKToZSTKea2yXxxN3co034=;
 b=AkXyVH6hR3aiZfHsHEc59g7EJWZh7sinr/yu6SelW2xiNHxtewJ7n3Y7ldBruVpfqq0QskKWeyUS91R4NBwYC4EN1SdBMdj2qb1DEHZ9ctHm7IVnvAPy4u19nOxAK5orLJmyELFNvVPk8VACgj5irlJsGS+eLpu9ed9oR6DEfpE=
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com (52.134.65.158) by
 DB3PR0402MB3690.eurprd04.prod.outlook.com (52.134.70.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 28 Nov 2019 11:46:47 +0000
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::3846:d70b:d3ae:8e8]) by DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::3846:d70b:d3ae:8e8%4]) with mapi id 15.20.2474.023; Thu, 28 Nov 2019
 11:46:47 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: add missing SAI nodes
Thread-Topic: [PATCH 1/2] arm64: dts: imx8mq: add missing SAI nodes
Thread-Index: AQHVpU9/qaHQ97zK9kWLFSNZyy0BHaegeGiA
Date:   Thu, 28 Nov 2019 11:46:47 +0000
Message-ID: <25f2c1ed14116f70ab5cdcf2223df798de8bfb34.camel@nxp.com>
References: <20191127182127.1204-1-l.stach@pengutronix.de>
In-Reply-To: <20191127182127.1204-1-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5f0147e-5d06-4506-6c87-08d773f8a67d
x-ms-traffictypediagnostic: DB3PR0402MB3690:|DB3PR0402MB3690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3690D408C4E7D808F8DAF2F8F9470@DB3PR0402MB3690.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(189003)(199004)(2616005)(71190400001)(66476007)(186003)(64756008)(14454004)(558084003)(6116002)(4326008)(66556008)(2906002)(478600001)(11346002)(71200400001)(76116006)(76176011)(6506007)(66446008)(25786009)(3846002)(446003)(102836004)(44832011)(26005)(5660300002)(110136005)(81166006)(66066001)(86362001)(316002)(54906003)(81156014)(66946007)(7736002)(118296001)(305945005)(50226002)(91956017)(8676002)(256004)(229853002)(99286004)(36756003)(6436002)(6512007)(4001150100001)(6246003)(2501003)(8936002)(6486002)(99106002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3690;H:DB3PR0402MB3835.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IZQmtDoBwQEO8PJ3lBfF8lIkXznb+XD9i0riQDPvQ8xT7zWAa/acw/RnaS/YBNWIrlQ5mQ2SRB+Gp/4AuYQm0KBYi5TMMbXl7B2WMCVo6jMGR5G3z34lpv/t7Um/GjIQUCVAKr39nnZlG41kVzGdo1zWmqlOg231FG5WnSY/dUPAfKHuC5fqfnOmy5T99cBgomZOyfaXRPMIA92JusH6wg8dS0JCfsqL/NVvxTF7lpw5mpZzehxCYLK0IOmLbdkRFbbuWg52LeBpEC0/KvFcmFXNnto5tJBj52IKAOnO//dTlDdAhRt4WHBYauAWQKxTGCQG2AJrIyUZjaWha4fkHNWzgmrevq6VT9qq35wBzMq99Uhe7uvgVYcQVd5qNmFj2dsyWltG49W9jIuJxsUFEaHK4M9Hk9BY9hkwJyGaE2EM5C37YGMPrBptb9o1Rxdj
Content-Type: text/plain; charset="utf-8"
Content-ID: <9631EBCACEFA4C4BB2E29DF7248E9670@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f0147e-5d06-4506-6c87-08d773f8a67d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 11:46:47.6197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/IblFnGgh13ZO0lkKWXQpbviiRwBAwNtfvb/xu8ot3YI6SZe2XqS0bx8v4CZ+5B8EAY+HvOFaMtszy5zk3W6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3690
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTExLTI3IGF0IDE5OjIxICswMTAwLCBMdWNhcyBTdGFjaCB3cm90ZToNCj4g
Q3VycmVudGx5IG9ubHkgU0FJMiBpcyBwcmVzZW50IGluIHRoZSBEVC4gQWRkIGFsbCB0aGUgb3Ro
ZXIgU0FJDQo+IGluc3RhbmNlcyBwcmVzZW50IG9uIHRoZSBTb0MuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4NCg0KUmV2aWV3ZWQtYnk6
IERhbmllbCBCYWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4NCg0K

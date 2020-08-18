Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79D8C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 01:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 661892053B
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 01:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="o6tmiVsA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgHRBAS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 21:00:18 -0400
Received: from mail-am6eur05on2062.outbound.protection.outlook.com ([40.107.22.62]:34912
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726135AbgHRBAP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Aug 2020 21:00:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csQw0Iylk0xuTNNreNPi/czYOg/yjgUwmiGrSrQ27EUxa/khRifbNCFQnabchI945EQfEHD28PXHUmrOQH2T84L+b1d4szeQtaY6404bIHpk+U+QUbty8hjLTL/8DKqJN02mBxRYtk8X/e9w85D/+KTQo4bnb4SY74BWDmPPI7dsXCQSeeOWnKxV5qPPXVi6o1SAu8vg4QxXGf5YOjJk26z7uCb5l7oHB/so8OcpGSlINEE70lHKpyjNdjm01GssimJLofgmlVqhJMGYgJY1shESH7ZvMRcEGDMRjls2Qbs1La65OrJW//cNbLVeQqZW8iaTUNg4GHI80M55n3SGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFUfNnXIMZb8u50nlS3AZ/l/ELT0hVLe+4FBE0Fu2SI=;
 b=oHPDmmiAZTCHlKzcvo0MsqF2cMOiNeDjozZtnl0bbSe0UXDxg2XXDHjv9/HeaYBH9x4xjyC5yELqwNwiYfNZscD9vUQqWNzhVp64WkX5y3eIq/quBnRC7qE+uAHIKCslrgtzXcsAGQZP7I8pbu5iwY3Qk3tSAE4BskCy3hWEfXkToQA7BmEKbeXxEULd2B5zT3sBeq1mcC51V2lSmmKd4QusbdMwYGunxfCAW+g37ier5uQUWFyMSigQM4RhcBOPAD+Hm92CessVAm+iomaYSJQbE9nk7oTaDNg3QL9ZePBvptO4VnzdaKvA4ECtY/pMMueS+c4ENB/UFcbsXbFkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFUfNnXIMZb8u50nlS3AZ/l/ELT0hVLe+4FBE0Fu2SI=;
 b=o6tmiVsAl1CpstJFvKi7YnuaEQs1Je+9TTyArG5BLNFC77GitGkgjgiKfHUMUL2weBnP275RS6XlMBKmmotj6jEw0UAl1NGpCVbQimlRuJRLXS9+y/VOp7wbXYSF/SUTBWvnmauCLjCJcy86tUgbX+MXZCGVIAC4ThObl3LdhOg=
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 01:00:10 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::ed9d:4503:443a:3f4f%5]) with mapi id 15.20.3283.027; Tue, 18 Aug 2020
 01:00:10 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board support
Thread-Topic: [PATCH 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board
 support
Thread-Index: AQHWZKskj+IOA/fFIEWfxpXxpSSkcqk9K3Sw
Date:   Tue, 18 Aug 2020 01:00:10 +0000
Message-ID: <AM0PR04MB491520219D2E738EF5F3372C875C0@AM0PR04MB4915.eurprd04.prod.outlook.com>
References: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
 <1595918641-2325-3-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1595918641-2325-3-git-send-email-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a7ca1516-7fd3-42de-299e-08d843120e9a
x-ms-traffictypediagnostic: AM0PR04MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6324427B5E9EDB7E226CD4DA875C0@AM0PR04MB6324.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfTeKID2mKeXNJ4KkP9NFamDLpQqTTofInUS19VSCIUstUlV/nCZZoWcwGlG3lcNYvqT8isHuA8s+iVa3qgRp5ZJdEDafHntV+DZgKGRzG2qj6++7CJrm9uG/0ZJQwlmSStbdiMh6z6m7As54Wk1+LUFsCQjmYkxXfpdVU/6KUzic6eJRs8uEg9+FS0+yQca1HmdABVamXQwD+Zx5ffw4CUH1N25dvmpAdXAuR7zMCjM1VrOdDUmIXl8HxWpVdXgY6S53Dhfw9GDL+fdtD0Z1elhBrzmuQw3p4ESBaB5XCvikdTOsIAfz7gXaYnBit9hmImVLOmtHu/M8jaBl/5qCIHz0QXAtTO+dkfmNLK85RGG/IOgoFC8YEmPC6a2zjmV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(83380400001)(8676002)(4326008)(8936002)(55016002)(110136005)(53546011)(6506007)(316002)(2906002)(186003)(86362001)(64756008)(26005)(66476007)(66446008)(66946007)(66556008)(76116006)(52536014)(54906003)(33656002)(5660300002)(7696005)(9686003)(478600001)(71200400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3l2cGm2Pe8iLWSsj2s79fRMZWm8VZaCemZBodug7CuhrQWupoczch1JroYmcyLVZo6NS/FaQDBG+dllj2ybGYjbcrKYUmk7Grd+Gxu+YWaDewk2nQI/9YvxFduHcKm8QbyNNU8k+N4gtzxghPwuKd+poQEL36Q++ASJRs0bFEZqOz7GkhIztAjxvPZ1+vESkqwiRJMJl/ze4GwRL71RJ9w2w5h0xIvOSLBiBWOaz7RGxCkRCWKQE1iLko2y7zLhTCFmjcnSn6kYdOniwWLmA3JDd6Pz8xojI6IKI+iKnMq0SHnEinTRr7MIv1yU5rFTCWED0+Ff8YAOXpoedJKbEzQJdWbXE4cHAru7I/ScukLt8aHy8bM9mzlo2jxnGWlB6l8Oiz/1c8w3be8PXGGHf4zgK6xaXu/5COwX9BtXVApF5ns3eNNb+tt2yjP1bBlLXJfg+mCZNa32PHA7FZr+SknKVNfrmMNgr0z+SRZol39llZzYIpAgrPG6lIFPB+3uXdKdZz2MKJzN5+jSvK3kuqxrXuc9smN2WzZoEXGifiIT3BxqxCTqCNZQqS/qgFJgwI1UMR467M6VZlBn6m0jUryvgqBjOPNpS0Hin29ImnA+j4Mqo8B2XvWOsbfyZpS67pXtWbywYXshuraU+8ywkkQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ca1516-7fd3-42de-299e-08d843120e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 01:00:10.5332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idatqbF+8Z/7aubZuzKCVlqFfyZiH9VA+ifnHoOIU2Loap3H67dXjFwsrKsGIZl4ZvfijUpEqraYb2M0eJPu4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6324
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

R2VudGxlIFBpbmcuLi4NCg0KDQpCUg0KSmFja3kgQmFpDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IEphY2t5IEJhaQ0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDI4LCAyMDIw
IDI6NDQgUE0NCj4gVG86IHJvYmgrZHRAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsg
cy5oYXVlckBwZW5ndXRyb25peC5kZQ0KPiBDYzogZmVzdGV2YW1AZ21haWwuY29tOyBrZXJuZWxA
cGVuZ3V0cm9uaXguZGU7IGRsLWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+OyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSBhcm02NDogZHRz
OiBpbXg4bW06IEFkZCBpbXg4bW0gZGRyNCBldmsgYm9hcmQNCj4gc3VwcG9ydA0KPiANCj4gQWRk
IHRoZSBib2FyZCBkdHMgc3VwcG9ydCBmb3IgaS5NWDhNTSBERFI0IEVWSyBib2FyZC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEphY2t5IEJhaSA8cGluZy5iYWlAbnhwLmNvbT4NCj4gLS0tDQo+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZSAgICAgICAgfCAgMSArDQo+ICAu
Li4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1kZHI0LWV2ay5kdHMgICAgfCA3Nw0KPiArKysr
KysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKykNCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0t
ZGRyNC1ldmsuZHRzDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvTWFrZWZpbGUNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmls
ZQ0KPiBpbmRleCBhMzlmMGExNzIzZTAuLjQxN2M1NTI0ODBmMiAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gQEAgLTI5LDYgKzI5LDcgQEAgZHRiLSQoQ09O
RklHX0FSQ0hfTEFZRVJTQ0FQRSkgKz0NCj4gZnNsLWx4MjE2MGEtcWRzLmR0Yg0KPiAgZHRiLSQo
Q09ORklHX0FSQ0hfTEFZRVJTQ0FQRSkgKz0gZnNsLWx4MjE2MGEtcmRiLmR0Yg0KPiANCj4gIGR0
Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OG1tLWV2ay5kdGINCj4gK2R0Yi0kKENPTkZJR19B
UkNIX01YQykgKz0gaW14OG1tLWRkcjQtZXZrLmR0Yg0KPiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhD
KSArPSBpbXg4bW4tZXZrLmR0Yg0KPiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBpbXg4bW4t
ZGRyNC1ldmsuZHRiDQo+ICBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtcC1ldmsuZHRi
IGRpZmYgLS1naXQNCj4gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tZGRy
NC1ldmsuZHRzDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLWRkcjQt
ZXZrLmR0cw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjlj
ZDg5MTgyMjE4ZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhtbS1kZHI0LWV2ay5kdHMNCj4gQEAgLTAsMCArMSw3NyBAQA0KPiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+ICsvKg0KPiArICogQ29weXJpZ2h0
IDIwMjAgTlhQDQo+ICsgKi8NCj4gKw0KPiArL2R0cy12MS87DQo+ICsNCj4gKyNpbmNsdWRlICJp
bXg4bW0tZXZrLmR0c2kiDQo+ICsNCj4gKy8gew0KPiArCW1vZGVsID0gIkZTTCBpLk1YOE1NIERE
UjQgRVZLIHdpdGggQ1lXNDM0NTUgV0lGSS9CVCBib2FyZCI7DQo+ICsJY29tcGF0aWJsZSA9ICJm
c2wsaW14OG1tLWRkcjQtZXZrIiwgImZzbCxpbXg4bW0iOw0KPiArDQo+ICsJbGVkcyB7DQo+ICsJ
CXBpbmN0cmwtMCA9IDwmcGluY3RybF9ncGlvX2xlZF8yPjsNCj4gKw0KPiArCQlzdGF0dXMgew0K
PiArCQkJZ3Bpb3MgPSA8JmdwaW8zIDQgR1BJT19BQ1RJVkVfTE9XPjsNCj4gKwkJfTsNCj4gKwl9
Ow0KPiArfTsNCj4gKw0KPiArJmRkcmMgew0KPiArCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmRk
cmNfb3BwX3RhYmxlPjsNCj4gKw0KPiArCWRkcmNfb3BwX3RhYmxlOiBvcHAtdGFibGUgew0KPiAr
CQljb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMtdjIiOw0KPiArDQo+ICsJCW9wcC0yNU0g
ew0KPiArCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwyNTAwMDAwMD47DQo+ICsJCX07DQo+ICsNCj4g
KwkJb3BwLTEwME0gew0KPiArCQkJb3BwLWh6ID0gL2JpdHMvIDY0IDwxMDAwMDAwMDA+Ow0KPiAr
CQl9Ow0KPiArDQo+ICsJCW9wcC02MDBNIHsNCj4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NjAw
MDAwMDAwPjsNCj4gKwkJfTsNCj4gKwl9Ow0KPiArfTsNCj4gKw0KPiArJmdwbWkgew0KPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2dwbWlf
bmFuZF8xPjsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICsJbmFuZC1vbi1mbGFzaC1iYnQ7DQo+
ICt9Ow0KPiArDQo+ICsmaW9tdXhjIHsNCj4gKwlwaW5jdHJsX2dwbWlfbmFuZF8xOiBncG1pLW5h
bmQtMSB7DQo+ICsJCWZzbCxwaW5zID0gPA0KPiArCQkJTVg4TU1fSU9NVVhDX05BTkRfQUxFX1JB
V05BTkRfQUxFDQo+IAkweDAwMDAwMDk2DQo+ICsJCQlNWDhNTV9JT01VWENfTkFORF9DRTBfQl9S
QVdOQU5EX0NFMF9CDQo+IAkweDAwMDAwMDk2DQo+ICsJCQlNWDhNTV9JT01VWENfTkFORF9DRTFf
Ql9SQVdOQU5EX0NFMV9CDQo+IAkweDAwMDAwMDk2DQo+ICsJCQlNWDhNTV9JT01VWENfTkFORF9D
TEVfUkFXTkFORF9DTEUNCj4gCTB4MDAwMDAwOTYNCj4gKwkJCU1YOE1NX0lPTVVYQ19OQU5EX0RB
VEEwMF9SQVdOQU5EX0RBVEEwMA0KPiAJMHgwMDAwMDA5Ng0KPiArCQkJTVg4TU1fSU9NVVhDX05B
TkRfREFUQTAxX1JBV05BTkRfREFUQTAxDQo+IAkweDAwMDAwMDk2DQo+ICsJCQlNWDhNTV9JT01V
WENfTkFORF9EQVRBMDJfUkFXTkFORF9EQVRBMDINCj4gCTB4MDAwMDAwOTYNCj4gKwkJCU1YOE1N
X0lPTVVYQ19OQU5EX0RBVEEwM19SQVdOQU5EX0RBVEEwMw0KPiAJMHgwMDAwMDA5Ng0KPiArCQkJ
TVg4TU1fSU9NVVhDX05BTkRfREFUQTA0X1JBV05BTkRfREFUQTA0DQo+IAkweDAwMDAwMDk2DQo+
ICsJCQlNWDhNTV9JT01VWENfTkFORF9EQVRBMDVfUkFXTkFORF9EQVRBMDUNCj4gCTB4MDAwMDAw
OTYNCj4gKwkJCU1YOE1NX0lPTVVYQ19OQU5EX0RBVEEwNl9SQVdOQU5EX0RBVEEwNg0KPiAJMHgw
MDAwMDA5Ng0KPiArCQkJTVg4TU1fSU9NVVhDX05BTkRfREFUQTA3X1JBV05BTkRfREFUQTA3DQo+
IAkweDAwMDAwMDk2DQo+ICsJCQlNWDhNTV9JT01VWENfTkFORF9SRV9CX1JBV05BTkRfUkVfQg0K
PiAJMHgwMDAwMDA5Ng0KPiArCQkJTVg4TU1fSU9NVVhDX05BTkRfUkVBRFlfQl9SQVdOQU5EX1JF
QURZX0INCj4gCTB4MDAwMDAwNTYNCj4gKwkJCU1YOE1NX0lPTVVYQ19OQU5EX1dFX0JfUkFXTkFO
RF9XRV9CDQo+IAkweDAwMDAwMDk2DQo+ICsJCQlNWDhNTV9JT01VWENfTkFORF9XUF9CX1JBV05B
TkRfV1BfQg0KPiAJMHgwMDAwMDA5Ng0KPiArCQk+Ow0KPiArCX07DQo+ICsNCj4gKwlwaW5jdHJs
X2dwaW9fbGVkXzI6IGdwaW9sZWQyZ3JwIHsNCj4gKwkJZnNsLHBpbnMgPSA8DQo+ICsJCQlNWDhN
TV9JT01VWENfTkFORF9DRTNfQl9HUElPM19JTzQJMHgxOQ0KPiArCQk+Ow0KPiArCX07DQo+ICt9
Ow0KPiAtLQ0KPiAyLjI2LjINCg0K

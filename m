Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F394DC43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDB4420726
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 11:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="h6qKPsh1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfLJLKj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 06:10:39 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com ([40.107.8.115]:49381
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727178AbfLJLKj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 06:10:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpU6HBDJA6YK+F4CGFUcv4zXQCydr9cz/xO8tG48GY0cb2A0DVBC3uF03rgQC3yuD1b6PiFAroKSLovNgyeWSRhUJ5io080Nmc01+SoG87iCjpC6QUxppSmCJVXiar+OhjpoRtr1Qx3valkJwkckqqSt/R8DRC1dLrmzLcIg2XwwSoqw8Rhg9vhm9j2mZ9I/5sYNocj3W/eAcuVhKISzzYsWrEDuTgiMDDDhRrzfsGU2cKaO78meOA/zer0CmZfBIsEfvGySaqC/YWCsQXAYwKfIZFUlG+rfDqLUrY4zZyC5Mg68gitrQeWqVYyMZIduSoDVYzMFWn0fAvNX9aqLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLNeqOHUDq1XlI+vy0sHgteCb8urMqTBC/pwNO9Iu08=;
 b=C6WkC1WZki0Kgm/wE6hEZmsTR3jPmvOqsmUXvdRyadYhE7HN871+RqvwAwaa0qrOX0kslNtYJBYERzB2ZgxsyyUH0naLe/lUXNI4X0igTCZbubB8/i0+A7lkLdacCjLq8dXBRpywGFMJn5nO+7QR1g9nbRaF6KzbYdYcuX6c3znYz0SS95sk2Qz8w/3ETqCkDdP+SJs1XNTIgnWBJhml6rBxH7mYbS07fFRkB0j3dv1DrbNoRXjY78qzXNJd1HC5AKrrnDY8uKMaFBh0XMVBUa3PIFuLj9/1FYvVQyx2zAEznt8o+8WKFdC587Giw01QtkNElawnWjeQ7x0qO6tFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLNeqOHUDq1XlI+vy0sHgteCb8urMqTBC/pwNO9Iu08=;
 b=h6qKPsh1AxbFHC+E+l0b8QXK1qJGiE6X0GcElh+p8VvBg8KoQbdc8nh1u1sewG+waE4Z9yNkLxG0bXgq2YBW3KAEzMuLEjyhBvcJiA4ttWo49yr0+uGlYCQrlQDsMObwLlv7nlIhZFDqdQRpL/x7RMiARhJTiyTJFrV8IK9+gB0=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3564.eurprd02.prod.outlook.com (52.134.72.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.16; Tue, 10 Dec 2019 11:10:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::446e:c4f8:7e59:1c6d%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 11:10:33 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH] dt-bindings: arm: Remove leftover axentia.txt
Thread-Topic: [PATCH] dt-bindings: arm: Remove leftover axentia.txt
Thread-Index: AQHVn7KYRtbuNJhxzU6zeDV2d4GH06ezU76AgAABswA=
Date:   Tue, 10 Dec 2019 11:10:33 +0000
Message-ID: <0ea488f6-adf9-d2fe-ef55-373a70cf04fe@axentia.se>
References: <20191120145536.17884-1-robh@kernel.org>
 <20191210110419.GI1463890@piout.net>
In-Reply-To: <20191210110419.GI1463890@piout.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0401CA0056.eurprd04.prod.outlook.com
 (2603:10a6:3:19::24) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b846e1d3-b9d8-40ff-2282-08d77d619365
x-ms-traffictypediagnostic: DB3PR0202MB3564:
x-microsoft-antispam-prvs: <DB3PR0202MB35642E60126BE69EF213B92DBC5B0@DB3PR0202MB3564.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39830400003)(136003)(366004)(396003)(376002)(189003)(199004)(4326008)(8936002)(81166006)(81156014)(71200400001)(6486002)(6512007)(26005)(110136005)(54906003)(6506007)(53546011)(86362001)(31696002)(186003)(8676002)(66556008)(66946007)(66476007)(64756008)(66446008)(316002)(2616005)(52116002)(36756003)(508600001)(2906002)(31686004)(4001150100001)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3564;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oOWfXMPwoiAPl1WnkCfgvOyTtl13YZPbQ5udTv+iB7B9+ey8qUbUv5gq16YpYEptO34YuOCNoJ4XSNzonseTACA7vB7nNBlj8NBeUHe1OjhTVWSZUTWXmDj2O5Q54jk2+GVy5DozieBzvdu3Z7ILRMjHuJq+sNVmMbxb4ZxNQptQ7si0iKKQbQPm4LEdW/U72zth66si4SX/AtPg7F9rxz/2uqjTSXX3u+q3L+Z/Emj4seK/YlJcOKt8OgSitftOxftWqY6wbb1KkQZmfLDTXHmKIkvnGdB81SMyrWLCR32Oqzwyhbl4rK9EbhWB0j6oyjrYHkp2hUxnnKnSS64lcnpummjjdtsSEBLNUL2Xl7lLfnEKfLgT92341WYVn132CCgkR8B3S/xvG55h6CnD178eRFyBH76Z2xc/QH3ei8pTCFKTsSFCtH1sY7r+c4TT
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <684E8A02BB06C94786E5A9AA34112459@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b846e1d3-b9d8-40ff-2282-08d77d619365
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 11:10:33.6961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyKkH/JlzZyDwUmtYGIFvysoQZ/F6c0BQ76aK5IRDhVuF3q2NsKMZfqn40xS0KmI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3564
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

T24gMjAxOS0xMi0xMCAxMjowNCwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+IE9uIDIwLzEx
LzIwMTkgMDg6NTU6MzYtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+PiBUaGUgYmluZGluZ3Mg
ZGVzY3JpYmVkIGluIGF4ZW50aWEudHh0IGFyZSBhbHJlYWR5IGNvdmVyZWQgYnkNCj4+IGF0bWVs
LWF0OTEueWFtbCwgc28gcmVtb3ZlIHRoZSBmaWxlLg0KPj4NCj4+IENjOiBQZXRlciBSb3NpbiA8
cGVkYUBheGVudGlhLnNlPg0KPj4gQ2M6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAbWlj
cm9jaGlwLmNvbT4NCj4+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlA
Ym9vdGxpbi5jb20+DQo+PiBDYzogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9jaGVz
QG1pY3JvY2hpcC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPg0KPiBBY2tlZC1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPg0KDQpSaWdodCwgdGhpcyBvbmUgZmVsbCBvZiBvdXQgb2YgbXkgbWVtb3J5
IGR1ZSB0byBvdmVybG9hZC4gU29ycnkuDQoNCkFja2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBh
eGVudGlhLnNlPg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+IA0KPj4gLS0tDQo+PiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2F4ZW50aWEudHh0ICAgICAgIHwgMjggLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxIC0NCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDI5IGRlbGV0aW9ucygtKQ0KPj4gIGRlbGV0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2F4ZW50aWEu
dHh0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYXhlbnRpYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2F4ZW50aWEudHh0DQo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IGRlNThm
MjQ2Mzg4MC4uMDAwMDAwMDAwMDAwDQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2F4ZW50aWEudHh0DQo+PiArKysgL2Rldi9udWxsDQo+PiBAQCAtMSwyOCAr
MCwwIEBADQo+PiAtRGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIEF4ZW50aWEgQVJNIGRldmljZXMN
Cj4+IC09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gLQ0K
Pj4gLUxpbmVhIENQVSBtb2R1bGUNCj4+IC0tLS0tLS0tLS0tLS0tLS0tDQo+PiAtDQo+PiAtUmVx
dWlyZWQgcm9vdCBub2RlIHByb3BlcnRpZXM6DQo+PiAtY29tcGF0aWJsZSA9ICJheGVudGlhLGxp
bmVhIiwNCj4+IC0JICAgICAiYXRtZWwsc2FtYTVkMzEiLCAiYXRtZWwsc2FtYTVkMyIsICJhdG1l
bCxzYW1hNSI7DQo+PiAtYW5kIGZvbGxvd2luZyB0aGUgcnVsZXMgZnJvbSBhdG1lbC1hdDkxLnR4
dCBmb3IgYSBzYW1hNWQzMSBTb0MuDQo+PiAtDQo+PiAtDQo+PiAtTmF0dGlzIHYyIGJvYXJkIHdp
dGggTmF0dGUgdjIgcG93ZXIgYm9hcmQNCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPj4gLQ0KPj4gLVJlcXVpcmVkIHJvb3Qgbm9kZSBwcm9wZXJ0aWVzOg0K
Pj4gLWNvbXBhdGlibGUgPSAiYXhlbnRpYSxuYXR0aXMtMiIsICJheGVudGlhLG5hdHRlLTIiLCAi
YXhlbnRpYSxsaW5lYSIsDQo+PiAtCSAgICAgImF0bWVsLHNhbWE1ZDMxIiwgImF0bWVsLHNhbWE1
ZDMiLCAiYXRtZWwsc2FtYTUiOw0KPj4gLWFuZCBmb2xsb3dpbmcgdGhlIHJ1bGVzIGZyb20gYWJv
dmUgZm9yIHRoZSBheGVudGlhLGxpbmVhIENQVSBtb2R1bGUuDQo+PiAtDQo+PiAtDQo+PiAtVFNF
LTg1MCB2MyBib2FyZA0KPj4gLS0tLS0tLS0tLS0tLS0tLS0NCj4+IC0NCj4+IC1SZXF1aXJlZCBy
b290IG5vZGUgcHJvcGVydGllczoNCj4+IC1jb21wYXRpYmxlID0gImF4ZW50aWEsdHNlODUwdjMi
LCAiYXhlbnRpYSxsaW5lYSIsDQo+PiAtCSAgICAgImF0bWVsLHNhbWE1ZDMxIiwgImF0bWVsLHNh
bWE1ZDMiLCAiYXRtZWwsc2FtYTUiOw0KPj4gLWFuZCBmb2xsb3dpbmcgdGhlIHJ1bGVzIGZyb20g
YWJvdmUgZm9yIHRoZSBheGVudGlhLGxpbmVhIENQVSBtb2R1bGUuDQo+PiBkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPj4gaW5kZXggOTdiMjhjOTEzODEzLi44ZDcxMWY3
NjRkZmIgMTAwNjQ0DQo+PiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMN
Cj4+IEBAIC0yODU5LDcgKzI4NTksNiBAQCBBWEVOVElBIEFSTSBERVZJQ0VTDQo+PiAgTToJUGV0
ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4NCj4+ICBMOglsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQ0KPj4gIFM6CU1h
aW50YWluZWQNCj4+IC1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2F4
ZW50aWEudHh0DQo+PiAgRjoJYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1saW5lYS5kdHNpDQo+PiAg
RjoJYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1uYXR0ZS5kdHNpDQo+PiAgRjoJYXJjaC9hcm0vYm9v
dC9kdHMvYXQ5MS1uYXR0aXMtMi1uYXR0ZS0yLmR0cw0KPj4gLS0gDQo+PiAyLjIwLjENCj4+DQo+
IA0KDQo=

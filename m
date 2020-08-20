Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBB8C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 00:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A82F2075E
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 00:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WO+SswXM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHTAsc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 20:48:32 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:47009
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726609AbgHTAsb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Aug 2020 20:48:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaRqSl65PfaijeW8euVUF0TpmlH9YXo1pWozTd6VCRSMR5AeNLjFNtNBrEy/QbxgE4HoGuonJmvlJ2/wcXF+iHFW+k7wxq+TDNI39Fc9pdFAaoNlXA1HReFa3INbdVx24l6pw5V35S2UuJIInFMvpVa5qluqX21Z1ssUHo2vHOuv5X4NE98TLdkaqG2Gfx3N+/ZKIzzYapMF2NFnwEeLgkbid8w4W51okbV79cs8TMb408Iy1FLwsVk2rq65/vIp5nP23EB6THmcc3d8uz2ku4iuNG8VS03KcHCJv5XhEEvXCqP70J8P6BpMWadvkZVtt5kUqhUeKtA1Jk8tiOryYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOP1jsm8Tj3stkwYE1O8CRdd1hAGCh+Z8E1Fp2yvoKc=;
 b=Wn2WZ88QKUCRVV91Rea6w9IY8m/icYADAQ0ak4TQ1x0F+EGtsIx2JurXSJeYOvkelOnslqx4xD/Q48nMFsCuZFMvm6TPjIU+sfv238gkVX6I0woR9KyBZ308emfQZm1u7BQer+pq6GnLAsyghcjE8AWkyz66ou9LWbiFJ2Ut9H1cdvXwrL8MNO/OoFLuL3Lf0wtiAdHwZ42CmptGLqTrz44sRnL1uq3n/o+uCH29HgFn2eKoWnwxEbXcWqvB5TmktSvvIxkiOI77JnAXNEhu0mHeZexZ4k6ETkUFXfAHZypy3LO1E51EKA0z7gCWQv4jZZjUhfcf/kIupwbWjAAlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOP1jsm8Tj3stkwYE1O8CRdd1hAGCh+Z8E1Fp2yvoKc=;
 b=WO+SswXMoEjtj+uSgEn/Nvl0eQUkJX4MpxrG8u5Zqy12IDNHWVeH42FnO1o2px9miG7p2ACIhT3VqBFZJD3w87U8WgGcDvDYbpX8KZabFSX+yt3JkpbK4FEHUIirwcTM6tosuIgf1YW+2SPQfVS5lbBNI4aChEWCqQ21b/iH1fM=
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR04MB6756.eurprd04.prod.outlook.com (2603:10a6:208:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 00:48:24 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 00:48:24 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board support
Thread-Topic: [PATCH 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board
 support
Thread-Index: AQHWZKskj+IOA/fFIEWfxpXxpSSkcqk/l3YAgACsuiA=
Date:   Thu, 20 Aug 2020 00:48:24 +0000
Message-ID: <AM0PR04MB4915742FE24F711C400581FA875A0@AM0PR04MB4915.eurprd04.prod.outlook.com>
References: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
 <1595918641-2325-3-git-send-email-ping.bai@nxp.com>
 <20200819134852.GD7114@dragon>
In-Reply-To: <20200819134852.GD7114@dragon>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbc18a06-16dd-4bcc-5b39-08d844a2be7e
x-ms-traffictypediagnostic: AM0PR04MB6756:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6756713AE0F89F685D174E2C875A0@AM0PR04MB6756.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Vf8lI6O/duOeTbsldJ2j/+mwrZE+wmDOMyqy7didKpmiKknI6qShoeAuIZkygB/X/Kz0Hc9hR6NbX47sf2ZLxTCLZPwvd3Vp6g0i8be9624XYkz/kPAzZ1cX12N74+5MCCDBgV6fwxZMCdFFtN4ysl0lns9+Z12yv+tlhvLT2JDapCpNEFhRPlAnvurCsLrvEeno7LIgsMXZMLuVJ+r0UW/JDa9e/9Wjk9Y1SCJDtcl9VgY8awit9PhjsZzZ8+pW4YbDcrKMX3OLSYk1ouucAqLDuXSsMiH4adiWYLNgueTUzsOiRTU+Q41uicSPePU7nv2aTqi7BZusGzfAx+cSgl7JFtmRyVAryjJODYR2W2XBtjWmob41uTRXFp/czon
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(66446008)(2906002)(9686003)(66476007)(6506007)(64756008)(55016002)(76116006)(66946007)(4326008)(7696005)(6916009)(5660300002)(66556008)(53546011)(52536014)(86362001)(8676002)(71200400001)(316002)(186003)(83380400001)(478600001)(8936002)(26005)(54906003)(33656002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: MjB3jkqpswPAZNxEnmaP9iGFP1t2I4+1b2VacTPR+99IJZ4fu6dcNcBPYJYN2R60IjQ5E+VrnbMxEdrohBsu+WEQPZJxC8JBbt56XXRE8B6nBr9hHKHytMt8MJKworpG3GO/uG2vGtvnR0en0KPbbwYjFmZ7JgTSqfocjjPxY1VLqGUHYxfo6Hiq+zE9YJ7SfiGPCYcEtL/hE/bbZPO8eNJzWwZpj28psNXjBB0ZCZIuFXfKH6AtjknEO8x1uKPb3Xli0H/fQG1/+QedUOMpL8vOH+GdM+8JtYbpBdZdAAoRPxRR1F8olsuaqquG21kiTmvnM8Ey3u/xE/RtlmCQ/rpS/hoOo5AWLSMdLyA8QfC2slSkKAv17saKVKPc+TJCZWhOZzN38AHvM8gq5lGkxo2Z2RmrhzY7hyOUpdDYtiLIvkta6TFsI6UgH3PCAjxN5+9OyZeup+SHMA2uP8V82NSWHkGcr//gHr83q9cr59iKSxuDPHMxJ/YuuVlylmEtddrRXWCoFBgdm+2hgQaQuJK5kJxSnCDTNvIeaeJY/DD2v0i0e9+/tRIcncNQo6CXBmnfo6xfCK23T6WTHSKn7Id07jrOXhgk0e/tLqlT7FFbPhAPkJpcxb6asItKHj9vWEjNoNlqJRVyZMA5z0qVDQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc18a06-16dd-4bcc-5b39-08d844a2be7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2020 00:48:24.2918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szgWOUQ8aiow0cG9AG0rtOMrBWEdJAMHpn7uM/8kdIJzuEW4S1tLoKUmveTJf35mGHzuqi9JyASAdObEGPeo4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6756
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGF3biBHdW8gW21haWx0bzpz
aGF3bmd1b0BrZXJuZWwub3JnXQ0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxOSwgMjAyMCA5
OjU2IFBNDQo+IFRvOiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+IENjOiByb2JoK2R0
QGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsN
Cj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29t
PjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAz
LzNdIGFybTY0OiBkdHM6IGlteDhtbTogQWRkIGlteDhtbSBkZHI0IGV2ayBib2FyZA0KPiBzdXBw
b3J0DQo+IA0KPiBPbiBUdWUsIEp1bCAyOCwgMjAyMCBhdCAwMjo0NDowMVBNICswODAwLCBKYWNr
eSBCYWkgd3JvdGU6DQo+ID4gQWRkIHRoZSBib2FyZCBkdHMgc3VwcG9ydCBmb3IgaS5NWDhNTSBE
RFI0IEVWSyBib2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2t5IEJhaSA8cGluZy5i
YWlAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
TWFrZWZpbGUgICAgICAgIHwgIDEgKw0KPiA+ICAuLi4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDht
bS1kZHI0LWV2ay5kdHMgICAgfCA3Nw0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4g
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLWRkcjQtZXZrLmR0cw0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlDQo+
ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiA+IGluZGV4IGEz
OWYwYTE3MjNlMC4uNDE3YzU1MjQ4MGYyIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvTWFrZWZpbGUNCj4gPiBAQCAtMjksNiArMjksNyBAQCBkdGItJChDT05GSUdfQVJD
SF9MQVlFUlNDQVBFKSArPQ0KPiBmc2wtbHgyMTYwYS1xZHMuZHRiDQo+ID4gIGR0Yi0kKENPTkZJ
R19BUkNIX0xBWUVSU0NBUEUpICs9IGZzbC1seDIxNjBhLXJkYi5kdGINCj4gPg0KPiA+ICBkdGIt
JChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtbS1ldmsuZHRiDQo+ID4gK2R0Yi0kKENPTkZJR19B
UkNIX01YQykgKz0gaW14OG1tLWRkcjQtZXZrLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9N
WEMpICs9IGlteDhtbi1ldmsuZHRiDQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14
OG1uLWRkcjQtZXZrLmR0Yg0KPiA+ICBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtcC1l
dmsuZHRiIGRpZmYgLS1naXQNCj4gPiBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtbS1kZHI0LWV2ay5kdHMNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtbS1kZHI0LWV2ay5kdHMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uOWNkODkxODIyMThlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1kZHI0LWV2ay5kdHMNCj4gPiBAQCAt
MCwwICsxLDc3IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0K
PiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgMjAyMCBOWFANCj4gPiArICovDQo+ID4gKw0KPiA+
ICsvZHRzLXYxLzsNCj4gPiArDQo+ID4gKyNpbmNsdWRlICJpbXg4bW0tZXZrLmR0c2kiDQo+ID4g
Kw0KPiA+ICsvIHsNCj4gPiArCW1vZGVsID0gIkZTTCBpLk1YOE1NIEREUjQgRVZLIHdpdGggQ1lX
NDM0NTUgV0lGSS9CVCBib2FyZCI7DQo+ID4gKwljb21wYXRpYmxlID0gImZzbCxpbXg4bW0tZGRy
NC1ldmsiLCAiZnNsLGlteDhtbSI7DQo+ID4gKw0KPiA+ICsJbGVkcyB7DQo+ID4gKwkJcGluY3Ry
bC0wID0gPCZwaW5jdHJsX2dwaW9fbGVkXzI+Ow0KPiA+ICsNCj4gPiArCQlzdGF0dXMgew0KPiA+
ICsJCQlncGlvcyA9IDwmZ3BpbzMgNCBHUElPX0FDVElWRV9MT1c+Ow0KPiA+ICsJCX07DQo+ID4g
Kwl9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmRkcmMgew0KPiA+ICsJb3BlcmF0aW5nLXBvaW50
cy12MiA9IDwmZGRyY19vcHBfdGFibGU+Ow0KPiA+ICsNCj4gPiArCWRkcmNfb3BwX3RhYmxlOiBv
cHAtdGFibGUgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12MiI7DQo+
ID4gKw0KPiA+ICsJCW9wcC0yNU0gew0KPiA+ICsJCQlvcHAtaHogPSAvYml0cy8gNjQgPDI1MDAw
MDAwPjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQlvcHAtMTAwTSB7DQo+ID4gKwkJCW9wcC1o
eiA9IC9iaXRzLyA2NCA8MTAwMDAwMDAwPjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiArCQlvcHAt
NjAwTSB7DQo+ID4gKwkJCW9wcC1oeiA9IC9iaXRzLyA2NCA8NjAwMDAwMDAwPjsNCj4gPiArCQl9
Ow0KPiA+ICsJfTsNCj4gDQo+IEknbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdGhpcyBkZHJj
X29wcF90YWJsZSBpcyBkZXRlcm1pbmVkLiAgSXQncw0KPiBkZWZpbmVkIGJ5IFNvQy9ERFIgY29u
dHJvbGxlciBvciBib2FyZC9ERFIgY2hpcD8NCg0KSXQgaXMgcmVsYXRlZCB0byBib3RoIFNPQyBE
RFIgY29udHJvbGxlciAmIHRoZSBib2FyZCBkZXNpZ24uIFRoZSBoaWdoZXN0IGZyZXF1ZW5jeSBp
cyA2MDBNSHooMjQwME1UUykgZm9yIEREUjQsDQo3NTBNSHooMzAwME1UUykgb3IgODAwTUh6KDMy
MDBNVFMpIGZvciBMUEREUjQuIFRoZSBsb3dlc3QgZnJlcXVlbmN5IGFsc28gcmVsYXRlZCB0byBE
RFIgdHlwZS4gRm9yIExQRERSNCwNCkREUkMgY2FuIHJ1biBhdCAyNU1IeigxMDBNVFMpLCBmb3Ig
RERSNCwgdGhlIGxvd2VzdCBmcmVxdWVuY3kgbmVlZCB0byA+MTY2TUh6Lg0KDQpUaGUgT1BQcyBk
ZWZpbmVkIGluIGR0cyBtdXN0IGJlIGFsaWduZWQgd2l0aCB0aGUgT1BQcyBpbml0aWFsaXplZCBk
dXJpbmcgRERSIGNhbGlicmF0aW9uIHN0YWdlIGFmdGVyIFNPQyBQT1IgQm9vdC4NCg0KaXQgc2Vl
bXMgdGhlIGRkcmMgb3BwIHRhYmxlIGZvciBERFI0IEVWSyBpcyBub3QgY29ycmVjdCwgSSB3aWxs
IHJlbW92ZSBpdCBmcm9tIHRoaXMgcGF0Y2hzZXQgZm9yIG5vdywgd2lsbCBhZGQgaXQgYmFjayBp
biBhIHNlcGFyYXRlIHBhdGNoLg0KDQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmdwbWkgew0K
PiA+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArCXBpbmN0cmwtMCA9IDwmcGlu
Y3RybF9ncG1pX25hbmRfMT47DQo+ID4gKwlzdGF0dXMgPSAib2theSI7DQo+IA0KPiBQbGVhc2Ug
cHV0ICdzdGF0dXMnIGF0IGVuZCBvZiBwcm9wZXJ0eSBsaXN0Lg0KDQpUaGFua3MsIHdpbGwgZml4
IGl0Lg0KDQo+IA0KPiA+ICsJbmFuZC1vbi1mbGFzaC1iYnQ7DQo+ID4gK307DQo+ID4gKw0KPiA+
ICsmaW9tdXhjIHsNCj4gPiArCXBpbmN0cmxfZ3BtaV9uYW5kXzE6IGdwbWktbmFuZC0xIHsNCj4g
DQo+IFRoZSBzdWZmaXggIjEiIGlzbid0IHJlYWxseSBuZWVkZWQsIGlzIGl0Pw0KPiANCg0KVGhh
bmtzLCB3aWxsIGZpeCBpdCBpbiBWMi4NCg0KQlINCkphY2t5IEJhaQ0KDQo+IFNoYXduDQo+IA0K
PiA+ICsJCWZzbCxwaW5zID0gPA0KPiA+ICsJCQlNWDhNTV9JT01VWENfTkFORF9BTEVfUkFXTkFO
RF9BTEUNCj4gCTB4MDAwMDAwOTYNCj4gPiArCQkJTVg4TU1fSU9NVVhDX05BTkRfQ0UwX0JfUkFX
TkFORF9DRTBfQg0KPiAJMHgwMDAwMDA5Ng0KPiA+ICsJCQlNWDhNTV9JT01VWENfTkFORF9DRTFf
Ql9SQVdOQU5EX0NFMV9CDQo+IAkweDAwMDAwMDk2DQo+ID4gKwkJCU1YOE1NX0lPTVVYQ19OQU5E
X0NMRV9SQVdOQU5EX0NMRQ0KPiAJMHgwMDAwMDA5Ng0KPiA+ICsJCQlNWDhNTV9JT01VWENfTkFO
RF9EQVRBMDBfUkFXTkFORF9EQVRBMDANCj4gCTB4MDAwMDAwOTYNCj4gPiArCQkJTVg4TU1fSU9N
VVhDX05BTkRfREFUQTAxX1JBV05BTkRfREFUQTAxDQo+IAkweDAwMDAwMDk2DQo+ID4gKwkJCU1Y
OE1NX0lPTVVYQ19OQU5EX0RBVEEwMl9SQVdOQU5EX0RBVEEwMg0KPiAJMHgwMDAwMDA5Ng0KPiA+
ICsJCQlNWDhNTV9JT01VWENfTkFORF9EQVRBMDNfUkFXTkFORF9EQVRBMDMNCj4gCTB4MDAwMDAw
OTYNCj4gPiArCQkJTVg4TU1fSU9NVVhDX05BTkRfREFUQTA0X1JBV05BTkRfREFUQTA0DQo+IAkw
eDAwMDAwMDk2DQo+ID4gKwkJCU1YOE1NX0lPTVVYQ19OQU5EX0RBVEEwNV9SQVdOQU5EX0RBVEEw
NQ0KPiAJMHgwMDAwMDA5Ng0KPiA+ICsJCQlNWDhNTV9JT01VWENfTkFORF9EQVRBMDZfUkFXTkFO
RF9EQVRBMDYNCj4gCTB4MDAwMDAwOTYNCj4gPiArCQkJTVg4TU1fSU9NVVhDX05BTkRfREFUQTA3
X1JBV05BTkRfREFUQTA3DQo+IAkweDAwMDAwMDk2DQo+ID4gKwkJCU1YOE1NX0lPTVVYQ19OQU5E
X1JFX0JfUkFXTkFORF9SRV9CDQo+IAkweDAwMDAwMDk2DQo+ID4gKwkJCU1YOE1NX0lPTVVYQ19O
QU5EX1JFQURZX0JfUkFXTkFORF9SRUFEWV9CDQo+IAkweDAwMDAwMDU2DQo+ID4gKwkJCU1YOE1N
X0lPTVVYQ19OQU5EX1dFX0JfUkFXTkFORF9XRV9CDQo+IAkweDAwMDAwMDk2DQo+ID4gKwkJCU1Y
OE1NX0lPTVVYQ19OQU5EX1dQX0JfUkFXTkFORF9XUF9CDQo+IAkweDAwMDAwMDk2DQo+ID4gKwkJ
PjsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJcGluY3RybF9ncGlvX2xlZF8yOiBncGlvbGVkMmdy
cCB7DQo+ID4gKwkJZnNsLHBpbnMgPSA8DQo+ID4gKwkJCU1YOE1NX0lPTVVYQ19OQU5EX0NFM19C
X0dQSU8zX0lPNAkweDE5DQo+ID4gKwkJPjsNCj4gPiArCX07DQo+ID4gK307DQo+ID4gLS0NCj4g
PiAyLjI2LjINCj4gPg0K

Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C107C4332B
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 01:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 688E420753
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 01:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qt9Vv68T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgCTB3D (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 21:29:03 -0400
Received: from mail-db8eur05on2078.outbound.protection.outlook.com ([40.107.20.78]:6158
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbgCTB3D (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 21:29:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrimySusAj3REtXxrCXwQN+1lHUhEROgLNCMCJBySgUxdzK1HTl5YosGu28nTkFJCJyB12fOLCEMzw/8N4BZaHlesSfdzOCSNAkgoEPmQeT51f9ebBVCAbAcLLfWAnEAFkrFupkCr5ruTSxykubedfKlIeO/pHO0nOkoDVJLMOwWmVWSTd2fNBS3kAnBrVD1IjzuuZqKVQPq1aZccY2oiZQkJr9K3kP+Vu7h/SEi9jEZi9qmUhpEnTXDsZf+LsD4K363ADQBaofoGoiyhVV3oUqDJ4vlot9XQ/Uyv+gN8S57KahBm7zhWm7Wc3bXUKBwqRS/hae23+ZZP5hrWC+oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JBZZwLoIHTLJv4j63Y8wf1Uz1ysJm089nWUKQUuPFU=;
 b=eP97d//A6hx8X+Yynb/GZgdLu/9fzN/TsXeb1FoKpSBXkYQdJKL89Jmz7vRcUhpde46IaqqUhmYqrz7d9o4/7BLqNTq34xqdZfOFNPEJosdKCFhMa4Jt2LouYtmKy24zthLloJT5UiXmzaps8siqYsQBOZInpBPZg7EOr3xederIFuY576kQrpSO0g/OCOk5IY2/a3KAHg7NctExeFXyYLjb4zdUuTW5Qi/sVA2S59GXaOTUaH+O1hBpTD1GCxHY0gYPtX3lZ01PdM9yPNizQQ7kD4OD+lYyYrSQSVkmQBcs6VtAT7Y8jkiFNVeuRwErUffOu+MBw9JlTagic7BkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JBZZwLoIHTLJv4j63Y8wf1Uz1ysJm089nWUKQUuPFU=;
 b=qt9Vv68Tc3/n+dCMp7HiiM4BepFxIrQyDMxX2ivOplyCYp3wPDBs1TDiZyvYgCTUil3DXl/wSGKwkLTwDKk156iggeR9XTTpX69L38FGdEn6+CHgJZ3SScHKEmVUx/T04hE1foXAm17QST9kTdhdKN1l5HyLWqsBpNcupKdxfSU=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 20 Mar 2020 01:29:00 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2835.017; Fri, 20 Mar 2020
 01:29:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Topic: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Index: AQHV+eSIbYUUoyB07UqkpsijN1q1vahO7pAAgACSAoCAALTwgIAAg0Ag
Date:   Fri, 20 Mar 2020 01:28:59 +0000
Message-ID: <AM7PR04MB7157C5F70FCC9C1DD204C8BF8BF50@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200314093941.2533-1-peter.chen@nxp.com>
 <20200314093941.2533-2-peter.chen@nxp.com> <20200318220420.GA15468@bogus>
 <20200319064655.GB11834@b29397-desktop>
 <CAL_JsqLF6cPCXqZiSOr6DPQad60w9Hd4yemEAmmCAR2TU86CqQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLF6cPCXqZiSOr6DPQad60w9Hd4yemEAmmCAR2TU86CqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5bd8dc3f-714a-405c-e4d4-08d7cc6e1119
x-ms-traffictypediagnostic: AM7PR04MB6934:|AM7PR04MB6934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB69347C4C88921B9F22F83B0F8BF50@AM7PR04MB6934.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03484C0ABF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(199004)(33656002)(6916009)(8676002)(52536014)(5660300002)(81156014)(44832011)(7696005)(26005)(186003)(66946007)(66446008)(64756008)(9686003)(66556008)(8936002)(55016002)(86362001)(6506007)(81166006)(53546011)(71200400001)(66476007)(2906002)(4326008)(54906003)(316002)(478600001)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6934;H:AM7PR04MB7157.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u30bq3RWLhjfiAPEEeo1Kvbqpbpc33kdRHlOCBHcjIC+OwgnF+5gBj5gHl1uvWuS78wqT3MT6QWtS2avAdavQrZiOcHwWkJ/bXeGwlD7JY/jgCl4gPwrJzQQD1xFCvGMRijlhJ4EObo4eKaLqxcvqEGEj1Uk1vO42l9XD3t4DP/1/jSouEOJ0LzNgwGIyxED/QuRzcictGYgoe19FlZbOhGpDnoT8nJFazFfyMG7PcllmX/z9cVojwjC/2Cuu2wGakc6mh4LoLwYPr9JApVJVAN1jGLywff3LmuXrE2f4miD8H+SiJU9d86BncAq6sJDS6j9/8vtSg/kCryRo1kBMnEM9YX/3XRxU5bHr1y4Qx+in7uwTWSigWNB7zJWtHfIqSHrOJZjpCPtrf/vMYzm2stDBUpuy/a/c7LwHBhRy41styys35ukpfVYszSMcUSs
x-ms-exchange-antispam-messagedata: vtc3uhk7zdmuScVRIg/OA4tsOmSAwmuSwWZJeaLSq8/knuKu62+xNeXTBG4yjZPmuZspfKnfb99EKQCB8Uaq7MQsNY6wUO/BW1CWGZjShYyC4/HRad5k3+DRRIahb53x7Hc0BrFO6gBCYMFE9J38NA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd8dc3f-714a-405c-e4d4-08d7cc6e1119
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2020 01:29:00.0448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbtEYi7bu83LDAvrZ7qhT42FakzeHlIe95xjLPL/L6Glpnbi/Ucxj4U7NLm/dBja2/X86eleURs27G1AoL4R0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IA0KPiA+IE9uIDIwLTAzLTE4IDE2OjA0OjIwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+IE9u
IFNhdCwgMTQgTWFyIDIwMjAgMTc6Mzk6NDEgKzA4MDAsIFBldGVyIENoZW4gd3JvdGU6DQo+ID4g
PiA+IEFkZCBDYWRlbmNlIFNBTFZPIFBIWSBiaW5kaW5nIGRvYywgdGhpcyBQSFkgaXMgYSBsZWdh
Y3kgbW9kdWxlLA0KPiA+ID4gPiBhbmQgaXMgb25seSB1c2VkIGZvciBVU0IzIGFuZCBVU0IyLg0K
PiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBDaGVuIDxwZXRlci5jaGVuQG54
cC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBDaGFuZ2VzIGZvciB2MjoNCj4gPiA+ID4gLSBG
aXgga2luZHMgb2YgeWFtbCBzdHlsZSBpc3N1ZQ0KPiA+ID4gPg0KPiA+ID4gPiAgLi4uL2JpbmRp
bmdzL3BoeS9jZG5zLHNhbHZvLXBoeS55YW1sICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysr
KysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4gPiA+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L2NkbnMsc2Fsdm8tcGh5LnlhbWwNCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBNeSBi
b3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBw
YXRjaDoNCj4gPiA+DQo+ID4gPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtDQo+IHJldmll
dy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2NkbnMsc2Fsdm8tcGh5LmV4
YW1wbGUuZHQueWFtbDoNCj4gdXNiMy1waHlANUIxNjAwMDA6ICdwb3dlci1kb21haW5zJyBkb2Vz
IG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLQ0KPiBbMC05XSsnDQo+ID4N
Cj4gPiBUaGUgJ3Bvd2VyLWRvbWFpbnMnIGlzIGRlc2NyaWJlZCBhdDoNCj4gPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXJfZG9tYWluLnR4dA0KPiANCj4gLnR4
dCBmaWxlcyBkb24ndCBnZW5lcmF0ZSB3YXJuaW5ncy4NCj4gDQoNCkkgbWVhbiB3aHkgZHRfYmlu
ZF9jaGVjayByZXBvcnQgYmVsb3c6DQoNCnVzYjMtcGh5QDVCMTYwMDAwOiAncG93ZXItZG9tYWlu
cycgZG9lcyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGluY3RybC0NClswLTldKycN
Cg0KSXQgaXMgJ3Bvd2VyLWRvbWFpbnMnLCBhbmQgbm90IHJlbGF0ZWQgdG8gcGluY3RybC4NCg0K
PiBBbmQgeW91IG1pZ2h0IHdhbnQgdG8gYmUgdXAgdG8gZGF0ZSB3aXRoIHlvdXIga2VybmVsIHRy
ZWUuDQo+IA0KPiA+DQo+ID4gPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncw0KPiA+ID4gL3BoeS9jZG5zLHNhbHZvLXBo
eS5leGFtcGxlLmR0LnlhbWw6IHVzYjMtcGh5QDVCMTYwMDAwOg0KPiA+ID4gI3BoeS1jZWxsczow
OjA6IDEgd2FzIGV4cGVjdGVkDQo+ID4gPg0KPiA+DQo+ID4gI3BoeS1jZWxsIGNvdWxkIGJlIDAg
aWYgaXQgaXMgYSBkZWRpY2F0ZWQgUEhZLCBlZyBzaW5nbGUgZnVuY3Rpb24gUEhZLg0KPiA+IFNl
ZSBiZWxvdyBjb21tZW50cyBmcm9tIGRyaXZlcnMvcGh5L3BoeS1jb3JlLmMNCj4gPg0KPiA+IC8q
Kg0KPiA+ICAqIG9mX3BoeV9zaW1wbGVfeGxhdGUoKSAtIHJldHVybnMgdGhlIHBoeSBpbnN0YW5j
ZSBmcm9tIHBoeSBwcm92aWRlcg0KPiA+ICAqIEBkZXY6IHRoZSBQSFkgcHJvdmlkZXIgZGV2aWNl
DQo+ID4gICogQGFyZ3M6IG9mX3BoYW5kbGVfYXJncyAobm90IHVzZWQgaGVyZSkNCj4gPiAgKg0K
PiA+ICAqIEludGVuZGVkIHRvIGJlIHVzZWQgYnkgcGh5IHByb3ZpZGVyIGZvciB0aGUgY29tbW9u
IGNhc2Ugd2hlcmUNCj4gPiAjcGh5LWNlbGxzIGlzDQo+ID4gICogMC4gRm9yIG90aGVyIGNhc2Vz
IHdoZXJlICNwaHktY2VsbHMgaXMgZ3JlYXRlciB0aGFuICcwJywgdGhlIHBoeQ0KPiA+IHByb3Zp
ZGVyDQo+ID4gICogc2hvdWxkIHByb3ZpZGUgYSBjdXN0b20gb2ZfeGxhdGUgZnVuY3Rpb24gdGhh
dCByZWFkcyB0aGUgKmFyZ3MqIGFuZA0KPiA+IHJldHVybnMNCj4gPiAgKiB0aGUgYXBwcm9wcmlh
dGUgcGh5Lg0KPiA+ICAqLw0KPiANCj4gV2hhdCdzIHlvdXIgcG9pbnQ/IFlvdSBoYXZlIGFuIGVy
cm9yIGVpdGhlciBpbiB0aGUgc2NoZW1hIG9yIHRoZSBleGFtcGxlLiBZb3UNCj4gbXVzdCBmaXgg
aXQuDQoNCkkgbWVhbiAjcGh5LWNlbGxzIGNhbiBiZSAwLCBidXQgeW91ciBzY3JpcHQgc2FpZCBp
dCBzaG91bGQgYmUgMS4NCg0KSSBydW4gZHQtYmluZGluZy1jaGVjayBhdCBsb2NhbCwgbm8gaXNz
dWUgaXMgcmVwb3J0ZWQsIHRoZSBjZG5zLHNhbHZvLXBoeS55YW1sIGlzIGF0IHRoZSBsYXN0IHR3
by4NCg0KYjI5Mzk3QGIyOTM5Ny1kZXNrdG9wOn4vd29yay9wcm9qZWN0cy91cHN0cmVhbS91c2Ik
IC4vbWsuc2ggZHQNCm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvYjI5Mzk3L3dv
cmsvcHJvamVjdHMvdXBzdHJlYW0vdXNiL291dG91dC9pbXhfdjgnDQogIENIS0RUICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHVzLnlhbWwNCiAgQ0hLRFQgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0LG1sYWhiLnlhbWwNCiAg
Q0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3BzY2kueWFtbA0K
ICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwN
CiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYnVzL2FsbHdpbm5l
cixzdW44aS1hMjMtcnNiLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svcWNvbSxnY2MtYXBxODA2NC55YW1sDQogIENIS0RUICAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FsbHdpbm5lcixzdW40aS1hMTAtb3NjLWNs
ay55YW1sDQogIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2Nr
L2FsbHdpbm5lcixzdW45aS1hODAtZ3QtY2xrLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS55YW1sDQogIENIS0RU
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc2ltcGxlLWZyYW1l
YnVmZmVyLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9sZWFkdGVrLGx0azUwMGhkMTgyOS55YW1sDQogIENIS0RUICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwveGlucGVuZyx4cHAwNTVj
MjcyLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbA0KICBDSEtEVCAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdHYtZW5j
b2Rlci55YW1sDQogIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rt
YS90aS9rMy11ZG1hLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQueWFtbA0KICBDSEtEVCAgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sDQogIENIS0RUICAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvc2Ftc3VuZyxleHlub3Mt
YWRjLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5w
dXQvdG91Y2hzY3JlZW4vZ29vZGl4LnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbGVkcy9jb21tb24ueWFtbA0KICBDSEtEVCAgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbGx3aW5uZXIsc3VuNGktYTEwLWNzaS55YW1sDQog
IENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3RpLGNhbC55
YW1sDQogIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1j
b250cm9sbGVycy9udmlkaWEsdGVncmExMjQtZW1jLnlhbWwNCiAgQ0hLRFQgICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL21heDc3NjUwLnlhbWwNCiAgQ0hLRFQgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL21tYy1jb250cm9sbGVyLnlhbWwNCiAg
Q0hLRFQgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21kaW8ueWFtbA0K
ICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55
YW1sDQogIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9jZG5z
LHNhbHZvLXBoeS55YW1sDQogIENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9hbGx3aW5uZXIsc3VuNGktYTEwLXVzYi1waHkueWFtbA0KDQpUaGFua3MsDQpQZXRl
cg0K

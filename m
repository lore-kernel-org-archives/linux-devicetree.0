Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FF9C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3775E214DB
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PxOp/53L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbgCCJX2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:23:28 -0500
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:5842
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728120AbgCCJX2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Mar 2020 04:23:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxs1XsjTDgmCakp3yul3n/84YkYDjUYhKO1A2Vff/jO59/LnVAUKnx0C0rUagRjAuAHcmBhlOgNZKdygsRWTQIBESBQpaxwUUI683lL8F7jUjMVXlx9/M7Ue5SM4vCZjtbtwARr0dfLV7JfnAyQaLs/ZUPRXGj2iZI9uqbhLV+porV6u3Z2Hm+pYq1cmdJoOhkmckujyR3NxI0Nx9aBAVe2bjwxpui/A1MVHq4Kmgjx2waveWOvf7eGoLn+C1KHh4fL0dajoilZLnIqdbEp4CcALZ3mJZBUSfSrqDFqRnW9g68yiWvjW5gioS32CjCaQwlMN/saLRenmbVB7HFeG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYAzmo/lKX57Ho5+46p9qIOZ3ZIsF+sErsAIVl0U++Y=;
 b=i8uYTrNdTAfUgIJlqv2ANeePP+zIRXmvS5H5VYvrNqZPIV3ZW85h9B9bH3YS9UDdAgjZwgctEwSr4fXIktVJuOBAjFl5CBBn5SGEfFRG1lXNUOTy9xop/C8rbZa5+LFotayPAKWEHmb1UiKktl6KOi0ZTb3YhIwB0Yjg4y3JP2Myt+wlW8r75b6GjBLNLzOOr8BbnjLGoD8xNF7BDJRYm9RB20VKT23euHtYojKjY0gmta8y+/CmG+LEPYNojhREGuoBA0vEho0cKkFjs9Qd/6TAROWeFNVwRXQfaGBsFwOmbUcpTRSPdG2wIycyDX3FwVZpVcJp70Lm3QnkJEt96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYAzmo/lKX57Ho5+46p9qIOZ3ZIsF+sErsAIVl0U++Y=;
 b=PxOp/53LlnYxZhjbD5gPpwhp0nQ9ViGkN3hBkBIN9vqh3lHBJ4VNtJjjLcfwNsczUk3XFtgVKI0DLxAuDdZaszxEcyVt6dhAnWL1KEZfmb0MaXg4xagyW48X2+42RimFqsURVVmUWP6Y+ZN80O8dPX8Og30J7jqMOW9AdCzt5YU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5725.eurprd04.prod.outlook.com (20.178.126.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19; Tue, 3 Mar 2020 09:23:22 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 09:23:22 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>,
        Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Topic: [PATCH 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Thread-Index: AQHV7TcYWgsnimYnvUK07Zx3ZoCe3agvRosAgAER7SCAAEV4AIAEBKCAgADeNICAAR8ywA==
Date:   Tue, 3 Mar 2020 09:23:22 +0000
Message-ID: <VI1PR04MB5327358EB3BA7E6FE6BC6C588BE40@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20200227062754.19131-1-peter.chen@nxp.com>
 <20200227062754.19131-2-peter.chen@nxp.com> <20200227170810.GA2318@bogus>
 <VI1PR04MB5327992CC6BA891C199D39A08BE80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAL_JsqLQ+5iR_rTaS7D2cvS_psT0XKh=FLH0EmLo2EsE4cuXSA@mail.gmail.com>
 <20200302025849.GB3834@b29397-desktop>
 <CAL_Jsq+gVgsODWXCuJrD0ONNsSGTABYUpARDUPxMwePL6Ro82A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+gVgsODWXCuJrD0ONNsSGTABYUpARDUPxMwePL6Ro82A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [180.171.74.255]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 73680183-bc82-46ee-5c07-08d7bf548505
x-ms-traffictypediagnostic: VI1PR04MB5725:|VI1PR04MB5725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB57256D319A1664DCC9DE03CE8BE40@VI1PR04MB5725.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(71200400001)(316002)(9686003)(2906002)(86362001)(6916009)(54906003)(4744005)(55016002)(33656002)(26005)(8676002)(76116006)(66946007)(64756008)(66476007)(66446008)(66556008)(6506007)(478600001)(8936002)(7696005)(186003)(81166006)(81156014)(52536014)(4326008)(5660300002)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5725;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GI+aEWptIJfSztkcjeWD1XrHiM1ELooXXFyoi/DnueIXN+JeEXFJa9ZvjBuoGYTcWwJA02ur+vEcgGu27mLIZj0YH/Xb0oaui1sMKTTTmjhWRNLudzPkPFRNBe6VXmCjdToKX1xPX1BYrtGlSQXb9Gr9cY2YkBN5BX1FB8AlM+g+B2ZVBsUSExY/Ge1YMaOeOX0qccw7sPvALojUpG2qk31a5UsrI6YisvPvbGkhM1ObEomeZhvUut4ewyyDeE1QrtmpICCcb4uSTPol/UO8ly/ImxQ2eXgMzhlXmFExtdrUMgugZ5FctsDYQu0+Cd54VwM6B6LDdFWvza6/Xj0KO6j+imKwpH4PcEnFYWzbgyZwK2ozfSsX5oHuRHX3XdMygvMd9HLtoz7tP3xQ2EalPIOjJdUYHaRr6jxbhufObmmtb6YvotYp68MTozFKtBst
x-ms-exchange-antispam-messagedata: 9/tntqhYzt/2d/2fHXKMlHbrYP+T+1GkRu8ZT1BtVOJO8LEmCxWkgQLbjyaSBhucqgtoQ9ZXIMzd27tNgO/GzFU988dVIDfOg95BHwyT1sHqL06eHAn6uWXODzsVYx0hZS/ipikkiltEc33h7KxVsQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73680183-bc82-46ee-5c07-08d7bf548505
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 09:23:22.4374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76utD9794sfyVbgpyb/qOH4O4xzapOIe6akUc1oXS5rLmrGY9gNnHvd2McpDx/JpYSbQKmlSywSj9gLHvtwH8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5725
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IA0KIA0KPiA+ICAzOCBleGFtcGxlczoNCj4gPiAgMzkgICAgIC18DQo+IA0KPiBUaGUgaW5kZW50
YXRpb24gaXMgd3JvbmcgaGVyZS4gSXQgc2hvdWxkIGJlIDIgc3BhY2VzLCBub3QgNC4gV2hhdCBm
b2xsb3dzIGhhcyB0byBiZQ0KPiBpbmRlbnRlZCBtb3JlIHRoYW4gdGhlIGFib3ZlIGxpbmUuIElu
ZGVudGF0aW9uIGlzIGhvdyB0aGUgZW5kIG9mIHRoZSBibG9jayBpcyBmb3VuZC4NCj4gDQo+ID4g
IDQwICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3JzcmMuaD4NCj4gPiAg
NDENCj4gPiAgNDIgICAgIHVzYjNwaHk6IHVzYjMtcGh5QDVCMTYwMDAwIHsNCj4gPiAgNDMgICAg
ICAgICBjb21wYXRpYmxlID0gIm54cCxzYWx2by1waHkiOw0KPiA+ICA0NCAgICAgICAgIHJlZyA9
IDwweDVCMTYwMDAwIDB4NDAwMDA+Ow0KPiA+ICA0NSAgICAgICAgIGNsb2NrcyA9IDwmdXNiM19s
cGNnIDQ+Ow0KPiA+ICA0NiAgICAgICAgIGNsb2NrLW5hbWVzID0gInNhbHZvX3BoeV9jbGsiOw0K
PiA+ICA0NyAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX1VTQl8yX1BIWT47
DQo+ID4gIDQ4ICAgICAgICAgI3BoeS1jZWxscyA9IDwwPjsNCj4gPiAgNDkgICAgIH07DQogDQpU
aGFua3MsIFJvYiwgSSBmaXhlZCBpdC4gSSB3aWxsIHNlbmQgdjIgYWZ0ZXIgZHJpdmVyIHJldmll
dyBmaW5pc2hlcy4NCg0KUGV0ZXINCg==

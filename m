Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976DAC2BA83
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 09:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E63E21734
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 09:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbgBMJQ0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 04:16:26 -0500
Received: from skedge03.snt-world.com ([91.208.41.68]:46336 "EHLO
        skedge03.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbgBMJQ0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 04:16:26 -0500
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge03.snt-world.com (Postfix) with ESMTPS id EA84C67A650;
        Thu, 13 Feb 2020 10:16:23 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 13 Feb
 2020 10:16:23 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Thu, 13 Feb 2020 10:16:23 +0100
From:   Schrempf Frieder <frieder.schrempf@kontron.de>
To:     Adam Ford <aford173@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Peng Fan <peng.fan@nxp.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Jacky Bai <ping.bai@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgRmF1cmU=?= <clement.faure@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        "Silvano Di Ninno" <silvano.dininno@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Thread-Topic: [PATCH 0/3] Add power domain driver support for i.mx8m family
Thread-Index: AQHVlbJgwlK4xQm/JEm2k7LRhwNAZagZYFsA
Date:   Thu, 13 Feb 2020 09:16:23 +0000
Message-ID: <871ac22a-0508-8e92-b012-f414be5bd174@kontron.de>
References: <20190417053211.2195-1-ping.bai@nxp.com>
 <AM0PR04MB42116FEB1EE2CAE68A1CAA8980250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1555503195.2317.19.camel@pengutronix.de>
 <VI1PR04MB55330105F4839FCF98B7CFC0EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <68aaace3-f66e-b4b8-30a0-57b8b66a7524@arm.com>
 <VI1PR04MB5533A1F87436C0839A772D03EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <20190418144330.GD7770@e107155-lin>
 <CAHCN7xKK3zWE9i24prauPw0DSNTjASsMgDYY8w3OBJ+hb2y-sg@mail.gmail.com>
In-Reply-To: <CAHCN7xKK3zWE9i24prauPw0DSNTjASsMgDYY8w3OBJ+hb2y-sg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="utf-8"
Content-ID: <69FB702234D02743A3808FD4F54E88B6@snt-world.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: EA84C67A650.AFAC6
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: aford173@gmail.com, aisheng.dong@nxp.com,
        andre.przywara@arm.com, clement.faure@nxp.com,
        devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, l.stach@pengutronix.de,
        leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, mark.rutland@arm.com, peng.fan@nxp.com,
        ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
        shawnguo@kernel.org, silvano.dininno@nxp.com,
        souvik.chakravarty@arm.com, sudeep.holla@arm.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SGksDQoNCk9uIDA3LjExLjE5IDIyOjI4LCBBZGFtIEZvcmQgd3JvdGU6DQo+IE9uIFRodSwgQXBy
IDE4LCAyMDE5IGF0IDk6NDMgQU0gU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMDQ6MjE6NTVQTSArMDAwMCwg
TGVvbmFyZCBDcmVzdGV6IHdyb3RlOg0KPj4+IE9uIDQvMTcvMjAxOSA0OjMzIFBNLCBTdWRlZXAg
SG9sbGEgd3JvdGU6DQo+Pj4+Pj4gSSBkb24ndCB5ZXQgYnV5IHRoZSBzZWN1cml0eSBhcmd1bWVu
dC4gVGhlcmUgYXJlIG1hbnkgbW9yZSBzaGFyZWQgcGFydHMNCj4+Pj4+PiBvbiB0aGUgU29DLCBs
aWtlIHRoZSBjbG9jayBjb250cm9sbGVyLCB0aGF0IHdvdWxkIG5lZWQgdG8gYmUgdGFrZW4gYXdh
eQ0KPj4+Pj4+IGZyb20gdGhlIG5vbi1zZWN1cmUgd29ybGQgaWYgb25lIHdvdWxkIHdhbnQgdG8g
cnVuIGFuIHVudHJ1c3RlZCBPUw0KPj4+Pj4+IGtlcm5lbCBvbiBhIGkuTVg4TSBzeXN0ZW0uDQo+
Pj4+Pj4NCj4+Pj4+PiBUbyBwcm9wZXJseSBpbXBsZW1lbnQgc2VjdXJpdHkgb24gYW55IGkuTVg4
TSBiYXNlZCBzeXN0ZW0gdGhlIGZpcm13YXJlDQo+Pj4+Pj4gd291bGQgbmVlZCB0byBncm93IHNv
bWV0aGluZyBsaWtlIGEgZnVsbCBBUk0gU0NQSSBpbXBsZW1lbnRhdGlvbiwgc28NCj4+Pj4+PiBh
bGwgc2hhcmVkIGNyaXRpY2FsIHBlcmlwaGVyYWxzIGFyZSBzb2xlbHkgdW5kZXIgZmlybXdhcmUg
Y29udHJvbC4NCj4+Pj4+DQo+Pj4+PiBJdCBtaWdodCBiZSBwb3NzaWJsZSB0byByZXdvcmsgdGhp
cyB0byB1c2Ugc29tZSBmb3JtIG9mIFNDTUktb3Zlci1TTUMNCj4+Pj4+IGluc3RlYWQgb2YgdmVu
ZG9yLXNwZWNpZmljIFNNQ0NDIFNJUCBjYWxscw0KPiANCj4gSSB3YXMganVzdCBjdXJpb3VzIHRv
IGtub3cgaWYgdGhlcmUgaXMgYW55IHByb2dyZXNzIGJlaW5nIG1hZGUgb24NCj4gdGhpcy4gIFRo
ZSBpLm14OG1tLWV2ayBpcyBtaXNzaW5nIGZ1bmN0aW9uYWxpdHkgdXBzdHJlYW0gYW5kIEkgdGhp
bmsNCj4gdGhlIHBvd2VyIGRvbWFpbiBzdXBwb3J0IHdvdWxkIGhlbHAgZW5hYmxlIHNvbWUgb2Yg
dGhlc2UgZmVhdHVyZXMuDQo+IA0KDQpIYXMgdGhlcmUgYmVlbiBhbnkgZGVjaXNpb24gb3IgYWN0
aW9uIHRha2VuIGluIHRoaXMgdG9waWM/DQpXaWxsIHRoZSBwb3dlciBkb21haW4gZHJpdmVyIGFz
IHByb3Bvc2VkIGluIHRoaXMgcGF0Y2ggYmUgdXBzdHJlYW1lZCBhdCANCnNvbWUgdGltZSwgb3Ig
cmF0aGVyIG5vdD8NCg0KSSB0cnkgdG8gYnVpbGQgYSBtYWlubGluZSBCU1AgZm9yIGkuTVg4TU0g
KE1MIFUtQm9vdCwgTUwgVEYtQSwgTUwgTGludXgpIA0KYW5kIEkgaW50ZWdyYXRlZCBkaXNwbGF5
IGFuZCBncmFwaGljcyBzdXBwb3J0IGZyb20gdGhlIGRvd25zdHJlYW0gTlhQIA0Ka2VybmVsLg0K
DQpXaGlsZSBtb3N0IHRoaW5ncyBhbHJlYWR5IHdvcmsgZmluZSwgdGhlcmUncyB0aGUgaXNzdWUg
b2YgaG93IHRvIGhhbmRsZSANCnRoZSBwb3dlciBkb21haW5zLiBDdXJyZW50bHkgSSBuZWVkIHRv
IHVuZ2F0ZSBzb21lIGNsb2NrcyBpbiB0aGUgVEYtQSANCkJMMzEgdG8gZ2V0IGZvciBleGFtcGxl
IHRoZSBHUFUgcnVubmluZy4gSWYgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5IA0KdGhlIHBy
b3Bvc2VkIHBvd2VyIGRvbWFpbiBkcml2ZXIgY291bGQgaGFuZGxlIHRoaXMgaW4gTGludXggb3Ro
ZXJ3aXNlLg0KDQpUaGFua3MsDQpGcmllZGVy

Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21965FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 09:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7C932178F
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 09:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbfKHJY1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 04:24:27 -0500
Received: from smtp1.axis.com ([195.60.68.17]:3009 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726987AbfKHJY1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 04:24:27 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 04:24:26 EST
IronPort-SDR: uaoumzGobxbV3e0roywZVsx2sbPNsuaHcEGKR++2PNBV/YlAYkOUmOc54na2q0w/FdoSB812q8
 nR36LGkkqHApqjYMV3Xazy/J3+agPWGTIR62fvoAsp5rEKl90sjW4HID3JuCI1c90jno0wlG0l
 CiwEIByEA0BVpb3BlHfa7DDhZTD+pUeS/2lmPrX+NesCuwka4/q41x+lTZuse9aMdo/TvsUAxT
 D2i37qotolBVDyfGb1bbSMygjv3Gm8UIh6fKfLric7NAaNFp54WMISimcw68SvGxPlFSFCL5gu
 yng=
X-IronPort-AV: E=Sophos;i="5.68,280,1569276000"; 
   d="scan'208";a="2309653"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From:   Pavel Modilaynen <pavel.modilaynen@axis.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Frank Rowand <frowand.list@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: RE: [PATCH] dtc: Use pkg-config to locate libyaml
Thread-Topic: [PATCH] dtc: Use pkg-config to locate libyaml
Thread-Index: AQHVOKhfMuBY6u5s2UOc2e9G575Aw6d76EyAgAXLEDA=
Date:   Fri, 8 Nov 2019 09:17:17 +0000
Message-ID: <66bc78ec83c940cd92932221a0c5c387@XBOX07.axis.com>
References: <20190712115219.25997-1-pavelmn@axis.com>
 <CAL_JsqK-NqxuNKGv5s68DMrxpnHdU-M-vKkP4pTgdfrYRo=09A@mail.gmail.com>
In-Reply-To: <CAL_JsqK-NqxuNKGv5s68DMrxpnHdU-M-vKkP4pTgdfrYRo=09A@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KDQo+ID4gVXNpbmcgTWFr
ZWZpbGUncyB3aWxkY2FyZCB3aXRoIGFic29sdXRlIHBhdGggdG8gZGV0ZWN0IHRoZSBwcmVzZW5j
ZSBvZg0KPiA+IGxpYnlhbWwgcmVzdWx0cyBpbiBmYWxzZS1wb3NpdGl2ZSBkZXRlY3Rpb24gd2hl
biBjcm9zcy1jb21waWxpbmcgZS5nLg0KPiA+IGluIHlvY3RvIGVudmlyb25tZW50Lg0KPiANCj4g
QXMgdGhpcyBpcyBhIGhvc3QgdG9vbCwgaXQncyBub3QgcmVhbGx5IGFib3V0IGNyb3NzLWNvbXBp
bGluZywgYnV0IHNhbmRib3hpbmcgdGhlDQo+IGhvc3QgZW52PyBJT1csIEkgY3Jvc3MtY29tcGls
ZSBhbGwgdGhlIHRpbWUgYW5kIGRvbid0IGhhdmUgYW4gaXNzdWUuDQoNClllcywgeW91IGFyZSBj
b3JyZWN0LCB0aGlzIGlzIHRvIGFkZHJlc3Mgc2FuZGJveGluZywgdG9vIGxhdGUgdG8gY29ycmVj
dD8NCg0KPiANCj4gPiBVc2UgcGtnLWNvbmZpZyB0byBsb2NhdGUgbGlieWFtbCB0byBhZGRyZXNz
IHRoaXMgc2NlbmFyaW8uDQo+IA0KPiBUaGUgcmVhc29uIEkgZGlkbid0IHVzZSBwa2ctY29uZmln
IGluIHRoZSBmaXJzdCBwbGFjZSBpcyBpdCBhZGRzIGFub3RoZXINCj4gZGVwZW5kZW5jeS4gQUlV
SSwgaXQncyBvbmx5IG5lZWRlZCBmb3IgZ2NvbmZpZy94Y29uZmlnIHdoaWNoIGFyZSBwcm9iYWJs
eQ0KPiBub3Qgd2lkZWx5IHVzZWQgZXNwZWNpYWxseSBmb3IgQ0kuIExvb2tzIGxpa2Ugb2JqdG9v
bCBuZWVkcyBpdCB0b28sIGJ1dCB0aGF0J3MNCj4geDg2IG9ubHkgdGhvdWdoIGFybTY0IHN1cHBv
cnQgaXMgYmVpbmcgd29ya2VkIG9uLiBTbyBJIGd1ZXNzIGl0IGlzIHByZXR0eQ0KPiBtdWNoIGJl
Y29taW5nIGEgcmVxdWlyZW1lbnQuDQoNCkV4YWN0bHksIHRoZSBwYXRjaCB3YXMgaW5zcGlyZWQg
YnkgdXNhZ2Ugb2YgcGtnLWNvbmZpZyBpbiB0aGF0IHNoZWxsIHNjcmlwdHMgDQphc3N1bWluZyB0
aGF0IGl0J3MgbW9yZSBjb3JyZWN0IHdheSB0byBoYW5kbGUgbGlieWFtbCBkZXBlbmRlbmN5Li4u
DQpJIHNlZSBpdCBhbHNvIHVzZWQgZm9yIGJ1aWxkaW5nIHRvb2xzLg0KDQpTaG91bGQgSSBtYXli
ZSBhZGQgbmV3IHBhdGNoIHRvIGZhbGxiYWNrIHRvIHdpbGRjYXJkIHdoZW4gcGtnLWNvbmZpZyBp
cyBub3QgZm91bmQ/DQoNCj4gDQo+IFNvIEkndmUgYXBwbGllZCBpdC4gSSBhZGRlZCBzdXBwcmVz
c2luZyBzdGRlcnIgaW4gY2FzZSBwa2ctY29uZmlnIGlzbid0IHByZXNlbnQuDQoNClRoYW5rIHlv
dSENCg0KUGF2ZWwNCg==

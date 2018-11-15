Return-Path: <SRS0=9lQL=N2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:37344
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728950AbeKOW0M (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 15 Nov 2018 17:26:12 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Date: Thu, 15 Nov 2018 12:18:28 +0000
Message-ID: <OSAPR01MB15533EC80CCAB741F0B66DC58ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-2-chris.brandt@renesas.com>
 <20181113195732.GB19257@w540>
 <OSAPR01MB155328061E423C6DD4504D828AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <CAMuHMdVO9nh_zgxaBW9dmchfvxsVmLSEkm5_AcNrYE3Aw2EbRA@mail.gmail.com>
In-Reply-To: <CAMuHMdVO9nh_zgxaBW9dmchfvxsVmLSEkm5_AcNrYE3Aw2EbRA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFRodXJzZGF5LCBOb3ZlbWJlciAxNSwgMjAxOCwgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOg0KPiA+IEFzIGZvciB2YWxpZGF0aW5nIHRoZSB2YWx1ZXMsIHRoZSBvbmx5
IHRoaW5nIEkgY2FuIHJlYWxseSBjaGVjayBpcyB0aGF0Og0KPiA+ICAgb2ZfYXJncy5hcmdzWzJd
ID09IFJaQTJfTlBJTlMNCj4gPg0KPiA+IE9mIGNvdXJzZSwgbm93IHRoYXQgSSBzYXkgdGhhdCwg
SSByZWFsaXplIHRoYXQgaWYvd2hlbiBpdCBkb2VzIGNvbWUgdGltZQ0KPiA+IHRvIGV4cGFuZCB0
aGlzIGRyaXZlciBiZXlvbmQgdGhlIDEgU09DIHRoYXQgZXhpc3RzIHRvZGF5LCBJIHdpbGwgaGF2
ZQ0KPiA+IHRvIHN0b3AgdXNpbmcgdGhhdCBoYXJkIGNvZGVkIFJaQTJfTlBJTlMgdmFsdWUuLi5i
dXQgSSdsbCBkZWFsIHdpdGggdGhhdA0KPiA+IHdoZW4gdGhlIHRpbWUgY29tZXMuDQo+IA0KPiBO
b3QgdGhhdCB0aGVyZSBpcyBhbiBpbmhlcmVudCBkYW5nZXIgaW4gdGFraW5nIG9mX2FyZ3MuYXJn
c1syXSB3aXRob3V0DQo+IHZhbGlkYXRpb24gdG8gc3VwcG9ydCBmdXR1cmUgU29DcyB3aXRob3V0
IGRyaXZlciBjaGFuZ2VzLg0KPiBwb3J0X25hbWVzW10gaXMgYSBmaXhlZCBzaXplIGFycmF5LCBz
byBhbiBTb0Mgd2l0aCBtb3JlIHBpbnMgd2lsbA0KPiBjYXVzZSBtZW1vcnkgYWNjZXNzIGJleW9u
ZCB0aGUgZW5kIG9mIHRoZSBhcnJheS4gUG9zc2libHkgdGhlcmUgYXJlDQo+IG90aGVyIGxvY2F0
aW9ucyB0aGF0IG5lZWQgdG8gYmUgY2hhbmdlZC4NCj4gDQo+IFNvIElNSE8gaXQncyBiZXR0ZXIg
dG8gaGF2ZSBleHBsaWNpdCBzdXBwb3J0IGZvciBkaWZmZXJlbnQgU29DcyB1c2luZw0KPiBkaWZm
ZXJlbnQgY29tcGF0aWJsZSB2YWx1ZXMsIHNvIHlvdSBjYW4gc3RvcmUgdGhlIG51bWJlciBvZiBw
aW5zIGluDQo+IG9mX2RldmljZV9pZC5kYXRhLCBhbmQgdmFsaWRhdGUgYWdhaW5zdCB0aGF0Lg0K
DQpJIHdpbGwgZmlsbCBpbiBvZl9kZXZpY2VfaWQuZGF0YSB3aXRoIHRoZSBudW1iZXIgb2YgcG9y
dHMgZm9yIGVhY2ggU09DIA0KKG9ubHkgMSBTT0MgdG9kYXkpIGFuZCB0aGVuIHVzZSB0aGF0IG51
bWJlciB0aHJvdWdob3V0IHRoZSBkcml2ZXIgaW5zdGVhZCANCm9mIHRoZSBoYXJkIGNvZGVkIG51
bWJlci4NCkknbGwgYWxzbyBjaGVjayB0aGF0IG9mX2FyZ3MuYXJnc1syXSBtYXRjaGVzIG9mX2Rl
dmljZV9pZC5kYXRhLg0KDQpUaGVuLCBpdCBzaG91bGQgYmUgcmVhbCBlYXN5IHRvIGFkZCBzdXBw
b3J0IGZvciBhbm90aGVyIFNPQyB3aGVuIGl0IA0KY29tZXMgYWxvbmcuIFJaL1QxIHdoaWNoIGhh
cyB0aGUgc2FtZSBjb250cm9sbGVyIGhhcyBwb3J0cyB1cCB0bw0KUG9ydCAiVSIgZm9yIGV4YW1w
bGUuDQoNCkNocmlzDQoNCg==

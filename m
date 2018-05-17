Return-Path: <SRS0=KKmW=IE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40045.outbound.protection.outlook.com ([40.107.4.45]:36690
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751494AbeEQNxG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 17 May 2018 09:53:06 -0400
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 05/14] usb: typec: add API to get typec basic port
 power and data config
Date: Thu, 17 May 2018 13:53:01 +0000
Message-ID: <VI1PR0402MB39175918FAC406501855417F89910@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-6-git-send-email-jun.li@nxp.com>
 <c28a8352-e960-449b-e7c1-7965d340536e@gmail.com>
 <VI1PR0402MB3917CE86B45CBC1B6F7F576B899C0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <74e1c164-1652-75f4-409c-bd1c214bda4d@gmail.com>
 <20180516122527.GC11469@kuha.fi.intel.com>
 <33d02e76-bdf2-be50-68ec-9d520acdbe82@gmail.com>
In-Reply-To: <33d02e76-bdf2-be50-68ec-9d520acdbe82@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Mats Karrman <mats.dev.list@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, Peter Chen <peter.chen@nxp.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGkgTWF0cw0KDQo+IEkgcmVyZWFkIHRoaXMgcGF0Y2ggYW5kIHRyaWVkIHRvIHNlZSBpdCBtb3Jl
IGluIHRoZSBjb250ZXh0IG9mIHRoZSBvdGhlciBwYXRjaGVzDQo+IGFuZCB0aGUgZXhpc3Rpbmcg
Y29kZS4gVGhlIG5hbWluZyBvZiB0aGUgZXhpc3Rpbmcgc3RyaW5nIHRhYmxlcyBkb2Vzbid0IGhl
bHAgaW4NCj4gZ2V0dGluZyB0aGlzIHJpZ2h0LCBob3dldmVyIEkgaGF2ZSBhIHByb3Bvc2FsOg0K
PiANCj4gdHlwZWNfZmluZF9wb3J0X3Bvd2VyX3JvbGUoKSB0byBnZXQgdG8gVFlQRUNfUE9SVF9T
UkMvU05LL0RSUA0KPiB0eXBlY19maW5kX3BvcnRfZGF0YV9yb2xlKCkgdG8gZ2V0IHRvIFRZUEVD
X1BPUlRfREZQL1VGUC9EUkQNCj4gdHlwZWNfZmluZF9wb3dlcl9yb2xlKCkgdG8gZ2V0IHRvIFRZ
UEVDX1NJTksvU09VUkNFDQo+IA0KPiBhbmQgc29tZXRpbWUsIGlmIHRoZSB1c2Ugc2hvdWxkIGFy
aXNlDQo+IA0KPiB0eXBlY19maW5kX2RhdGFfcm9sZSgpIHRvIGdldCB0byBUWVBFQ19ERVZJQ0Uv
SE9TVA0KPiANCj4gSSB0aGluayBpdCBpcyBmYWlybHkgY29tcHJlaGVuc2libGUsICpfcG9ydF8q
IGNvbmNlcm5zIGEgY2FwYWJpbGl0eSBhbmQgd2l0aG91dA0KPiAqX3BvcnRfKiBpdCBpcyBhbiBh
Y3R1YWwgc3RhdGUuIFBsdXMgaXQgbWF0Y2hlcyB0aGUgbmFtZXMgb2YgdGhlIGNvbnN0YW50cy4N
Cj4gDQoNClJlYXNvbmFibGUgdG8gbWUsIEkgd2FzIHVzaW5nICJ0eXBlIiB0byBjb25jZXJuIGEg
Y2FwYWJpbGl0eSBidXQgaXQgd2FzIG5vdA0KcHJlZmVycmVkLCBpZiBIZWlra2kgYWdyZWUgdGhp
cyBwcm9wb3NhbCwgSSB3aWxsIGNoYW5nZSB0aGUgQVBJIG5hbWVzIGxpa2UgdGhpcw0KYW5kIGlu
Y2x1ZGUgNCBBUElzIGFib3ZlLg0KIA0KVGhhbmtzDQpMaSBKdW4NCg==

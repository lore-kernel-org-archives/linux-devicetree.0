Return-Path: <SRS0=/AVO=NC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from skedge04.snt-world.com ([91.208.41.69]:45194 "EHLO
        skedge04.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727554AbeJVXVB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Oct 2018 19:21:01 -0400
From: Schrempf Frieder <frieder.schrempf@kontron.De>
Subject: Re: [PATCH v2 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Date: Mon, 22 Oct 2018 14:54:57 +0000
Message-ID: <2f67fca8-5a50-641e-9e56-6a5a701a2f70@kontron.de>
References: <20181022054031.14027-1-peter.chen@nxp.com>
 <20181022054031.14027-5-peter.chen@nxp.com>
In-Reply-To: <20181022054031.14027-5-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <699B3F42AD72DE4EAD1E7C61780682D6@snt-world.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

T24gMjIuMTAuMTggMDc6NDMsIFBldGVyIENoZW4gd3JvdGU6DQo+IEZvciBVU0IgSFNJQywgdGhl
IGRhdGEgYW5kIHN0cm9iZSBwaW4gbmVlZHMgdG8gYmUgcHVsbGVkIGRvd24NCj4gYXQgZGVmYXVs
dCwgd2UgY29uc2lkZXIgaXQgYXMgImlkbGUiIHN0YXRlLiBXaGVuIHRoZSBVU0IgaG9zdA0KPiBp
cyByZWFkeSB0byBiZSB1c2VkLCB0aGUgc3Ryb2JlIHBpbiBuZWVkcyB0byBiZSBwdWxsZWQgdXAs
DQo+IHdlIGNvbnNpZGVyIGl0IGFzICJhY3RpdmUiIHN0YXRlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiAtLS0NCj4gICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQgfCAxICsNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQNCj4gaW5kZXgg
NTI5ZTUxODc5ZmIyLi4xMGM4ZDc5M2VhNDkgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnR4dA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpLWhkcmMtdXNiMi50eHQNCj4gQEAgLTgx
LDYgKzgxLDcgQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gICAgIG11eCBzdGF0ZSBvZiAxIGlu
ZGljYXRlcyBob3N0IG1vZGUuDQo+ICAgLSBtdXgtY29udHJvbC1uYW1lczogU2hhbGwgYmUgInVz
Yl9zd2l0Y2giIGlmIG11eC1jb250cm9scyBpcyBzcGVjaWZpZWQuDQo+ICAgLSBwaW5jdHJsLW5h
bWVzOiBOYW1lcyBmb3Igb3B0aW9uYWwgcGluIG1vZGVzIGluICJkZWZhdWx0IiwgImhvc3QiLCAi
ZGV2aWNlIg0KPiArICBPciBuYW1lcyBmb3IgSFNJQyAiaWRsZSIgYW5kICJhY3RpdmUiIHBpbiBt
b2Rlcy4NCg0KSSB0aGluayB5b3UgZm9yZ290IHRvIGltcHJvdmUgdGhpcyBkZXNjcmlwdGlvbi4g
TWF5YmUgc29tZXRoaW5nIGxpa2UgdGhpczoNCg0KcGluY3RybC1uYW1lczogTmFtZXMgZm9yIG9w
dGlvbmFsIHBpbiBtb2RlcyBmb3IgImRlZmF1bHQiLCAiaG9zdCIgb3INCiAgICAgICAgICAgICAg
ICAiZGV2aWNlIi4gSW4gY2FzZSBvZiBIU0lDLW1vZGUgImlkbGUiIGFuZCAiYWN0aXZlIiBwaW4N
CiAgICAgICAgICAgICAgICBtb2RlcyBhcmUgbWFuZGF0b3J5LiBJbiB0aGlzIGNhc2UgdGhlICJp
ZGxlIiBzdGF0ZSBuZWVkcw0KICAgICAgICAgICAgICAgIHRvIHB1bGwgZG93biB0aGUgZGF0YSBh
bmQgc3Ryb2JlIHBpbiBhbmQgdGhlICJhY3RpdmUiDQogICAgICAgICAgICAgICAgc3RhdGUgbmVl
ZHMgdG8gcHVsbCB1cCB0aGUgc3Ryb2JlIHBpbi4NCg0KVGhhbmtzLA0KRnJpZWRlcg0KDQo+ICAg
LSBwaW5jdHJsLW46IGFsdGVybmF0ZSBwaW4gbW9kZXMNCj4gICANCj4gICBpLm14IHNwZWNpZmlj
IHByb3BlcnRpZXMNCj4g

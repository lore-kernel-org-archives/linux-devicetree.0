Return-Path: <SRS0=5gq4=M5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40088.outbound.protection.outlook.com ([40.107.4.88]:43360
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726067AbeJQI5U (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 17 Oct 2018 04:57:20 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Date: Wed, 17 Oct 2018 01:04:08 +0000
Message-ID: <VI1PR04MB532714955E773B5F0ECB23F68BFF0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20181016045846.2345-1-peter.chen@nxp.com>
 <20181016045846.2345-5-peter.chen@nxp.com>
 <CAOMZO5Cts2=Y10P0bAXDRTnQ7trgzwb2EBpxjcV7GBY7HwXKCA@mail.gmail.com>
In-Reply-To: <CAOMZO5Cts2=Y10P0bAXDRTnQ7trgzwb2EBpxjcV7GBY7HwXKCA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>, dl-linux-imx <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

IA0KPiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCAyOjAyIEFNIFBldGVyIENoZW4gPHBldGVyLmNo
ZW5AbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGb3IgVVNCIEhTSUMsIHRoZSBkYXRhIGFuZCBz
dHJvYmUgcGluIG5lZWRzIHRvIGJlIHB1bGxlZCBkb3duIGF0DQo+ID4gZGVmYXVsdCwgd2UgY29u
c2lkZXIgaXQgYXMgImlkbGUiIHN0YXRlLiBXaGVuIHRoZSBVU0IgaG9zdCBpcyByZWFkeSB0bw0K
PiA+IGJlIHVzZWQsIHRoZSBzdHJvYmUgcGluIG5lZWRzIHRvIGJlIHB1bGxlZCB1cCwgd2UgY29u
c2lkZXIgaXQgYXMNCj4gPiAiYWN0aXZlIiBzdGF0ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBldGVyIENoZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIudHh0IHwgMSArDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnR4dA0KPiA+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIudHh0
DQo+ID4gaW5kZXggNTI5ZTUxODc5ZmIyLi4xMGM4ZDc5M2VhNDkgMTAwNjQ0DQo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVzYjIudHh0DQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jaS1oZHJjLXVz
YjIudHh0DQo+ID4gQEAgLTgxLDYgKzgxLDcgQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gPiAg
ICBtdXggc3RhdGUgb2YgMSBpbmRpY2F0ZXMgaG9zdCBtb2RlLg0KPiA+ICAtIG11eC1jb250cm9s
LW5hbWVzOiBTaGFsbCBiZSAidXNiX3N3aXRjaCIgaWYgbXV4LWNvbnRyb2xzIGlzIHNwZWNpZmll
ZC4NCj4gPiAgLSBwaW5jdHJsLW5hbWVzOiBOYW1lcyBmb3Igb3B0aW9uYWwgcGluIG1vZGVzIGlu
ICJkZWZhdWx0IiwgImhvc3QiLCAiZGV2aWNlIg0KPiA+ICsgIE9yIG5hbWVzIGZvciBIU0lDICJp
ZGxlIiBhbmQgImFjdGl2ZSIgcGluIG1vZGVzLg0KPiANCj4gSSBkb24ndCB0aGluayB0aGlzIGRl
c2NyaXB0aW9uIGlzIGNsZWFyIGVub3VnaC4NCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgYWRkIGEg
cmVhbCBkdHMgc25pcHBldCBmb3IgdGhlIEhTSUMgY2FzZSBpbnN0ZWFkPw0KDQpPaywgSSB3aWxs
IGFkZCBleGFtcGxlIGxpa2UgYmVsb3cgYXQgbmV4dCB2ZXJzaW9uLg0KIHVzYkAwMjE4NDAwMCB7
IC8qIFVTQiBPVEcgKi8gew0KCS4uLg0KICAgICAgICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAi
aWRsZSIsICJhY3RpdmUiOw0KICAgICAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF91
c2JoMl8xPjsNCiAgICAgICAgICAgICAgICBwaW5jdHJsLTEgPSA8JnBpbmN0cmxfdXNiaDJfMj47
DQoJLi4uDQp9Ow0KDQpQZXRlcg0K

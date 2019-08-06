From: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Date: Tue, 6 Aug 2019 20:35:43 +0000
Message-ID: <E47FF678-1B81-4C00-9328-B0452D74E62D@fb.com>
References: <20190723002052.2878847-1-vijaykhemka@fb.com>
 <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
 <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
 <F7BAC53E-925E-4FA4-815D-ACB82DF8D240@fb.com>
 <CACPK8XehEoakQxvQhC1cU5tvZaVbLOARtZ4xc6dD8sx9WDiPuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8XehEoakQxvQhC1cU5tvZaVbLOARtZ4xc6dD8sx9WDiPuA@mail.gmail.com>
Content-Language: en-US
Content-ID: <7157F82B2A3E1544A74117E5DB728CBD@namprd15.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Herbert Xu <herbert@gondor.apana.org.au>, Patrick Venture <venture@google.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Anson Huang <anson.huang@nxp.com>, Jeremy Gebben <jgebben@sweptlaser.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>
List-Id: devicetree@vger.kernel.org

Sm9lbCwNCkkgaGF2ZSBhZGRlZCBhbGwgMyBpZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBwYXRjaCBh
bmQgSSBhbSBub3Qgc3VyZSBpZiB0aGF0IHBhdGNoIGhhcyBiZWVuIGFwcGxpZWQgb3Igbm90Lg0K
DQpSZWdhcmRzDQotVmlqYXkNCg0K77u/T24gOC8xLzE5LCAxMTozMSBQTSwgIkpvZWwgU3Rhbmxl
eSIgPGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCg0KICAgIEFkZCBweGUxNjEwIGFzIGEgdHJpdmlh
bCBkZXZpY2UNCiAgICANCiAgICANCiAgICANCiAgICBPbiBUdWUsIDIzIEp1bCAyMDE5IGF0IDE3
OjE0LCBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPg0KICAg
ID4gT24gNy8yMy8xOSwgNzo1MyBBTSwgIlJvYiBIZXJyaW5nIiA8cm9iaCtkdEBrZXJuZWwub3Jn
PiB3cm90ZToNCiAgICA+DQogICAgPiAgICAgT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgODo1MCBB
TSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90ZToNCiAgICA+ICAgICA+DQog
ICAgPiAgICAgPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCA2OjQ2IFBNIFZpamF5IEtoZW1rYSA8
dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+ICAgICA+ID4NCiAgICA+ICAgICA+ID4g
VGhlIHB4ZTE2MTAgaXMgYSB2b2x0YWdlIHJlZ3VsYXRvciBmcm9tIEluZmluZW9uLiBJdCBhbHNv
IHN1cHBvcnRzDQogICAgPiAgICAgPiA+IG90aGVyIFZScyBweGUxMTEwIGFuZCBweG0xMzEwIGZy
b20gSW5maW5lb24uDQogICAgPg0KICAgID4gICAgIFdoYXQgaGFwcGVuZWQgdG8gdGhlIG90aGVy
IGNvbXBhdGlibGVzPyBTL3cgZG9lc24ndCBuZWVkIHRvIGtub3cgdGhlDQogICAgPiAgICAgZGlm
ZmVyZW5jZXM/DQogICAgPiBBcyBmYXIgYXMgZHJpdmVyIGlzIGNvbmNlcm5lZCwgaXQgZG9lc24n
dCBuZWVkIHRvIGtub3cgZGlmZmVyZW5jZXMuDQogICAgDQogICAgWW91IGhhdmUgdGhlc2UgdGhy
ZWUgSURzIGluIHRoZSBkcml2ZXI6DQogICAgDQogICAgIHB4bTEzMTANCiAgICAgcHhtMTMxMA0K
ICAgICBweGUxNjEwDQogICAgDQogICAgU28gYWxsIHRocmVlIGNvdWxkIGJlIGxpc3RlZCBpbiB0
aGUgZG9jdW1lbnRhdGlvbj8NCiAgICANCiAgICBSb2IsIGlzIHRoaXMgd2hhdCB5b3Ugd2FudGVk
IFZpamF5IHRvIGRvPw0KICAgIA0KDQo=

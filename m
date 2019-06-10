From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v7 1/6] dt-bindings: add binding for USBSS-DRD controller.
Date: Mon, 10 Jun 2019 06:52:44 +0000
Message-ID: <VI1PR04MB5327D364DC5930C3A954AA6A8B130@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-2-git-send-email-pawell@cadence.com>
 <f032b3f3-409d-b0fc-8d5f-01c898b4c7a7@ti.com>
 <BYAPR07MB470903AF06C1F8A34BBB3C64DD100@BYAPR07MB4709.namprd07.prod.outlook.com>
 <64be9d26-2a68-1b90-89c8-29b227e0cd9c@ti.com>
 <BYAPR07MB470965B3CBCB58E1C7B1253FDD130@BYAPR07MB4709.namprd07.prod.outlook.com>
 <VI1PR04MB532797447E56454C0E2D3F668B130@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <BYAPR07MB470915AB1D833EC1CEA5C8D7DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB470915AB1D833EC1CEA5C8D7DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

DQogDQo+ID4+ICAtIHJlZy1uYW1lcyAtIHJlZ2lzdGVyIG1lbW9yeSBhcmVhIG5hbWVzOg0KPiA+
PiAgICAgICAgICJ4aGNpIiAtIGZvciBIT1NUIHJlZ2lzdGVycyBzcGFjZQ0KPiA+PiAgICAgICAg
ICJkZXYiIC0gZm9yIERFVklDRSByZWdpc3RlcnMgc3BhY2UNCj4gPj4gICAgICAgICAib3RnIiAt
IGZvciBPVEcvRFJEIHJlZ2lzdGVycyBzcGFjZQ0KPiA+PiAgLSBjb21wYXRpYmxlOiBTaG91bGQg
Y29udGFpbjoNCj4gPj4gICAgICAgICAiY2Rucyx1c2IzLTEuMC4wIiAtIGZvciAweDAwMDI0NTAy
IGNvbnRyb2xsZXIgdmVyc2lvbg0KPiA+PiAgICAgICAgICJjZG5zLHVzYjMtMS4wLjEiIC0gZm9y
IDB4MDAwMjQ1MDkgY29udHJvbGxlciB2ZXJzaW9uDQo+ID4+ICAgICAgICAgImNkbnMsdXNiMy0x
LjAuMiIgLSBmb3IgMHgwMDAyNDUwQyBjb250cm9sbGVyIHZlcnNpb24NCj4gPj4gICAgICAgICAi
Y2Rucyx1c2IzLTEuMC4zIiAtIGZvciAweDAwMDI0NTBkIGNvbnRyb2xsZXIgdmVyc2lvbg0KPiA+
DQo+ID5JZiB0aGUgdmFsdWUgY2FuIGJlIHJlYWQgZnJvbSByZWdpc3Rlciwgd2h5IHdlIHN0aWxs
IG5lZWQgZGlmZmVyZW50IGNvbXBhdGlibGVzPw0KPiBXZSBkb24ndCBuZWVkIGl0LiBJIGxlZnQg
aXQgb25seSAgYXMgaW5mb3JtYXRpb24gdGhhdCBjZG5zMyBjb250cm9sbGVyIGV4aXN0IGluIDQg
ZGlmZmVyZW50DQo+IHZlcnNpb24uDQo+IA0KDQpTbywgeW91IHdpbGwgaGF2ZSBvbmx5IG9uZSBj
b21wYXRpYmxlIGF0IGJvdGggZHJpdmVyIGFuZCBiaW5kaW5nIGRvYywgZWcgImNkbnMsIHVzYjMi
Pw0KQW5kIHlvdSBtYXkgbW92ZSB0aGUgY29udHJvbGxlciBpbmZvcm1hdGlvbiBpbnRvIHRoZSBk
cml2ZXIsIGFuZCBoYXZlIGEgTUFDUk8gZm9yIGl0Pw0KDQo+ID4+IE1heWJlIEkgc2hvdWxkIGFk
ZCBhbHNvIHNvbWV0aGluZyBmb3IgdXNiMl9waHkgaW4gZHQtYmluZGluZyBhbmQgaW4gZHJpdmVy
ID8NCj4gPj4NCj4gPg0KPiA+VGhlIFBIWSBkcml2ZXIgaXMgbG9jYXRlZCBhdDogZHJpdmVycy9w
aHkvY2FkZW5jZS9waHktY2FkZW5jZS1zaWVycmEuYy4NCj4gPldpbGwgd2UgbmVlZCBhbm90aGVy
IG9uZSBmb3IgVVNCMiBQSFk/DQo+IA0KPiBBcyBJIGtub3cgc2llcnJhIHBoeSBpcyBVU0IzLjAg
cGh5Lg0KPiBBbHNvIEkga25vdyB0aGF0IHdlIGhhdmUgdG9yZW50IHBoeSBkcml2ZXIgZm9yIDIu
MC4gSXQncyByZWFkeSBidXQgaXMgaGFzIG5vdCB5ZXQgaW4NCj4ga2VybmVsLg0KPiBTbyBJIGFz
c3VtZSB0aGF0IEkgc2hvdWxkIGNoYW5nZQ0KPiAgICAgICAgICAgICAgIHBoeXMgPSA8JnVzYjNf
cGh5PjsNCj4gICAgICAgICAgICAgICBwaHktbmFtZXMgPSAiY2RuczMsdXNicGh5IjsNCj4gDQo+
IHdpdGg6DQo+ICAgICAgICAgICAgICAgICAgcGh5cyA9IDwmdXNiMl9waHk+LCA8JnVzYjNfcGh5
PjsNCj4gICAgICAgICAgICAgICAgICBwaHktbmFtZXMgPSAiY2RuczMsdXNicGh5MiIsICJjZG5z
Myx1c2JwaHkzIjsNCj4gDQogDQpZZXMsIEkgdGhpbmsgc28uDQoNClBldGVyDQo=

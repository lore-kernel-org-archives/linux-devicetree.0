From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v2 5/5] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Fri, 28 Dec 2018 01:31:27 +0000
Message-ID: <VI1PR04MB53274270615A700AB36967F78BB70@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1545577992-4013-1-git-send-email-pawell@cadence.com>
 <1545577992-4013-6-git-send-email-pawell@cadence.com>
 <CAL411-rj0mRMfPCZOHw04q3s-9oJx7Os9Jz83bO=RgPZKLrB1g@mail.gmail.com>
 <CAL411-omVL2rwoQP6GwKZa9f_1TLBbEAkyLdxNkJZqaQu9cvsA@mail.gmail.com>
 <BYAPR07MB4709F8A00A13390235BA4BE1DDB60@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709F8A00A13390235BA4BE1DDB60@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

IA0KPiA+DQo+ID5AQCAtMjk5LDYgKzMwNiw3IEBAIGludCBjZG5zM19kcmRfaW5pdChzdHJ1Y3Qg
Y2RuczMgKmNkbnMpDQo+ID4gICAgICAgICAgICAgICAgY2Rucy0+dmVyc2lvbiAgPSBDRE5TM19D
T05UUk9MTEVSX1YwOw0KPiA+ICAgICAgICAgICAgICAgIGNkbnMtPm90Z192MV9yZWdzID0gTlVM
TDsNCj4gPiAgICAgICAgICAgICAgICBjZG5zLT5vdGdfcmVncyA9IHJlZ3M7DQo+ID4rICAgICAg
ICAgICAgICAgd3JpdGVsKDB4MSwgJmNkbnMtPm90Z192MF9yZWdzLT5zaW11bGF0ZSk7DQo+ID4g
ICAgICAgICAgICAgICAgZGV2X2luZm8oY2Rucy0+ZGV2LCAiRFJEIHZlcnNpb24gdjAgKCUwOHgp
XG4iLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWRsKCZjZG5zLT5vdGdfdjBfcmVn
cy0+dmVyc2lvbikpOw0KPiA+ICAgICAgICB9IGVsc2Ugew0KPiANCj4gSSBoYXZlIGNvbmZpcm1h
dGlvbiBmcm9tIEhXIHRlYW0gdGhhdCB0aW1lIHRoYXQgZHJpdmVyIHNob3VsZCB3YWl0IGFmdGVy
IGRlLQ0KPiBzZWxlY3RpbmcgbW9kZSBpcyAyLTNtcyBmb3Igc2ltdWxhdGUgbW9kZS4gSXQncyB0
aW1lIHdoZW4gRlNNIGlzIGluDQo+IERSRF9IX1dBSVRfVkJVU19GQUlMLg0KPiBEcml2ZXIgY2Fu
bm90IHJlLWVuYWJsZSB0aGUgaG9zdC9kZXZpY2UgbW9kZSBiZWZvcmUgdGhpcyB0aW1lIGhhcyBl
bGFwc2VkLg0KPiANCj4gMyBtcyBpcyB0aGUgbWF4aW11bSB0aW1lLiBBZGRpdGlvbmFsbHksIHlv
dSBjYW4gY29uZmlybSB0aGUgY3VycmVudCBGU00gc3RhdGUgYnkNCj4gcmVhZGluZyB0aGUgaG9z
dF9vdGdfc3RhdGUgKGJpdCA1OjMpIG9yIGRldl9vdGdfc3RhdGUgKDI6MCkgIGZyb20gT1RHU1RB
VEUNCj4gcmVnaXN0ZXIuDQo+IA0KPiBJZiBiaXQgMCBpbiBzaW11bGF0ZSByZWdpc3RlciBpcyBj
bGVhcmVkIHRoZSB0aW1lIGlzIGV4YWN0bHkgMXMuDQo+IA0KDQpUaGFua3MsIFBhd2VsLg0KDQpX
b3VsZCB5b3UgcGxlYXNlIGFkZCBiZWxvdyBjaGFuZ2VzIGluIHlvdXIgbmV4dCByZXZpc2lvbj8N
Ci0gU2V0IGJpdCAwIGluIHNpbXVsYXRlIHJlZ2lzdGVyDQotIHRpbWVvdXQgbG9naWMgZm9yIHdh
aXRpbmcgaG9zdF9vdGdfc3RhdGUgb3IgZGV2X290Z19zdGF0ZSBhdCBPVEdTVEFURQ0Kd2hlbiBz
d2l0Y2ggdG8gaG9zdCBvciBkZXZpY2UuDQoNClBldGVyDQoNCg==

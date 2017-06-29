From: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH 4/8] usb: bdc: Small code cleanup
Date: Thu, 29 Jun 2017 14:28:23 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DD002DC6D@AcuExch.aculab.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-5-git-send-email-alcooperx@gmail.com>
 <063D6719AE5E284EB5DD2968C1650D6DD002C93C@AcuExch.aculab.com>
 <CAGh=XABghZ73=TNToMvpQWXP26dS1W8iujj1uQtOB8ewf+Mpew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGh=XABghZ73=TNToMvpQWXP26dS1W8iujj1uQtOB8ewf+Mpew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Al Cooper' <al.cooper-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yuan linyu <Linyu.Yuan-cfy2TCaE7SHLM0G2K2Xlo2/U75nxZMCp@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

RnJvbTogQWwgQ29vcGVyDQo+IFNlbnQ6IDI4IEp1bmUgMjAxNyAxNTo1Ng0KPiBPbiBXZWQsIEp1
biAyOCwgMjAxNyBhdCA0OjQ3IEFNLCBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBhY3VsYWIu
Y29tPiB3cm90ZToNCj4gPj4NCj4gPj4gICAgICAgdGVtcCA9IGJkY19yZWFkbChiZGMtPnJlZ3Ms
IEJEQ19CRENTQyk7DQo+ID4+ICAgICAgIGlmICgodGVtcCAmIEJEQ19QNjQpICYmDQo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAhZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkZXYsIERNQV9C
SVRfTUFTSyg2NCkpKSB7DQo+ID4+IC0gICAgICAgICAgICAgZGV2X2RiZyhiZGMtPmRldiwgIlVz
aW5nIDY0LWJpdCBhZGRyZXNzXG4iKTsNCj4gPj4gKyAgICAgICAgICAgICBkZXZfZGJnKGRldiwg
IlVzaW5nIDY0LWJpdCBhZGRyZXNzXG4iKTsNCj4gPj4gICAgICAgfSBlbHNlIHsNCj4gPj4gLSAg
ICAgICAgICAgICByZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERN
QV9CSVRfTUFTSygzMikpOw0KPiA+PiArICAgICAgICAgICAgIHJldCA9IGRtYV9zZXRfbWFza19h
bmRfY29oZXJlbnQoZGV2LCBETUFfQklUX01BU0soMzIpKTsNCj4gPg0KPiA+IFRoYXQganVzdCB3
cm9uZy4uLg0KPiA+IE9yIHdhcyB3cm9uZyBiZWZvcmUuDQo+IA0KPiBXaHkgaXMgdGhpcyB3cm9u
Zz8NCg0KSXQgaXNuJ3Qgb2J2aW91cyB0aGF0ICZwZGV2LT5kZXYgaXMgYmRjLT5kZXYgYW5kIGhl
bmNlIGRldi4NCg0KCURhdmlkDQoNCg==
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

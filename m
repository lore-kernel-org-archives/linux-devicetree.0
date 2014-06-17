From: "Opensource [Adam Thomson]" <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 6/8] power: Add support for DA9150 Charger
Date: Tue, 17 Jun 2014 08:21:39 +0000
Message-ID: <2E89032DDAA8B9408CB92943514A0337AB4FDA47@SW-EX-MBX01.diasemi.com>
References: <cover.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
 <d4ef0d7ce2d6a2919d528ed75e82d2b99ec8d962.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
 <20140616132749.GW14323@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140616132749.GW14323@lee--X1>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Opensource [Adam Thomson]" <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gSnVuZSAxNiwgMjAxNCAxNDoyOCwgTGVlIEpvbmVzIHdyb3RlOg0KDQo+ID4gKyNpZm5kZWYg
X0RBOTE1MF9DSEFSR0VSX0gNCj4gPiArI2RlZmluZSBfREE5MTUwX0NIQVJHRVJfSA0KPiANCj4g
VHdvICdfJ3MgYXJlIG5vcm1hbGx5IHByZWZlcnJlZC4NCg0KT2ssIGNhbiBjaGFuZ2UgaXQgYWNj
b3JkaW5nbHkuDQoNCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2kyYy5oPg0KPiANCj4gV2hhdCBhcmUgeW91IHVzaW5nIHRoaXMgZm9yPw0K
DQpOb3RoaW5nLiBXaWxsIHJlbW92ZSB0aGVtLiBUaGFua3MuDQoNCj4gPiArI2luY2x1ZGUgPGxp
bnV4L21mZC9kYTkxNTAvY29yZS5oPg0KPiA+ICsNCj4gPiArDQo+IA0KPiBFeHRyYSAnXG4nIGhl
cmUuDQoNClllcywganVzdCBzZXBhcmF0ZSBpbmNsdWRlcyBmcm9tIHRoZSByZXN0IG9mIHRoZSBm
aWxlLiBGaW5kIGl0IG1vcmUgcmVhZGFibGUuDQpJZiBpdCdzIGFuIGlzc3VlIHRob3VnaCBJIGNh
biByZW1vdmUgaXQuDQoNCj4gPiArCXN0cnVjdCBwb3dlcl9zdXBwbHkgYWM7DQo+ID4gKwlzdHJ1
Y3QgcG93ZXJfc3VwcGx5IHVzYjsNCj4gPiArCXN0cnVjdCBwb3dlcl9zdXBwbHkgYmF0dGVyeTsN
Cj4gDQo+IERvIHlvdSB3YW50IHRoZXNlIChvciBwb2ludGVycyB0byB0aGVzZSkgaGVyZT8NCj4g
DQo+IEhvdyBtdWNoIHNwYWNlIGRvIHRoZXkgdGFrZSB1cD8NCg0KWWVzIHRoZXNlIGFyZSByZXF1
aXJlZCBpbiB0aGF0IHN0cnVjdHVyZS4gVGhpcyBpcyB0aGUgY29tbW9uIGFwcHJvYWNoIGZvcg0K
cG93ZXJfc3VwcGx5IGRyaXZlcnMuIFRoZSBzdHJ1Y3R1cmVzLCBoYXZpbmcgaGFkIGEgdmVyeSBx
dWljayBsb29rLCBhcmUgYXJvdW5kDQptYXliZSA3MCBieXRlcyBlYWNoLg0K

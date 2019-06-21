From: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH v7 3/7] cpu-topology: Move cpu topology code to common
 code.
Date: Fri, 21 Jun 2019 22:31:27 +0000
Message-ID: <91559562f2958fa904b53e621e596d6216efa9fb.camel@wdc.com>
References: <20190617185920.29581-1-atish.patra@wdc.com>
         <20190617185920.29581-4-atish.patra@wdc.com>
         <20190619173801.GB20916@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619173801.GB20916@kroah.com>
Content-Language: en-US
Content-ID: <27C05F5F6A9C554FA6F50BCF64D1706A@namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "rfontana@redhat.com" <rfontana@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "davem@davemloft.net" <davem@davemloft.net>, "jhugo@codeaurora.org" <jhugo@codeaurora.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mingo@kernel.org" <mingo@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "will.deacon@arm.com" <will.deacon@arm.com>, morten.rasmussen@a
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA2LTE5IGF0IDE5OjM4ICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDExOjU5OjE2QU0gLTA3MDAsIEF0aXNoIFBh
dHJhIHdyb3RlOg0KPiA+IEJvdGggUklTQy1WICYgQVJNNjQgYXJlIHVzaW5nIGNwdS1tYXAgZGV2
aWNlIHRyZWUgdG8gZGVzY3JpYmUNCj4gPiB0aGVpciBjcHUgdG9wb2xvZ3kuIEl0J3MgYmV0dGVy
IHRvIG1vdmUgdGhlIHJlbGV2YW50IGNvZGUgdG8NCj4gPiBhIGNvbW1vbiBwbGFjZSBpbnN0ZWFk
IG9mIGR1cGxpY2F0ZSBjb2RlLg0KPiA+IA0KPiA+IFRvOiBXaWxsIERlYWNvbiA8d2lsbC5kZWFj
b25AYXJtLmNvbT4NCj4gPiBUbzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJt
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNv
bT4NCj4gPiBbVGVzdGVkIG9uIFFERjI0MDBdDQo+ID4gVGVzdGVkLWJ5OiBKZWZmcmV5IEh1Z28g
PGpodWdvQGNvZGVhdXJvcmEub3JnPg0KPiA+IFtUZXN0ZWQgb24gSnVubyBhbmQgb3RoZXIgZW1i
ZWRkZWQgcGxhdGZvcm1zLl0NCj4gPiBUZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhv
bGxhQGFybS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxh
QGFybS5jb20+DQo+ID4gQWNrZWQtYnk6IFdpbGwgRGVhY29uIDx3aWxsLmRlYWNvbkBhcm0uY29t
Pg0KPiANCj4gQWNrZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+DQoNCkhpIFBhdWwsDQpJIGd1ZXNzIEdyZWcgaGFzIGFja2VkIHRoZSBzZXJpZXMg
YXNzdW1pbmcgdGhhdCBpdCB3aWxsIGdvIHRocm91Z2ggc29tZQ0Kb3RoZXIgdHJlZS4gQ2FuIHlv
dSB0YWtlIGl0IHRocm91Z2ggUklTQy1WIHRyZWUgPw0KDQpTb3JyeSBmb3IgdGhlIGNvbmZ1c2lv
bi4NCg0KTm90ZTogV2UgYXJlIHN0aWxsIHdhaXRpbmcgZm9yIFJNSydzIEFDSyBvbiBhcm0gcGF0
Y2ggYmVmb3JlIGl0IGNhbiBiZQ0Kc2VudCBhcyBhIFBSLg0KDQpSZWdhcmRzLA0KQXRpc2gNCg==

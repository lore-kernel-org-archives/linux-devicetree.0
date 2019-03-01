From: "Ardelean, Alexandru" <Alex.Ardelean@analog.com>
Subject: Re: [PATCH v4 4/9] staging:iio:ad7780: add chip ID values and mask
Date: Fri, 1 Mar 2019 07:20:01 +0000
Message-ID: <190e26b19b8ed6559b92d3a000d852bbb0099a52.camel@analog.com>
References: <cover.1551358569.git.renatogeh@gmail.com>
         <90c573cd53bb54d49de6ac270bcff66880ccfeb5.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90c573cd53bb54d49de6ac270bcff66880ccfeb5.1551358569.git.renatogeh@gmail.com>
Content-Language: en-US
Content-ID: <9487AF172CBDEB46A60968BB37F41499@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "lars@metafoo.de" <lars@metafoo.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "jic23@kernel.org" <jic23@kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "renatogeh@gmail.com" <renatogeh@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "giuliano.belinassi@usp.br" <giuliano.belinassi@usp.br>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-usp@googlegroups.com" <kernel-usp@googlegroups.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTAyLTI4IGF0IDExOjI0IC0wMzAwLCBSZW5hdG8gTHVpIEdlaCB3cm90ZToN
Cj4gDQo+IA0KPiBUaGUgYWQ3NzgwIHN1cHBvcnRzIGJvdGggdGhlIGFkNzc4eCBhbmQgYWQ3MTd4
IGZhbWlsaWVzLiBFYWNoIGNoaXAgaGFzDQo+IGEgY29ycmVzcG9uZGluZyBJRC4gVGhpcyBwYXRj
aCBwcm92aWRlcyBhIG1hc2sgZm9yIGV4dHJhY3RpbmcgSUQgdmFsdWVzDQo+IGZyb20gdGhlIHN0
YXR1cyBiaXRzIGFuZCBhbHNvIG1hY3JvcyBmb3IgdGhlIGNvcnJlY3QgdmFsdWVzIGZvciB0aGUN
Cj4gYWQ3MTcwLCBhZDcxNzEsIGFkNzc4MCBhbmQgYWQ3NzgxLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUmVuYXRvIEx1aSBHZWggPHJlbmF0b2dlaEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9zdGFnaW5nL2lpby9hZGMvYWQ3NzgwLmMgfCA4ICsrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9paW8vYWRjL2FkNzc4MC5jDQo+IGIvZHJpdmVycy9zdGFnaW5nL2lpby9h
ZGMvYWQ3NzgwLmMNCj4gaW5kZXggNTZjNDllMjhmNDMyLi5hZDc2MTdhM2ExNDEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9paW8vYWRjL2FkNzc4MC5jDQo+ICsrKyBiL2RyaXZlcnMv
c3RhZ2luZy9paW8vYWRjL2FkNzc4MC5jDQo+IEBAIC0yNiwxMCArMjYsMTQgQEANCj4gICNkZWZp
bmUgQUQ3NzgwX1JEWSAgICAgICAgICAgICBCSVQoNykNCj4gICNkZWZpbmUgQUQ3NzgwX0ZJTFRF
UiAgICAgICAgICBCSVQoNikNCj4gICNkZWZpbmUgQUQ3NzgwX0VSUiAgICAgICAgICAgICBCSVQo
NSkNCj4gLSNkZWZpbmUgQUQ3NzgwX0lEMSAgICAgICAgICAgICBCSVQoNCkNCj4gLSNkZWZpbmUg
QUQ3NzgwX0lEMCAgICAgICAgICAgICBCSVQoMykNCj4gICNkZWZpbmUgQUQ3NzgwX0dBSU4gICAg
ICAgICAgICBCSVQoMikNCj4gDQo+ICsjZGVmaW5lIEFENzE3MF9JRCAgICAgICAgICAgICAgMA0K
PiArI2RlZmluZSBBRDcxNzFfSUQgICAgICAgICAgICAgIDENCj4gKyNkZWZpbmUgQUQ3NzgwX0lE
ICAgICAgICAgICAgICAxDQo+ICsjZGVmaW5lIEFENzc4MV9JRCAgICAgICAgICAgICAgMA0KPiAr
DQo+ICsjZGVmaW5lIEFENzc4MF9JRF9NQVNLICAgICAgICAgKEJJVCgzKSB8IEJJVCg0KSkNCg0K
VGhpcyBhbHNvIGRvZXNuJ3QgaGF2ZSBhbnkgZnVuY3Rpb25hbGl0eSBjaGFuZ2UuDQpUaGUgQUQ3
MTcwX0lELCBBRDcxNzFfSUQsIEFENzc4MF9JRCAmIEFENzc4MV9JRCBJRHMgYXJlIGFsc28gdW51
c2VkIChtYXliZQ0KaW4gYSBsYXRlciBwYXRjaCB0aGV5IGFyZSA/KS4NCg0KSSB3b3VsZCBhbHNv
IGxlYXZlIHRoZSBBRDc3ODBfSUQxICYgQUQ3NzgwX0lEMCBkZWZpbml0aW9ucyBpbiBwbGFjZSwg
c2luY2UNCnRoZXkncmUgZWFzaWVyIG1hdGNoZWQgd2l0aCB0aGUgZGF0YXNoZWV0Lg0KDQo+IA0K
PiAgI2RlZmluZSBBRDc3ODBfUEFUVEVSTl9HT09EICAgIDENCj4gICNkZWZpbmUgQUQ3NzgwX1BB
VFRFUk5fTUFTSyAgICBHRU5NQVNLKDEsIDApDQo+IC0tDQo+IDIuMjEuMA0KPiANCg==

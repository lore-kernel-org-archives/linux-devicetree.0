From: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: tiogapass: Add VR devices
Date: Tue, 23 Jul 2019 00:33:40 +0000
Message-ID: <69DFAF50-E181-4C7A-910A-C45E6E151F8E@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <802c5419-08ec-4a0e-8a50-ad4a1bbf7f3a@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <802c5419-08ec-4a0e-8a50-ad4a1bbf7f3a@www.fastmail.com>
Content-Language: en-US
Content-ID: <515ADAC7575AC24CABAC6D61534CEFDB@namprd15.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>
List-Id: devicetree@vger.kernel.org

DQoNCu+7v09uIDcvMjIvMTksIDU6MTIgUE0sICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bhai5p
ZC5hdT4gd3JvdGU6DQoNCiAgICBIaSBWaWpheSwNCiAgICANCiAgICBBIGZldyBuaXRwaWNrcy4N
CiAgICANCiAgICBPbiBUdWUsIDIzIEp1bCAyMDE5LCBhdCAwNToxMCwgVmlqYXkgS2hlbWthIHdy
b3RlOg0KICAgID4gQWRkZXMNCiAgICANCiAgICBUeXBvOiBBZGRzDQpBY2sNCiAgICANCiAgICA+
IFZvbHRhZ2UNCiAgICANCiAgICBVbm5lY2Vzc2FyeSBjYXBpdGFsaXNhdGlvbi4NCkFjaw0KICAg
IA0KICAgID4gcmVndWxhdG9ycyBJbmZpbmVvbiBweGUxNjEwIGRldmljZXMgdG8gRmFjZWJvb2sN
CiAgICA+IHRpb2dhcGFzcyBwbGF0Zm9ybS4NCiAgICA+IA0KICAgID4gU2lnbmVkLW9mZi1ieTog
VmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQogICAgPiAtLS0NCiAgICA+ICAuLi4v
ZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0cyAgICAgfCAzNiArKysrKysrKysr
KysrKysrKysrDQogICAgPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCiAgICA+
IA0KICAgID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJv
b2stdGlvZ2FwYXNzLmR0cyANCiAgICA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1m
YWNlYm9vay10aW9nYXBhc3MuZHRzDQogICAgPiBpbmRleCBjNDUyMWVkYTc4N2MuLmI3NzgzODMz
YTU4YyAxMDA2NDQNCiAgICA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFj
ZWJvb2stdGlvZ2FwYXNzLmR0cw0KICAgID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVk
LWJtYy1mYWNlYm9vay10aW9nYXBhc3MuZHRzDQogICAgPiBAQCAtMTQ0LDYgKzE0NCw0MiBAQA0K
ICAgID4gICZpMmM1IHsNCiAgICA+ICAJc3RhdHVzID0gIm9rYXkiOw0KICAgID4gIAkvLyBDUFUg
Vm9sdGFnZSByZWd1bGF0b3JzDQogICAgPiArCXZyQDQ4IHsNCiAgICANCiAgICBUaGUgcmVjb21t
ZW5kZWQgZ2VuZXJpYyBuYW1lIGlzICdyZWd1bGF0b3InLCBzbyBlLmcuIHJlZ3VsYXRvckA0OA0K
QWNrOiBTdWJtaXR0ZWQgdjIgZm9yIHRoaXMgcGF0Y2guDQogICAgDQogICAgPiArCQljb21wYXRp
YmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NDg+Ow0KICAgID4g
Kwl9Ow0KICAgID4gKwl2ckA0YSB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4
ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NGE+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2ckA1
MCB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJ
cmVnID0gPDB4NTA+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2ckA1MiB7DQogICAgPiArCQljb21w
YXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NTI+Ow0KICAg
ID4gKwl9Ow0KICAgID4gKwl2ckA1OCB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9u
LHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NTg+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2
ckA1YSB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4g
KwkJcmVnID0gPDB4NWE+Ow0KICAgID4gKwl9Ow0KICAgID4gKwl2ckA2OCB7DQogICAgPiArCQlj
b21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4Njg+Ow0K
ICAgID4gKwl9Ow0KICAgID4gKwl2ckA3MCB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmlu
ZW9uLHB4ZTE2MTAiOw0KICAgID4gKwkJcmVnID0gPDB4NzA+Ow0KICAgID4gKwl9Ow0KICAgID4g
Kwl2ckA3MiB7DQogICAgPiArCQljb21wYXRpYmxlID0gImluZmluZW9uLHB4ZTE2MTAiOw0KICAg
ID4gKwkJcmVnID0gPDB4NzI+Ow0KICAgID4gKwl9Ow0KICAgID4gIH07DQogICAgPiAgDQogICAg
PiAgJmkyYzYgew0KICAgID4gLS0gDQogICAgPiAyLjE3LjENCiAgICA+IA0KICAgID4NCiAgICAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=

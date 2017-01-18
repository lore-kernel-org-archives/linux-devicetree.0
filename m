From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] ARM64: dts: meson-gxm-rbox-pro: Enable Bluetooth
Date: Wed, 18 Jan 2017 14:29:58 -0800
Message-ID: <m2y3y8xaqh.fsf@baylibre.com>
References: <20170117030611.23827-1-afaerber@suse.de>
 <20170117030611.23827-3-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117030611.23827-3-afaerber@suse.de> ("Andreas
 =?utf-8?Q?F=C3=A4rber=22's?=
 message of "Tue, 17 Jan 2017 04:06:11 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPiB3cml0ZXM6Cgo+IEFkZCBhbiBTRElP
IHJlc2V0IEdQSU8gYW5kIGVuYWJsZSB0aGUgc2VyaWFsIHVzZWQgYnkgdGhlIEFQNjI1NQo+IEJs
dWV0b290aCBtb2R1bGUuIEJhc2VkIG9uIHdvcmsgYnkgTWFydGluIEJsdW1lbnN0aW5nbC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPiAtLS0K
PiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bS1yYm94LXByby5kdHMgfCAx
MSArKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neG0tcmJveC1wcm8uZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4
bS1yYm94LXByby5kdHMKPiBpbmRleCA5ZjA0ZmE0ZTVhZWMuLjZlYTIyNWY1ODRiZCAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3htLXJib3gtcHJvLmR0
cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neG0tcmJveC1wcm8u
ZHRzCj4gQEAgLTU4LDYgKzU4LDcgQEAKPiAgCj4gIAlhbGlhc2VzIHsKPiAgCQlzZXJpYWwwID0g
JnVhcnRfQU87Cj4gKwkJc2VyaWFsMSA9ICZ1YXJ0X0E7Cj4gIAl9Owo+ICAKPiAgCWNob3NlbiB7
Cj4gQEAgLTEyMiw3ICsxMjMsOCBAQAo+ICAKPiAgCXNkaW9fcHdyc2VxOiBzZGlvLXB3cnNlcSB7
Cj4gIAkJY29tcGF0aWJsZSA9ICJtbWMtcHdyc2VxLXNpbXBsZSI7Cj4gLQkJcmVzZXQtZ3Bpb3Mg
PSA8JmdwaW8gR1BJT1hfNiBHUElPX0FDVElWRV9MT1c+Owo+ICsJCXJlc2V0LWdwaW9zID0gPCZn
cGlvIEdQSU9YXzYgR1BJT19BQ1RJVkVfTE9XPiwKPiArCQkJCTwmZ3BpbyBHUElPWF8xNyBHUElP
X0FDVElWRV9MT1c+Owo+ICAJCWNsb2NrcyA9IDwmd2lmaTMyaz47Cj4gIAkJY2xvY2stbmFtZXMg
PSAiZXh0X2Nsb2NrIjsKCmMuZi4gdGhyZWFkIG9uIE1hcnRpbidzIHNlcmllcy4gICBJIGRvbid0
IGxpa2UgdGhpcyAoYWIpdXNlIG9mCnJlc2V0LWdwaW9zIGZvciBzZGlvLXB3cnNlcSwgYW5kIHRo
ZXJlJ3Mgc29tZSB3b3JrIGNvbWluZyB0aGF0IHdpbGwgbWFrZQp0aGlzIG11Y2ggY2xlYW5lci4K
ClNvLCBJJ2xsIGhvbGQgb2ZmIG9uIHRoaXMgdW50aWwgdGhlIG90aGVyIHNvbHV0aW9uIGlzIHJl
YWR5LgoKS2V2aW4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==

From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: bcm: add Northstar driver
Date: Wed, 19 Sep 2018 14:45:52 -0700
Message-ID: <da0992c4-f8c8-7e3c-6d54-35a8cfdcd7bc@gmail.com>
References: <20180919210219.21921-1-zajec5@gmail.com>
 <20180919210219.21921-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180919210219.21921-2-zajec5@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDkvMTkvMjAxOCAwMjowMiBQTSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGRyaXZlciBwcm92aWRl
cyBzdXBwb3J0IGZvciBOb3J0aHN0YXIgbXV4IGNvbnRyb2xsZXIuIEl0IGRpZmZlcnMKPiBmcm9t
IE5vcnRoc3RhciBQbHVzIG9uZSBzbyBhIG5ldyBiaW5kaW5nIGFuZCBkcml2ZXIgd2VyZSBuZWVk
ZWQuCj4gCj4gUmlnaHQgbm93IGl0IGluY2x1ZGVzIHN1cHBvcnQgZm9yIFNQSSBwaW5zIG9ubHkg
d2hpY2ggaXMgY2F1c2VkIGJ5IGEKPiBsYWNrIG9mIGFjY2VzcyB0byBCcm9hZGNvbSdzIGRhdGFz
aGVldC4gU1BJIHBpbnMgaW5mbyB3YXMgZXh0cmFjdGVkIGZyb20KPiB0aGUgQnJvYWRjb20ncyBT
REsuIE9uY2UgbW9yZSBwaW5zIGFyZSBkaXNjb3ZlcmVkIHRoZXkgY2FuIGJlIGFkZGVkIHRvCj4g
dGhlIGRyaXZlciB3aXRob3V0IGJyZWFraW5nIGFueSBleGlzdGluZyBzZXR1cHMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQoKW3Nu
aXBdCgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MgbnNfcGluY3RybF9w
aW5zW10gPSB7Cj4gKwl7IDAsICJzcGlfY2xrIiB9LAo+ICsJeyAxLCAic3BpX3NzIiB9LAo+ICsJ
eyAyLCAic3BpX21vc2kiIH0sCj4gKwl7IDMsICJzcGlfbWlzbyIgfSwKPiArfTsKCkluIGNhc2Ug
eW91IGFyZSBpbnRlcmVzdGVkLCBoZXJlIGFyZSB0aGUgYWRkaXRpb25hbCBmdW5jdGlvbnM6Cgo0
OiBpMmNfc2NsCjU6IGkyY19zZGEKCjY6IG1kYwo3OiBtZGlvCgo4OiBwd20wCjk6IHB3bTEKMTA6
IHB3bTIKMTE6IHB3bTMKCjEyOiB1YXJ0MV9yeAoxMzogdWFydDFfdHgKMTQ6IHVhcnQxX2N0cwox
NTogdWFydDFfcnRzCgpPbiBCQ001MzAxMjoKCjE2OiB1YXJ0Ml9yeAoxNzogdWFydDJfdHgKMjI6
IHNkaW9fY2FyZF9wb3dlcl9jdGwKMjM6IHNkaW9fZW5fMXA4CgpPbiBCQ001MzAxMzoKCjIxOiAy
NU1oeiBjcnlzdGFsIG91dHB1dCBmb3IgSTJTCgpOb3QgYW4gZXhwZXJ0IG9uIHBpbmN0cmwgZHJp
dmVycywgYnV0IGl0IGxvb2tzIHJlYXNvbmFibGUgdG8gbWUuCi0tIApGbG9yaWFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

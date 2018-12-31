From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add document for Broadcom STB
 reset controller
Date: Mon, 31 Dec 2018 15:13:25 -0800
Message-ID: <67d797f6-fc3a-535c-d336-edcdc70c332e@broadcom.com>
References: <20181221013409.14324-1-f.fainelli@gmail.com>
 <20181221013409.14324-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181221013409.14324-2-f.fainelli@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTgtMTItMjAgNTozNCBwLm0uLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3RlOgo+IEFkZCBh
IGJpbmRpbmcgZG9jdW1lbnQgZm9yIHRoZSBCcm9hZGNvbSBTVEIgcmVzZXQgY29udHJvbGxlciwg
YWxzbyBrbm93bgo+IGFzIFNXX0lOSVQtc3R5bGUgcmVzZXQgY29udHJvbGxlci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+IC0tLQo+
ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvYnJjbSxyZXNldC50eHQgIHwgMjcgKysr
KysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVz
ZXQvYnJjbSxyZXNldC50eHQKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVzZXQvYnJjbSxyZXNldC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVzZXQvYnJjbSxyZXNldC50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNmU1MzQxYjRmODkxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9icmNtLHJlc2V0LnR4dApU
aGlzIGlzIGJyY21zdGItcmVzZXQgc3BlY2lmaWMuwqAgRmlsZSBzaG91bGQgYmUgYnJjbSwgYnJj
bXN0Yi1yZXNldC50eHQKPiBAQCAtMCwwICsxLDI3IEBACj4gK0Jyb2FkY29tIFNUQiBTV19JTklU
LXN0eWxlIHJlc2V0IGNvbnRyb2xsZXIKPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+ICsKPiArQnJvYWRjb20gU1RCIFNvQ3MgaGF2ZSBhIFNXX0lOSVQtc3R5
bGUgcmVzZXQgY29udHJvbGxlciB3aXRoIHNlcGFyYXRlCj4gK1NFVC9DTEVBUi9TVEFUVVMgcmVn
aXN0ZXJzIGFuZCBwb3NzaWJseSBtdWx0aXBsZSBiYW5rcywgZWFjaCBvZiAzMiBiaXQKPiArcmVz
ZXQgbGluZXMuCj4gKwo+ICtQbGVhc2UgYWxzbyByZWZlciB0byByZXNldC50eHQgaW4gdGhpcyBk
aXJlY3RvcnkgZm9yIGNvbW1vbiByZXNldAo+ICtjb250cm9sbGVyIGJpbmRpbmcgdXNhZ2UuCj4g
Kwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSBicmNt
LGJyY21zdGItcmVzZXQKPiArLSByZWc6IHJlZ2lzdGVyIGJhc2UgYW5kIGxlbmd0aAo+ICstICNy
ZXNldC1jZWxsczogbXVzdCBiZSBzZXQgdG8gMQo+ICsKPiArRXhhbXBsZToKPiArCj4gKwlyZXNl
dDogcmVzZXQtY29udHJvbGxlckA4NDA0MzE4IHsKPiArCQljb21wYXRpYmxlID0gImJyY20sYnJj
bXN0Yi1yZXNldCI7Cj4gKwkJcmVnID0gPDB4ODQwNDMxOCAweDMwPjsKPiArCQkjcmVzZXQtY2Vs
bHMgPSA8MT47Cj4gKwl9Owo+ICsKPiArCSZldGhlcm5ldF9zd2l0Y2ggewo+ICsJCXJlc2V0cyA9
IDwmcmVzZXQ+Owo+ICsJCXJlc2V0LW5hbWVzID0gInN3aXRjaCI7Cj4gKwl9OwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm: imx: Use of_node_name_eq for node name comparisons
Date: Thu, 14 Feb 2019 10:07:40 +0100
Message-ID: <1550135260.4571.1.camel@pengutronix.de>
References: <20181205195050.4759-7-robh@kernel.org>
 <CAL_JsqKPJet11X3pru1u5hEUVUH_SCcmncVAaesfDrzxtUEGEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqKPJet11X3pru1u5hEUVUH_SCcmncVAaesfDrzxtUEGEg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLAoKT24gV2VkLCAyMDE5LTAyLTEzIGF0IDEyOjA3IC0wNjAwLCBSb2IgSGVycmluZyB3
cm90ZToKPiBPbiBXZWQsIERlYyA1LCAyMDE4IGF0IDE6NTAgUE0gUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IENvbnZlcnQgc3RyaW5nIGNvbXBhcmVzIG9mIERU
IG5vZGUgbmFtZXMgdG8gdXNlIG9mX25vZGVfbmFtZV9lcSBoZWxwZXIKPiA+IGluc3RlYWQuIFRo
aXMgcmVtb3ZlcyBkaXJlY3QgYWNjZXNzIHRvIHRoZSBub2RlIG5hbWUgcG9pbnRlci4KPiA+IAo+
ID4gRm9yIGluc3RhbmNlcyB1c2luZyBvZl9ub2RlX2NtcCwgdGhpcyBoYXMgdGhlIHNpZGUgZWZm
ZWN0IG9mIG5vdyB1c2luZwo+ID4gY2FzZSBzZW5zaXRpdmUgY29tcGFyaXNvbnMuIFRoaXMgc2hv
dWxkIG5vdCBtYXR0ZXIgZm9yIGFueSBGRFQgYmFzZWQKPiA+IHN5c3RlbSB3aGljaCB0aGlzIGlz
Lgo+ID4gCj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiA+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3Jl
LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gUGhpbGlwcCwgY2FuIEkgZ2V0IGFuIGFjayBvbiB0aGlzPyBJIGNhbiBjb21taXQg
aXQuCgpUaGFuayB5b3UsCkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

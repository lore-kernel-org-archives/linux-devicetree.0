From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
Date: Fri, 6 Jan 2017 11:54:48 +0000
Message-ID: <83fd9b61-dbff-68e0-82e5-8e01058d04a9@arm.com>
References: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
 <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

SGkgTWljaGHFgiwKCk9uIDA1LzAxLzE3IDE5OjA0LCBNaWNoYcWCIFplZ2FuIHdyb3RlOgo+IEhl
bGxvLgo+IAo+IFRoZSBwYXRjaCBjYXVzZXMgY3B1ZnJlcSBtb2R1bGUgKHNjcGktY3B1ZnJlcSkg
bm90IHRvIGRldGVjdCBjcHVmcmVxLCBzbwo+IGl0IGFjdHVhbGx5IHdvcmtzLCBidXQuLi4KPiBM
b2FkaW5nIHRoZSBtb2R1bGUgY2F1c2VzIGZldyBlcnJvcnMgYmVjYXVzZSBvZiBub3QgZm91bmQg
ZnJlcXVlbmNpZXMgb3IKPiBzb21ldGhpbmcsIHRoZW4gaXQgaXMgYWxsIG9rYXkuIEhvd2V2ZXIg
YWZ0ZXIgbG9hZGluZyBzY3BpLWNwdWZyZXEgeW91Cj4gY2Fubm90IGFjdHVhbGx5IHBvd2VyIHRo
ZSBjcHUgb2ZmIGFuZCBvbi4gWW91IHdpbGwgcG93ZXIgaXQgb2ZmCj4gc3VjY2Vzc2Z1bGx5LCBi
dXQgd2hlbiB0cnlpbmcgdG8gcG93ZXIgaXQgb24sIHRoZSBjcHVmcmVxIGRyaXZlciB3aWxsCj4g
ZXJyb3Igb3V0LCAKClllcyBJIGhhZCBub3RpY2VkIHRoaXMgaW4gcGFzdCwgdGhpcyBuZWVkcyB0
byBiZSBmaXhlZC4gSSBoYWQgYSBwYXRjaAphbmQgc2VlbXMgbGlrZSBpdCBzbGlwcGVkIHRocm91
Z2ggdGhlIGNyYWNrcy4gSSB3aWxsIGZpbnMgYW5kIHBvc3QgaXQuCgo+IGFuZCB0aGVuIGFmdGVy
IGl0IGhhcHBlbnMsIHRoZSBjcHUgdGhhdCB3YXMgdHJ5aW5nIHRvIGdvCj4gb25saW5lIHdpbGwg
YmUgb2ZmbGluZSBhZ2FpbiwgYW5kIHRoYXQgaXMgYSBsaXR0bGUuLi4gdW5mb3J0dW5hdGUuIFRo
ZQoKSUlVQywgeW91IG1lYW4gdGhlIGNwdWZyZXEgZHJpdmUgc3BpdHMgZXJyb3Igb24gZXZlcnkg
aG90cGx1ZyBldmVudCA/CklmIHNvIHllcywgb3RoZXJ3aXNlIEkgdGhpbmsgSSBkaWRuJ3QgdW5k
ZXJzdGFuZCB5b3UgY29uY2VybiBhYm92ZS4KCj4gcXVlc3Rpb24gaXMsIGFuZCBJIGNhbm5vdCBy
ZWFsbHkgdGVzdCB0aGF0OiB3aWxsIHRoZSBtb2R1bGUgYWN0dWFsbHkKPiBhdXRvbG9hZCBhZnRl
ciB0aGlzIGNoYW5nZT8KPgoKSXQgc2hvdWxkIHdvcmssIEkgaGFkIHRlc3RlZCB0aGlzIGluIHBh
c3QuCgotLSAKUmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

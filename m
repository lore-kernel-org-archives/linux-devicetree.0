From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 0/7] sunxi: Add DT representation for the MBUS
 controller
Date: Mon, 8 Apr 2019 16:14:53 +0800
Message-ID: <CAGb2v66cc-y0c98yaggFpnuWGwdWa5HpG0uapidreSqmc_maAQ@mail.gmail.com>
References: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
 <5ca841d1.1c69fb81.f4702.b85d@mx.google.com>
 <20190408081126.t3blyvtcqslzvki2@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190408081126.t3blyvtcqslzvki2@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBBcHIgOCwgMjAxOSBhdCA0OjExIFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMDYsIDIwMTkgYXQgMDE6MDY6
MDdBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAwMSwgMjAxOSBh
dCAxMDo1Njo0MEFNICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4K
PiA+ID4gV2UndmUgaGFkIGZvciBxdWl0ZSBzb21lIHRpbWUgdG8gaGFjayBhcm91bmQgaW4gb3Vy
IGRyaXZlcnMgdG8gdGFrZSBpbnRvCj4gPiA+IGFjY291bnQgdGhlIGZhY3QgdGhhdCBvdXIgRE1B
IGFjY2Vzc2VzIGFyZSBub3QgZG9uZSB0aHJvdWdoIHRoZSBwYXJlbnQKPiA+ID4gbm9kZSwgYnV0
IHRocm91Z2ggYW5vdGhlciBidXMgd2l0aCBhIGRpZmZlcmVudCBtYXBwaW5nIHRoYW4gdGhlIENQ
VSBmb3IgdGhlCj4gPiA+IFJBTSAoMCBpbnN0ZWFkIG9mIDB4NDAwMDAwMDAgZm9yIG1vc3QgU29D
cykuCj4gPiA+Cj4gPiA+IEFmdGVyIHNvbWUgZGlzY3Vzc2lvbiBhZnRlciB0aGUgc3VibWlzc2lv
biBvZiBhIGNhbWVyYSBkZXZpY2Ugc3VmZmVyaW5nIG9mCj4gPiA+IHRoZSBzYW1lIGhhY2tzLCBJ
J3ZlIGRlY2lkZWQgdG8gcHV0IHRvZ2V0aGVyIGEgc2VyaWUgdGhhdCBpbnRyb2R1Y2UgYQo+ID4g
PiBzcGVjaWFsIGludGVyY29ubmVjdCBuYW1lIGNhbGxlZCAiZG1hIiB0aGF0IHRoYXQgYWxsb3dz
IHRvIGV4cHJlc3MgdGhlIERNQQo+ID4gPiByZWxhdGlvbnNoaXAgYmV0d2VlbiBhIG1hc3RlciBh
bmQgaXRzIGJ1cywgZXZlbiBpZiB0aGV5IGFyZSBub3QgZGlyZWN0Cj4gPiA+IHBhcmVudHMgaW4g
dGhlIERULgo+ID4gPgo+ID4gPiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluaywKPiA+ID4gTWF4
aW1lCj4gPgo+ID4gTEdUTS4KPiA+Cj4gPiBIb3cgZG8geW91IHByb3Bvc2UgbWVyZ2luZyB0aGlz
PyBJIGNhbiB0YWtlIDEtNSwgYW5kIDYgYW5kIDcgdGhydQo+ID4gYXJtLXNvYz8KPgo+IFlvdSBj
YW4gbWVyZ2UgMS00LCBhbmQgSSdsbCBtZXJnZSA1IHRocm91Z2ggZHJtLW1pc2MgYW5kIDYtNyB0
aHJvdWdoCj4gYXJtLXNvYwoKV291bGRuJ3QgdGhlcmUgYmUgc29tZSBydW50aW1lIGRlcGVuZGVu
Y3kgYmV0d2VlbiAzLCA0LCBhbmQgNT8KCkNoZW5ZdQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=

From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 0/7] sunxi: Add DT representation for the MBUS
 controller
Date: Mon, 8 Apr 2019 16:26:50 +0800
Message-ID: <CAGb2v67OJ52c-SWGSvBoPhVTX3qYJp7HXwu4md7bSfMQ+_fhsQ@mail.gmail.com>
References: <cover.f8909884585996f28d97f4ef95efbcab19527dc4.1554108995.git-series.maxime.ripard@bootlin.com>
 <5ca841d1.1c69fb81.f4702.b85d@mx.google.com>
 <20190408081126.t3blyvtcqslzvki2@flea>
 <CAGb2v66cc-y0c98yaggFpnuWGwdWa5HpG0uapidreSqmc_maAQ@mail.gmail.com>
 <20190408082116.ndh3qnbgw4p6j75c@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190408082116.ndh3qnbgw4p6j75c@flea>
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

T24gTW9uLCBBcHIgOCwgMjAxOSBhdCA0OjIxIFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTQ6
NTNQTSArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgOCwgMjAxOSBh
dCA0OjExIFBNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBTYXQsIEFwciAwNiwgMjAxOSBhdCAwMTowNjowN0FNIC0wNTAwLCBS
b2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEFwciAwMSwgMjAxOSBhdCAxMDo1Njo0
MEFNICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+ID4gPiA+ID4gSGksCj4gPiA+ID4gPgo+
ID4gPiA+ID4gV2UndmUgaGFkIGZvciBxdWl0ZSBzb21lIHRpbWUgdG8gaGFjayBhcm91bmQgaW4g
b3VyIGRyaXZlcnMgdG8gdGFrZSBpbnRvCj4gPiA+ID4gPiBhY2NvdW50IHRoZSBmYWN0IHRoYXQg
b3VyIERNQSBhY2Nlc3NlcyBhcmUgbm90IGRvbmUgdGhyb3VnaCB0aGUgcGFyZW50Cj4gPiA+ID4g
PiBub2RlLCBidXQgdGhyb3VnaCBhbm90aGVyIGJ1cyB3aXRoIGEgZGlmZmVyZW50IG1hcHBpbmcg
dGhhbiB0aGUgQ1BVIGZvciB0aGUKPiA+ID4gPiA+IFJBTSAoMCBpbnN0ZWFkIG9mIDB4NDAwMDAw
MDAgZm9yIG1vc3QgU29DcykuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWZ0ZXIgc29tZSBkaXNjdXNz
aW9uIGFmdGVyIHRoZSBzdWJtaXNzaW9uIG9mIGEgY2FtZXJhIGRldmljZSBzdWZmZXJpbmcgb2YK
PiA+ID4gPiA+IHRoZSBzYW1lIGhhY2tzLCBJJ3ZlIGRlY2lkZWQgdG8gcHV0IHRvZ2V0aGVyIGEg
c2VyaWUgdGhhdCBpbnRyb2R1Y2UgYQo+ID4gPiA+ID4gc3BlY2lhbCBpbnRlcmNvbm5lY3QgbmFt
ZSBjYWxsZWQgImRtYSIgdGhhdCB0aGF0IGFsbG93cyB0byBleHByZXNzIHRoZSBETUEKPiA+ID4g
PiA+IHJlbGF0aW9uc2hpcCBiZXR3ZWVuIGEgbWFzdGVyIGFuZCBpdHMgYnVzLCBldmVuIGlmIHRo
ZXkgYXJlIG5vdCBkaXJlY3QKPiA+ID4gPiA+IHBhcmVudHMgaW4gdGhlIERULgo+ID4gPiA+ID4K
PiA+ID4gPiA+IExldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLAo+ID4gPiA+ID4gTWF4aW1lCj4g
PiA+ID4KPiA+ID4gPiBMR1RNLgo+ID4gPiA+Cj4gPiA+ID4gSG93IGRvIHlvdSBwcm9wb3NlIG1l
cmdpbmcgdGhpcz8gSSBjYW4gdGFrZSAxLTUsIGFuZCA2IGFuZCA3IHRocnUKPiA+ID4gPiBhcm0t
c29jPwo+ID4gPgo+ID4gPiBZb3UgY2FuIG1lcmdlIDEtNCwgYW5kIEknbGwgbWVyZ2UgNSB0aHJv
dWdoIGRybS1taXNjIGFuZCA2LTcgdGhyb3VnaAo+ID4gPiBhcm0tc29jCj4gPgo+ID4gV291bGRu
J3QgdGhlcmUgYmUgc29tZSBydW50aW1lIGRlcGVuZGVuY3kgYmV0d2VlbiAzLCA0LCBhbmQgNT8K
Pgo+IFdoYXQgaXNzdWUgZGlkIHlvdSBoYXZlIGluIG1pbmQ/Cj4KPiBJIGd1ZXNzIHRoZSBvbmx5
IGlzc3VlIHdvdWxkIGJlIGlmIHdlIGhhdmUgdGhlIG5ldyBEVCBwcm9wZXJ0aWVzLCBidXQKPiBu
b3QgdGhlIG5ldyBjb3JlIGNvZGUuIEJ1dCB0aGF0IHNlZW1zIHByZXR0eSB1bmxpa2VseSwgc2lu
Y2UgZWFjaCBvZgo+IHRoZSB0cmVlcyB3aWxsIHdvcmsgaW5kZXBlbmRlbnRseSwgYW5kIG5leHQg
c2hvdWxkIGhhdmUgYWxsIG9mIHRoZW0uCgpJIGdvdCBpdCB3cm9uZy4gRXZlbiBpbiB5b3VyIGNh
c2Ugc2luY2UgdGhlIGludGVyY29ubmVjdCBwcm9wZXJ0eSBpcwppZ25vcmVkLCBhbmQgdGhlIGRy
aXZlciB3b3VsZCBqdXN0IGZhbGwgYmFjayB0byB1c2luZyB0aGUgZml4ZWQgb2Zmc2V0LgoKU29y
cnkgZm9yIHRoZSBub2lzZS4KCkNoZW5ZdQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

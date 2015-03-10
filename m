From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] regulator: don't emit errors in
 {devm_}regulator_bulk_get when defering
Date: Tue, 10 Mar 2015 13:33:23 +0100
Message-ID: <2019237.rjYDPBpg0A@phil>
References: <1429128.MSqYm0qZ9p@phil> <9261130.uPvufuEFrr@phil>
 <20150310120750.GE28806@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150310120750.GE28806@sirena.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIDEwLiBNw6RyeiAyMDE1LCAxMjowNzo1MCBzY2hyaWViIE1hcmsgQnJvd246
Cj4gT24gVHVlLCBNYXIgMTAsIDIwMTUgYXQgMTI6MjI6MDZBTSArMDEwMCwgSGVpa28gU3R1ZWJu
ZXIgd3JvdGU6Cj4gPiBXaGVuIHtkZXZtX31yZWd1bGF0b3JfZ2V0IHJldHVybnMgLUVQUk9CRV9E
RUZFUiB0aGUgZHJpdmVyIGluIHF1ZXN0aW9uCj4gPiB3aWxsCj4gPiB0cnkgcHJvYmluZyBhZ2Fp
biBhdCBhIGxhdGVyIHRpbWUuIFNvIGRvbid0IHNwYW0gdGhlIGxvZyB3aXRoIGZhaWx1cmUKPiA+
IG1lc3NhZ2VzIGFzIHRoaXMgaXMgYW4gZXhwZWN0ZWQgcmVzdWx0IG9mIHByb2JlIG9yZGVyaW5n
Lgo+ID4gCj4gPiAtCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IHN1cHBseSAnJXMnOiAl
ZFxuIiwKPiA+IC0JCQkJY29uc3VtZXJzW2ldLnN1cHBseSwgcmV0KTsKPiA+ICsJCQlpZiAocmV0
ICE9IC1FUFJPQkVfREVGRVIpCj4gPiArCQkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBz
dXBwbHkgJyVzJzogJWRcbiIsCj4gPiArCQkJCQljb25zdW1lcnNbaV0uc3VwcGx5LCByZXQpOwo+
IAo+IE5vLCB0aGlzIGlzIG5vdCBnb29kIC0geW91IGdldCBhIG5pY2UgcXVpZXQgYm9vdCBldmVu
IGlmIHRoZSByZWd1bGF0b3IKPiBkb2VzIG5vdCBhcHBlYXIgd2hpY2ggbWVhbnMgcGVvcGxlIGhh
dmUgbm8gaWRlYSB3aHkgdGhlIGRyaXZlciBpc24ndAo+IGxvYWRpbmcuICBUaGF0J3Mgbm90IGEg
Z29vZCB1c2VyIGV4cGVyaWVuY2UsIHNpbGVudCBlcnJvciBoYW5kbGluZyBpcwo+IHRoZSBtYWlu
IHByb2JsZW0gSSBzZWUgcGVvcGxlIHJ1bm5pbmcgaW50byB0cnlpbmcgdG8gZ2V0IHRoZWlyIHN5
c3RlbXMKPiB1cCBhbmQgcnVubmluZyB0aGVzZSBkYXlzLgo+IAo+IFJlYWxseSBkZWZlcnJlZCBw
cm9iZSBpcyBqdXN0IGZ1bmRhbWVudGFsbHkgbm9pc3kgc2luY2UgaXQncwo+IGludGVudGlvbmFs
bHkgdG9sZXJhdGluZyBlcnJvcnMgbGlrZSB0aGlzIGFuZCBvZiBjb3Vyc2UgYSBsb3Qgb2YgdGhl
Cj4gbm9pc2UgY29tZXMgZnJvbSB0aGUgZGVmZXJyYWwgbWVzc2FnZXMgdGhlIGNvcmUgcHJpbnRz
LgoKb2ssIEknbGwgZHJvcCB0aGlzIG9uZSB0aGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=

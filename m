From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 4/7] of: address: Add support for the dma-parent
 property
Date: Mon, 11 Feb 2019 14:09:15 +0100
Message-ID: <20190211130915.6lgenqziixecik5p@flea>
References: <cover.ddd928eab0069d426b711e69940918eaf85625ce.1549482066.git-series.maxime.ripard@bootlin.com>
 <824396752ee40c8e4222fddb4a80408646989c17.1549482066.git-series.maxime.ripard@bootlin.com>
 <CAL_Jsq+y++qMkCNehPxZ3J8bfU7Atgppy4uMtTEdPdkt9Xv_jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+y++qMkCNehPxZ3J8bfU7Atgppy4uMtTEdPdkt9Xv_jQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBGZWIgMDYsIDIwMTkgYXQgMDI6NTc6NTFQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gV2VkLCBGZWIgNiwgMjAxOSBhdCAxOjQyIFBNIE1heGltZSBSaXBhcmQgPG1heGlt
ZS5yaXBhcmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IFNvbWUgU29DcyBoYXZlIGRldmlj
ZXMgdGhhdCBhcmUgdXNpbmcgYSBzZXBhcmF0ZSBidXMgZnJvbSB0aGUgbWFpbiBidXMgdG8KPiA+
IHBlcmZvcm0gRE1BLgo+ID4KPiA+IFRoZXNlIGJ1c2VzIG1pZ2h0IGhhdmUgc29tZSByZXN0cmlj
dGlvbnMgYW5kL29yIGRpZmZlcmVudCBtYXBwaW5nIHRoYW4gZnJvbQo+ID4gdGhlIENQVSBzaWRl
LCBzbyB3ZSdkIG5lZWQgdG8gZXhwcmVzcyB0aG9zZSB1c2luZyB0aGUgdXN1YWwgZG1hLXJhbmdl
cywgYnV0Cj4gPiB1c2luZyBhIGRpZmZlcmVudCBEVCBub2RlIHRoYW4gdGhlIG5vZGUncyBwYXJl
bnQuCj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9yIGEgZG1hLXBhcmVudCBwcm9wZXJ0eSB0aGF0IGxp
bmtzIHRvIHRoZSBETUEgYnVzIHVzZWQgYnkgdGhlCj4gPiBkZXZpY2UgaW4gc3VjaCBhIGNhc2Uu
Cj4gCj4gPz8gZG1hLXBhcmVudCBpcyBnb25lIG5vdywgcmlnaHQ/IEFuZCBJIHNlZSAjZG1hLXBh
cmVudC1jZWxscz8KClVyZ2gsIHJpZ2h0Li4uIEkgZm9yZ290IHRvIHVwZGF0ZSB0aGUgY29tbWl0
IGxvZywgSSdsbCByZXNlbmQgaXQuCgpNYXhpbWUKCi0tIApNYXhpbWUgUmlwYXJkLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

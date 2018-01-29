From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: Add Cadence DSI driver
Date: Mon, 29 Jan 2018 15:16:21 +0100
Message-ID: <20180129151621.546a9b8f@bbrezillon>
References: <20180118134309.13123-1-boris.brezillon@free-electrons.com>
 <9b45c6a3-f26b-59f5-d313-88290a2c5b42@ti.com>
 <20180129141409.0ec356d1@bbrezillon>
 <07d82fcd-1e6c-37a8-36b7-d1a81cfeb2ae@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <07d82fcd-1e6c-37a8-36b7-d1a81cfeb2ae@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "Menon,
 Nishanth" <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, Simon Hatliff <hatliff@cadence.com>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Richard Sproul <sproul@cadence.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyOSBKYW4gMjAxOCAxNTo1OTozMyArMDIwMApUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPiB3cm90ZToKCj4gT24gMjkvMDEvMTggMTU6MTQsIEJvcmlzIEJyZXpp
bGxvbiB3cm90ZToKPiAKPiA+PiBZb3UgZG9uJ3QgZGlzYWJsZSB0aGUgZHNpX3N5c19jbGsgbmVp
dGhlciBpbiB0aGUgb2sgbm9yIGluIHRoZSBlcnJvciBwYXRocy4gIAo+ID4gCj4gPiBIbSwgaXQg
c2hvdWxkbid0IGJlIGVuYWJsZWQgaW4gdGhlIGZpcnN0IHBsYWNlOiB0aGUgcnVudGltZSByZXN1
bWUKPiA+IGhvb2sgdGFrZXMgY2FyZSBvZiBlbmFibGluZyBpdCwgYW5kIHdlIGRvbid0IG5lZWQg
dGhpcyBjbG9jayB0byBhY2Nlc3MKPiA+IElQIHJlZ2lzdGVycyAod2hpY2ggaXMgYWxsIHdlIGRv
IGluIHRoZSBwcm9iZSkuICAKPiAKPiBBaCwgcmlnaHQsIHlvdSBjYW4ganVzdCB1c2UgcG1fcnVu
dGltZSBkaXJlY3RseSB0byBlbmFibGUgdGhlIElQLgo+IAo+IEkgd2FzIGxvb2tpbmcgYXQgdGhl
IGRvY3MsIGJ1dCBpdCB3YXNuJ3QgcXVpdGUgY2xlYXIgdG8gbWUgd2hlbiBleGFjdGx5Cj4gZHNp
X3N5c19jbGsgaXMgbmVlZGVkLiBJIHRha2UgaXQgdGhhdCB5b3UgY2FuIGFjY2VzcyByZWdpc3Rl
cnMgd2l0aCBqdXN0Cj4gdGhlIGRzaV9wX2NsaywgYnV0IHlvdSBjYW4ndCByZWFsbHkgZG8gYW55
dGhpbmcgd2l0aCB0aGUgSVAgd2l0aG91dAo+IGRzaV9zeXNfY2xrPyBJZiBzbywgSSB0aGluayBl
bmFibGluZyBib3RoIGRzaV9wX2NsayBhbmQgZHNpX3N5c19jbGsgaW4KPiB0aGUgcnVudGltZSBQ
TSBjYWxsYmFja3MgaXMgb2suCgpUaGF0J3MgbXkgdW5kZXJzdGFuZGluZy4KCj4gCj4gQWx0ZXJu
YXRpdmVseSwgaWYgZHNpX3N5c19jbGsgaXMgb25seSBuZWVkZWQgZm9yIHNvbWUgc3BlY2lmaWMK
PiBmdW5jdGlvbmFsaXR5LCBhIG1vcmUgY29ycmVjdCB3YXkgd291bGQgYmUgdG8gZW5hYmxlIHRo
YXQgY2xvY2sgb25seQo+IHdoZW4gdGhhdCBvcGVyYXRpb24gaXMgcGVyZm9ybWVkLgoKSUlVQywg
aXQncyBuZWVkZWQgdG8gY2xvY2sgdGhlIFBQSSBkb21haW4sIHNvIGFueSBvcGVyYXRpb24KdHJh
bnNtaXR0aW5nIHRoaW5ncyBvbiB0aGUgRFNJIGJ1cyByZXF1aXJlcyB0aGUgc3lzIGNsb2NrLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

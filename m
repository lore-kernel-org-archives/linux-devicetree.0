From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v9 0/4] drm/atmel-hlcdc: bus-width override support
Date: Mon, 27 Aug 2018 22:40:55 +0200
Message-ID: <20180827224055.3ab63c43@bbrezillon>
References: <20180825085620.10566-1-peda@axentia.se>
 <20180827212449.723bdc99@bbrezillon>
 <ca38bd82-09d2-8e55-a3a2-e0e559abdf7f@axentia.se>
 <20180827223505.7e2fe6f6@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180827223505.7e2fe6f6@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sakari Ailus <sakari.ailus@iki.fi>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Jyri Sarha <jsarha@ti.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyNyBBdWcgMjAxOCAyMjozNTowNSArMDIwMApCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBib290bGluLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgMjcgQXVnIDIwMTggMjI6
MzE6MjIgKzAyMDAKPiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPiB3cm90ZToKPiAKPiA+
IE9uIDIwMTgtMDgtMjcgMjE6MjQsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4gPiBPbiBT
YXQsIDI1IEF1ZyAyMDE4IDEwOjU2OjE2ICswMjAwCj4gPiA+IFBldGVyIFJvc2luIDxwZWRhQGF4
ZW50aWEuc2U+IHdyb3RlOgo+ID4gPiAgICAgCj4gPiA+PiBIaSEKPiA+ID4+Cj4gPiA+PiBUaGUg
YmFja2dyb3VuZCBmb3IgdGhlc2UgcGF0Y2hlcyBpcyB0aGF0IG91ciBQQ0IgaW50ZXJmYWNlIGJl
dHdlZW4KPiA+ID4+IHRoZSBTQU1BNUQzIGFuZCB0aGUgZHM5MGMxODUgbHZkcyBlbmNvZGVyIGlz
IG9ubHkgdXNpbmcgMTYgYml0cywgYW5kCj4gPiA+PiB0aGlzIGhhcyB0byBiZSBkZXNjcmliZWQg
c29tZXdoZXJlLCBvciB0aGUgYXRtZWwtaGxjZGMgZHJpdmVyIGhhdmUgbm8KPiA+ID4+IGNoYW5j
ZSBvZiBzZWxlY3RpbmcgdGhlIGNvcnJlY3Qgb3V0cHV0IG1vZGUuIFNpbmNlIHdlIGhhdmUgc2lt
aWxhcgo+ID4gPj4gcHJvYmxlbXMgd2l0aCBhIHRkYTE5OTg4IEhETUkgZW5jb2RlciBJIGFkZGVk
IHBhdGNoZXMgdG8gb3ZlcnJpZGUKPiA+ID4+IHRoZSBhdG1lbC1obGNkYyBvdXRwdXQgZm9ybWF0
IHZpYSBEVCBwcm9wZXJ0aWVzIGNvbXBhdGlibGUgd2l0aCB0aGUKPiA+ID4+IG1lZGlhIHZpZGVv
LWludGVyZmFjZSBiaW5kaW5nIGFuZCB0aGluZ3Mgc3RhcnQgdG8gcGxheSB0b2dldGhlci4gICAg
Cj4gPiA+IAo+ID4gPiBRdWV1ZWQgdG8gZHJtLW1pc2MtbmV4dC4gICAgCj4gPiAKPiA+IFRoYW5r
cyEKPiA+IAo+ID4gTWludXRlIGlzc3VlLCB5b3Ugc2VlbSB0byBoYXZlIHNvbWUgc3BlbGwtY2hl
Y2sgZ29pbmcgb24gb3Igc29tZXRoaW5nLAo+ID4gYmVjYXVzZSB0aGUgc3ViamVjdCBvZiBwYXRj
aCAxLzQgaGFzIGJlZW4gImNvcnJlY3RlZCIgZnJvbQo+ID4gIi4uLmFkZCB0aSxkczkwYzE4NSIg
dG8gIi4uLmFkZCB0aSwgZHM5MGMxODUiCj4gPiAKPiA+IFlvdSBtaWdodCB3YW50IHRvIGV2YWx1
YXRlIGlmIHRoYXQgYXV0by1jb3JyZWN0aW9uICJmZWF0dXJlIiBzaG91bGQgYmUKPiA+IGRpc2Fi
bGVkL3R3ZWFrZWQvd2hhdGV2ZXIuLi4gIAo+IAo+IEhtLCB3ZWlyZC4gSSBqdXN0IGRvd25sb2Fk
ZWQgdGhlIG1ib3ggZnJvbSBkcmktZGV2ZWwncyBwYXRjaHdvcmsgYW5kCj4gcGFzc2VkIGl0IHRv
IGRpbSBhcHBseS4gZGltIHRlbmRzIHRvIGRvIGEgbG90IG9mIHRoaW5ncyBiZWhpbmQgdGhlCj4g
c2NlbmUsIHNvIG1heWJlIGl0J3MgYWxzbyB0cnlpbmcgdG8gZml4IHR5cG9zIDotKS4KCk5vcGUs
IGxvb2tzIGxpa2UgaXQgd2FzIGFscmVhZHkgd3Jvbmcgb24gcGF0Y2h3b3JrIFsxXSwgZG9uJ3Qg
a25vdyB3aGF0CmhhcHBlbmVkLCBiZWNhdXNlIHRoZSB2ZXJzaW9uIEkgaGF2ZSBpbiBteSBtYWls
Ym94IGlzIGNvcnJlY3QuCgpbMV1odHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvMjQ2MDM5LwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v8 3/4] drm/atmel-hlcdc: iterate over all output endpoints
Date: Fri, 24 Aug 2018 09:47:01 +0200
Message-ID: <20180824094701.1f17393f@bbrezillon>
References: <20180810130359.9882-1-peda@axentia.se>
 <20180810130359.9882-4-peda@axentia.se>
 <20180813135949.32vrlrevtazr5x7d@apu3b.nibble.pw>
 <0baac94e-f3d2-53fd-4af9-854bb4498345@axentia.se>
 <CAL_JsqJPzwpN2TFghy-FfHZppexG9gW4qBy6iYtGpyP_Bp6dUA@mail.gmail.com>
 <5c9853fc-e2ea-6983-ac88-b52b6e9e6ecd@axentia.se>
 <CAL_JsqJHRL0f2YwvOJBpggKRVQwPWy8j08-+_nd-VifOOKYqFA@mail.gmail.com>
 <56016787-0487-1571-7c28-2767033cda23@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56016787-0487-1571-7c28-2767033cda23@axentia.se>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, jmondi <jacopo@jmondi.org>, David Airlie <airlied@linux.ie>, Alexandre Belloni <alexandre.belloni@bootlin.com>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Jyri Sarha <jsarha@ti.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Russell King <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAxNCBBdWcgMjAxOCAxNzowNToyOSArMDIwMApQZXRlciBSb3NpbiA8cGVkYUBheGVu
dGlhLnNlPiB3cm90ZToKCj4gPj4+Pj4+IEBAIC03NywxMyArNzksMjkgQEAgc3RhdGljIGludCBh
dG1lbF9obGNkY19hdHRhY2hfZW5kcG9pbnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGVu
ZHBvaW50KQo+ID4+Pj4+Pgo+ID4+Pj4+PiAgaW50IGF0bWVsX2hsY2RjX2NyZWF0ZV9vdXRwdXRz
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPj4+Pj4+ICB7Cj4gPj4+Pj4+IC0gICAgaW50IGVu
ZHBvaW50LCByZXQgPSAwOwo+ID4+Pj4+PiAtCj4gPj4+Pj4+IC0gICAgZm9yIChlbmRwb2ludCA9
IDA7ICFyZXQ7IGVuZHBvaW50KyspCj4gPj4+Pj4+IC0gICAgICAgICAgICByZXQgPSBhdG1lbF9o
bGNkY19hdHRhY2hfZW5kcG9pbnQoZGV2LCBlbmRwb2ludCk7Cj4gPj4+Pj4+ICsgICAgc3RydWN0
IG9mX2VuZHBvaW50IGVuZHBvaW50Owo+ID4+Pj4+PiArICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSA9IE5VTEw7Cj4gPj4+Pj4+ICsgICAgaW50IGNvdW50ID0gMDsKPiA+Pj4+Pj4gKyAgICBp
bnQgcmV0ID0gMDsKPiA+Pj4+Pj4gKwo+ID4+Pj4+PiArICAgIGZvcl9lYWNoX2VuZHBvaW50X29m
X25vZGUoZGV2LT5kZXYtPm9mX25vZGUsIG5vZGUpIHsKPiA+Pj4+Pj4gKyAgICAgICAgICAgIG9m
X2dyYXBoX3BhcnNlX2VuZHBvaW50KG5vZGUsICZlbmRwb2ludCk7ICAKPiA+Pj4KPiA+Pj4gSSdk
IHJlYWxseSBsaWtlIHRvIGtpbGwgb2ZmIG9mX2dyYXBoX3BhcnNlX2VuZHBvaW50LCBub3QgYWRk
IG1vcmUKPiA+Pj4gdXNlcnMgKGNoZWNrIHRoZSBnaXQgaGlzdG9yeSBvbiB0aGlzIGNvZGUpLiBZ
b3Ugc2hvdWxkIGtub3cgd2hhdCBhcmUKPiA+Pj4gcG9zc2libGUgcG9ydCBhbmQgZW5kcG9pbnQg
bnVtYmVycywgc28gaXRlcmF0ZSBvdmVyIHRob3NlLiAgCj4gPj4KPiA+PiBTbywgYWRkIGEgY29t
bWVudCB0byB0aGF0IGVmZmVjdCBpbiB0aGUgZG9jcyBvZiB0aGUgb2ZfZ3JhcGhfcGFyc2VfZW5k
cG9pbnQKPiA+PiBmdW5jdGlvbi4KPiA+Pgo+ID4+IEhvdyBjYW4gdGhlIGhsY2RjIGRyaXZlciBr
bm93IHRoZSBhY3R1YWwgbnVtYmVyIG9mIGVuZHBvaW50cz8gSXQncyBhCj4gPj4gb25lLXdheSBz
aWduYWwgcGF0aCBvdXQgZnJvbSB0aGF0IHBvcnQsIGFuZCBpdCBjYW4gZWFzaWx5IGJlIHJvdXRl
ZCB0bwo+ID4+IDEsIDIsIDMgb3IgZXZlbiBtb3JlIHBsYWNlcy4gQXMgc2hvd24gYWJvdmUsIGZv
cmNpbmcgdGhlIGVuZHBvaW50IGlkCj4gPj4gdG8gc3RhcnQgYXQgemVybyBpcyBhIG51aXNhbmNl
LCBhbmQgSSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIGl0Lgo+ID4+Cj4gPj4gQnV0IEkgd2VsY29t
ZSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gYXJyYW5nZSB0aGUgYWJvdmUgZHRzaS9kdHMgZnJhZ21l
bnRzCj4gPj4gaW4gYSB3b3JsZCB3aGVyZSB0aGUgZW5kcG9pbnQgaWQgYWJzb2x1dGVseSBoYXMg
dG8gc3RhcnQgYXQgemVyby4gIAo+ID4gCj4gPiBZb3VyIGR0cyBmaWxlIGFycmFuZ2VtZW50IHNl
ZW1zIGZpbmUuIENhbid0IHlvdSBqdXN0IG5vdCBleGl0IHRoZSBsb29wCj4gPiBvbiAtRU5PREVW
PyBJT1csIGp1c3QgaXRlcmF0ZSB0aWwgeW91IGZpbmQgYW4gZW5hYmxlZCBlbmRwb2ludC4gIAo+
IAo+IFRoYXQgd291bGQgcmVncmVzcyBjYXNlcyB3aGVyZSB0d28gKG9yIG1vcmUpIGVuZHBvaW50
cyBhcmUgZW5hYmxlZAo+ICh3aGljaCBpcyBjdXJyZW50bHkgc3VwcG9ydGVkKS4gQXMgSSBzZWUg
aXQsIHRoZSBkcml2ZXIgd2lsbCBoYXZlIGEKPiB2ZXJ5IGhhcmQgdGltZSBrbm93aW5nIHdoZW4g
dG8gc3RvcCBpdGVyYXRpbmcgd2l0aCBhbnkgc29sdXRpb24gbm90Cj4gaW52b2x2aW5nIHRoZSBl
cXVpdmFsZW50IG9mIHRoZSBmdW5jdGlvbnMgZm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9kZQo+IGFu
ZCBvZl9ncmFwaF9wYXJzZV9lbmRwb2ludC4gT3Blbi1jb2Rpbmcgb2ZfZ3JhcGhfcGFyc2VfZW5k
cG9pbnQganVzdAo+IHRvIGF2b2lkIGl0IGlzIGEgYml0IG1vcmUgdGhhbiBzaWxseSBJTUhPLi4u
CgpJIGFncmVlLCBhbmQgYWN0dWFsbHksIEkgdGhpbmsgdGhpcyBpcyBSb2Igd2hvIHN1Z2dlc3Rl
ZCB0byBkbyB3aGF0IHdlCmRvIGhlcmUgOi0pIChpdGVyYXRlIGZyb20gMCB0byBYLCBhbmQgc3Rv
cCBhcyBzb29uIGFzCi1FTk9ERVYgaXMgcmV0dXJuZWQpLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2 6/8] drm/imx: support handling bridge timings bus flags
Date: Thu, 13 Sep 2018 10:03:05 -0700
Message-ID: <c0814f7187159956c4a495986bdba01c@agner.ch>
References: <20180912183222.25414-1-stefan@agner.ch>
 <20180912183222.25414-7-stefan@agner.ch>
 <1536827930.3452.4.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1536827930.3452.4.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de, fabio.estevam@nxp.com, sean@poorly.run, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

T24gMTMuMDkuMjAxOCAwMTozOCwgUGhpbGlwcCBaYWJlbCB3cm90ZToKPiBPbiBXZWQsIDIwMTgt
MDktMTIgYXQgMTE6MzIgLTA3MDAsIFN0ZWZhbiBBZ25lciB3cm90ZToKPj4gQSBicmlkZ2UgbWln
aHQgcmVxdWlyZSBzcGVjaWZpYyBzZXR0aW5ncyBmb3IgdGhlIHBpeGVsIGRhdGEgb24KPj4gdGhl
IGJ1cy4KPiAKPiBPbiB3aGljaCBidXM/IFRoZSBicmlkZ2UgaGFzIGlucHV0IGFuZCBvdXRwdXQu
Cj4gCj4+IENvcHkgdGhlIGJ1cyBmbGFncyBmcm9tIHRoZSBicmlkZ2UgdGltaW5ncyBpZiBhIGJy
aWRnZQo+PiBpcyBpbiB1c2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3Rl
ZmFuQGFnbmVyLmNoPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlz
cGxheS5jIHwgMyArKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jIGIvZHJp
dmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKPj4gaW5kZXggYWVmZDA0ZTE4Zjkz
Li43Nzk4YTA2MjFkZjcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxs
ZWwtZGlzcGxheS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxh
eS5jCj4+IEBAIC0yMzksNiArMjM5LDkgQEAgc3RhdGljIGludCBpbXhfcGRfYmluZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPj4gIAlpZiAo
cmV0ICYmIHJldCAhPSAtRU5PREVWKQo+PiAgCQlyZXR1cm4gcmV0Owo+Pgo+PiArCWlmIChpbXhw
ZC0+YnJpZGdlICYmIGlteHBkLT5icmlkZ2UtPnRpbWluZ3MpCj4+ICsJCWlteHBkLT5idXNfZmxh
Z3MgPSBpbXhwZC0+YnJpZGdlLT50aW1pbmdzLT5pbnB1dF9idXNfZmxhZ3M7Cj4gCj4gT2gsIG9r
LiBJJ2QgYWxzbyBzcGVjaWZ5IGlucHV0IGJ1cyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gCgpH
b29kIHBvaW50LCB3aWxsIGNoYW5nZSBpbiB2MyB0bzoKCiJBIGJyaWRnZSBtaWdodCByZXF1aXJl
IHNwZWNpZmljIHNldHRpbmdzIGZvciB0aGUgcGl4ZWwgZGF0YSBvbgppdHMgaW5wdXQgYnVzLiBU
aG9zZSBhcmUgc3BlY2lmaWVkIHRocm91Z2ggb3B0aW9uYWwgYnVzIHRpbWluZ3MuCkNvcHkgdGhl
IGJyaWRnZXMgaW5wdXQgYnVzIGZsYWdzIGFzIHRvIHRoZSBpbXhwZCBidXMgZmxhZ3MuIgoKLS0K
U3RlZmFuCgo+PiArCj4+ICAJaW14cGQtPmRldiA9IGRldjsKPj4KPj4gIAlyZXQgPSBpbXhfcGRf
cmVnaXN0ZXIoZHJtLCBpbXhwZCk7Cj4gCj4gcmVnYXJkcwo+IFBoaWxpcHAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

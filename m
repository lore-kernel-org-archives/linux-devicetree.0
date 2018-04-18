From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2 6/6] drm/atmel-hlcdc: fix broken release date
Date: Wed, 18 Apr 2018 09:44:28 +0200
Message-ID: <20180418094428.6db785dc@bbrezillon>
References: <20180417131052.16336-1-peda@axentia.se>
 <20180417131052.16336-7-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180417131052.16336-7-peda@axentia.se>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAxNyBBcHIgMjAxOCAxNToxMDo1MiArMDIwMApQZXRlciBSb3NpbiA8cGVkYUBheGVu
dGlhLnNlPiB3cm90ZToKCj4gQnVtcCB0aGUgbWlub3IgdmVyc2lvbiB3aGlsZSBhdCBpdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyB8IDQgKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jCj4gaW5kZXggODUyM2M0
MGZhYzk0Li5hYTQ4ZjI4N2I1Y2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2F0bWVs
LWhsY2RjL2F0bWVsX2hsY2RjX2RjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxj
ZGMvYXRtZWxfaGxjZGNfZGMuYwo+IEBAIC03NjMsOSArNzYzLDkgQEAgc3RhdGljIHN0cnVjdCBk
cm1fZHJpdmVyIGF0bWVsX2hsY2RjX2RjX2RyaXZlciA9IHsKPiAgCS5mb3BzID0gJmZvcHMsCj4g
IAkubmFtZSA9ICJhdG1lbC1obGNkYyIsCj4gIAkuZGVzYyA9ICJBdG1lbCBITENEIENvbnRyb2xs
ZXIgRFJNIiwKPiAtCS5kYXRlID0gIjIwMTQxNTA0IiwKCkkgZ3Vlc3MgSSB1c2VkIFlZWVlERE1N
IGZvcm1hdCA6LSkuCgo+ICsJLmRhdGUgPSAiMjAxODA0MDkiLAo+ICAJLm1ham9yID0gMSwKPiAt
CS5taW5vciA9IDAsCj4gKwkubWlub3IgPSAxLAoKRG9uJ3Qga25vdyB3aGF0IHRoZSBzdHJhdGVn
eSBpcyByZWdhcmRpbmcgZGF0ZSBhbmQgbWlub3IgdmVyc2lvbgp1cGRhdGVzLiBJIG5ldmVyIGhh
ZCB0byB1cGRhdGUgdGhhdCBiZWZvcmUsIHNvIEkgZ3Vlc3MgaXQncyBub3QKaW1wb3J0YW50IHRv
IHVzZXJzcGFjZSBhbnl3YXkuCgo+ICB9Owo+ICAKPiAgc3RhdGljIGludCBhdG1lbF9obGNkY19k
Y19kcm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

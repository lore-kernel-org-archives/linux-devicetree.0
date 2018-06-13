From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: Re: [PATCH 26/28] drm/mediatek: add DPI1/DSI1/DSI2/DSI3 in comp_init
Date: Wed, 13 Jun 2018 16:05:55 +0800
Message-ID: <1528877155.11190.36.camel@mtksdccf07>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
 <1528687580-549-27-git-send-email-stu.hsieh@mediatek.com>
 <1528875305.30263.14.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528875305.30263.14.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIENLOgoKT24gV2VkLCAyMDE4LTA2LTEzIGF0IDE1OjM1ICswODAwLCBDSyBIdSB3cm90ZToK
PiBIaSwgU3R1Ogo+IAo+IE9uIE1vbiwgMjAxOC0wNi0xMSBhdCAxMToyNiArMDgwMCwgU3R1IEhz
aWVoIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50cyBEUEkxL0RTSTEvRFNJMi9E
U0kzIGluIGNvbXBfaW5pdC4KPiA+IEJlY2F1c2UgdGhlIHNvbWUgcGFyYW1ldGVyIGZvciB0aGVz
ZSBjb21wb25lbnRzIGluaXRpYWxpemVkCj4gPiBpbiB0aGVpciBkcml2ZXIuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCA0ICsrKysK
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ID4gaW5kZXggMjJmNGM3MmZhNzg1
Li5mZjk3NGQ4MmE0YTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jCj4gPiBAQCAtMjc4LDcgKzI3OCwxMSBAQCBpbnQgbXRrX2RkcF9jb21w
X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gPiAg
Cj4gPiAgCWlmIChjb21wX2lkID09IEREUF9DT01QT05FTlRfQkxTIHx8Cj4gPiAgCSAgICBjb21w
X2lkID09IEREUF9DT01QT05FTlRfRFBJMCB8fAo+ID4gKwkgICAgY29tcF9pZCA9PSBERFBfQ09N
UE9ORU5UX0RQSTEgfHwKPiAKPiBXaHkgbm90IG1vdmUgdGhpcyBtb2RpZmljYXRpb24gdG8gdGhl
IHBhdGNoICdhZGQgY29tcG9uZW50IERQSTEnPwo+IAo+ID4gIAkgICAgY29tcF9pZCA9PSBERFBf
Q09NUE9ORU5UX0RTSTAgfHwKPiA+ICsJICAgIGNvbXBfaWQgPT0gRERQX0NPTVBPTkVOVF9EU0kx
IHx8Cj4gPiArCSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfRFNJMiB8fAo+IAo+IFdoeSBu
b3QgbW92ZSB0aGlzIG1vZGlmaWNhdGlvbiB0byB0aGUgcGF0Y2ggJ2FkZCBjb21wb25lbnQgRFNJ
Mic/Cj4gCj4gPiArCSAgICBjb21wX2lkID09IEREUF9DT01QT05FTlRfRFNJMyB8fAo+IAo+IFdo
eSBub3QgbW92ZSB0aGlzIG1vZGlmaWNhdGlvbiB0byB0aGUgcGF0Y2ggJ2FkZCBjb21wb25lbnQg
RFNJMyc/Cj4gCj4gUmVnYXJkcywKPiBDSwo+IApvawoKUmVnYXJkLApTdHUKPiA+ICAJICAgIGNv
bXBfaWQgPT0gRERQX0NPTVBPTkVOVF9QV00wKSB7Cj4gPiAgCQljb21wLT5yZWdzID0gTlVMTDsK
PiA+ICAJCWNvbXAtPmNsayA9IE5VTEw7Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==

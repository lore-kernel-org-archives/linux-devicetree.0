From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] drm/omap: partial workaround for DRA7xx DMM errata
 i878
Date: Wed, 04 Apr 2018 13:28:16 +0300
Message-ID: <3403759.MX1QIus5OE@avalon>
References: <20180322134206.22857-1-peter.ujfalusi@ti.com>
 <4932838.akKzjW5mjy@avalon> <8dd97211-a4b4-cd8e-f9ef-896adfb95d81@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8dd97211-a4b4-cd8e-f9ef-896adfb95d81@ti.com>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org, jsarha@ti.com, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

SGkgVG9taSwKCk9uIFdlZG5lc2RheSwgNCBBcHJpbCAyMDE4IDEzOjAyOjA0IEVFU1QgVG9taSBW
YWxrZWluZW4gd3JvdGU6Cj4gT24gMDQvMDQvMTggMTI6NTEsIExhdXJlbnQgUGluY2hhcnQgd3Jv
dGU6Cj4gPiBPbiBXZWRuZXNkYXksIDQgQXByaWwgMjAxOCAxMDozNzowNSBFRVNUIFRvbWkgVmFs
a2VpbmVuIHdyb3RlOgo+ID4+IE9uIDA0LzA0LzE4IDAwOjExLCBMYXVyZW50IFBpbmNoYXJ0IHdy
b3RlOgo+ID4+PiBJIGFzc3VtZSBhY2Nlc3MgdG8gRE1NLW1hcHBlZCBidWZmZXJzIHRvIGJlIHdh
eSBtb3JlIGZyZXF1ZW50IHRoYW4KPiA+Pj4gYWNjZXNzIHRvIHRoZSBETU0gcmVnaXN0ZXJzLiBJ
ZiB0aGF0J3MgdGhlIGNhc2UsIHRoaXMgcGFydGlhbCB3b3JrYXJvdW5kCj4gPj4+IHNob3VsZCBv
bmx5IHNsaWdodGx5IGxvd2VyIHRoZSBwcm9iYWJpbGl0eSBvZiBzeXN0ZW0gbG9jay11cC4gRG8g
eW91Cj4gPj4+IGhhdmUgcGxhbnMgdG8gaW1wbGVtZW50IGEgd29ya2Fyb3VuZCB0aGF0IHdpbGwg
Zml4IHRoZSBwcm9ibGVtCj4gPj4+IGNvbXBsZXRlbHkgPwo+ID4+IAo+ID4+IENQVSBvbmx5IGFj
Y2Vzc2VzIG1lbW9yeSB2aWEgRE1NIHdoZW4gdXNpbmcgVElMRVIgMkQgYnVmZmVycywgd2hpY2gg
YXJlCj4gPj4gbm90IG9mZmljaWFsbHkgc3VwcG9ydGVkLiBGb3Igbm9uLTJELCB0aGUgcGFnZXMg
YXJlIG1hcHBlZCBkaXJlY3RseSB0bwo+ID4+IHRoZSBDUFUgd2l0aG91dCBETU0gaW4gYmV0d2Vl
bi4KPiA+IAo+ID4gV2hhdCBpcyB0aGUgRE1NIHVzZWQgZm9yIHdpdGggbm9uLTJEIHRoZW4gPyBE
b2VzIGl0IG5lZWQgdG8gYmUgc2V0dXAgYXQKPiA+IGFsbCA/Cj4gCj4gSXQgY3JlYXRlcyBhIGNv
bnRpZ3VvdXMgdmlldyBvZiBtZW1vcnkgZm9yIElQcyB3aXRob3V0IElPTU1VcywgbGlrZSBEU1Mu
CgpPSywgZ290IGl0LiBJbiB0aGF0IGNhc2UgdGhlIENQVSBhY2Nlc3NlcyBkb24ndCBuZWVkIHRv
IGdvIHRocm91Z2ggdGhlIERNTSwgCm9ubHkgdGhlIGRldmljZSBhY2Nlc3NlcyBkbywgYXMgdGhl
IENQVSB3aWxsIGdvIHRocm91Z2ggdGhlIE1NVS4gU29ycnkgZm9yIHRoZSAKbm9pc2UuCgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

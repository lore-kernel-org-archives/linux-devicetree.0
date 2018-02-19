From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 4/8] drm/rockchip: dw_hdmi: Allow outputs that don't
 need output switching
Date: Mon, 19 Feb 2018 12:49:17 +0100
Message-ID: <1630677.YWXALm60yB@phil>
References: <20180216204158.29839-1-heiko@sntech.de>
 <20180216204158.29839-5-heiko@sntech.de>
 <f1104948-5b95-968c-edc4-7a4d5212bae0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f1104948-5b95-968c-edc4-7a4d5212bae0@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, algea.cao@rock-chips.com, devicetree@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, kishon@ti.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

SGkgUm9iaW4sCgpBbSBNb250YWcsIDE5LiBGZWJydWFyIDIwMTgsIDEyOjQzOjExIENFVCBzY2hy
aWViIFJvYmluIE11cnBoeToKPiBIaSBIZWlrbywKPiAKPiBPbiAxNi8wMi8xOCAyMDo0MSwgSGVp
a28gU3R1ZWJuZXIgd3JvdGU6Cj4gPiBTbyBmYXIgd2UgYWx3YXlzIGVuY291bnRlcmVkIHNvY3Mg
d2l0aCAyIG91dHB1dCBjcnRjcyBuZWVkaW5nIHRoZSBkcml2ZXIKPiA+IHRvIHRlbGwgdGhlIGhk
bWkgYmxvY2sgd2hpY2ggb3V0cHV0IHRvIGNvbm5lY3QgdG8uIEJ1dCB0aGVyZSBhbHNvIGV4aXN0
Cj4gPiBzb2NzIHdpdGggb25seSBvbmUgY3J0YyBsaWtlIHRoZSByazMyMjgsIHJrMzMyOCBhbmQg
cmszMzY4Lgo+ID4gCj4gPiBTbyBhZGFwdCB0aGUgcmVnaXN0ZXIgZmllbGQgdG8gc2ltcGx5IGNh
cnJ5IGEgbmVnYXRpdmUgdmFsdWUgdG8gc2lnbmFsCj4gPiB0aGF0IG5vdyBvdXRwdXQtc3dpdGNo
aW5nIGlzIG5lY2Vzc2FyeS4KPiAKPiBOaXQ6IHMvbm93L25vLyA/IChIb29yYXkgZm9yIGdyYW1t
YXRpY2FsbHktY29ycmVjdCB0eXBvcyB3aGljaCBpbnZlcnQgCj4gdGhlIGVudGlyZSBtZWFuaW5n
IG9mIHRoZSBzZW50ZW5jZSEpCgo6LUQKCj4gV2hhdCBhcmUgdGhlIG5lY2Vzc2FyeSBkZXBlbmRl
bmNpZXMgZm9yIHRoZXNlIHBhdGNoZXM/IEkgdHJpZWQgYXBwbHlpbmcgCj4gdGhlIHNlcmllcyBv
biA0LjE2LXJjMSB0byB0ZXN0LCBidXQgaXQgZmFpbGVkIGF0IHBhdGNoICM2IHdpdGggc29tZSAK
PiBtaXNzaW5nIGNvbnRleHQgKEkgdHJpZWQgY2hlY2tpbmcgZHJtLW5leHQgZm9yIHdoZXJlIHJv
Y2tjaGlwX2hkbWk6OmhkbWkgCj4gbWlnaHQgaGF2ZSBjb21lIGZyb20sIGJ1dCBkaWRuJ3Qgc2Vl
IGFueXRoaW5nIG9idmlvdXMpCgpZb3UnbGwgbmVlZCB0aGUgbW9zdCByZWNlbnQgZHJtLW1pc2Mg
Y2hhbmdlcyBbMF0sIGVzcGVjaWFsbHkgdGhlIGR3LWhkbWkKY2hhbmdlcyBmcm9tIEplcm5laiBT
a3JhYmVjIHRoYXQgdG91Y2ggc2ltaWxhciBhcmVhcyBhbmQgZXZlbiBpbmNsdWRlZCBhCnNpbWls
YXIgcGF0Y2ggdG8gZXhwb3J0IHNvbWUgZ2VuZXJhbCBwaHkgZnVuY3Rpb25zLCB3aGljaCBJIGNv
dWxkIGRyb3AKZnJvbSBteSBzZXJpZXMuCgoKSGVpa28KClswXSBodHRwczovL2NnaXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0tbWlzYy9sb2cvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

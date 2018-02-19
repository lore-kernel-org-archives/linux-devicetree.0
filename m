From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 8/8] drm/rockchip: dw_hdmi: add dw-hdmi support for
 the rk3328
Date: Mon, 19 Feb 2018 14:28:53 -0600
Message-ID: <20180219202853.eovn6onxtk7p7f4p@rob-hp-laptop>
References: <20180216204158.29839-1-heiko@sntech.de>
 <20180216204158.29839-9-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180216204158.29839-9-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, algea.cao@rock-chips.com, devicetree@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, kishon@ti.com, Laurent.pinchart@ideasonboard.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDk6NDE6NThQTSArMDEwMCwgSGVpa28gU3R1ZWJuZXIg
d3JvdGU6Cj4gVGhlIHJrMzMyOCB1c2VzIGFuIGV4dGVybmFsIGhkbWkgcGh5IGZyb20gSW5ub3Np
bGljb24gd2hpY2ggdXNlcwo+IHRoZSBnZW5lcmljIHBoeSBmcmFtZXdvcmsgZm9yIGFjY2Vzcy4g
QWRkIHRoZSBuZWNlc3NhcnkgZGF0YQo+IGFuZCB0aGUgY29tcGF0aWJsZSBmb3IgaXQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQgfCAgIDEg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jICAgICAgICB8
IDEwNiArKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDcgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0
Cj4gaW5kZXggOTM3YmZiNDcyZTFkLi4zOTE0MzQyNGE0NzQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2Nr
Y2hpcC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLnR4dAo+IEBAIC0xMyw2ICsxMyw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6Cj4gIAo+ICAtIGNvbXBhdGlibGU6IHNob3VsZCBiZSBvbmUgb2YgdGhl
IGZvbGxvd2luZzoKPiAgCQkicm9ja2NoaXAscmszMjg4LWR3LWhkbWkiCj4gKwkJInJvY2tjaGlw
LHJrMzMyOC1kdy1oZG1pIgoKSXMgRGVzaWdud2FyZSAoU3lub3BzeXMpIG5vdyBJbm5vc2lsaWNv
bj8KCj4gIAkJInJvY2tjaGlwLHJrMzM5OS1kdy1oZG1pIgo+ICAtIHJlZzogU2VlIGR3X2hkbWku
dHh0Lgo+ICAtIHJlZy1pby13aWR0aDogU2VlIGR3X2hkbWkudHh0LiBTaGFsbCBiZSA0LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

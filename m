From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 04/15] clk: rockchip: use clock id for 24m dsi on rk3368
Date: Mon, 17 Dec 2018 13:36:39 +0100
Message-ID: <20181217123650.6773-5-heiko@sntech.de>
References: <20181217123650.6773-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181217123650.6773-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RXhwb3J0IHRoZSBjbG9jayB1c2luZyB0aGUgbmV3bHkgYWRkZWQgY2xvY2sgaWQuCgpTaWduZWQt
b2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgotLS0KIGRyaXZlcnMvY2xr
L3JvY2tjaGlwL2Nsay1yazMzNjguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3JvY2tjaGlwL2Ns
ay1yazMzNjguYyBiL2RyaXZlcnMvY2xrL3JvY2tjaGlwL2Nsay1yazMzNjguYwppbmRleCA1OGRl
YmY3ZGFmODUuLjU2Y2ExMGZlM2U5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvcm9ja2NoaXAv
Y2xrLXJrMzM2OC5jCisrKyBiL2RyaXZlcnMvY2xrL3JvY2tjaGlwL2Nsay1yazMzNjguYwpAQCAt
NTMyLDcgKzUzMiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgcm9ja2NoaXBfY2xrX2JyYW5jaCByazMzNjhf
Y2xrX2JyYW5jaGVzW10gX19pbml0ZGF0YSA9IHsKIAlHQVRFKEFDTEtfUEVSSSwgImFjbGtfcGVy
aSIsICJhY2xrX3Blcmlfc3JjIiwgQ0xLX0lHTk9SRV9VTlVTRUQsCiAJCQlSSzMzNjhfQ0xLR0FU
RV9DT04oMyksIDEsIEdGTEFHUyksCiAKLQlHQVRFKDAsICJzY2xrX21pcGlkc2lfMjRtIiwgInhp
bjI0bSIsIDAsIFJLMzM2OF9DTEtHQVRFX0NPTig0KSwgMTQsIEdGTEFHUyksCisJR0FURShTQ0xL
X01JUElEU0lfMjRNLCAic2Nsa19taXBpZHNpXzI0bSIsICJ4aW4yNG0iLCAwLCBSSzMzNjhfQ0xL
R0FURV9DT04oNCksIDE0LCBHRkxBR1MpLAogCiAJLyoKIAkgKiBDbG9jay1BcmNoaXRlY3R1cmUg
RGlhZ3JhbSA0Ci0tIAoyLjE5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

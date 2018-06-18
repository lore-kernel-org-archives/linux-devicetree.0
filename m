From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 1/8] drm/bridge/synopsys: dsi: move
 mipi_dsi_host_unregister to __dw_mipi_dsi_remove
Date: Mon, 18 Jun 2018 12:27:59 +0200
Message-ID: <20180618102806.15650-2-heiko@sntech.de>
References: <20180618102806.15650-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180618102806.15650-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, briannorris@chromium.org, hoegsberg@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com, linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com, robh+dt@kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, mka@chromium.org
List-Id: devicetree@vger.kernel.org

UmlnaHQgbm93IHRoZSBob3N0IGlzIG9ubHkgdW5yZWdpc3RlcmVkIHdoZW4gdGhlIGRyaXZlciBp
cyB1c2VkIHZpYSB0aGUKYnJpZGdlIGFwaSBhbmQgbm90IHZpYSB0aGUgY29tcG9uZW50IGFwaSwg
bGVhZGluZyB0byB0aGUgaG9zdCBzdGF5aW5nCnJlZ2lzdGVyZWQgaW4gY2FzZXMgbGlrZSBwcm9i
ZSBkZWZlcnJhbC4KClNvIG1vdmUgdGhlIGhvc3QgdW5yZWdpc3RlciB0byB0aGUgZ2VuZXJhbCBy
ZW1vdmUgZnVuY3Rpb24sIHNvIHRoYXQgaXQKZ2V0cyBjbGVhbmVkIHVwIGluIGFsbCBjYXNlcy4K
ClNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwppbmRleCBmZDc5OTk2NDJjZjgu
LjA3Y2RlMjU1Y2FiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1taXBpLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
bWlwaS1kc2kuYwpAQCAtOTQxLDYgKzk0MSw4IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAogc3RhdGljIHZvaWQgX19kd19taXBpX2RzaV9yZW1v
dmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpCiB7CisJbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVy
KCZkc2ktPmRzaV9ob3N0KTsKKwogCXBtX3J1bnRpbWVfZGlzYWJsZShkc2ktPmRldik7CiB9CiAK
QEAgLTk1Nyw4ICs5NTksNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChkd19taXBpX2RzaV9wcm9iZSk7
CiAKIHZvaWQgZHdfbWlwaV9kc2lfcmVtb3ZlKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQogewot
CW1pcGlfZHNpX2hvc3RfdW5yZWdpc3RlcigmZHNpLT5kc2lfaG9zdCk7Ci0KIAlfX2R3X21pcGlf
ZHNpX3JlbW92ZShkc2kpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoZHdfbWlwaV9kc2lfcmVtb3Zl
KTsKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

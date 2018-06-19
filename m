From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v6 01/29] drm/mediatek: update dt-bindings for mt2712
Date: Tue, 19 Jun 2018 15:34:02 +0800
Message-ID: <1529393670-26862-2-git-send-email-stu.hsieh@mediatek.com>
References: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VXBkYXRlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIGRpc3BsYXkg
c3Vic3lzdGVtIGZvcgpNZWRpYXRlayBNVDI3MTIgU29Dcy4KClNpZ25lZC1vZmYtYnk6IFN0dSBI
c2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KQWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRp
YXRlay5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRpc3AudHh0IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAppbmRleCAzODMx
ODNhODkxNjQuLjg0NjlkZTUxMDAwMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZGlzcC50eHQKQEAgLTQwLDcgKzQwLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0
aW9uIGJsb2Nrcyk6CiAJIm1lZGlhdGVrLDxjaGlwPi1kcGkiICAgICAgICAtIERQSSBjb250cm9s
bGVyLCBzZWUgbWVkaWF0ZWssZHBpLnR4dAogCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tdXRleCIg
LSBkaXNwbGF5IG11dGV4CiAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAtIG92ZXJkcml2
ZQotICB0aGUgc3VwcG9ydGVkIGNoaXBzIGFyZSBtdDI3MDEgYW5kIG10ODE3My4KKyAgdGhlIHN1
cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDI3MTIgYW5kIG10ODE3My4KIC0gcmVnOiBQaHlz
aWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0
ZXIgc3BhY2UKIC0gaW50ZXJydXB0czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVu
Y3Rpb24gYmxvY2sgKHJlcXVpcmVkLCBleGNlcHQgZm9yCiAgIG1lcmdlIGFuZCBzcGxpdCBmdW5j
dGlvbiBibG9ja3MpLgotLSAKMi4xMi41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK

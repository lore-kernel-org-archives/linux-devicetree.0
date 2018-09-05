From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 3/6] dt-bindings: display: add data-enable polarity property
Date: Tue,  4 Sep 2018 22:21:10 -0700
Message-ID: <20180905052113.21262-3-stefan@agner.ch>
References: <20180905052113.21262-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180905052113.21262-1-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linus.walleij@linaro.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

QWxsb3cgdG8gc3BlY2lmeSB0aGUgZGF0YS1lbmFibGUgcG9sYXJpdHkgcmVxdWlyZWQgYnkgYSBk
dW1iIFZHQQpEQUMgY29udmVydGluZyBwYXJhbGxlbCBSR0IgdG8gVkdBLgoKU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Ci0tLQogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvZHVtYi12Z2EtZGFjLnR4dCAgICAgICAgICB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R1bWItdmdhLWRhYy50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZHVtYi12Z2EtZGFj
LnR4dAppbmRleCAxNjRjYmIxNWYwNGMuLmFkYmQyY2EwYWYyZiAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R1bWItdmdhLWRhYy50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2R1bWItdmdhLWRhYy50eHQKQEAgLTE4LDYgKzE4LDcgQEAgZ3JhcGggYmluZGluZ3Mgc3BlY2lm
aWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQuCiAKIE9w
dGlvbmFsIHByb3BlcnRpZXM6CiAtIHZkZC1zdXBwbHk6IFBvd2VyIHN1cHBseSBmb3IgREFDCist
IGRlLWFjdGl2ZTogZGF0YS1lbmFibGUgcHVsc2UgaXMgYWN0aXZlIGxvdy9oaWdoL2lnbm9yZWQK
IAogRXhhbXBsZQogLS0tLS0tLQotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

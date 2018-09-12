From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 5/8] dt-bindings: display: add data-enable polarity property
Date: Wed, 12 Sep 2018 11:32:19 -0700
Message-ID: <20180912183222.25414-6-stefan@agner.ch>
References: <20180912183222.25414-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180912183222.25414-1-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linus.walleij@linaro.org, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWxsb3cgdG8gc3BlY2lmeSB0aGUgZGF0YS1lbmFibGUgcG9sYXJpdHkgcmVxdWlyZWQgYnkgYSBk
dW1iIFZHQQpEQUMgY29udmVydGluZyBwYXJhbGxlbCBSR0IgdG8gVkdBLgoKU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Ci0tLQogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvZHVtYi12Z2EtZGFjLnR4dCAgICAgICAgIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9kdW1iLXZnYS1kYWMudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R1bWItdmdhLWRh
Yy50eHQKaW5kZXggMTY0Y2JiMTVmMDRjLi43MjcxMTFhZGUyMDMgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9kdW1iLXZnYS1kYWMu
dHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9kdW1iLXZnYS1kYWMudHh0CkBAIC0xOCw2ICsxOCw4IEBAIGdyYXBoIGJpbmRpbmdzIHNwZWNp
ZmllZCBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0LgogCiBP
cHRpb25hbCBwcm9wZXJ0aWVzOgogLSB2ZGQtc3VwcGx5OiBQb3dlciBzdXBwbHkgZm9yIERBQwor
LSBkZS1hY3RpdmU6IFBvbGFyaXR5IG9mIHRoZSBkYXRhIGVuYWJsZSBzaWduYWwuIDAgZm9yIGFj
dGl2ZSBsb3csIDEgZm9yCisgIGFjdGl2ZSBoaWdoLCB1bnNldCBmb3Igc3lzdGVtLXNwZWNpZmlj
IGRlZmF1bHRzLgogCiBFeGFtcGxlCiAtLS0tLS0tCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

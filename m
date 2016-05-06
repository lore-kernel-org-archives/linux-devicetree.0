From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v16 8/8] clk: mediatek: remove hdmitx_dig_cts from TOP clocks
Date: Fri,  6 May 2016 15:05:54 +0200
Message-ID: <1462539954-26158-9-git-send-email-p.zabel@pengutronix.de>
References: <1462539954-26158-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1462539954-26158-1-git-send-email-p.zabel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, kernel@pengutronix.de, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Emil Velikov <emil.l.velikov@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

VGhlIGhkbWl0eF9kaWdfY3RzIGNsb2NrIHNpZ25hbCBpcyBub3QgYSBjaGlsZCBvZiB0dmRwbGxf
NDQ1cDVtLApidXQgaXMgcm91dGVkIG91dCBvZiB0aGUgSERNSSBQSFkgbW9kdWxlLgoKU2lnbmVk
LW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KQWNrZWQtYnk6
IFN0ZXBoZW4gQm95ZCA8c2JveWRAY29kZWF1cm9yYS5vcmc+Ci0tLQogZHJpdmVycy9jbGsvbWVk
aWF0ZWsvY2xrLW10ODE3My5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyBiL2RyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYwppbmRleCBjZjRmY2I2Li4xMGM5ODYwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMKKysrIGIvZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10ODE3My5jCkBAIC02MSw3ICs2MSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRrX2ZpeGVkX2ZhY3RvciB0b3BfZGl2c1tdIF9faW5pdGNvbnN0ID0gewogCUZBQ1RPUihD
TEtfVE9QX0NMS1JUQ19JTlQsICJjbGtydGNfaW50IiwgImNsazI2bSIsIDEsIDc5MyksCiAJRkFD
VE9SKENMS19UT1BfRlBDLCAiZnBjX2NrIiwgImNsazI2bSIsIDEsIDEpLAogCi0JRkFDVE9SKENM
S19UT1BfSERNSVRYX0RJR19DVFMsICJoZG1pdHhfZGlnX2N0cyIsICJ0dmRwbGxfNDQ1cDVtIiwg
MSwgMyksCiAJRkFDVE9SKENMS19UT1BfSERNSVRYUExMX0QyLCAiaGRtaXR4cGxsX2QyIiwgImhk
bWl0eF9kaWdfY3RzIiwgMSwgMiksCiAJRkFDVE9SKENMS19UT1BfSERNSVRYUExMX0QzLCAiaGRt
aXR4cGxsX2QzIiwgImhkbWl0eF9kaWdfY3RzIiwgMSwgMyksCiAKLS0gCjIuOC4wLnJjMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

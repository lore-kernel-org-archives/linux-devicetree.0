From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 13/13] clk: mediatek: remove hdmitx_dig_cts from TOP clocks
Date: Mon,  4 Jan 2016 18:36:45 +0100
Message-ID: <1451929005-16372-14-git-send-email-p.zabel@pengutronix.de>
References: <1451929005-16372-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1451929005-16372-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, kernel@pengutronix.de, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

VGhlIGhkbWl0eF9kaWdfY3RzIGNsb2NrIHNpZ25hbCBpcyBub3QgYSBjaGlsZCBvZiB0dmRwbGxf
NDQ1cDVtLApidXQgaXMgcm91dGVkIG91dCBvZiB0aGUgSERNSSBQSFkgbW9kdWxlLgoKU2lnbmVk
LW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5j
IGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jCmluZGV4IDNhZTBiODguLmUwZDk5
OTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYworKysgYi9k
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMKQEAgLTYxLDcgKzYxLDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfZml4ZWRfZmFjdG9yIHRvcF9kaXZzW10gX19pbml0Y29uc3QgPSB7
CiAJRkFDVE9SKENMS19UT1BfQ0xLUlRDX0lOVCwgImNsa3J0Y19pbnQiLCAiY2xrMjZtIiwgMSwg
NzkzKSwKIAlGQUNUT1IoQ0xLX1RPUF9GUEMsICJmcGNfY2siLCAiY2xrMjZtIiwgMSwgMSksCiAK
LQlGQUNUT1IoQ0xLX1RPUF9IRE1JVFhfRElHX0NUUywgImhkbWl0eF9kaWdfY3RzIiwgInR2ZHBs
bF80NDVwNW0iLCAxLCAzKSwKIAlGQUNUT1IoQ0xLX1RPUF9IRE1JVFhQTExfRDIsICJoZG1pdHhw
bGxfZDIiLCAiaGRtaXR4X2RpZ19jdHMiLCAxLCAyKSwKIAlGQUNUT1IoQ0xLX1RPUF9IRE1JVFhQ
TExfRDMsICJoZG1pdHhwbGxfZDMiLCAiaGRtaXR4X2RpZ19jdHMiLCAxLCAzKSwKIAotLSAKMi42
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

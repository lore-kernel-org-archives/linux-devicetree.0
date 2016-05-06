From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v16 1/8] memory: mtk-smi: export mtk_smi_larb_get/put
Date: Fri,  6 May 2016 15:05:47 +0200
Message-ID: <1462539954-26158-2-git-send-email-p.zabel@pengutronix.de>
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

VG8gYWxsb3cgYnVpbGRpbmcgbWVkaWF0ZWstZHJtLmtvIGFzIGEgbW9kdWxlLCB0aGUKbXRrX3Nt
aV9sYXJiX2dldCBhbmQgbXRrX3NtaV9sYXJiX3B1dCBzeW1ib2xzIGhhdmUKdG8gYmUgZXhwb3J0
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PgotLS0KIGRyaXZlcnMvbWVtb3J5L210ay1zbWkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS9tdGstc21pLmMgYi9k
cml2ZXJzL21lbW9yeS9tdGstc21pLmMKaW5kZXggMDg5MDkxZi4uZjZiNTc1NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jCisrKyBiL2RyaXZlcnMvbWVtb3J5L210ay1zbWku
YwpAQCAtOTEsNiArOTEsNyBAQCBpbnQgbXRrX3NtaV9sYXJiX2dldChzdHJ1Y3QgZGV2aWNlICps
YXJiZGV2KQogCiAJcmV0dXJuIDA7CiB9CitFWFBPUlRfU1lNQk9MX0dQTChtdGtfc21pX2xhcmJf
Z2V0KTsKIAogdm9pZCBtdGtfc21pX2xhcmJfcHV0KHN0cnVjdCBkZXZpY2UgKmxhcmJkZXYpCiB7
CkBAIC0xMDYsNiArMTA3LDcgQEAgdm9pZCBtdGtfc21pX2xhcmJfcHV0KHN0cnVjdCBkZXZpY2Ug
KmxhcmJkZXYpCiAJbXRrX3NtaV9kaXNhYmxlKCZsYXJiLT5zbWkpOwogCW10a19zbWlfZGlzYWJs
ZShjb21tb24pOwogfQorRVhQT1JUX1NZTUJPTF9HUEwobXRrX3NtaV9sYXJiX3B1dCk7CiAKIHN0
YXRpYyBpbnQKIG10a19zbWlfbGFyYl9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRl
dmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQotLSAKMi44LjAucmMzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

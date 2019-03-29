From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] ARM: dts: stm32: add power supply of rm68200 on
 stm32mp157c-ev1
Date: Fri, 29 Mar 2019 11:12:53 +0100
Message-ID: <1553854373-28946-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHByb3BlcnR5IChwb3dlci1zdXBwbHkpIHRvIHBhbmVsIHJt
NjgyMDAgKHJheWRpdW0pCm9uIHN0bTMybXAxNTdjLWV2MS4KClNpZ25lZC1vZmYtYnk6IFlhbm5p
Y2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWVkMS5kdHMgfCA4ICsrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTU3Yy1ldjEuZHRzIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS5kdHMgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1lZDEuZHRzCmluZGV4IDlmZDc5NDMuLjI4ZDA4MDkg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS5kdHMKKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZWQxLmR0cwpAQCAtNzAsNiArNzAsMTQgQEAK
IAkJZ3Bpb3Mtc3RhdGVzID0gPDA+OwogCQlzdGF0ZXMgPSA8MTgwMDAwMCAweDEgMjkwMDAwMCAw
eDA+OwogCX07CisKKwl2M3YzOiB2M3YzIHsKKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4
ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9ICJ2M3YzIjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3Zv
bHQgPSA8MzMwMDAwMD47CisJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owor
CQlyZWd1bGF0b3ItYWx3YXlzLW9uOworCX07CiB9OwogCiAmZHRzIHsKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3Yy1ldjEuZHRzCmluZGV4IGI2YWNhNDAuLmNiM2FlYjIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2MtZXYxLmR0cwpAQCAtNjMsNiArNjMsNyBAQAogCQljb21wYXRpYmxlID0g
InJheWRpdW0scm02ODIwMCI7CiAJCXJlZyA9IDwwPjsKIAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9m
IDE1IEdQSU9fQUNUSVZFX0xPVz47CisJCXBvd2VyLXN1cHBseSA9IDwmdjN2Mz47CiAJCWJhY2ts
aWdodCA9IDwmcGFuZWxfYmFja2xpZ2h0PjsKIAkJc3RhdHVzID0gIm9rYXkiOwogCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK

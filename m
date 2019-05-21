From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] ARM: dts: stm32: add power supply of rm68200 on
 stm32mp157c-ev1
Date: Tue, 21 May 2019 17:03:18 +0200
Message-ID: <1558450998-13451-1-git-send-email-yannick.fertre@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHByb3BlcnR5IChwb3dlci1zdXBwbHkpIHRvIHBhbmVsIHJt
NjgyMDAgKHJheWRpdW0pCm9uIHN0bTMybXAxNTdjLWV2MS4KClNpZ25lZC1vZmYtYnk6IFlhbm5p
Y2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWV2MS5kdHMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzCmluZGV4IDhlZjJjYjAuLjUwZjMy
NjMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cwpAQCAtMTI3LDYgKzEyNyw3
IEBACiAJCXJlZyA9IDwwPjsKIAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9mIDE1IEdQSU9fQUNUSVZF
X0xPVz47CiAJCWJhY2tsaWdodCA9IDwmcGFuZWxfYmFja2xpZ2h0PjsKKwkJcG93ZXItc3VwcGx5
ID0gPCZ2M3YzPjsKIAkJc3RhdHVzID0gIm9rYXkiOwogCiAJCXBvcnQgewotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==

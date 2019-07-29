From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c-ev1
Date: Mon, 29 Jul 2019 16:29:08 +0200
Message-ID: <1564410548-20436-1-git-send-email-yannick.fertre@st.com>
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

VGhlIGRzaSBwaHlzaWNhbCBsYXllciBpcyBwb3dlcmVkIGJ5IHRoZSAxdjggcG93ZXIgY29udHJv
bGxlciBzdXBwbHkuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVy
dHJlQHN0LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1N2MtZXYxLmR0cwppbmRleCBmZWI4Zjc3Li4xOWQ2OWQwIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNTdjLWV2MS5kdHMKQEAgLTEwMSw2ICsxMDEsNyBAQAogJmRzaSB7CiAJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CiAJI3NpemUtY2VsbHMgPSA8MD47CisJcGh5LWRzaS1zdXBwbHkgPSA8JnJl
ZzE4PjsKIAlzdGF0dXMgPSAib2theSI7CiAKIAlwb3J0cyB7Ci0tIAoyLjcuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

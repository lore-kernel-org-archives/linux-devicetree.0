From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v2 5/7] ARM: dts: stm32: Add ltdc support on stm32f429 MCU
Date: Fri, 10 Feb 2017 16:24:32 +0100
Message-ID: <1486740274-25958-6-git-send-email-yannick.fertre@st.com>
References: <1486740274-25958-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486740274-25958-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIExUREMgKExjZC10ZnQgRGlzcGxheSBDb250cm9sbGVyKSBzdXBwb3J0LgoKU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
MmY0MjkuZHRzaQppbmRleCBlNGRhZTBlLi4wMGY2NjgxIDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMmY0MjkuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0Mjku
ZHRzaQpAQCAtNDgsNiArNDgsOCBAQAogI2luY2x1ZGUgInNrZWxldG9uLmR0c2kiCiAjaW5jbHVk
ZSAiYXJtdjctbS5kdHNpIgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzJmNDI5
LXBpbmZ1bmMuaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdG0zMmY0LWNsb2NrLmg+
CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbWZkL3N0bTMyZjQtcmNjLmg+CiAKIC8gewogCWNsb2Nr
cyB7CkBAIC0yMDYsNyArMjA4LDcgQEAKIAkJCXJlZyA9IDwweDQwMDA3MDAwIDB4NDAwPjsKIAkJ
fTsKIAotCQlwaW4tY29udHJvbGxlciB7CisJCXBpbmN0cmw6IHBpbi1jb250cm9sbGVyIHsKIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MT47CiAJCQljb21wYXRp
YmxlID0gInN0LHN0bTMyZjQyOS1waW5jdHJsIjsKQEAgLTQyNiw2ICs0MjgsMjEgQEAKIAkJCWlu
dGVycnVwdHMgPSA8ODA+OwogCQkJY2xvY2tzID0gPCZyY2MgMCAzOD47CiAJCX07CisKKwkJbHRk
Yzogc3RtMzItbHRkY0A0MDAxNjgwMCB7CisJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLWx0ZGMi
OworCQkJcmVnID0gPDB4NDAwMTY4MDAgMHgyMDA+OworCQkJaW50ZXJydXB0cyA9IDw4OD4sIDw4
OT47CisJCQlyZXNldHMgPSA8JnJjYyBTVE0zMkY0X0FQQjJfUkVTRVQoTFREQyk+OworCQkJY2xv
Y2tzID0gPCZyY2MgMSBDTEtfTENEPjsKKwkJCWNsb2NrLW5hbWVzID0gImxjZCI7CisJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOworCisJCQlwb3J0IHsKKwkJCQlsdGRjX291dF9yZ2I6IGVuZHBvaW50
IHsKKwkJCQl9OworCQkJfTsKKwkJfTsKIAl9OwogfTsKIAotLSAKMS45LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

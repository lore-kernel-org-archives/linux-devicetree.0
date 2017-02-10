From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v2 6/9] ARM: dts: stm32: Add ltdc support on stm32f429 MCU
Date: Fri, 10 Feb 2017 15:54:46 +0100
Message-ID: <1486738489-22154-7-git-send-email-yannick.fertre@st.com>
References: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
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
bS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSB8IDE4ICsrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
ZjQyOS5kdHNpCmluZGV4IGU0ZGFlMGUuLjQ3MzUxZTIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyZjQyOS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5k
dHNpCkBAIC00OCw2ICs0OCw3IEBACiAjaW5jbHVkZSAic2tlbGV0b24uZHRzaSIKICNpbmNsdWRl
ICJhcm12Ny1tLmR0c2kiCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMmY0Mjkt
cGluZnVuYy5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0bTMyZjQtY2xvY2suaD4K
IAogLyB7CiAJY2xvY2tzIHsKQEAgLTIwNiw3ICsyMDcsNyBAQAogCQkJcmVnID0gPDB4NDAwMDcw
MDAgMHg0MDA+OwogCQl9OwogCi0JCXBpbi1jb250cm9sbGVyIHsKKwkJcGluY3RybDogcGluLWNv
bnRyb2xsZXIgewogCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkjc2l6ZS1jZWxscyA9IDwx
PjsKIAkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNDI5LXBpbmN0cmwiOwpAQCAtNDI2LDYgKzQy
NywyMSBAQAogCQkJaW50ZXJydXB0cyA9IDw4MD47CiAJCQljbG9ja3MgPSA8JnJjYyAwIDM4PjsK
IAkJfTsKKworCQlsdGRjOiBzdG0zMi1sdGRjQDQwMDE2ODAwIHsKKwkJCWNvbXBhdGlibGUgPSAi
c3Qsc3RtMzItbHRkYyI7CisJCQlyZWcgPSA8MHg0MDAxNjgwMCAweDIwMD47CisJCQlpbnRlcnJ1
cHRzID0gPDg4PiwgPDg5PjsKKwkJCXJlc2V0cyA9IDwmcmNjIDMxND47CisJCQljbG9ja3MgPSA8
JnJjYyAxIENMS19MQ0Q+OworCQkJY2xvY2stbmFtZXMgPSAiY2xrLWxjZCI7CisJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOworCisJCQlwb3J0IHsKKwkJCQlsdGRjX291dF9yZ2I6IGVuZHBvaW50IHsK
KwkJCQl9OworCQkJfTsKKwkJfTsKIAl9OwogfTsKIAotLSAKMS45LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

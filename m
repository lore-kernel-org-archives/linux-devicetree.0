From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v7 6/9] ARM: dts: stm32: Add ltdc support on stm32f429 MCU
Date: Fri, 14 Apr 2017 12:13:36 +0200
Message-ID: <1492164819-10513-7-git-send-email-yannick.fertre@st.com>
References: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1492164819-10513-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIExUREMgKExjZC10ZnQgRGlzcGxheSBDb250cm9sbGVyKSBzdXBwb3J0LgoKU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5k
dHNpCmluZGV4IGVlMGRhOTcuLjIzZGViZDkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMyZjQyOS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpCkBA
IC01NDMsNyArNTQzLDE3IEBACiAJCQlyZWcgPSA8MHg0MDAwNzAwMCAweDQwMD47CiAJCX07CiAK
LQkJcGluLWNvbnRyb2xsZXIgeworCQlsdGRjOiBkaXNwbGF5LWNvbnRyb2xsZXJANDAwMTY4MDAg
eworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1sdGRjIjsKKwkJCXJlZyA9IDwweDQwMDE2ODAw
IDB4MjAwPjsKKwkJCWludGVycnVwdHMgPSA8ODg+LCA8ODk+OworCQkJcmVzZXRzID0gPCZyY2Mg
U1RNMzJGNF9BUEIyX1JFU0VUKExUREMpPjsKKwkJCWNsb2NrcyA9IDwmcmNjIDEgQ0xLX0xDRD47
CisJCQljbG9jay1uYW1lcyA9ICJsY2QiOworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsK
KworCQlwaW5jdHJsOiBwaW4tY29udHJvbGxlciB7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
IAkJCSNzaXplLWNlbGxzID0gPDE+OwogCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMmY0MjktcGlu
Y3RybCI7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

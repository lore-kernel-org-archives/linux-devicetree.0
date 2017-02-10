From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v2 1/7] dt-bindings: display: add STM32 LTDC driver
Date: Fri, 10 Feb 2017 16:24:28 +0100
Message-ID: <1486740274-25958-2-git-send-email-yannick.fertre@st.com>
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

U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0t
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0ICB8IDM3
ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmI5M2UxYzgKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dApA
QCAtMCwwICsxLDM3IEBACisqIFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBsY2QtdGZ0IGRpc3Bs
YXkgY29udHJvbGxlcgorCistIGx0ZGM6IGxjZC10ZnQgZGlzcGxheSBjb250cm9sbGVyIGhvc3QK
KyAgbXVzdCBiZSBhIHN1Yi1ub2RlIG9mIHN0LWRpc3BsYXktc3Vic3lzdGVtCisgIFJlcXVpcmVk
IHByb3BlcnRpZXM6CisgIC0gY29tcGF0aWJsZTogInN0LHN0bTMyLWx0ZGMiCisgIC0gcmVnOiBQ
aHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIElQIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mIG1l
bW9yeSBtYXBwZWQgcmVnaW9uLgorICAtIGNsb2NrczogQSBsaXN0IG9mIHBoYW5kbGUgKyBjbG9j
ay1zcGVjaWZpZXIgcGFpcnMsIG9uZSBmb3IgZWFjaAorICAgIGVudHJ5IGluICdjbG9jay1uYW1l
cycuCisgIC0gY2xvY2stbmFtZXM6IEEgbGlzdCBvZiBjbG9jayBuYW1lcy4gRm9yIGx0ZGMgaXQg
c2hvdWxkIGNvbnRhaW46CisgICAgICAtICJjbGstbGNkIiBmb3IgdGhlIGNsb2NrIGZlZWRpbmcg
dGhlIG91dHB1dCBwaXhlbCBjbG9jayAmIElQIGNsb2NrLgorICAtIHJlc2V0czogcmVzZXQgdG8g
YmUgdXNlZCBieSB0aGUgZGV2aWNlIChkZWZpbmVkIGJ5IHVzZSBvZiBSQ0MgbWFjcm8pLgorICBS
ZXF1aXJlZCBub2RlczoKKyAgICAtIFZpZGVvIHBvcnQgZm9yIFJHQiBvdXRwdXQuCisKK0V4YW1w
bGU6CisKKy8geworCS4uLgorCXNvYyB7CisJLi4uCisJCWx0ZGM6IHN0bTMyLWx0ZGNANDAwMTY4
MDAgeworCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1sdGRjIjsKKwkJCXJlZyA9IDwweDQwMDE2
ODAwIDB4MjAwPjsKKwkJCWludGVycnVwdHMgPSA8ODg+LCA8ODk+OworCQkJcmVzZXRzID0gPCZy
Y2MgU1RNMzJGNF9BUEIyX1JFU0VUKExUREMpPjsKKwkJCWNsb2NrcyA9IDwmcmNjIDEgQ0xLX0xD
RD47CisJCQljbG9jay1uYW1lcyA9ICJsY2QiOworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwor
CQkJcG9ydCB7CisJCQkJbHRkY19vdXRfcmdiOiBlbmRwb2ludCB7CisJCQkJfTsKKwkJCX07CisJ
CX07CisJfTsKK307Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==

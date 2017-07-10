From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add support for Orise
 Tech otm8009a dsi panel
Date: Mon, 10 Jul 2017 11:02:12 +0200
Message-ID: <1499677333-10571-3-git-send-email-philippe.cornu@st.com>
References: <1499677333-10571-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1499677333-10571-1-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VGhlIE9yaXNlIFRlY2ggT1RNODAwOUEgaXMgYSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwg
Y29ubmVjdGVkIHVzaW5nCmEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLiBJdHMgYmFja2xpZ2h0
IGlzIG1hbmFnZWQgdGhyb3VnaCB0aGUgRFNJIGxpbmsuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgICB8IDIxICsrKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gs
b3RtODAwOWEudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNjg2MjAyOAotLS0gL2Rldi9udWxs
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29y
aXNldGVjaCxvdG04MDA5YS50eHQKQEAgLTAsMCArMSwyMSBAQAorT3Jpc2UgVGVjaCBPVE04MDA5
QSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwgKE1JUEktRFNJIHZpZGVvIG1vZGUpCisKK1Ro
ZSBPcmlzZSBUZWNoIE9UTTgwMDlBIGlzIGEgMy45NyIgNDgweDgwMCBURlQgTENEIHBhbmVsIGNv
bm5lY3RlZCB1c2luZworYSBNSVBJLURTSSB2aWRlbyBpbnRlcmZhY2UuIEl0cyBiYWNrbGlnaHQg
aXMgbWFuYWdlZCB0aHJvdWdoIHRoZSBEU0kgbGluay4KKworUmVxdWlyZWQgcHJvcGVydGllczoK
KyAgLSBjb21wYXRpYmxlOiAib3Jpc2V0ZWNoLG90bTgwMDlhIgorICAtIHJlZzogdGhlIHZpcnR1
YWwgY2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorCitPcHRpb25hbCBwcm9wZXJ0
aWVzOgorICAtIHJlc2V0LWdwaW9zOiBhIEdQSU8gc3BlYyBmb3IgdGhlIHJlc2V0IHBpbiAoYWN0
aXZlIGxvdykuCisKK0V4YW1wbGU6CismZHNpIHsKKwkuLi4KKwlwYW5lbEAwIHsKKwkJY29tcGF0
aWJsZSA9ICJvcmlzZXRlY2gsb3RtODAwOWEiOworCQlyZWcgPSA8MD47CisJCXJlc2V0LWdwaW9z
ID0gPCZncGlvaCA3IEdQSU9fQUNUSVZFX0xPVz47CisJfTsKK307Ci0tIAoxLjkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

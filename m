From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v1 2/3] dt-bindings: display: panel: Add support for Orise
 Tech otm8009a dsi panel
Date: Tue, 4 Jul 2017 18:30:04 +0200
Message-ID: <1499185805-23354-3-git-send-email-philippe.cornu@st.com>
References: <1499185805-23354-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1499185805-23354-1-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VGhlIE9yaXNlIFRlY2ggT1RNODAwOUEgaXMgYSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwg
Y29ubmVjdGVkIHVzaW5nCmEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLiBJdHMgYmFja2xpZ2h0
IGlzIG1hbmFnZWQgdGhyb3VnaCB0aGUgRFNJIGxpbmsuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gs
b3RtODAwOWEudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMGJiODIzNwotLS0gL2Rldi9udWxs
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29y
aXNldGVjaCxvdG04MDA5YS50eHQKQEAgLTAsMCArMSwyMCBAQAorT3Jpc2UgVGVjaCBPVE04MDA5
QSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwgKE1JUEktRFNJIHZpZGVvIG1vZGUpCisKK1Ro
ZSBPcmlzZSBUZWNoIE9UTTgwMDlBIGlzIGEgMy45NyIgNDgweDgwMCBURlQgTENEIHBhbmVsIGNv
bm5lY3RlZCB1c2luZworYSBNSVBJLURTSSB2aWRlbyBpbnRlcmZhY2UuIEl0cyBiYWNrbGlnaHQg
aXMgbWFuYWdlZCB0aHJvdWdoIHRoZSBEU0kgbGluay4KKworUmVxdWlyZWQgcHJvcGVydGllczoK
KyAgLSBjb21wYXRpYmxlOiAib3Jpc2V0ZWNoLG90bTgwMDlhIgorICAtIHJlZzogdGhlIHZpcnR1
YWwgY2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBoZXJhbAorICAtIHJlc2V0LWdwaW9zOiBh
IEdQSU8gc3BlYyBmb3IgdGhlIHJlc2V0IHBpbiAoYWN0aXZlIGxvdykuIChPcHRpb25hbCkKKwor
RXhhbXBsZToKKyZkc2kgeworCS4uLgorCisJcGFuZWxAMCB7CisJCWNvbXBhdGlibGUgPSAib3Jp
c2V0ZWNoLG90bTgwMDlhIjsKKwkJcmVnID0gPDA+OworCQlyZXNldC1ncGlvcyA9IDwmZ3Bpb2gg
NyAwPjsKKwl9OworfTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK

From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v3 2/3] dt-bindings: display: panel: Add support for Orise
 Tech otm8009a dsi panel
Date: Mon, 17 Jul 2017 15:19:52 +0200
Message-ID: <1500297593-30633-3-git-send-email-philippe.cornu@st.com>
References: <1500297593-30633-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1500297593-30633-1-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VGhlIE9yaXNlIFRlY2ggT1RNODAwOUEgaXMgYSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwg
Y29ubmVjdGVkIHVzaW5nCmEgTUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLiBJdHMgYmFja2xpZ2h0
IGlzIG1hbmFnZWQgdGhyb3VnaCB0aGUgRFNJIGxpbmsuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gs
b3RtODAwOWEudHh0ICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L29yaXNldGVjaCxvdG04MDA5YS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEudHh0Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAuLjY4NjIwMjgKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEu
dHh0CkBAIC0wLDAgKzEsMjEgQEAKK09yaXNlIFRlY2ggT1RNODAwOUEgMy45NyIgNDgweDgwMCBU
RlQgTENEIHBhbmVsIChNSVBJLURTSSB2aWRlbyBtb2RlKQorCitUaGUgT3Jpc2UgVGVjaCBPVE04
MDA5QSBpcyBhIDMuOTciIDQ4MHg4MDAgVEZUIExDRCBwYW5lbCBjb25uZWN0ZWQgdXNpbmcKK2Eg
TUlQSS1EU0kgdmlkZW8gaW50ZXJmYWNlLiBJdHMgYmFja2xpZ2h0IGlzIG1hbmFnZWQgdGhyb3Vn
aCB0aGUgRFNJIGxpbmsuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisgIC0gY29tcGF0aWJsZTog
Im9yaXNldGVjaCxvdG04MDA5YSIKKyAgLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVy
IG9mIGEgRFNJIHBlcmlwaGVyYWwKKworT3B0aW9uYWwgcHJvcGVydGllczoKKyAgLSByZXNldC1n
cGlvczogYSBHUElPIHNwZWMgZm9yIHRoZSByZXNldCBwaW4gKGFjdGl2ZSBsb3cpLgorCitFeGFt
cGxlOgorJmRzaSB7CisJLi4uCisJcGFuZWxAMCB7CisJCWNvbXBhdGlibGUgPSAib3Jpc2V0ZWNo
LG90bTgwMDlhIjsKKwkJcmVnID0gPDA+OworCQlyZXNldC1ncGlvcyA9IDwmZ3Bpb2ggNyBHUElP
X0FDVElWRV9MT1c+OworCX07Cit9OwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

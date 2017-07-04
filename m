From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v1 0/3] Add support for the otm8009a dsi panel
Date: Tue, 4 Jul 2017 18:30:02 +0200
Message-ID: <1499185805-23354-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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

SGkgYWxsLAoKVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBhZGQgc3VwcG9ydCBmb3Ig
dGhlIE9yaXNlIFRlY2gKb3RtODAwOWEgMy45NyIgNDgweDgwMCBURlQgTENEIHBhbmVsIChNSVBJ
LURTSSB2aWRlbyBtb2RlKS4KVGhpcyBMQ0QgcGFuZWwgaXMgdXNlZCBpbiBzZXZlcmFsIFNUTTMy
IGJvYXJkcy4KClZlcnNpb24gMToKLSBJbml0aWFsIGNvbW1pdAoKQmVzdCByZWdhcmRzLApQaGls
aXBwZQoKUGhpbGlwcGUgQ09STlUgKDMpOgogIGR0LWJpbmRpbmdzOiBBZGQgdmVuZG9yIHByZWZp
eCBmb3IgT3Jpc2UgVGVjaG5vbG9neQogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbDogQWRk
IHN1cHBvcnQgZm9yIE9yaXNlIFRlY2ggb3RtODAwOWEgZHNpCiAgICBwYW5lbAogIGRybS9wYW5l
bDogQWRkIHN1cHBvcnQgZm9yIG90bTgwMDlhIHBhbmVsIGRyaXZlcgoKIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgIHwgIDIwICsKIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgICAgICAgIHwgICAxICsKIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vcmlzZXRlY2gtb3RtODAwOWEuYyAgIHwgNTE3ICsr
KysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1NDggaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQKIGNyZWF0ZSBtb2RlIDEwMDc1NSBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlhLmMKCi0tIAoxLjkuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

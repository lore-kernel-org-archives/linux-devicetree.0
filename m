From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 1/8] dt-bindings: display: add STM32 LTDC driver
Date: Wed, 15 Mar 2017 18:02:07 +0100
Message-ID: <1489597334-16896-2-git-send-email-yannick.fertre@st.com>
References: <1489597334-16896-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1489597334-16896-1-git-send-email-yannick.fertre@st.com>
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

QWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFlh
bm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCAgfCAzNiArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0
ZGMudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwLi5lOGQzOWM1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKQEAgLTAsMCArMSwzNiBAQAor
KiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgbGNkLXRmdCBkaXNwbGF5IGNvbnRyb2xsZXIKKwor
LSBsdGRjOiBsY2QtdGZ0IGRpc3BsYXkgY29udHJvbGxlciBob3N0CisgIG11c3QgYmUgYSBzdWIt
bm9kZSBvZiBzdC1kaXNwbGF5LXN1YnN5c3RlbQorICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgorICAt
IGNvbXBhdGlibGU6ICJzdCxzdG0zMi1sdGRjIgorICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRy
ZXNzIG9mIHRoZSBJUCByZWdpc3RlcnMgYW5kIGxlbmd0aCBvZiBtZW1vcnkgbWFwcGVkIHJlZ2lv
bi4KKyAgLSBjbG9ja3M6IEEgbGlzdCBvZiBwaGFuZGxlICsgY2xvY2stc3BlY2lmaWVyIHBhaXJz
LCBvbmUgZm9yIGVhY2gKKyAgICBlbnRyeSBpbiAnY2xvY2stbmFtZXMnLgorICAtIGNsb2NrLW5h
bWVzOiBBIGxpc3Qgb2YgY2xvY2sgbmFtZXMuIEZvciBsdGRjIGl0IHNob3VsZCBjb250YWluOgor
ICAgICAgLSAiY2xrLWxjZCIgZm9yIHRoZSBjbG9jayBmZWVkaW5nIHRoZSBvdXRwdXQgcGl4ZWwg
Y2xvY2sgJiBJUCBjbG9jay4KKyAgLSByZXNldHM6IHJlc2V0IHRvIGJlIHVzZWQgYnkgdGhlIGRl
dmljZSAoZGVmaW5lZCBieSB1c2Ugb2YgUkNDIG1hY3JvKS4KKyAgUmVxdWlyZWQgbm9kZXM6Cisg
ICAgLSBWaWRlbyBwb3J0IGZvciBSR0Igb3V0cHV0LgorCitFeGFtcGxlOgorCisvIHsKKwkuLi4K
Kwlzb2MgeworCS4uLgorCQlsdGRjOiBkaXNwbGF5LWNvbnRyb2xsZXJANDAwMTY4MDAgeworCQkJ
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMi1sdGRjIjsKKwkJCXJlZyA9IDwweDQwMDE2ODAwIDB4MjAw
PjsKKwkJCWludGVycnVwdHMgPSA8ODg+LCA8ODk+OworCQkJcmVzZXRzID0gPCZyY2MgU1RNMzJG
NF9BUEIyX1JFU0VUKExUREMpPjsKKwkJCWNsb2NrcyA9IDwmcmNjIDEgQ0xLX0xDRD47CisJCQlj
bG9jay1uYW1lcyA9ICJsY2QiOworCisJCQlwb3J0IHsKKwkJCQlsdGRjX291dF9yZ2I6IGVuZHBv
aW50IHsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OworfTsKLS0gCjEuOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

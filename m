From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH] dt-bindings: display: stm32: add pixel clock mandatory
 property
Date: Thu, 26 Oct 2017 18:12:36 +0200
Message-ID: <1509034356-23885-1-git-send-email-philippe.cornu@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell
 King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Archit
 Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Bhumika Goyal <bhumirks@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSBEUEkvUkdCIGlucHV0IHBpeGVsIGNsb2NrIGluIG1hbmRhdG9yeSBwcm9wZXJ0aWVz
CmJlY2F1c2UgaXQgcmVhbGx5IG9mZmVycyBhIGJldHRlciBwcmVjaXNlbmVzcyBmb3IgdGltaW5n
CmNvbXB1dGF0aW9ucy4KTm90ZTogRml4IGFsc28gdGhlIERTSSBwYW5lbCBleGFtcGxlIHdoZXJl
ICJyZWYiICYgInBjbGsiCmNsb2NrcyB3ZXJlIHN3YXBwZWQuCgpTaWduZWQtb2ZmLWJ5OiBQaGls
aXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0IHwgNiArKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRk
Yy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0z
Mi1sdGRjLnR4dAppbmRleCAwMjkyNTIyLi45OTgyM2ZiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4
dApAQCAtMjgsNiArMjgsNyBAQCBNYW5kYXRvcnkgcHJvcGVydGllcyBzcGVjaWZpYyB0byBTVE0z
MiBEU0k6CiAtICNzaXplLWNlbGxzOiBTaG91bGQgYmUgPDA+LgogLSBjb21wYXRpYmxlOiAic3Qs
c3RtMzItZHNpIi4KIC0gY2xvY2stbmFtZXM6CisgIC0gRFBJL1JHQiBpbnB1dCBwaXhlbCBjbG9j
ayBzdHJpbmcgbmFtZSwgbXVzdCBiZSAicHhfY2xrIi4KICAgLSBwaHkgcGxsIHJlZmVyZW5jZSBj
bG9jayBzdHJpbmcgbmFtZSwgbXVzdCBiZSAicmVmIi4KIC0gcmVzZXRzOiBzZWUgWzVdLgogLSBy
ZXNldC1uYW1lczogc2VlIFs1XS4KQEAgLTk3LDggKzk4LDkgQEAgRXhhbXBsZSAyOiBEU0kgcGFu
ZWwKIAkJCSNzaXplLWNlbGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1kc2ki
OwogCQkJcmVnID0gPDB4NDAwMTZjMDAgMHg4MDA+OwotCQkJY2xvY2tzID0gPCZyY2MgMSBDTEtf
RjQ2OV9EU0k+LCA8JmNsa19oc2U+OwotCQkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsiOwor
CQkJY2xvY2tzID0gPCZyY2MgMSBDTEtfRjQ2OV9EU0k+LCA8JnJjYyAxIENMS19MQ0Q+LAorCQkJ
CSA8JmNsa19oc2U+OworCQkJY2xvY2stbmFtZXMgPSAicGNsayIsICJweF9jbGsiLCAicmVmIjsK
IAkJCXJlc2V0cyA9IDwmcmNjIFNUTTMyRjRfQVBCMl9SRVNFVChEU0kpPjsKIAkJCXJlc2V0LW5h
bWVzID0gImFwYiI7CiAKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK

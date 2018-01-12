From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v2] dt-bindings: display: stm32: add pixel clock mandatory
 property
Date: Fri, 12 Jan 2018 16:30:34 +0100
Message-ID: <20180112153034.20353-1-philippe.cornu@st.com>
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
aXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjogcHV0
IG5ldyBjbG9jayBpbiBsYXN0IHBvc2l0aW9uIChSb2IgSGVycmluZykKCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDYgKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMy
LWx0ZGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qs
c3RtMzItbHRkYy50eHQKaW5kZXggMDI5MjUyMjUzYWQ0Li45NDJiNzIzN2FlODcgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0
ZGMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0
LHN0bTMyLWx0ZGMudHh0CkBAIC0yOSw2ICsyOSw3IEBAIE1hbmRhdG9yeSBwcm9wZXJ0aWVzIHNw
ZWNpZmljIHRvIFNUTTMyIERTSToKIC0gY29tcGF0aWJsZTogInN0LHN0bTMyLWRzaSIuCiAtIGNs
b2NrLW5hbWVzOgogICAtIHBoeSBwbGwgcmVmZXJlbmNlIGNsb2NrIHN0cmluZyBuYW1lLCBtdXN0
IGJlICJyZWYiLgorICAtIERQSS9SR0IgaW5wdXQgcGl4ZWwgY2xvY2sgc3RyaW5nIG5hbWUsIG11
c3QgYmUgInB4X2NsayIuCiAtIHJlc2V0czogc2VlIFs1XS4KIC0gcmVzZXQtbmFtZXM6IHNlZSBb
NV0uCiAKQEAgLTk3LDggKzk4LDkgQEAgRXhhbXBsZSAyOiBEU0kgcGFuZWwKIAkJCSNzaXplLWNl
bGxzID0gPDA+OwogCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1kc2kiOwogCQkJcmVnID0gPDB4
NDAwMTZjMDAgMHg4MDA+OwotCQkJY2xvY2tzID0gPCZyY2MgMSBDTEtfRjQ2OV9EU0k+LCA8JmNs
a19oc2U+OwotCQkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsiOworCQkJY2xvY2tzID0gPCZy
Y2MgMSBDTEtfRjQ2OV9EU0k+LCA8JmNsa19oc2U+LAorCQkJCSA8JnJjYyAxIENMS19MQ0Q+Owor
CQkJY2xvY2stbmFtZXMgPSAicGNsayIsICJyZWYiLCAicHhfY2xrIjsKIAkJCXJlc2V0cyA9IDwm
cmNjIFNUTTMyRjRfQVBCMl9SRVNFVChEU0kpPjsKIAkJCXJlc2V0LW5hbWVzID0gImFwYiI7CiAK
LS0gCjIuMTUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==

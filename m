From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH] dt-bindings: display: stm32: correct clock-names in dsi panel
 example
Date: Mon, 22 Jan 2018 16:35:47 +0100
Message-ID: <20180122153547.23470-1-philippe.cornu@st.com>
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
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mickael Reulier <mickael.reulier@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

SW4gdGhlIGRzaSBwYW5lbCBleGFtcGxlLCBjbG9jayBuYW1lcyBpbiB0aGUgImNsb2NrLW5hbWVz
IgpmaWVsZCBoYXZlIGJlZW4gc3dhcHBlZDoKKiAicGNsayIgKHBlcmlwaGVyYWwgY2xvY2spIGlz
IDwmcmNjIDEgQ0xLX0Y0NjlfRFNJPiBvbiBzdG0zMmY0CiogInJlZiIgKGRzaSBwaHkgcGxsIHJl
ZiBjbG9jaykgaXMgPCZjbGtfaHNlPiBvbiBzdG0zMmY0CgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4
dAppbmRleCAwMjkyNTIyNTNhZDQuLjNlYjFiNDhiNDdkZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50
eHQKQEAgLTk4LDcgKzk4LDcgQEAgRXhhbXBsZSAyOiBEU0kgcGFuZWwKIAkJCWNvbXBhdGlibGUg
PSAic3Qsc3RtMzItZHNpIjsKIAkJCXJlZyA9IDwweDQwMDE2YzAwIDB4ODAwPjsKIAkJCWNsb2Nr
cyA9IDwmcmNjIDEgQ0xLX0Y0NjlfRFNJPiwgPCZjbGtfaHNlPjsKLQkJCWNsb2NrLW5hbWVzID0g
InJlZiIsICJwY2xrIjsKKwkJCWNsb2NrLW5hbWVzID0gInBjbGsiLCAicmVmIjsKIAkJCXJlc2V0
cyA9IDwmcmNjIFNUTTMyRjRfQVBCMl9SRVNFVChEU0kpPjsKIAkJCXJlc2V0LW5hbWVzID0gImFw
YiI7CiAKLS0gCjIuMTUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

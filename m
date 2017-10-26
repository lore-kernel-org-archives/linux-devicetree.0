From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v1 1/2] dt-bindings: display: stm32: add a 2nd endpoint
Date: Thu, 26 Oct 2017 13:48:08 +0200
Message-ID: <1509018489-19641-2-git-send-email-philippe.cornu@st.com>
References: <1509018489-19641-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1509018489-19641-1-git-send-email-philippe.cornu@st.com>
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
 King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mickael Reulier <mickael.reulier@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

bHRkYyBjYW4gaGF2ZSB1cCB0byAyIGVuZHBvaW50czoKIC0gZHBpIGV4dGVybmFsIGdwaW9zOiBm
b3IgcmdiIHBhbmVscyBvciBleHRlcm5hbCBicmlkZ2UgSUNzLgogLSBkcGkgaW50ZXJuYWwgaW9z
OiBjb25uZWN0ZWQgaW50ZXJuYWxseSB0byBkc2kuCgpOb3RlOiBSZWZlciB0byB0aGUgcmVmZXJl
bmNlIG1hbnVhbCB0byBrbm93IGlmIHRoZSBkc2kgaXMKcHJlc2VudCBvbiB5b3VyIGRldmljZS4K
ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRk
Yy50eHQgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKaW5kZXggNzRiNWFjNy4uMDI5MjUyMiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3Rt
MzItbHRkYy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvc3Qsc3RtMzItbHRkYy50eHQKQEAgLTEwLDcgKzEwLDExIEBACiAgICAgICAtICJsY2QiIGZv
ciB0aGUgY2xvY2sgZmVlZGluZyB0aGUgb3V0cHV0IHBpeGVsIGNsb2NrICYgSVAgY2xvY2suCiAg
IC0gcmVzZXRzOiByZXNldCB0byBiZSB1c2VkIGJ5IHRoZSBkZXZpY2UgKGRlZmluZWQgYnkgdXNl
IG9mIFJDQyBtYWNybykuCiAgIFJlcXVpcmVkIG5vZGVzOgotICAgIC0gVmlkZW8gcG9ydCBmb3Ig
UkdCIG91dHB1dC4KKyAgLSBWaWRlbyBwb3J0IGZvciBEUEkgUkdCIG91dHB1dDogbHRkYyBoYXMg
b25lIHZpZGVvIHBvcnQgd2l0aCB1cCB0byAyCisgICAgZW5kcG9pbnRzOgorICAgICAgLSBmb3Ig
ZXh0ZXJuYWwgZHBpIHJnYiBwYW5lbCBvciBicmlkZ2UsIHVzaW5nIGdwaW9zLgorICAgICAgLSBm
b3IgaW50ZXJuYWwgZHBpIGlucHV0IG9mIHRoZSBNSVBJIERTSSBob3N0IGNvbnRyb2xsZXIuCisg
ICAgICBOb3RlOiBUaGVzZSAyIGVuZHBvaW50cyBjYW5ub3QgYmUgYWN0aXZhdGVkIHNpbXVsdGFu
ZW91c2x5LgogCiAqIFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBEU0kgY29udHJvbGxlciBzcGVj
aWZpYyBleHRlbnNpb25zIHRvIFN5bm9wc3lzCiAgIERlc2lnbldhcmUgTUlQSSBEU0kgaG9zdCBj
b250cm9sbGVyCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v2 0/3] Add support for the otm8009a dsi panel
Date: Mon, 10 Jul 2017 11:02:10 +0200
Message-ID: <1499677333-10571-1-git-send-email-philippe.cornu@st.com>
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
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VmVyc2lvbiAyOgotIHBhbmVsLW9yaXNldGVjaC1vdG04MDA5YS5jOiBBZGQgTWFudWZhY3R1cmVy
IENvbW1hbmQgU2V0IGRlZmluZXMsCiAgYWRkIG5ldyBtYWNybyBmb3IgaGFuZGxpbmcgYWRkcmVz
cyBzaGlmdGluZywgaW1wcm92ZSByZXNldAogIHNlcXVlbmNlLCB1c2UgbW9yZSBtaXBpIGRjcyBo
ZWxwZXJzIChBbmRyemVqIEhhamRhKQotIGR0LWJpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0
ZWNoLG90bTgwMDlhLnR4dDogRml4IHJlc2V0IGdwaW8KICBhY3RpdmUgbGV2ZWwgaW4gdGhlIGV4
YW1wbGUgKEFuZHJ6ZWogSGFqZGEpLCBBZGQgYW4gIk9wdGlvbmFsCiAgUHJvcGVydGllcyIgc2Vj
dGlvbiAoUm9iIEhlcnJpbmcpLgoKVmVyc2lvbiAxOgotIEluaXRpYWwgY29tbWl0CgpUaGUgcHVy
cG9zZSBvZiB0aGlzIHBhdGNoIGlzIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgT3Jpc2UgVGVjaApv
dG04MDA5YSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwgKE1JUEktRFNJIHZpZGVvIG1vZGUp
LgpUaGlzIExDRCBwYW5lbCBpcyB1c2VkIGluIHNldmVyYWwgU1RNMzIgYm9hcmRzLgoKUGhpbGlw
cGUgQ09STlUgKDMpOgogIGR0LWJpbmRpbmdzOiBBZGQgdmVuZG9yIHByZWZpeCBmb3IgT3Jpc2Ug
VGVjaG5vbG9neQogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBwYW5lbDogQWRkIHN1cHBvcnQgZm9y
IE9yaXNlIFRlY2ggb3RtODAwOWEgZHNpCiAgICBwYW5lbAogIGRybS9wYW5lbDogQWRkIHN1cHBv
cnQgZm9yIG90bTgwMDlhIHBhbmVsIGRyaXZlcgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L29yaXNldGVjaCxvdG04MDA5YS50eHQgIHwgIDIxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3ZlbmRvci1wcmVmaXhlcy50eHQgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1vcmlzZXRlY2gtb3RtODAwOWEuYyAgIHwgNDg5ICsrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1MjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29y
aXNldGVjaCxvdG04MDA5YS50eHQKIGNyZWF0ZSBtb2RlIDEwMDc1NSBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlhLmMKCi0tIAoxLjkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

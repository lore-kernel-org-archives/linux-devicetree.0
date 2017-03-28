From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v5 05/10] dt-bindings: Add Ampire AM-480272H3TMQW-T01H panel
Date: Tue, 28 Mar 2017 11:44:48 +0200
Message-ID: <1490694293-18358-6-git-send-email-yannick.fertre@st.com>
References: <1490694293-18358-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1490694293-18358-1-git-send-email-yannick.fertre@st.com>
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZSBXVkdBIHBhbmVsCkFtcGlyZSBBTS00ODAyNzJIM1RNUVctVDAxSC4KCkFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRy
ZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2FtcGlyZSxh
bS00ODAyNzJoM3RtcXctdDAxaC50eHQgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0tNDgwMjcy
aDN0bXF3LXQwMWgudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00
ODAyNzJoM3RtcXctdDAxaC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4u
NjgxMjI4MAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxhbS00ODAyNzJoM3RtcXctdDAxaC50eHQKQEAgLTAs
MCArMSwyNiBAQAorQW1waXJlIEFNLTQ4MDI3MkgzVE1RVy1UMDFIIDQuMyIgV1FWR0EgVEZUIExD
RCBwYW5lbAorCitUaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFu
ZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVkCitpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRo
aXMgZGlyZWN0b3J5LgorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91
bGQgYmUgImFtcGlyZSxhbS00ODAyNzJoM3RtcXctdDAxaCIKKworT3B0aW9uYWwgcHJvcGVydGll
czoKKy0gcG93ZXItc3VwcGx5OiByZWd1bGF0b3IgdG8gcHJvdmlkZSB0aGUgc3VwcGx5IHZvbHRh
Z2UKKy0gZW5hYmxlLWdwaW9zOiBHUElPIHBpbiB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgcGFu
ZWwKKy0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGF0dGFjaGVk
IHRvIHRoZSBwYW5lbAorCitPcHRpb25hbCBub2RlczoKKy0gVmlkZW8gcG9ydCBmb3IgUkdCIGlu
cHV0LgorCitFeGFtcGxlOgorCXBhbmVsX3JnYjogcGFuZWwtcmdiIHsKKwkJY29tcGF0aWJsZSA9
ICJhbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgiOworCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW9h
IDggMT47CisJCXBvcnQgeworCQkJcGFuZWxfaW5fcmdiOiBlbmRwb2ludCB7CisJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZjb250cm9sbGVyX291dF9yZ2I+OworCQkJfTsKKwkJfTsKKwl9OwotLSAK
MS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

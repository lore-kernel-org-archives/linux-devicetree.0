From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 3/8] dt-bindings: Add Ampire AM-480272H3TMQW-T01H panel
Date: Wed, 15 Mar 2017 18:02:09 +0100
Message-ID: <1489597334-16896-4-git-send-email-yannick.fertre@st.com>
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

U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0t
CiAuLi4vZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgudHh0ICB8IDI2
ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFoLnR4dAoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FtcGlyZSxh
bS00ODAyNzJoM3RtcXctdDAxaC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0tNDgwMjcyaDN0bXF3LXQwMWgudHh0Cm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmU3MDExMWYKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hbXBpcmUsYW0t
NDgwMjcyaDN0bXF3LXQwMWgudHh0CkBAIC0wLDAgKzEsMjYgQEAKK0FtcGlyZSBBTS00ODAyNzJI
M1RNUVctVDAxSCA0LjMiIFdRVkdBIFRGVCBMQ0QgcGFuZWwKKworVGhpcyBiaW5kaW5nIGlzIGNv
bXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmll
ZAoraW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4KKworUmVxdWlyZWQgcHJv
cGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJhbXBpcmUsYW0tNDgwMjcyaDN0bXF3
LXQwMWgiCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHBvd2VyLXN1cHBseTogcmVndWxhdG9y
IHRvIHByb3ZpZGUgdGhlIHN1cHBseSB2b2x0YWdlCistIGVuYWJsZS1ncGlvczogR1BJTyBwaW4g
dG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIHBhbmVsCistIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0
aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworT3B0aW9uYWwgbm9k
ZXM6CistIFZpZGVvIHBvcnQgZm9yIFJHQiBpbnB1dC4KKworRXhhbXBsZToKKwlwYW5lbF9yZ2I6
IHBhbmVsLXJnYiB7CisJCWNvbXBhdGlibGUgPSAiYW1waXJlLGFtLTQ4MDI3MmgzdG1xdy10MDFo
IjsKKwkJZW5hYmxlLWdwaW9zID0gPCZncGlvYSA4IDE+OworCQlwb3J0IHsKKwkJCXBhbmVsX2lu
X3JnYjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmY29udHJvbGVyX291dF9y
Z2I+OworCQkJfTsKKwkJfTsKKwl9OwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

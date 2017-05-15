From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v1 3/3] drm/stm: Add STM32 DSI host driver
Date: Mon, 15 May 2017 10:22:25 +0200
Message-ID: <a254c176-8064-1984-10b8-dce4308cc3d6@baylibre.com>
References: <1494600989-13507-1-git-send-email-philippe.cornu@st.com>
 <1494600989-13507-4-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1494600989-13507-4-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philippe CORNU <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Ludovic Barre <ludovic.barre@st.com>, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDUvMTIvMjAxNyAwNDo1NiBQTSwgUGhpbGlwcGUgQ09STlUgd3JvdGU6Cj4gVGhpcyBtaXBp
IGRzaSBob3N0IGRyaXZlciBpcyBiYXNlZCBvbiB0aGUgUm9ja2NoaXAgdmVyc2lvbiBvZiB0aGUK
PiBTeW5vcHN5cyBEZXNpZ253YXJlIG1pcGkgZHNpIGRyaXZlciAocm9ja2NoaXAvZHctbWlwaS1k
c2kuYykKPiBtb2RpZmllZCBmb3IgdGhlIHN0bTMyIGZhbWlseToKPiAtIHJlcGxhY2UgUm9ja2No
aXAgZGlnaXRhbCAmIHBoeSBzcGVjaWZpYyBleHRlbnNpb25zIHdpdGggc3RtMzIncyBvbmVzLgo+
IC0gYWRkIGEgYnJpZGdlCj4gCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgQ09STlUgPHBoaWxp
cHBlLmNvcm51QHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3N0bS9LY29uZmlnICAg
ICAgIHwgICAgNyArCj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vTWFrZWZpbGUgICAgICB8ICAgIDIg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3LW1pcGktZHNpLmMgfCAxMTk3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMjA2IGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9zdG0vZHctbWlw
aS1kc2kuYwo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL0tjb25maWcKPiBpbmRleCAyYzQ4MTdmLi4wMDA3Nzg5IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdG0vS2NvbmZpZwo+IEBAIC0xNCwzICsxNCwxMCBAQCBjb25maWcgRFJNX1NUTQo+ICAJ
ICBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgTUNVcy4KPiAgCSAgVG8gY29tcGlsZSB0aGlzIGRy
aXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlIG1vZHVsZQo+ICAJICB3aWxsIGJl
IGNhbGxlZCBzdG0tZHJtLgo+ICsKPiArY29uZmlnIERSTV9TVE1fRFNJCj4gKwl0cmlzdGF0ZSAi
TUlQSSBEU0kgc3VwcG9ydCBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzIFNvQyIKPiArCWRlcGVuZHMg
b24gRFJNX1NUTQo+ICsJc2VsZWN0IERSTV9NSVBJX0RTSQo+ICsJaGVscAo+ICsJICBDaG9vc2Ug
dGhpcyBvcHRpb24gZm9yIE1JUEkgRFNJIHN1cHBvcnQgb24gU1RNaWNyb2VsZWN0cm9uaWNzIFNv
Qy4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS9zdG0vTWFrZWZpbGUKPiBpbmRleCBlMTE0ZDQ1Li5lNDQ4YTkzIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c3RtL01ha2VmaWxlCj4gQEAgLTQsNCArNCw2IEBAIHN0bS1kcm0teSA6PSBcCj4gIAlkcnYubyBc
Cj4gIAlsdGRjLm8KPiAgCj4gK29iai0kKENPTkZJR19EUk1fU1RNX0RTSSkgKz0gZHctbWlwaS1k
c2kubwo+ICsKPiAgb2JqLSQoQ09ORklHX0RSTV9TVE0pICs9IHN0bS1kcm0ubwo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3LW1pcGktZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
c3RtL2R3LW1pcGktZHNpLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAu
LjRiN2Y3YjkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kdy1t
aXBpLWRzaS5jCgoKSGkgUGhpbGlwcGUsCgpGaXJzdCBxdWVzdGlvbiwgd2h5IGNvdWxkbid0IHRo
aXMgYmUgdHJhbnNmb3JtZWQgYXMgYSBicmlkZ2UgZHJpdmVyIGFsb25nIHRoZSBTeW5vcHN5cyBE
Vy1IRE1JIGRyaXZlciA/CgpOZWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

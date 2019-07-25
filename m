From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v2 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Date: Thu, 25 Jul 2019 12:05:32 +0200
Message-ID: <CA+M3ks5v7vF_mPBr4mkwsHidc-N4jfJDgqWWE7qRv0LDsYJ-pQ@mail.gmail.com>
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Olivier Moysan <olivier.moysan@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, jernej.skrabec@siol.net, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

TGUgbHVuLiAyMiBqdWlsLiAyMDE5IMOgIDE4OjA2LCBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBBZGQgZGV2bV9jbGtfZ2V0IGNhbGwgdG8gcmV0
cmlldmUgcmVmZXJlbmNlIHRvIG1hc3RlciBjbG9jay4KPgo+IEZpeGVzOiBmZjU3ODE2MzRjNDEg
KCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRpbyBzdXBwb3J0IikKPgo+
IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBzdC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gQWNrZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4K
VGhhbmtzLApCZW5qYW1pbgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkwMnguYwo+IGluZGV4IGMyZjk3ZTU5OTdhMS4uOTYyOTMxYzIwZWZlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzUxLDYgKzc1MSw3IEBAIHN0YXRpYyBpbnQg
c2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAo+ICAgICAg
ICAgICAgICAgICBzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19m
aWZvX2lkW2ldIHwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpMnNfbGFuZV9pZFtsYW5lc1tp
XV0gfCBTSUk5MDJYX1RQSV9JMlNfRklGT19FTkFCTEU7Cj4KPiArICAgICAgIHNpaTkwMngtPmF1
ZGlvLm1jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibWNsayIpOwo+ICAgICAgICAgaWYgKElTX0VS
UihzaWk5MDJ4LT5hdWRpby5tY2xrKSkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IiVzOiBObyBjbG9jayAoYXVkaW8gbWNsaykgZm91bmQ6ICVsZFxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7Cj4gLS0K
PiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

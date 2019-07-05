From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Date: Fri, 5 Jul 2019 12:24:02 +0000
Message-ID: <39d9bf8f-a906-7f69-582d-b2996e600c0f@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
Content-ID: <DDC1C03DC92D944FA408C2A9B6DAE01F@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "jsarha@ti.com" <jsarha@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm>
List-Id: devicetree@vger.kernel.org

SGkgT2xpdmllciwNCmFuZCBtYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCkkgZG8gbm90IHNl
ZSBob3cgYXVkaW8gY291bGQgd29yayB3aXRob3V0IHlvdXIgcGF0Y2gsIHNvOg0KUmV2aWV3ZWQt
Ynk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQpQaGlsaXBwZSA6LSkN
Cg0KT24gNy8yLzE5IDU6NDcgUE0sIE9saXZpZXIgTW95c2FuIHdyb3RlOg0KPiBBZGQgZGV2bV9j
bGtfZ2V0IGNhbGwgdG8gcmV0cmlldmUgcmVmZXJlbmNlIHRvIG1hc3RlciBjbG9jay4NCj4gDQo+
IEZpeGVzOiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERN
SSBhdWRpbyBzdXBwb3J0IikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxv
bGl2aWVyLm1veXNhbkBzdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTAyeC5jIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYw0KPiBpbmRleCBkZDdhYTQ2NmIyODAuLjM2YWNjMjU2
ZTY3ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMNCj4gQEAgLTc1MCw2ICs3NTAs
NyBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3Qgc2lpOTAyeCAq
c2lpOTAyeCwNCj4gICAJCXNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldIHw9IGF1
ZGlvX2ZpZm9faWRbaV0gfA0KPiAgIAkJCWkyc19sYW5lX2lkW2xhbmVzW2ldXSB8CVNJSTkwMlhf
VFBJX0kyU19GSUZPX0VOQUJMRTsNCj4gICANCj4gKwlzaWk5MDJ4LT5hdWRpby5tY2xrID0gZGV2
bV9jbGtfZ2V0KGRldiwgIm1jbGsiKTsNCj4gICAJaWYgKElTX0VSUihzaWk5MDJ4LT5hdWRpby5t
Y2xrKSkgew0KPiAgIAkJZGV2X2VycihkZXYsICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZv
dW5kOiAlbGRcbiIsDQo+ICAgCQkJX19mdW5jX18sIFBUUl9FUlIoc2lpOTAyeC0+YXVkaW8ubWNs
aykpOw0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

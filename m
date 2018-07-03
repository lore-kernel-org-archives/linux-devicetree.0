From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v2 3/8] drm/bridge/synopsys: dsi: defer probing if panel
 not available in bridge-attach
Date: Tue, 3 Jul 2018 11:57:59 +0000
Message-ID: <156aa52e-5deb-238a-ad3d-42dca99edd4b@st.com>
References: <20180618102806.15650-1-heiko@sntech.de>
 <20180618102806.15650-4-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180618102806.15650-4-heiko@sntech.de>
Content-Language: en-US
Content-ID: <CDB3A88B920831438381FDE5A67F17CF@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "briannorris@chromium.org" <briannorris@chromium.org>, "hoegsberg@gmail.com" <hoegsberg@gmail.com>, Yannick FERTRE <yannick.fertre@st.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "nickey.yang@rock-chips.com" <nickey.yang@rock-chips.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mka@chromium.org" <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

SGkgSGVpa28sDQoNCk9uIDA2LzE4LzIwMTggMTI6MjggUE0sIEhlaWtvIFN0dWVibmVyIHdyb3Rl
Og0KPiBXaGVuIHRoZSBwYW5lbC1kcml2ZXIgaXMgYnVpbGQgYXMgYSBtb2R1bGUgaXQgY3VycmVu
dGx5IGZhaWxzIGhhcmQgYXMgdGhlDQo+IHBhbmVsIGNhbm5vdCBiZSBwcm9iZWQgZGlyZWN0bHk6
DQo+IA0KPiBkd19taXBpX2RzaV9iaW5kKCkNCj4gICAgX19kd19taXBpX2RzaV9wcm9iZSgpDQo+
ICAgICAgY3JlYXRlcyBkc2kgYnVzDQo+ICAgICAgY3JlYXRlcyBwYW5lbCBkZXZpY2UNCj4gICAg
ICB0cmlnZ2VycyBwYW5lbCBtb2R1bGUgbG9hZA0KPiAgICAgIHBhbmVsIG5vdCBwcm9iZWQgKG1v
ZHVsZSBub3QgbG9hZGVkIG9yIHBhbmVsIHByb2JlIHNsb3cpDQo+ICAgIGRybV9icmlkZ2VfYXR0
YWNoDQo+ICAgICAgZmFpbHMgd2l0aCAtRUlOVkFMIGR1ZSB0byBlbXB0eSBwYW5lbF9icmlkZ2UN
Cj4gDQo+IFNvIGVtaXQgYSAtRVBST0JFX0RFRkVSIGluIHRoYXQgY2FzZSB0byBnaXZlIHRoZSBk
cml2ZXIgYW5vdGhlcg0KPiBjaGFuY2UgYXQgZ2V0dGluZyB0aGUgZGlzcGxheSBsYXRlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDMg
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBpbmRleCBiYjRhZWNh
NWMwZjkuLmJkNTAzZjAwMGVkNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBAQCAtODM1LDYgKzgzNSw5IEBAIHN0YXRpYyBpbnQg
ZHdfbWlwaV9kc2lfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiAg
IAkJcmV0dXJuIC1FTk9ERVY7DQo+ICAgCX0NCj4gICANCj4gKwlpZiAoIWRzaS0+cGFuZWxfYnJp
ZGdlKQ0KPiArCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gKw0KDQpUaGFuayB5b3UgZm9yIHlv
dXIgcGF0Y2gsDQoNClJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVA
c3QuY29tPg0KVGVzdGVkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29t
Pg0KDQpQaGlsaXBwZSA6LSkNCg0KPiAgIAkvKiBTZXQgdGhlIGVuY29kZXIgdHlwZSBhcyBjYWxs
ZXIgZG9lcyBub3Qga25vdyBpdCAqLw0KPiAgIAlicmlkZ2UtPmVuY29kZXItPmVuY29kZXJfdHlw
ZSA9IERSTV9NT0RFX0VOQ09ERVJfRFNJOw0KPiAgIA0KPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

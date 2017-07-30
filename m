From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v6 1/7] drm/stm: ltdc: Fix leak of px clk enable in some
 error paths
Date: Sun, 30 Jul 2017 09:10:29 +0000
Message-ID: <99a961b3-8549-1612-15e8-08f150cc8989@st.com>
References: <1500277223-29553-1-git-send-email-philippe.cornu@st.com>
 <1500277223-29553-2-git-send-email-philippe.cornu@st.com>
 <bd6aeb5d-8f39-3e5e-0f72-a1d50e4438ef@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <bd6aeb5d-8f39-3e5e-0f72-a1d50e4438ef@codeaurora.org>
Content-Language: en-US
Content-ID: <117A8706E37227498A3AC78278FA2A8A@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin
 Gaignard <benjamin.gaignard@linaro.org>, Yannick FERTRE <yannick.fertre@st.com>, Neil Armstrong <narmstrong@baylibre.com>, Eric
 Anholt <eric@anholt.net>, Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Xinliang Liu <xinliang.liu@linaro.org>, "zourongrong@gmail.com" <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>, Mark
 Yao <mark.yao@rock-chips.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Fabien DESSENNE <fabien.dessenne@st.com>, Mickael REULIER <mickael.reulier@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Ludovic BARRE <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA3LzI5LzIwMTcgMDQ6MzIgUE0sIEFyY2hpdCBUYW5lamEgd3JvdGU6DQo+IEhpIFBo
aWxpcHBlLA0KPiANCj4gT24gMDcvMTcvMjAxNyAwMToxMCBQTSwgUGhpbGlwcGUgQ09STlUgd3Jv
dGU6DQo+PiBUaGUgcGl4ZWwgY2xvY2sgZ2V0cyBlbmFibGVkIGVhcmx5IGR1cmluZyBpbml0LCBz
aW5jZSBpdCdzIHJlcXVpcmVkDQo+PiBpbiBvcmRlciB0byByZWFkIHJlZ2lzdGVycy4gVGhpcyBw
aXhlbCBjbG9jayBtdXN0IGJlIGRpc2FibGVkIGlmDQo+PiBlcnJvcnMgZHVyaW5nIHRoaXMgaW5p
dCBwaGFzZS4NCj4+DQo+IA0KPiBUaGlzIHBhdGNoIHdhcyBwdWxsZWQgaW4gdG8gZHJtLW1pc2Mt
bmV4dCwgYnV0IGl0IGxhY2tzIHlvdXIgU2lnbi1vZmYuDQo+IEl0IGxvb2tzIGxpa2UgdGhlIEFj
ayBhbmQgdGhlIFNpZ24tb2ZmIGdvdCBhY2NpZGVudGFsbHkgbWl4ZWQgdXANCj4gDQoNCkhpIEFy
Y2hpdCwNClRoaXMgcGF0Y2ggaXMgZnJvbSBFcmljIHRoYXQgaXMgd2h5IEkgcHV0IGhpcyAic2ln
bmVkLW9mZi1ieSIgYW5kIEkgDQoiYWNrZWQiIGl0IHRvIGNvbmZpcm0gdGhhdCB0aGUgcGF0Y2gg
aXMgZmluZSB0byBtZSA6LSkNCg0KTmV2ZXJ0aGVsZXNzLCBhcyBJIGFtIHRoZSBwYXRjaCAiYXV0
aG9yIiBpbiB0aGUgZ2l0IHRyZWUsIEkgY29uZmlybSB3aXRoIA0KbXkgbXkgYmVsb3cgc2lnbmVk
LW9mZi1ieToNCg0KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4NCg0KTWFueSB0aGFua3MNClBoaWxpcHBlIDotKQ0KDQo+IENhbiB5b3UgcGxlYXNl
IHJlcGx5IHRvIHRoaXMgbWFpbCB3aXRoIHlvdXIgIlNpZ25lZC1vZmYtYnkiIHNvIHRoYXQNCj4g
d2UgaGF2ZSBwcm9vZiBvZiBpdCBvbiBkcmktZGV2ZWw/DQo+IA0KPiBUaGFua3MsDQo+IEFyY2hp
dA0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+DQo+
PiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCj4+IC0t
LQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDEwICsrKysrKy0tLS0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYw0KPj4gaW5kZXggNTMzMTc2MC4uN2Y2NGQ1YSAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuYw0KPj4gQEAgLTEwNDUsMTMgKzEwNDUsMTUgQEAgaW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGRldikNCj4+ICAgICAgIGlmIChvZl9hZGRyZXNzX3RvX3Jlc291cmNlKG5wLCAw
LCAmcmVzKSkgew0KPj4gICAgICAgICAgIERSTV9FUlJPUigiVW5hYmxlIHRvIGdldCByZXNvdXJj
ZVxuIik7DQo+PiAtICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+ICsgICAgICAgIHJldCA9IC1F
Tk9ERVY7DQo+PiArICAgICAgICBnb3RvIGVycjsNCj4+ICAgICAgIH0NCj4+ICAgICAgIGxkZXYt
PnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCAmcmVzKTsNCj4+ICAgICAgIGlmIChJ
U19FUlIobGRldi0+cmVncykpIHsNCj4+ICAgICAgICAgICBEUk1fRVJST1IoIlVuYWJsZSB0byBn
ZXQgbHRkYyByZWdpc3RlcnNcbiIpOw0KPj4gLSAgICAgICAgcmV0dXJuIFBUUl9FUlIobGRldi0+
cmVncyk7DQo+PiArICAgICAgICByZXQgPSBQVFJfRVJSKGxkZXYtPnJlZ3MpOw0KPj4gKyAgICAg
ICAgZ290byBlcnI7DQo+PiAgICAgICB9DQo+PiAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYX0lS
UTsgaSsrKSB7DQo+PiBAQCAtMTA2NCw3ICsxMDY2LDcgQEAgaW50IGx0ZGNfbG9hZChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGRldikNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X25hbWUo
ZGV2KSwgZGRldik7DQo+PiAgICAgICAgICAgaWYgKHJldCkgew0KPj4gICAgICAgICAgICAgICBE
Uk1fRVJST1IoIkZhaWxlZCB0byByZWdpc3RlciBMVERDIGludGVycnVwdFxuIik7DQo+PiAtICAg
ICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAgICAgICAgICBnb3RvIGVycjsNCj4+ICAgICAg
ICAgICB9DQo+PiAgICAgICB9DQo+PiBAQCAtMTA3OSw3ICsxMDgxLDcgQEAgaW50IGx0ZGNfbG9h
ZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikNCj4+ICAgICAgIGlmIChyZXQpIHsNCj4+ICAgICAg
ICAgICBEUk1fRVJST1IoImhhcmR3YXJlIGlkZW50aWZpZXIgKDB4JTA4eCkgbm90IHN1cHBvcnRl
ZCFcbiIsDQo+PiAgICAgICAgICAgICAgICAgbGRldi0+Y2Fwcy5od192ZXJzaW9uKTsNCj4+IC0g
ICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICAgICBnb3RvIGVycjsNCj4+ICAgICAgIH0NCj4+
ICAgICAgIERSTV9JTkZPKCJsdGRjIGh3IHZlcnNpb24gMHglMDh4IC0gcmVhZHlcbiIsIA0KPj4g
bGRldi0+Y2Fwcy5od192ZXJzaW9uKTsNCj4+DQo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

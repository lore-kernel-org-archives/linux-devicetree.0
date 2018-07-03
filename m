From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v2 1/8] drm/bridge/synopsys: dsi: move
 mipi_dsi_host_unregister to __dw_mipi_dsi_remove
Date: Tue, 3 Jul 2018 11:58:07 +0000
Message-ID: <ec4dc385-4f0d-a1c3-eb59-e8c622769e0c@st.com>
References: <20180618102806.15650-1-heiko@sntech.de>
 <20180618102806.15650-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180618102806.15650-2-heiko@sntech.de>
Content-Language: en-US
Content-ID: <92C5D64653AE434385725547094232CA@st.com>
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

SGkgSGVpa28sDQoNCg0KT24gMDYvMTgvMjAxOCAxMjoyNyBQTSwgSGVpa28gU3R1ZWJuZXIgd3Jv
dGU6DQo+IFJpZ2h0IG5vdyB0aGUgaG9zdCBpcyBvbmx5IHVucmVnaXN0ZXJlZCB3aGVuIHRoZSBk
cml2ZXIgaXMgdXNlZCB2aWEgdGhlDQo+IGJyaWRnZSBhcGkgYW5kIG5vdCB2aWEgdGhlIGNvbXBv
bmVudCBhcGksIGxlYWRpbmcgdG8gdGhlIGhvc3Qgc3RheWluZw0KPiByZWdpc3RlcmVkIGluIGNh
c2VzIGxpa2UgcHJvYmUgZGVmZXJyYWwuDQo+IA0KPiBTbyBtb3ZlIHRoZSBob3N0IHVucmVnaXN0
ZXIgdG8gdGhlIGdlbmVyYWwgcmVtb3ZlIGZ1bmN0aW9uLCBzbyB0aGF0IGl0DQo+IGdldHMgY2xl
YW5lZCB1cCBpbiBhbGwgY2FzZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa29Ac250ZWNoLmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LW1pcGktZHNpLmMgfCA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBpbmRleCBmZDc5OTk2NDJjZjguLjA3Y2RlMjU1
Y2FiMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1t
aXBpLWRzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlw
aS1kc2kuYw0KPiBAQCAtOTQxLDYgKzk0MSw4IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gICANCj4gICBzdGF0aWMgdm9pZCBfX2R3X21pcGlf
ZHNpX3JlbW92ZShzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSkNCj4gICB7DQo+ICsJbWlwaV9kc2lf
aG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9ob3N0KTsNCj4gKw0KPiAgIAlwbV9ydW50aW1lX2Rp
c2FibGUoZHNpLT5kZXYpOw0KPiAgIH0NCj4gICANCj4gQEAgLTk1Nyw4ICs5NTksNiBAQCBFWFBP
UlRfU1lNQk9MX0dQTChkd19taXBpX2RzaV9wcm9iZSk7DQo+ICAgDQo+ICAgdm9pZCBkd19taXBp
X2RzaV9yZW1vdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpDQo+ICAgew0KPiAtCW1pcGlfZHNp
X2hvc3RfdW5yZWdpc3RlcigmZHNpLT5kc2lfaG9zdCk7DQo+IC0NCg0KVGhhbmsgeW91IGZvciB5
b3VyIHBhdGNoLA0KDQpSZXZpZXdlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4NClRlc3RlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNv
bT4NCg0KUGhpbGlwcGUgOi0pDQoNCj4gICAJX19kd19taXBpX2RzaV9yZW1vdmUoZHNpKTsNCj4g
ICB9DQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfbWlwaV9kc2lfcmVtb3ZlKTsNCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

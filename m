From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: display: stm32: add supply property
 to DSI controller
Date: Fri, 5 Apr 2019 16:33:29 +0000
Message-ID: <0adc22b0-10aa-9c9b-d998-f0705bfb15fd@st.com>
References: <1554279389-27377-1-git-send-email-yannick.fertre@st.com>
 <1554279389-27377-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1554279389-27377-2-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Content-ID: <6F1FC8ACA86F7A4D9570706DAA8C6F4F@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gNC8zLzE5IDEwOjE2IEFNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6DQo+IFRoaXMgcGF0Y2gg
YWRkcyBkb2N1bWVudGF0aW9uIG9mIGEgbmV3IHByb3BlcnR5IHBoeS1kc2ktc3VwcGx5IHRvIHRo
ZQ0KPiBTVE0zMiBEU0kgY29udHJvbGxlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sg
RmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPiAtLS0NCj4gICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDMgKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRk
Yy50eHQNCj4gaW5kZXggM2ViMWI0OC4uNjBjNTRkYSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRk
Yy50eHQNCj4gQEAgLTQwLDYgKzQwLDggQEAgTWFuZGF0b3J5IG5vZGVzIHNwZWNpZmljIHRvIFNU
TTMyIERTSToNCj4gICAtIHBhbmVsIG9yIGJyaWRnZSBub2RlOiBBIG5vZGUgY29udGFpbmluZyB0
aGUgcGFuZWwgb3IgYnJpZGdlIGRlc2NyaXB0aW9uIGFzDQo+ICAgICBkb2N1bWVudGVkIGluIFs2
XS4NCj4gICAgIC0gcG9ydDogcGFuZWwgb3IgYnJpZGdlIHBvcnQgbm9kZSwgY29ubmVjdGVkIHRv
IHRoZSBEU0kgb3V0cHV0IHBvcnQgKHBvcnRAMSkuDQo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0K
PiArLSBwaHktZHNpLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlk
ZXMgdGhlIHN1cHBseSB2b2x0YWdlLg0KPiAgIA0KPiAgIE5vdGU6IFlvdSBjYW4gZmluZCBtb3Jl
IGRvY3VtZW50YXRpb24gaW4gdGhlIGZvbGxvd2luZyByZWZlcmVuY2VzDQo+ICAgWzFdIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5kaW5ncy50eHQNCj4g
QEAgLTEwMSw2ICsxMDMsNyBAQCBFeGFtcGxlIDI6IERTSSBwYW5lbA0KPiAgIAkJCWNsb2NrLW5h
bWVzID0gInBjbGsiLCAicmVmIjsNCj4gICAJCQlyZXNldHMgPSA8JnJjYyBTVE0zMkY0X0FQQjJf
UkVTRVQoRFNJKT47DQo+ICAgCQkJcmVzZXQtbmFtZXMgPSAiYXBiIjsNCj4gKwkJCXBoeS1kc2kt
c3VwcGx5ID0gPCZyZWcxOD47DQoNCkRlYXIgWWFubmljaywNClRoYW5rIHlvdSBmb3IgeW91ciBw
YXRjaCwNCg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5j
b20+DQoNClBoaWxpcHBlIDopDQoNCg0KPiAgIA0KPiAgIAkJCXBvcnRzIHsNCj4gICAJCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

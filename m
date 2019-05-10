From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: stm32: add supply property
 to DSI controller
Date: Fri, 10 May 2019 15:59:59 +0000
Message-ID: <2a00b710-9c7d-bd87-5a33-a39d13d6f71a@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Content-ID: <6C07FBD58C6BDA4B933A6AEECCC7475C@st.com>
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

RGVhciBZYW5uaWNrLA0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLA0KDQooYWxyZWFkeSA7LSkN
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQ
aGlsaXBwZSA6KQ0KDQoNCk9uIDUvMTAvMTkgNDoyMCBQTSwgWWFubmljayBGZXJ0csOpIHdyb3Rl
Og0KPiBUaGlzIHBhdGNoIGFkZHMgZG9jdW1lbnRhdGlvbiBvZiBhIG5ldyBwcm9wZXJ0eSBwaHkt
ZHNpLXN1cHBseSB0byB0aGUNCj4gU1RNMzIgRFNJIGNvbnRyb2xsZXIuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRk
Yy50eHQgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9z
dCxzdG0zMi1sdGRjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3N0LHN0bTMyLWx0ZGMudHh0DQo+IGluZGV4IDNlYjFiNDguLjYwYzU0ZGEgMTAwNjQ0DQo+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMy
LWx0ZGMudHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3N0LHN0bTMyLWx0ZGMudHh0DQo+IEBAIC00MCw2ICs0MCw4IEBAIE1hbmRhdG9yeSBub2Rl
cyBzcGVjaWZpYyB0byBTVE0zMiBEU0k6DQo+ICAgLSBwYW5lbCBvciBicmlkZ2Ugbm9kZTogQSBu
b2RlIGNvbnRhaW5pbmcgdGhlIHBhbmVsIG9yIGJyaWRnZSBkZXNjcmlwdGlvbiBhcw0KPiAgICAg
ZG9jdW1lbnRlZCBpbiBbNl0uDQo+ICAgICAtIHBvcnQ6IHBhbmVsIG9yIGJyaWRnZSBwb3J0IG5v
ZGUsIGNvbm5lY3RlZCB0byB0aGUgRFNJIG91dHB1dCBwb3J0IChwb3J0QDEpLg0KPiArT3B0aW9u
YWwgcHJvcGVydGllczoNCj4gKy0gcGh5LWRzaS1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3Vs
YXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBwbHkgdm9sdGFnZS4NCj4gICANCj4gICBOb3RlOiBZ
b3UgY2FuIGZpbmQgbW9yZSBkb2N1bWVudGF0aW9uIGluIHRoZSBmb2xsb3dpbmcgcmVmZXJlbmNl
cw0KPiAgIFsxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2st
YmluZGluZ3MudHh0DQo+IEBAIC0xMDEsNiArMTAzLDcgQEAgRXhhbXBsZSAyOiBEU0kgcGFuZWwN
Cj4gICAJCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiI7DQo+ICAgCQkJcmVzZXRzID0gPCZy
Y2MgU1RNMzJGNF9BUEIyX1JFU0VUKERTSSk+Ow0KPiAgIAkJCXJlc2V0LW5hbWVzID0gImFwYiI7
DQo+ICsJCQlwaHktZHNpLXN1cHBseSA9IDwmcmVnMTg+Ow0KPiAgIA0KPiAgIAkJCXBvcnRzIHsN
Cj4gICAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

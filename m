From: Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: stm32: remove phy-dsi-supply property on
 stm32mp157c-dk2 board
Date: Fri, 2 Aug 2019 09:02:31 +0000
Message-ID: <3a0f3e01-3c02-c28b-a6ca-0114a84358fb@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-6-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1557498023-10766-6-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Content-ID: <B5D0500FA370C842AC6FEF97802FF46B@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philippe CORNU <philippe.cornu@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgQWxleGFuZHJlLA0KDQp0aGlzIHBhdGNoIGNhbiBiZSBhYmFuZG9uZWQuDQoNCkJSDQoNCi0t
IA0KWWFubmljayBGZXJ0csOpIHwgVElOQTogMTY2IDcxNTIgfCBUZWw6ICszMyAyNDQwMjcxNTIg
fCBNb2JpbGU6ICszMyA2MjA2MDAyNzANCk1pY3JvY29udHJvbGxlcnMgYW5kIERpZ2l0YWwgSUNz
IEdyb3VwIHwgTWljcm9jb250cm9sbGV1cnMgRGl2aXNpb24NCk9uIDUvMTAvMTkgNDoyMCBQTSwg
WWFubmljayBGZXJ0csOpIHdyb3RlOg0KPiBUaGlzIHByb3BlcnR5IGlzIGFscmVhZHkgZGVmaW5l
ZCBpbnRvIHN0bTMybXAxNTdjLmR0c2kgZmlsZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFubmlj
ayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMgfCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2MtZGsyLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMNCj4gaW5k
ZXggMDIwZWEwZi4uMDlmNmU3YiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2MtZGsyLmR0cw0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1k
azIuZHRzDQo+IEBAIC0xNyw3ICsxNyw2IEBADQo+ICAgCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
PiAgIAkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gICAJc3RhdHVzID0gIm9rYXkiOw0KPiAtCXBoeS1k
c2ktc3VwcGx5ID0gPCZyZWcxOD47DQo+ICAgDQo+ICAgCXBvcnRzIHsNCj4gICAJCSNhZGRyZXNz
LWNlbGxzID0gPDE+OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

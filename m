From: Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c
Date: Fri, 2 Aug 2019 09:01:32 +0000
Message-ID: <e381b766-c576-828b-49a5-f13990b9d49f@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Content-ID: <F7623D89E5834A4A9837C0DAEEC4B353@st.com>
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
IEdyb3VwIHwgTWljcm9jb250cm9sbGV1cnMgRGl2aXNpb24NCg0KDQpPbiA1LzEwLzE5IDQ6MjAg
UE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToNCg0KPiBUaGUgZHNpIHBoeXNpY2FsIGxheWVyIGlz
IHBvd2VyZWQgYnkgdGhlIDF2OCBwb3dlciBjb250cm9sbGVyIHN1cHBseS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IC0tLQ0K
PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kgfCAxICsNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNp
DQo+IGluZGV4IDJhZmVlZTYuLjZiMTRmMWUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2MuZHRzaQ0KPiBAQCAtMTE1Niw2ICsxMTU2LDcgQEANCj4gICAJCQljbG9jay1uYW1lcyA9ICJw
Y2xrIiwgInJlZiIsICJweF9jbGsiOw0KPiAgIAkJCXJlc2V0cyA9IDwmcmNjIERTSV9SPjsNCj4g
ICAJCQlyZXNldC1uYW1lcyA9ICJhcGIiOw0KPiArCQkJcGh5LWRzaS1zdXBwbHkgPSA8JnJlZzE4
PjsNCj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiAgIAkJfTsNCj4gICANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

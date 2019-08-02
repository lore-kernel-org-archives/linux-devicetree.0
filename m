From: Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c-ev1
Date: Fri, 2 Aug 2019 08:01:40 +0000
Message-ID: <4e53ec28-0368-7ad8-1397-4d3d3172f02e@st.com>
References: <1564410548-20436-1-git-send-email-yannick.fertre@st.com>
 <346d04ad-17ed-40c8-f10a-b13a2ea79d92@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <346d04ad-17ed-40c8-f10a-b13a2ea79d92@st.com>
Content-Language: en-US
Content-ID: <DDDF93E406C16842AF9F6D3FE37A2808@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Philippe CORNU <philippe.cornu@st.com>, Fabrice GASNIER <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

TWFueSB0aGFua3MgQWxleC4NCg0KT24gOC8yLzE5IDk6MzYgQU0sIEFsZXhhbmRyZSBUb3JndWUg
d3JvdGU6DQo+IEhpIFlhbm5pY2sNCj4NCj4gT24gNy8yOS8xOSA0OjI5IFBNLCBZYW5uaWNrIEZl
cnRyw6kgd3JvdGU6DQo+PiBUaGUgZHNpIHBoeXNpY2FsIGxheWVyIGlzIHBvd2VyZWQgYnkgdGhl
IDF2OCBwb3dlciBjb250cm9sbGVyIHN1cHBseS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5u
aWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4+IC0tLQ0KPj4gwqAgYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cyB8IDEgKw0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWV2MS5kdHMgDQo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWV2MS5kdHMNCj4+IGluZGV4IGZlYjhmNzcuLjE5ZDY5ZDAgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzDQo+PiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzDQo+PiBAQCAtMTAxLDYgKzEwMSw3IEBADQo+PiDCoCAm
ZHNpIHsNCj4+IMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiDCoMKgwqDCoMKg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gK8KgwqDCoCBwaHktZHNpLXN1cHBseSA9IDwmcmVnMTg+
Ow0KPj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7DQo+PiDCoCDCoMKgwqDCoMKgIHBvcnRz
IHsNCj4+DQo+DQo+IEFwcGxpZWQgb24gc3RtMzItbmV4dC4NCj4NCj4gVGhhbmtzLg0KPiBBbGV4
DQotLSANCllhbm5pY2sgRmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVsOiArMzMgMjQ0MDI3
MTUyIHwgTW9iaWxlOiArMzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJzIGFuZCBEaWdpdGFs
IElDcyBHcm91cCB8IE1pY3JvY29udHJvbGxldXJzIERpdmlzaW9uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

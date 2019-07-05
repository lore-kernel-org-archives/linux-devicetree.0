From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
Date: Fri, 5 Jul 2019 12:35:14 +0000
Message-ID: <ca446f4b-d918-fe6d-f6bd-4aa07efbefac@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
Content-ID: <82CCEAE863094E428B349826FE92A781@st.com>
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

SGkgT2xpdmllciwNCmFuZCBtYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCkkgaGF2ZSBkb3Vi
bGUgY2hlY2tlZCBpbiB0aGUgc2lsOTAyMi8yNCBkYXRhc2hlZXQgYW5kIHlvdSBhcmUgcmlnaHQ6
DQoNCiJBcyBhbiBvcHRpb24sIHRoZSBvcmlnaW5hbCBNQ0xLIHNpZ25hbCB1c2VkIHRvIHN0cm9i
ZSB0aGUgSTJTIHNpZ25hbHMgDQpvdXQgZnJvbSB0aGUgc291cmNpbmcgY2hpcCBjYW4gYmUgdXNl
ZC4gSWYgdGhlIGludGVybmFsIFBMTCBpcyB1c2VkLCANCnRoZW4gYW4gZXh0ZXJuYWwgTUNMSyBp
bnB1dCBpcyBub3QgcmVxdWlyZWQuIg0KDQpTbywgZXZlbiBpZiAjc291bmQtZGFpLWNlbGxzIGlz
IHRoZXJlLCB0aGlzIGlzIG5vdCBtYW5kYXRvcnkgdG8gaGF2ZSBNQ0xLLg0KDQpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NClBoaWxpcHBlIDotKQ0K
DQoNCk9uIDcvMi8xOSA1OjQ3IFBNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToNCj4gQXMgc3RhdGVk
IGluIFNpTDkwMjIvMjQgZGF0YXNoZWV0LCBtYXN0ZXIgY2xvY2sgaXMgbm90IHJlcXVpcmVkIGZv
ciBJMlMuDQo+IE1ha2UgbWNsayBwcm9wZXJ0eSBvcHRpb25hbCBpbiBEVCBiaW5kaW5ncy4NCj4g
DQo+IEZpeGVzOiAzZjE4MDIxZjQzYTMgKCJkdC1iaW5kaW5nczogZGlzcGxheTogc2lpOTAyeDog
QWRkIEhETUkgYXVkaW8gYmluZGluZ3MiKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBN
b3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4NCj4gLS0tDQo+ICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgNSArKy0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3NpaTkwMngudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3NpaTkwMngudHh0DQo+IGluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUwODdj
MGQwIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2Uvc2lpOTAyeC50eHQNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0DQo+IEBAIC0yNiw5ICsyNiw4IEBA
IE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ICAgCS0gY2xvY2tzOiBwaGFuZGxlIGFuZCBjbG9jayBz
cGVjaWZpZXIgZm9yIGVhY2ggY2xvY2sgbGlzdGVkIGluDQo+ICAgICAgICAgICAgICB0aGUgY2xv
Y2stbmFtZXMgcHJvcGVydHkNCj4gICAJLSBjbG9jay1uYW1lczogIm1jbGsiDQo+IC0JICAgRGVz
Y3JpYmVzIFNJSTkwMnggTUNMSyBpbnB1dC4gTUNMSyBpcyB1c2VkIHRvIHByb2R1Y2UNCj4gLQkg
ICBIRE1JIGF1ZGlvIENUUyB2YWx1ZXMuIFRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQgaWYNCj4g
LQkgICAiI3NvdW5kLWRhaS1jZWxscyItcHJvcGVydHkgaXMgcHJlc2VudC4gVGhpcyBwcm9wZXJ0
eSBmb2xsb3dzDQo+ICsJICAgRGVzY3JpYmVzIFNJSTkwMnggTUNMSyBpbnB1dC4gTUNMSyBjYW4g
YmUgdXNlZCB0byBwcm9kdWNlDQo+ICsJICAgSERNSSBhdWRpbyBDVFMgdmFsdWVzLiBUaGlzIHBy
b3BlcnR5IGZvbGxvd3MNCj4gICAJICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dA0KPiAgIAkgICBjb25zdW1lciBiaW5kaW5nLg0KPiAg
IA0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: display: panel: Add support for Orise
 Tech otm8009a dsi panel
Date: Thu, 6 Jul 2017 14:21:26 +0000
Message-ID: <c7caa8fc-076b-c2ad-5210-19458f89dab7@st.com>
References: <1499185805-23354-1-git-send-email-philippe.cornu@st.com>
 <1499185805-23354-3-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1499185805-23354-3-git-send-email-philippe.cornu@st.com>
Content-Language: en-US
Content-ID: <ACA8DAA4D9CF6E4299C7BA8BC526AA17@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick FERTRE <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Fabien DESSENNE <fabien.dessenne@st.com>, Mickael REULIER <mickael.reulier@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Ludovic BARRE <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA3LzA0LzIwMTcgMDY6MzAgUE0sIFBoaWxpcHBlIENPUk5VIHdyb3RlOg0KPiBUaGUg
T3Jpc2UgVGVjaCBPVE04MDA5QSBpcyBhIDMuOTciIDQ4MHg4MDAgVEZUIExDRCBwYW5lbCBjb25u
ZWN0ZWQgdXNpbmcNCj4gYSBNSVBJLURTSSB2aWRlbyBpbnRlcmZhY2UuIEl0cyBiYWNrbGlnaHQg
aXMgbWFuYWdlZCB0aHJvdWdoIHRoZSBEU0kgbGluay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIENPUk5VIDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgICAgfCAyMCArKysrKysr
KysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3Rt
ODAwOWEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwLi4wYmI4MjM3DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4
dA0KPiBAQCAtMCwwICsxLDIwIEBADQo+ICtPcmlzZSBUZWNoIE9UTTgwMDlBIDMuOTciIDQ4MHg4
MDAgVEZUIExDRCBwYW5lbCAoTUlQSS1EU0kgdmlkZW8gbW9kZSkNCj4gKw0KPiArVGhlIE9yaXNl
IFRlY2ggT1RNODAwOUEgaXMgYSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwgY29ubmVjdGVk
IHVzaW5nDQo+ICthIE1JUEktRFNJIHZpZGVvIGludGVyZmFjZS4gSXRzIGJhY2tsaWdodCBpcyBt
YW5hZ2VkIHRocm91Z2ggdGhlIERTSSBsaW5rLg0KPiArDQo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVz
Og0KPiArICAtIGNvbXBhdGlibGU6ICJvcmlzZXRlY2gsb3RtODAwOWEiDQo+ICsgIC0gcmVnOiB0
aGUgdmlydHVhbCBjaGFubmVsIG51bWJlciBvZiBhIERTSSBwZXJpcGhlcmFsDQo+ICsgIC0gcmVz
ZXQtZ3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0aGUgcmVzZXQgcGluIChhY3RpdmUgbG93KS4gKE9w
dGlvbmFsKQ0KPiArDQo+ICtFeGFtcGxlOg0KPiArJmRzaSB7DQo+ICsJLi4uDQo+ICsNCj4gKwlw
YW5lbEAwIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJvcmlzZXRlY2gsb3RtODAwOWEiOw0KPiArCQly
ZWcgPSA8MD47DQo+ICsJCXJlc2V0LWdwaW9zID0gPCZncGlvaCA3IDA+Ow0KDQpIaSBBbGwsDQpJ
IHNob3VsZCBoYXZlIHdyaXR0ZW4gaW5zdGVhZDoNCiAgKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9o
IDcgR1BJT19BQ1RJVkVfTE9XPjsNCg0KcmVzZXQtZ3Bpb3MgaXMgYWN0aXZlIGxvdyBhbmQgdGhl
IGRlZmluZSBHUElPX0FDVElWRV9MT1cgPSAxIHNvIHRoZSANCmV4YW1wbGUgd2FzIG5vdCBnb29k
Lg0KDQpJIHdpbGwgc2VuZCBzb29uIHRoZSB2MiB3aXRoIHRoZSBjb3JyZWN0aW9uLg0KTWFueSB0
aGFua3MNClBoaWxpcHBlDQoNCg0KPiArCX07DQo+ICt9Ow0KPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

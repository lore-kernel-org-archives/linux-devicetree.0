From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v3 0/3] Add support for the otm8009a dsi panel
Date: Thu, 27 Jul 2017 09:16:55 +0000
Message-ID: <aa101cd2-2530-342f-691a-867d121e8c4a@st.com>
References: <1500297593-30633-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1500297593-30633-1-git-send-email-philippe.cornu@st.com>
Content-Language: en-US
Content-ID: <D8B8ADE8940F71469D8BF30B2C8882C4@st.com>
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
 Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick FERTRE <yannick.fertre@st.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Fabien DESSENNE <fabien.dessenne@st.com>, Mickael REULIER <mickael.reulier@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Ludovic BARRE <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

SGkgVGhpZXJyeSwNCg0KVGhlIDIgZHQtYmluZGluZ3MgcGF0Y2hlcyBoYXZlIGJlZW4gImFja2Vk
IiBieSBSb2IuDQpUaGUgZHJpdmVyIGl0c2VsZiBoYXMgYmVlbiAicmV2aWV3ZWQiIHR3byB0aW1l
cyBieSBBbmRyemVqLg0KDQpEbyBub3QgaGVzaXRhdGUgdG8gc2VuZCBtZSBhbnkgY29tbWVudHMg
c28gSSBjYW4gdGFrZSB0aGVtIGludG8gYWNjb3VudCANCmJlZm9yZSBteSBob2xpZGF5cyAoZW5k
IG9mIG5leHQgd2VlaykuLi4NCg0KTWFueSB0aGFua3MgZm9yIHlvdXIgc3VwcG9ydCwNCg0KUGhp
bGlwcGUgOi0pDQoNCg0KT24gMDcvMTcvMjAxNyAwMzoxOSBQTSwgUGhpbGlwcGUgQ09STlUgd3Jv
dGU6DQo+IFZlcnNpb24gMzoNCj4gLSBwYW5lbC1vcmlzZXRlY2gtb3RtODAwOWEuYzogUmVtb3Zl
IGEgRklYTUUgKEFuZHJ6ZWogSGFqZGEpDQo+IC0gcGFuZWwvTWFrZWZpbGUgJiBLY29uZmlnOiBB
bHBoYWJldGljYWwgb3JkZXIgKEFuZHJ6ZWogSGFqZGEpDQo+IA0KPiBWZXJzaW9uIDI6DQo+IC0g
cGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlhLmM6IEFkZCBNYW51ZmFjdHVyZXIgQ29tbWFuZCBTZXQg
ZGVmaW5lcywNCj4gICAgYWRkIG5ldyBtYWNybyBmb3IgaGFuZGxpbmcgYWRkcmVzcyBzaGlmdGlu
ZywgaW1wcm92ZSByZXNldA0KPiAgICBzZXF1ZW5jZSwgdXNlIG1vcmUgbWlwaSBkY3MgaGVscGVy
cyAoQW5kcnplaiBIYWpkYSkNCj4gLSBkdC1iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVj
aCxvdG04MDA5YS50eHQ6IEZpeCByZXNldCBncGlvDQo+ICAgIGFjdGl2ZSBsZXZlbCBpbiB0aGUg
ZXhhbXBsZSAoQW5kcnplaiBIYWpkYSksIEFkZCBhbiAiT3B0aW9uYWwNCj4gICAgUHJvcGVydGll
cyIgc2VjdGlvbiAoUm9iIEhlcnJpbmcpLg0KPiANCj4gVmVyc2lvbiAxOg0KPiAtIEluaXRpYWwg
Y29tbWl0DQo+IA0KPiBUaGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoIGlzIHRvIGFkZCBzdXBwb3J0
IGZvciB0aGUgT3Jpc2UgVGVjaA0KPiBvdG04MDA5YSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFu
ZWwgKE1JUEktRFNJIHZpZGVvIG1vZGUpLg0KPiBUaGlzIExDRCBwYW5lbCBpcyB1c2VkIGluIHNl
dmVyYWwgU1RNMzIgYm9hcmRzLg0KPiANCj4gUGhpbGlwcGUgQ09STlUgKDMpOg0KPiAgICBkdC1i
aW5kaW5nczogQWRkIHZlbmRvciBwcmVmaXggZm9yIE9yaXNlIFRlY2hub2xvZ3kNCj4gICAgZHQt
YmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBBZGQgc3VwcG9ydCBmb3IgT3Jpc2UgVGVjaCBvdG04
MDA5YSBkc2kNCj4gICAgICBwYW5lbA0KPiAgICBkcm0vcGFuZWw6IEFkZCBzdXBwb3J0IGZvciBv
dG04MDA5YSBwYW5lbCBkcml2ZXINCj4gDQo+ICAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
b3Jpc2V0ZWNoLG90bTgwMDlhLnR4dCAgfCAgMjEgKw0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgICAgICAgIHwgICAxICsNCj4gICBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1vcmlzZXRlY2gtb3RtODAwOWEuYyAgIHwgNDkx
ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgNTIzIGluc2VydGlv
bnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dA0KPiAgIGNyZWF0ZSBt
b2RlIDEwMDc1NSBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlh
LmMNCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

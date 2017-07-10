From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: display: panel: Add support for Orise
 Tech otm8009a dsi panel
Date: Mon, 10 Jul 2017 09:34:24 +0000
Message-ID: <4f628366-d365-c55f-c26a-282f0678d147@st.com>
References: <1499185805-23354-1-git-send-email-philippe.cornu@st.com>
 <1499185805-23354-3-git-send-email-philippe.cornu@st.com>
 <20170710011211.b6inrhlqmkph3otl@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170710011211.b6inrhlqmkph3otl@rob-hp-laptop>
Content-Language: en-US
Content-ID: <B0A9F91AAB41634698ACAE878DE619CC@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, Yannick FERTRE <yannick.fertre@st.com>, Thierry Reding <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mickael REULIER <mickael.reulier@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Ludovic BARRE <ludovic.barre@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQoNCk9uIDA3LzEwLzIwMTcgMDM6MTIgQU0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBUdWUs
IEp1bCAwNCwgMjAxNyBhdCAwNjozMDowNFBNICswMjAwLCBQaGlsaXBwZSBDT1JOVSB3cm90ZToN
Cj4+IFRoZSBPcmlzZSBUZWNoIE9UTTgwMDlBIGlzIGEgMy45NyIgNDgweDgwMCBURlQgTENEIHBh
bmVsIGNvbm5lY3RlZCB1c2luZw0KPj4gYSBNSVBJLURTSSB2aWRlbyBpbnRlcmZhY2UuIEl0cyBi
YWNrbGlnaHQgaXMgbWFuYWdlZCB0aHJvdWdoIHRoZSBEU0kgbGluay4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KPj4gLS0tDQo+
PiAgIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgICAg
fCAyMCArKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dA0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9vcmlzZXRlY2gsb3RtODAwOWEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnR4dA0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAuLjBiYjgyMzcNCj4+IC0tLSAvZGV2L251bGwNCj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29y
aXNldGVjaCxvdG04MDA5YS50eHQNCj4+IEBAIC0wLDAgKzEsMjAgQEANCj4+ICtPcmlzZSBUZWNo
IE9UTTgwMDlBIDMuOTciIDQ4MHg4MDAgVEZUIExDRCBwYW5lbCAoTUlQSS1EU0kgdmlkZW8gbW9k
ZSkNCj4+ICsNCj4+ICtUaGUgT3Jpc2UgVGVjaCBPVE04MDA5QSBpcyBhIDMuOTciIDQ4MHg4MDAg
VEZUIExDRCBwYW5lbCBjb25uZWN0ZWQgdXNpbmcNCj4+ICthIE1JUEktRFNJIHZpZGVvIGludGVy
ZmFjZS4gSXRzIGJhY2tsaWdodCBpcyBtYW5hZ2VkIHRocm91Z2ggdGhlIERTSSBsaW5rLg0KPj4g
Kw0KPj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+PiArICAtIGNvbXBhdGlibGU6ICJvcmlzZXRl
Y2gsb3RtODAwOWEiDQo+PiArICAtIHJlZzogdGhlIHZpcnR1YWwgY2hhbm5lbCBudW1iZXIgb2Yg
YSBEU0kgcGVyaXBoZXJhbA0KPj4gKyAgLSByZXNldC1ncGlvczogYSBHUElPIHNwZWMgZm9yIHRo
ZSByZXNldCBwaW4gKGFjdGl2ZSBsb3cpLiAoT3B0aW9uYWwpDQo+IA0KPiBJZiB0aGlzIGlzIG9w
dGlvbmFsLCBtb3ZlIGl0IHRvIGl0cyBvd24gc2VjdGlvbi4NCj4gDQoNCkRlYXIgUm9iLA0KTWFu
eSB0aGFua3MgZm9yIHlvdXIgY29tbWVudC4gRml4ZWQgaW4gdjIsIHNlbnQgZmV3IG1pbnV0ZXMg
YWdvLg0KQmVzdCByZWdhcmRzLA0KUGhpbGlwcGUNCg0KPj4gKw0KPj4gK0V4YW1wbGU6DQo+PiAr
JmRzaSB7DQo+PiArCS4uLg0KPj4gKw0KPj4gKwlwYW5lbEAwIHsNCj4+ICsJCWNvbXBhdGlibGUg
PSAib3Jpc2V0ZWNoLG90bTgwMDlhIjsNCj4+ICsJCXJlZyA9IDwwPjsNCj4+ICsJCXJlc2V0LWdw
aW9zID0gPCZncGlvaCA3IDA+Ow0KPj4gKwl9Ow0KPj4gK307DQo+PiAtLSANCj4+IDEuOS4xDQo+
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

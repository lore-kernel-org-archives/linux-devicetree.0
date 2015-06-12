From: Yuantian Tang <Yuantian.Tang@freescale.com>
Subject: RE: [PATCH v2] powerpc/rcpm: add RCPM driver
Date: Fri, 12 Jun 2015 09:10:06 +0000
Message-ID: <DM2PR03MB574877824ABB97221787F6DFABB0@DM2PR03MB574.namprd03.prod.outlook.com>
References: <1434004357-2294-1-git-send-email-Yuantian.Tang@freescale.com>
 <1434099462.2271.149.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1434099462.2271.149.camel@x220>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Scott Wood <scottwood@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhao C.H." <chenhui.zhao@freescale.com>
List-Id: devicetree@vger.kernel.org

VGhhdCBtYWtlcyBzZW5zZS4gVGhhbmtzIGZvciBwb2ludGluZyBvdXQuDQoNClRoYW5rcywNCll1
YW50aWFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBCb2xs
ZSBbbWFpbHRvOnBlYm9sbGVAdGlzY2FsaS5ubF0NCj4gU2VudDogRnJpZGF5LCBKdW5lIDEyLCAy
MDE1IDQ6NTggUE0NCj4gVG86IFRhbmcgWXVhbnRpYW4tQjI5OTgzDQo+IENjOiBXb29kIFNjb3R0
LUIwNzQyMTsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgWmhhbyBDaGVuaHVp
LUIzNTMzNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBwb3dlcnBjL3JjcG06IGFkZCBSQ1BN
IGRyaXZlcg0KPiANCj4gSnVzdCBhIG5pdC4NCj4gDQo+IE9uIFRodSwgMjAxNS0wNi0xMSBhdCAx
NDozMiArMDgwMCwgWXVhbnRpYW4uVGFuZ0BmcmVlc2NhbGUuY29tIHdyb3RlOg0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvc3lzZGV2L2ZzbF9yY3BtLmMNCj4gDQo+
ID4gK2ludCBmc2xfcmNwbV9pbml0KHZvaWQpDQo+IA0KPiBUaGlzIGlzIHVzZWQgb25seSB0aHJv
dWdoIGVhcmx5X2luaXRjYWxsKCkuIEkgdG9vayB0aGUgY2FyZ28gY3VsdA0KPiBhcHByb2FjaCBv
ZiBsb29raW5nIGF0IHRoZSBvdGhlciB1c2VzIG9mIGVhcmx5X2luaXRjYWxsKCkgaW4NCj4gYXJj
aC9wb3dlcnBjLy4gVGhhdCBhcHByb2FjaCB0ZWxscyBtZSB0aGlzIGZ1bmN0aW9uIGNvdWxkIGJl
IHN0YXRpYyBhbmQNCj4gbWFya2VkIGFzIF9faW5pdC4gV291bGQgdGhhdCB3b3JrIGhlcmUgdG9v
Pw0KPiANCj4gPiArew0KPiA+ICsJWy4uLl0NCj4gPiArfQ0KPiA+ICsNCj4gPiArLyogbmVlZCB0
byBjYWxsIHRoaXMgYmVmb3JlIFNNUCBpbml0ICovDQo+ID4gK2Vhcmx5X2luaXRjYWxsKGZzbF9y
Y3BtX2luaXQpOw0KPiANCj4gVGhhbmtzLA0KPiANCj4gUGF1bCBCb2xsZQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGlu
ZyBsaXN0CkxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJz
Lm9yZy9saXN0aW5mby9saW51eHBwYy1kZXY=

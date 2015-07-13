From: Wang J.W. <Jianwei.Wang@freescale.com>
Subject: RE: [PATCH v7 1/4] drm/layerscape: Add Freescale DCU DRM driver
Date: Mon, 13 Jul 2015 03:58:15 +0000
Message-ID: <DM2PR0301MB1229EC83D407F46E171339F09F9C0@DM2PR0301MB1229.namprd03.prod.outlook.com>
References: <1436527063-44762-1-git-send-email-jianwei.wang@freescale.com>
 <1436620543.2679.13.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1436620543.2679.13.camel@tiscali.nl>
Content-Language: en-US
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Huan Wang <alison.wang@freescale.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Scott Wood <scottwood@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgUGF1bCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIEJvbGxlIFttYWlsdG86cGVib2xsZUB0aXNjYWxp
Lm5sXQ0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAxMSwgMjAxNSA5OjE2IFBNDQo+IFRvOiBXYW5n
IEppYW53ZWktQjUyMjYxDQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gYWlybGllZEBsaW51
eC5pZTsgZGFuaWVsLnZldHRlckBmZndsbC5jaDsgbWFyay55YW9Acm9jay1jaGlwcy5jb207IFdv
b2QNCj4gU2NvdHQtQjA3NDIxOyB0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb207IFdhbmcgSHVhbi1C
MTg5NjU7IFhpdWJvIExpDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMS80XSBkcm0vbGF5ZXJz
Y2FwZTogQWRkIEZyZWVzY2FsZSBEQ1UgRFJNIGRyaXZlcg0KPiANCj4gQSBxdWVzdGlvbiBhbmQg
YSBuaXQgZm9sbG93Lg0KPiANCj4gT24gdnIsIDIwMTUtMDctMTAgYXQgMTk6MTcgKzA4MDAsIEpp
YW53ZWkgV2FuZyB3cm90ZToNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fZHJ2LmMNCj4gDQo+ID4gK01PRFVMRV9BTElBUygi
cGxhdGZvcm06ZnNsLWRjdS1kcm0iKTsNCj4gDQo+IFF1ZXN0aW9uOiB0aGlzIGFwcGVhcnMgdG8g
YmUgb25seSB1c2VmdWwgaWYgdGhlcmUncyBhIGNvcnJlc3BvbmRpbmcgc3RydWN0DQo+IHBsYXRm
b3JtX2RldmljZS4gVGhhdCBpcywgYSBwbGF0Zm9ybV9kZXZpY2Ugd2l0aCBhICJmc2wtZGN1LWRy
bSINCj4gLm5hbWUuIEl0IHdpbGwgZmlyZSBvZmYgYSAiTU9EQUxJQVM9cGxhdGZvcm06ZnNsLWRj
dS1kcm0iIHVldmVudCB3aGVuIGl0J3MNCj4gY3JlYXRlZC4NCj4gDQo+IEkgY291bGRuJ3QgZmlu
ZCB0aGlzIGNvcnJlc3BvbmRpbmcgcGxhdGZvcm1fZGV2aWNlLiBEb2VzIGl0IGV4aXN0PyBPciBp
cw0KPiB0aGlzIGFsaWFzIG5lZWRlZCBmb3Igc29tZSBvdGhlciByZWFzb24/DQo+IA0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2Ry
bV9kcnYuaA0KPiANCj4gPiArI2RlZmluZSBEUklWRVJfTkFNRQkJCSJmc2wtZGN1LWRybSINCj4g
DQo+IE5pdDogSSBkb24ndCB0aGluayBEUklWRVJfTkFNRSBpcyBhY3R1YWxseSB1c2VkIGFueXdo
ZXJlLgkNCj4gDQoNClllcywgeW91IGFyZSByaWdodC4gQm90aCBhcmUgdXNlbGVzcywgSSdsbCBy
ZW1vdmUgdGhlbS4NCkkgY29waWVkIHNvdXJjZSBjb2RlIGZyb20gb3RoZXIgRFJNIGRyaXZlciBh
dCBmaXJzdCwgYW5kIGZvcmdvdCB0byByZW1vdmUgdGhlbS4NClRoYW5rcyBmb3IgeW91ciBraW5k
bHkgcmVtaW5kLg0KDQoNCkJSLg0KSmlhbndlaQ0KDQo+IFRoYW5rcywNCj4gDQo+IA0KPiBQYXVs
IEJvbGxlDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

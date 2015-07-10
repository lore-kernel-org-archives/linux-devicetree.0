From: Wang J.W. <Jianwei.Wang@freescale.com>
Subject: RE: [PATCH v6 1/4] drm/layerscape: Add Freescale DCU DRM driver
Date: Fri, 10 Jul 2015 11:26:23 +0000
Message-ID: <DM2PR0301MB1229B5662B1F4F941D0CEE229F9F0@DM2PR0301MB1229.namprd03.prod.outlook.com>
References: <1436513215-43423-1-git-send-email-jianwei.wang@freescale.com>
 <DM2PR0301MB12295112F1CC589DE0FA47899F9F0@DM2PR0301MB1229.namprd03.prod.outlook.com>
 <CACvgo525wahUAFnWdBqsh=jAs=8=XkNTWPD0x1ArcfY3wD=w1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACvgo525wahUAFnWdBqsh=jAs=8=XkNTWPD0x1ArcfY3wD=w1g@mail.gmail.com>
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Huan Wang <alison.wang@freescale.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Scott Wood <scottwood@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgRW1pbCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGd1aWRhbmNlLiBJJ2xsIHBheSBhdHRlbnRp
b24gYWJvdXQgdGhpcyBuZXh0IHRpbWUuDQoNCkJSLg0KSmlhbndlaQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGxpbnV4LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5v
cmcgW21haWx0bzpsaW51eC1rZXJuZWwtDQo+IG93bmVyQHZnZXIua2VybmVsLm9yZ10gT24gQmVo
YWxmIE9mIEVtaWwgVmVsaWtvdg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMTAsIDIwMTUgNDo0MiBQ
TQ0KPiBUbzogV2FuZyBKaWFud2VpLUI1MjI2MQ0KPiBDYzogbWFyay55YW87IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOyBYaXVibyBMaTsgV2FuZyBIdWFuLUIxODk2NTsNCj4gZGFuaWVsLnZl
dHRlckBmZndsbC5jaDsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPiBkZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdvb2QgU2NvdHQtQjA3NDIxOyBsaW51eC1hcm0tDQo+
IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS80
XSBkcm0vbGF5ZXJzY2FwZTogQWRkIEZyZWVzY2FsZSBEQ1UgRFJNIGRyaXZlcg0KPiANCj4gSGkg
SmlhbndlaSwNCj4gDQo+IE9uIDEwIEp1bHkgMjAxNSBhdCAwODo0NywgV2FuZyBKLlcuIDxKaWFu
d2VpLldhbmdAZnJlZXNjYWxlLmNvbT4gd3JvdGU6DQo+ID4gSGkgTWFyaywNCj4gPg0KPiA+IFRo
YW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmV2aWV3ISBJIGhhdmUgdXBkYXRlIG15IERSTSBk
cml2ZXIuDQo+ID4gQWxsIHlvdXIgdGhyZWUgY29tbWVudHMgaGF2ZSBiZWVuIGFwcGxpZWQgaW4g
dGhpcyBsYXRlc3QgdmVyc2lvbi4NCj4gPiBJIHJlcGxpZWQgdGhlIGxhc3QgZW1haWwgc2V2ZXJh
bCB0aW1lcywgYnV0IGFsbCByZWZ1c2VkIHRoZSBtYWlsaXN0Lg0KPiBJJ2Qgc3VzcGVjdCB0aGF0
IHRoZSBNTCBhdXRvbWF0aWNhbGx5IHJlZnVzZWQgdGhlIGVtYWlsIGR1ZSB0byBpdHMgc2l6ZS4N
Cj4gVG8gYXZvaWQgdGhhdCBpbiB0aGUgZnV0dXJlIHlvdSBjYW4gdHJpbSB0aGUgZW1haWwgdG8g
aW5jbHVkZSBvbmx5IHRoZQ0KPiByZWxldmFudCBwYXJ0cyAobm90IGFwcGxpY2FibGUgaW4gdGhp
cyBjYXNlIEkga25vdykuIEF0IHRoZSBzYW1lIHRpbWUgaXQNCj4gbWFrZXMgcmVhZGluZyBhIGJp
dCBlYXNpZXIsIGFuZCBtaXNzaW5nIGJ1cmllZCBjb21tZW50cyBoYXJkZXIgOi0pDQo+IA0KPiBI
b3BlIHRoYXQgaGVscHMsDQo+IEVtaWwNCj4gLS0NCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlz
IGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LWtlcm5lbCIgaW4NCj4gdGhl
IGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcgTW9yZSBtYWpv
cmRvbW8gaW5mbyBhdA0KPiBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0
bWwNCj4gUGxlYXNlIHJlYWQgdGhlIEZBUSBhdCAgaHR0cDovL3d3dy50dXgub3JnL2xrbWwvDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

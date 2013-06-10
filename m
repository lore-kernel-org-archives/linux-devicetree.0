From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: RE: [PATCH v3] mfd: DT bindings for the palmas family MFD
Date: Mon, 10 Jun 2013 09:27:12 +0000
Message-ID: <DC88CAD03C0052499C1907B327FC63229EAB5B@DBDE04.ent.ti.com>
References: <1370496441-24620-1-git-send-email-j-keerthy@ti.com>
 <20130606070210.GR3370@gmail.com> <20130606070610.GS3370@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130606070610.GS3370@gmail.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "swarren@nvidia.com" <swarren@nvidia.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "wim@iguana.be" <wim@iguana.be>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "Kristo, Tero" <t-kristo@ti.com>, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

SGVsbG8gR3JhbnQvTGVlIEpvbmVzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IExlZSBKb25lcyBbbWFpbHRvOmxlZS5qb25lc0BsaW5hcm8ub3JnXQ0KPiBTZW50OiBU
aHVyc2RheSwgSnVuZSAwNiwgMjAxMyAxMjozNiBQTQ0KPiBUbzogSiwgS0VFUlRIWQ0KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZ3JhbnQubGlrZWx5QHNlY3JldGxhYi5jYTsg
bGludXgtDQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5v
emxhYnMub3JnOw0KPiBzd2FycmVuQHd3d2RvdG9yZy5vcmc7IHN3YXJyZW5AbnZpZGlhLmNvbTsg
cm9iLmhlcnJpbmdAY2FseGVkYS5jb207DQo+IHJvYkBsYW5kbGV5Lm5ldDsgc2FtZW9AbGludXgu
aW50ZWwuY29tOyB3aW1AaWd1YW5hLmJlOw0KPiBsZ2lyZHdvb2RAZ21haWwuY29tOyBnZ0BzbGlt
bG9naWMuY28udWs7IEtyaXN0bywgVGVybzsgSWFuIExhcnRleQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzXSBtZmQ6IERUIGJpbmRpbmdzIGZvciB0aGUgcGFsbWFzIGZhbWlseSBNRkQNCj4gDQo+
IE9uIFRodSwgMDYgSnVuIDIwMTMsIExlZSBKb25lcyB3cm90ZToNCj4gDQo+ID4gT24gVGh1LCAw
NiBKdW4gMjAxMywgSiBLZWVydGh5IHdyb3RlOg0KPiA+DQo+ID4gPiBBZGQgdGhlIHZhcmlvdXMg
YmluZGluZyBmaWxlcyBmb3IgdGhlIHBhbG1hcyBmYW1pbHkgb2YgY2hpcHMuIFRoZXJlDQo+ID4g
PiBpcyBhIHRvcCBsZXZlbCBNRkQgYmluZGluZyB0aGVuIGEgc2VwZXJhdGUgYmluZGluZyBmb3Ig
cmVndWxhdG9ycw0KPiBJUCBibG9ja3Mgb24gY2hpcHMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogR3JhZW1lIEdyZWdvcnkgPGdnQHNsaW1sb2dpYy5jby51az4NCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEogS2VlcnRoeSA8ai1rZWVydGh5QHRpLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IElhbiBMYXJ0ZXkgPGlhbkBzbGltbG9naWMuY28udWs+DQo+ID4gPiBSZXZpZXdlZC1ieTogU3Rl
cGhlbiBXYXJyZW4gPHN3YXJyZW5AbnZpZGlhLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcGFsbWFzLnR4dCAgIHwgICA0OQ0KPiAr
KysrKysrKysrKysrDQo+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL3Bh
bG1hcy1wbWljLnR4dCAgfCAgIDcyDQo+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMjEgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBt
b2RlDQo+ID4gPiAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9w
YWxtYXMudHh0DQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL3BhbG1hcy1wbWljLnR4DQo+ID4NCj4gPiBB
cHBsaWVkLCB0aGFua3MuDQo+IA0KPiBBaCB3YWl0LiBJdCBhcHBlYXJzIEdyYW50IHdhbnRzIHRv
IHRha2UgdGhpcy4NCj4gDQo+IFVuYXBwbGllZCwgdGhhbmtzLiA6KQ0KPiANCg0KSXMgaXQgYXBw
bGllZD8NCg0KPiAtLQ0KPiBMZWUgSm9uZXMNCj4gTGluYXJvIFNULUVyaWNzc29uIExhbmRpbmcg
VGVhbSBMZWFkDQo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcyBGb2xsb3cgTGluYXJvOiBGYWNlYm9vaw0KPiB8IFR3aXR0ZXIgfCBCbG9nDQoNClRoYW5r
cywNCktlZXJ0aHkNCg==

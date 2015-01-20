From: "Opensource [Steve Twiss]" <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH V3 2/2] devicetree: Add bindings for DA9063
Date: Tue, 20 Jan 2015 16:35:27 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB7D0B52E11@SW-EX-MBX02.diasemi.com>
References: <cover.1421762065.git.stwiss.opensource@diasemi.com>
 <99c7b7fb380070e5a2f7f4e9f333e8a2b12b591a.1421762065.git.stwiss.opensource@diasemi.com>
 <20150120155400.GI13701@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150120155400.GI13701@x1>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Dajun Chen <david.chen-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gMjAgSmFudWFyeSAyMDE1IDE1OjU0IExlZSBKb25lcyB3cm90ZToNCg0KWy4uLl0NCg0KPiA+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2RhOTA2My50eHQgfCA5Mw0K
PiArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkzIGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZmQvZGE5MDYzLnR4dA0KPiANCj4gSSBhbHJlYWR5IEFja2VkIHRoaXM/ICBB
bnkgcmVhc29uIHRoYXQgd2Fzbid0IGNhcnJpZWQgZm9yd2FyZCB0byB0aGlzDQo+IHN1Ym1pc3Np
b24/ICBIYXMgYW55dGhpbmcgY2hhbmdlZD8NCj4gDQoNClllcywgSSBoYWQgdG8gYWx0ZXIgdGhp
cyBiaW5kaW5ncyBkb2N1bWVudCBiZWNhdXNlIG9mIHRoZSBjb21wYXRpYmxlIGNoYW5nZSAuLi4N
ClNlZSBiZWxvdzoNCg0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MC4uNDJjNmZhNg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWZkL2RhOTA2My50eHQNCj4gPiBAQCAtMCwwICsxLDkzIEBADQo+
ID4gKyogRGlhbG9nIERBOTA2MyBQb3dlciBNYW5hZ2VtZW50IEludGVncmF0ZWQgQ2lyY3VpdCAo
UE1JQykNCj4gPiArDQo+ID4gK0RBOTA5MyBjb25zaXN0cyBvZiBhIGxhcmdlIGFuZCB2YXJpZWQg
Z3JvdXAgb2Ygc3ViLWRldmljZXMgKEkyQyBPbmx5KToNCj4gPiArDQo+ID4gK0RldmljZSAgICAg
ICAgICAgICAgICAgICBTdXBwbHkgTmFtZXMgICAgRGVzY3JpcHRpb24NCj4gPiArLS0tLS0tICAg
ICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLSAgICAtLS0tLS0tLS0tLQ0KPiA+ICtkYTkwNjMt
cmVndWxhdG9yICAgICAgICA6ICAgICAgICAgICAgICAgOiBMRE9zICYgQlVDS3MNCj4gPiArZGE5
MDYzLXJ0YyAgICAgICAgICAgICAgOiAgICAgICAgICAgICAgIDogUmVhbC1UaW1lIENsb2NrDQo+
ID4gK2RhOTA2My13YXRjaGRvZyAgICAgICAgIDogICAgICAgICAgICAgICA6IFdhdGNoZG9nDQo+
ID4gKw0KPiA+ICs9PT09PT0NCj4gPiArDQo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4g
Kw0KPiA+ICstIGNvbXBhdGlibGUgOiBTaG91bGQgYmUgImRsZyxkYTkwNjMiDQoNClRoZSBsaW5l
IGFib3ZlIHVzZWQgdG8gc2F5ICJkbGcsZGE5MDYzLWFkIiwgImRsZyxkYTkwNjMtYmIiLCBldGMu
DQpOb3cgaXQganVzdCBzYXlzICJkbGcsZGE5MDYzIg0KDQpbLi4uXQ0KDQo+ID4gKw0KPiA+ICtF
eGFtcGxlOg0KPiA+ICsNCj4gPiArCXBtaWMwOiBkYTkwNjNANTggew0KPiA+ICsJCWNvbXBhdGli
bGUgPSAiZGxnLGRhOTA2MyINCg0KQW5kIEkgYWxzbyBjaGFuZ2UgYSAgbGluZSBpbiB0aGUgZXhh
bXBsZSBmb3IgdGhlIHNhbWUgcmVhc29uLg0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24uDQoNClJl
Z2FyZHMsDQpTdGV2ZQ0KDQo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

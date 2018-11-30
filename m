Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:22432
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726473AbeK3Uav (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 30 Nov 2018 15:30:51 -0500
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 7/7] ARM: dts: r8a7744: Add SMP support
Date: Fri, 30 Nov 2018 09:22:04 +0000
Message-ID: <OSBPR01MB2103A3E57CCFD945E5711FE9B8D30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com>
 <1542878075-61314-8-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUgfrGyA1Y6vpRT-2KwfM6Gpzy945Oac-2_06HRed3Hjw@mail.gmail.com>
In-Reply-To: <CAMuHMdUgfrGyA1Y6vpRT-2KwfM6Gpzy945Oac-2_06HRed3Hjw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IGxpbnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2VybmVs
Lm9yZyA8bGludXgtcmVuZXNhcy1zb2MtDQo+IG93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVo
YWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiAzMCBOb3ZlbWJlciAyMDE4IDA4OjU0
DQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IENjOiBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBSdXRsYW5kDQo+IDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT47IFNpbW9uIEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0LmF1PjsgTWFnbnVzDQo+IERh
bW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IExpbnV4LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMt
DQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQgRkxB
VFRFTkVEIERFVklDRQ0KPiBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zz47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBDaHJp
cyBQYXRlcnNvbg0KPiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgRmFicml6aW8gQ2Fz
dHJvDQo+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNy83XSBBUk06IGR0czogcjhhNzc0NDogQWRkIFNNUCBzdXBwb3J0DQo+DQo+IE9uIFRo
dSwgTm92IDIyLCAyMDE4IGF0IDEwOjIzIEFNIEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIERUIG5vZGUgZm9yIHRoZSBBZHZhbmNlZCBQb3dlciBN
YW5hZ2VtZW50IFVuaXQgKEFQTVUpLCBhZGQgdGhlDQo+ID4gc2Vjb25kIENQVSBjb3JlLCBhbmQg
dXNlICJyZW5lc2FzLGFwbXUiIGFzICJlbmFibGUtbWV0aG9kIi4NCj4gPg0KPiA+IEFsc28gYWRk
IGNwdTEgcGhhbmRsZSBub2RlIHRvIHRoZSBQTVUgaW50ZXJydXB0LWFmZmluaXR5IHByb3BlcnR5
Lg0KPg0KPiBQbGVhc2UgY2hhbmdlIEdJQ19DUFVfTUFTS19TSU1QTEUoKSBmcm9tIDEgdG8gMiBp
biB0aGlzIHBhdGNoLCB0b28uDQoNCk9LLCBXaWxsIHNlbmQgVjIgZm9yIHRoaXMuDQoNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+DQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
Pg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQNCj4NCg0KUmVnYXJkcywNCkJpanUNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3Bl
IEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hh
bXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIg
UmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=

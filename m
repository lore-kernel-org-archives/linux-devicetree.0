From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output
Date: Mon, 23 Oct 2017 17:50:56 +0000
Message-ID: <TY1PR06MB08956CA52B99199B85DBE5E2C0460@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
 <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com>
 <2315907.0FoaqPrOEJ@avalon>
 <CAMuHMdXjAHOyLb+FKbztNTKciZMeR=VCuBXuTWdkzNEB1A5veA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXjAHOyLb+FKbztNTKciZMeR=VCuBXuTWdkzNEB1A5veA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNCj4gPg0KPiA+IEkgYXNzdW1lIHRoaXMgZGVzY3JpYmVzIGEgZml4ZWQg
Y2xvY2sgZ2VuZXJhdG9yIHRoYXQgaXMgbm90IEkyQy1jb250cm9sbGVkLg0KPiA+IFRoZSBub2Rl
IHNob3VsZCB0aHVzIG5vdCBiZSBhIGNoaWxkIG9mIHRoZSBpMmM1IGJ1cyBub2RlLCBidXQgc2hv
dWxkIGJlIG1vdmVkDQo+ID4gdG8gdGhlIHJvb3Qgbm9kZSBvZiB0aGUgRFQuDQo+DQo+IE9vcHMs
IHRoYXQncyBzb21ldGhpbmcgd2Ugc2hvdWxkIGZpeCBpbiByOGE3NzkxLWtvZWxzY2guZHRzLCB0
b28NCj4gKENDIEhhbnMpDQoNCnllYWgsIHRoYXQncyBwcmVjaXNlbHkgd2hlcmUgd2UgY29waWVk
IHRoZSBsYXlvdXQgZnJvbSA6KQ0KDQpUaGFua3MsDQpGYWINCg0KPg0KPiA+IFRoZSByZXN0IGxv
b2tzIGdvb2QgdG8gbWUuIFdpdGggdGhpcyBmaXhlZCwNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4N
Cj4gPiBIb3dldmVyIEkgY2FuJ3QgZmluZCBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctZGJj
bS1jYS5kdHNpIGluIGxpbnV4LW5leHQuDQo+ID4gV2hpY2ggdHJlZSB3b3VsZCB5b3UgbGlrZSB0
byBnZXQgdGhpcyBzZXJpZXMgbWVyZ2VkIHRocm91Z2ggPw0KPg0KPiBJdCdzIGJlZW4gaW4gbmV4
dCBhcyBvZiBuZXh0LTIwMTcxMDEyLg0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVy
b3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2lu
Z2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5k
ZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

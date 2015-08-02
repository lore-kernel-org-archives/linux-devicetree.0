From: Liberman Igal <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v4] powerpc/mpc85xx: Add MDIO bus muxing support to the
 board device tree(s)
Date: Sun, 2 Aug 2015 11:42:25 +0000
Message-ID: <DM2PR03MB509FD00DD1CB7AB0449B5ADE6880@DM2PR03MB509.namprd03.prod.outlook.com>
References: <1438231630-11056-1-git-send-email-igal.liberman@freescale.com>
 <1438287351.2993.369.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438287351.2993.369.camel-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DQoNClJlZ2FyZHMsDQpJZ2FsIExpYmVybWFuLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFdvb2QgU2NvdHQtQjA3NDIxDQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDMw
LCAyMDE1IDExOjE2IFBNDQo+IFRvOiBMaWJlcm1hbiBJZ2FsLUIzMTk1MA0KPiBDYzogZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBCdWN1
cg0KPiBNYWRhbGluLUNyaXN0aWFuLUIzMjcxNjsgWGllIFNoYW9odWktQjIxOTg5OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjRdIHBvd2VycGMv
bXBjODV4eDogQWRkIE1ESU8gYnVzIG11eGluZyBzdXBwb3J0DQo+IHRvIHRoZSBib2FyZCBkZXZp
Y2UgdHJlZShzKQ0KPiANCj4gT24gVGh1LCAyMDE1LTA3LTMwIGF0IDA3OjQ3ICswMzAwLCBJZ2Fs
LkxpYmVybWFuIHdyb3RlOg0KPiA+IEZyb206IElnYWwgTGliZXJtYW4gPElnYWwuTGliZXJtYW5A
ZnJlZXNjYWxlLmNvbT4NCj4gPg0KPiA+IERlc2NyaWJlIHRoZSBQSFkgdG9wb2xvZ3kgZm9yIGFs
bCBjb25maWd1cmF0aW9ucyBzdXBwb3J0ZWQgYnkgZWFjaA0KPiA+IGJvYXJkDQo+ID4NCj4gPiBC
YXNlZCBvbiBwcmlvciB3b3JrIGJ5IEFuZHkgRmxlbWluZyA8YWZsZW1pbmdAZnJlZXNjYWxlLmNv
bT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IElnYWwgTGliZXJtYW4gPElnYWwuTGliZXJtYW5A
ZnJlZXNjYWxlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHJ1dGkgS2FuZXRrYXIgPFNocnV0
aUBmcmVlc2NhbGUuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEVtaWwgTWVkdmUgPEVtaWxpYW4u
TWVkdmVARnJlZXNjYWxlLmNvbT4NCj4gDQo+IFNpZ25vZmZzIHNob3VsZCBiZSBpbiBjaHJvbm9s
b2dpY2FsIG9yZGVyLiAgWW91IHdlcmUgdGhlIGxhc3QgdG8gdG91Y2gvc3VibWl0DQo+IHRoaXMs
IHNvIHlvdXJzIHNob3VsZCBnbyBsYXN0LiAgTGlrZXdpc2UgaW4gdGhlIG90aGVyIHBhdGNoZXMg
eW91IGp1c3QgcG9zdGVkLg0KPiANCg0KT2ssIEknbGwga2VlcCB0aGUgY29ycmVjdCBvcmRlciwg
dGhhbmtzIGZvciBwb2ludGluZyBvdXQuIA0KDQo+IC1TY290dA0KDQo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

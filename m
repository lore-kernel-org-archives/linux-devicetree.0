From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v2 2/2] phy: rcar-gen3-usb2: add fallback binding
Date: Thu, 3 Mar 2016 09:23:22 +0000
Message-ID: <SG2PR06MB0919A78EC9E41C0188A4B119D8BD0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1456965518-13615-1-git-send-email-horms+renesas@verge.net.au>
	<1456965518-13615-3-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW24p_nx19232LADRMHY8-976YX-S41zEGQhmoe+3_AxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdW24p_nx19232LADRMHY8-976YX-S41zEGQhmoe+3_AxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgU2ltb24tc2FuLA0KDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAwMywgMjAxNiA1OjEzIFBN
DQo+IA0KPiBPbiBUaHUsIE1hciAzLCAyMDE2IGF0IDE6MzggQU0sIFNpbW9uIEhvcm1hbiA8aG9y
bXMrcmVuZXNhc0B2ZXJnZS5uZXQuYXU+IHdyb3RlOg0KPiA+IEluIHRoZSBjYXNlIG9mIFJlbmVz
YXMgUi1DYXIgaGFyZHdhcmUgd2Uga25vdyB0aGF0IHRoZXJlIGFyZSBnZW5lcmF0aW9ucyBvZg0K
PiA+IFNvQ3MsIGUuZy4gR2VuIDIgYW5kIEdlbiAzLiBCdXQgYmV5b25kIHRoYXQgaXRzIG5vdCBj
bGVhciB3aGF0IHRoZQ0KPiA+IHJlbGF0aW9uc2hpcCBiZXR3ZWVuIElQIGJsb2NrcyBtaWdodCBi
ZS4gRm9yIGV4YW1wbGUsIEkgYmVsaWV2ZSB0aGF0DQo+ID4gcjhhNzc5MCBpcyBvbGRlciB0aGFu
IHI4YTc3OTEgYnV0IHRoYXQgZG9lc24ndCBpbXBseSB0aGF0IHRoZSBsYXR0ZXIgaXMgYQ0KPiA+
IGRlc2NlbmRhbnQgb2YgdGhlIGZvcm1lciBvciB2aWNlIHZlcnNhLg0KPiA+DQo+ID4gV2UgY2Fu
LCBob3dldmVyLCBieSBleGFtaW5pbmcgdGhlIGRvY3VtZW50YXRpb24gYW5kIGJlaGF2aW91ciBv
ZiB0aGUNCj4gPiBoYXJkd2FyZSBhdCBydW4tdGltZSBvYnNlcnZlIHRoYXQgdGhlIGN1cnJlbnQg
ZHJpdmVyIGltcGxlbWVudGF0aW9uIGFwcGVhcnMNCj4gPiB0byBiZSBjb21wYXRpYmxlIHdpdGgg
dGhlIElQIGJsb2NrcyBvbiBTb0NzIHdpdGhpbiBhIGdpdmVuIGdlbmVyYXRpb24uDQo+ID4NCj4g
PiBGb3IgdGhlIGFib3ZlIHJlYXNvbnMgYW5kIGNvbnZlbmllbmNlIHdoZW4gZW5hYmxpbmcgbmV3
IFNvQ3MgYQ0KPiA+IHBlci1nZW5lcmF0aW9uIGZhbGxiYWNrIGNvbXBhdGliaWxpdHkgc3RyaW5n
IHNjaGVtZSBiZWluZyBhZG9wdGVkIGZvcg0KPiA+IGRyaXZlcnMgZm9yIFJlbmVzYXMgU29Dcy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXMrcmVuZXNhc0B2ZXJn
ZS5uZXQuYXU+DQo+IA0KPiBBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCg0KQWNrZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1v
ZGENCg0K
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

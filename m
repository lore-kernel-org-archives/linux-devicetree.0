From: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Fri, 28 Apr 2017 14:48:52 +0000
Message-ID: <SG2PR06MB11650F50D93653212039A4348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com>
 <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdU2CvipQQQ8-wxsiniHZJQmUMHv-t52Pw=sHD3YTd7Yug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU2CvipQQQ8-wxsiniHZJQmUMHv-t52Pw=sHD3YTd7Yug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgQXByaWwgMjgsIDIwMTcsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gPj4gU2hvdWxkbid0IHRoZSBpbnRlcnJ1cHQgKGNvbm5lY3RlZCB0byBQMV8x
NSkgYmUgZGVzY3JpYmVkPw0KPiA+DQo+ID4gVGhhdCBpbnRlcnJ1cHQgcGluIGZyb20gdGhlIFBI
WSBpcyBub3QgdXNlZC4gSXQgZGlkIG5vdCBuZWVkIHRvIGJlDQo+IGNvbm5lY3RlZC4NCj4gDQo+
IEJ1dCBpdCBpcyBjb25uZWN0ZWQsIGFjY29yZGluZyB0byB0aGUgc2NoZW1hdGljcy4NCg0KUDFf
MTUgY2FuIGJlIGNvbmZpZ3VyZWQgYXM6DQogKiBHUElPX0lODQogKiBBTjcNCiAqIEFWQl9DQVBU
VVJFDQoNClNvLi4uSSBndWVzcyB5b3Ugd291bGQgJ2Rlc2NyaWJlJyBpdCBhcyBhbiBHUElPLWlu
cHV0Lg0KDQoNCj4gRFQgZGVzY3JpYmVzIGhhcmR3YXJlLCBub3Qgc29mdHdhcmUgbGltaXRhdGlv
bnMuDQoNCkRlc2NyaWJpbmcgdGhpbmdzIGlzIGZpbmUsIGJ1dCB0aGUga2VybmVsIGNvZGUgdGFr
ZXMgdGhlIERUIGFuZCB0aGVuIHN0YXJ0IGNvbmZpZ3VyaW5nIHRoaW5ncyBiYXNlZCBvbiBpdC4N
Cg0KRm9yIGV4YW1wbGUsIG9uIHRoZSBSU0sgYm9hcmQsIHRoYXQgbGluZSBpcyBjb25uZWN0ZWQg
dG8gUDRfMTQuIFA0XzE0IGNhbiBiZSBjb25maWd1cmVkIGFzIElSUTYuLi5idXQgSVJRNiBjb21l
cyBvdXQgaW4gOCBkaWZmZXJlbnQgcGluIGNob2ljZXMsIGFuZCBJIG1pZ2h0IHdhbnQgdG8gdXNl
IG9uZSBvZiB0aG9zZSBvdGhlciBjaG9pY2VzLCBzbyBJIGRvbid0IHdhbnQgdG8gZGVzY3JpYmUg
UDRfMTQgYXMgYW4gaW50ZXJydXB0Lg0KDQpJZiBpdCB3YXMganVzdCBkZXNjcmliaW5nIHRoYXQg
InBpbiAxNSBvZiB0aGUgUEhZIGNoaXAgaXMgdGllZCB0byBwaW4gWTE5IG9mIHRoZSBSWi9BMUgi
LCB0aGF0J3MgZmluZSBiZWNhdXNlIGl0J3MgaGFyZHdhcmUgY29ubmVjdGlvbiB0aGF0J3Mgbm90
IGdvaW5nIHRvIGNoYW5nZS4NCkJ1dC4uLnRoZSBEVCBhbHNvIGRlZmluZXMgdGhlIHBpbiBtdXhp
bmcuLi53aGljaCBpcyBhIHNvZnR3YXJlIGRlY2lzaW9uIChkbyBJIHdhbnQgdG8gZ2V0IGludGVy
cnVwdCBvciBqdXN0IG1hbnVhbGx5IHBvbGwgb3Igc2ltcGxlIGlnbm9yZSBpdCkuDQpUaGlzIGlz
IHRoZSBwYXJ0IG9mIHRoZSB3aG9sZSAiRFQgaXMgZm9yIGhhcmR3YXJlIGRlc2NyaXB0aW9uIG9u
bHkiIHRoYXQgZG9lc24ndCByZWFsbHkgbWFrZSBzZW5zZSB0byBtZS4NCg0KDQpDaHJpcw0KDQo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 07/10] usb: chipidea: usbmisc_imx: add unburst setting for
 imx6
Date: Thu, 30 Jul 2015 02:36:42 +0000
Message-ID: <BN3PR0301MB08492114E18EDA153A352C9F818B0@BN3PR0301MB0849.namprd03.prod.outlook.com>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
	<1438137734-27311-8-git-send-email-peter.chen@freescale.com>
	<20150729103022.7cfe0466@ipc1.ka-ro>	<20150729075728.GC27605@shlinux2>
 <20150729121946.009e7f03@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150729121946.009e7f03-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?TG90aGFyIFdhw59tYW5u?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

IA0KPiA+IE9uIFdlZCwgSnVsIDI5LCAyMDE1IGF0IDEwOjMwOjIyQU0gKzAyMDAsIExvdGhhciBX
YcOfbWFubiB3cm90ZToNCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+ID4gV2l0aCB0aGlzIHNldHRp
bmcgYW5kIEFIQkJSU1QgYXQgU0JVU0NGRyBhcyAiSW5jcmVtZW50YWwgYnVyc3Qgb2YNCj4gPiA+
ID4gdW5zcGVjaWZpZWQgbGVuZ3RoIiwgZWFjaCB1bmJ1cnN0IHNpemUgY2FuIGJlIHRha2VuIGFz
IG9uZSBzaW5nbGUgdHJhbnNmZXIuDQo+ID4gPiA+IEl0IGlzIGJlbmVmaXQgZm9yIHVuYnVyc3Qg
c2l6ZSB0cmFuc2Zlci4NCj4gPiA+ID4NCj4gPiA+IFdoYXQgaXMgYW4gJ3VuYnVyc3QnPw0KPiA+
ID4NCj4gPg0KPiA+IEFzc3VtZSBidXJzdCBzaXplIGlzIDggZHdvcmQsIHVuYnVyc3Qgc2l6ZSAn
dCcgPCA4Lg0KPiA+DQo+ID4gV2l0aCB0aGlzIGZlYXR1cmUsICd0JyBsZW5ndGggcGF5bG9hZCBj
YW4gYmUgdGFrZW4gYXMgb25lIGJ1cnN0DQo+ID4gdHJhbnNmZXIsIG90aGVyd2lzZSwgdGhlIHNp
bmdsZSB0cmFuc2Zlcg0KPiA+ICgxIGR3b3JkKSB3aWxsIGJlIHVzZWQuDQo+ID4NCj4gSU1PIG5v
bi1idXJzdCB3b3VsZCBiZSBhIGJldHRlciB3b3JkLg0KPiANCg0KVGhhbmtzLCB3aWxsIGNoYW5n
ZS4NCg0KUGV0ZXINCg==
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

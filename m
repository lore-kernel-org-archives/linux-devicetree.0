From: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [Patch v5 00/13] add imx usb driver for mx28/6x
Date: Tue, 19 Jun 2012 01:14:58 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649803BE2DE2@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
	<CAOMZO5BXsPtwC2CTt6Z-DjZUYhrWMKDkr2QnFoAKb-aLc1XsNA@mail.gmail.com>
	<201206181913.06886.marex@denx.de>
 <CAOMZO5DF+CH+qe+VKc4vefkj05aXOtn0nVZK9vx+0kakP_em1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DF+CH+qe+VKc4vefkj05aXOtn0nVZK9vx+0kakP_em1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

IA0KPiANCj4gPiBEbyB5b3UgaGF2ZSByb290IFRUIGVuYWJsZWQ/IElmIHRoZSBwZW5kcml2ZSBp
c24ndCBkZXRlY3RlZCBhdCBhbGwsDQo+IGl0J3MNCj4gDQo+IFVTQl9FSENJX1JPT1RfSFVCX1RU
IGlzIGVuYWJsZWQuDQo+IA0KPiA+IHByb2JhYmx5IHRoZSBQSFkgbm90IGVuYWJsaW5nIChkaXNh
Ymxpbmc/KSB0aGUgZGlzY29uIGRldGVjdG9yIHVwb24NCj4gaW5pdC4gQnV0DQo+ID4gdGhlIFBI
WSBkcml2ZXIgaXMgZnJvbSBteSBjb2RlLCBzbyB0aGF0IHNob3VsZCB3b3JrLiBEbyB5b3Ugc2Vl
IGFueQ0KPiByZXNwb25zZSBhdA0KPiA+IGFsbCB1cG9uIGNvbm5lY3RpbmcgdGhlIHN0aWNrPw0K
PiANCj4gTm90aGluZyBzaG93cyB1cCBpbiB0aGUgY29uc29sZSBhZnRlciBjb25uZWN0aW5nIHRo
ZSBzdGljay4NCj4gDQo+IEF0dGFjaGVkIG15IC5jb25maWcgZmlsZS4NCj4gDQpNYWtlIHN1cmUg
dGhlIHZidXMgaXMgb24gZm9yIHlvdXIgdXNiIHBvcnQuDQoNCj4gVGhhbmtzLA0KPiANCj4gRmFi
aW8gRXN0ZXZhbQ0K

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

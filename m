From: Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 5/5] Documentation: fsl-quadspi: Add fsl, ls1012a-qspi
 compatible string
Date: Wed, 14 Dec 2016 07:52:07 +0000
Message-ID: <AM5PR0402MB2900DCF4C944648A9E50535C899A0@AM5PR0402MB2900.eurprd04.prod.outlook.com>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
 <1481188984-43683-6-git-send-email-yao.yuan@freescale.com>
 <20161212170948.fq7v5lva4kgt6hly@rob-hp-laptop>
 <DB6PR0402MB2902DADEB4E6D06418AD311F899B0@DB6PR0402MB2902.eurprd04.prod.outlook.com>
 <CAL_Jsq+jp_2m7D=Hv6TRa+1nQZhPis-0MPK5kOAWge_7RvN4Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+jp_2m7D=Hv6TRa+1nQZhPis-0MPK5kOAWge_7RvN4Qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgMTQsIDIwMTYgYXQgMDU6MjM6MDJQTSArMDgwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+IE9uIE1vbiwgRGVjIDEyLCAyMDE2IGF0IDg6NDcgUE0sIFlhbyBZdWFuIDx5YW8ueXVh
bkBueHAuY29tPiB3cm90ZToNCj4gPiBPbiBUaHUsIERlYyAxMywgMjAxNiBhdCAwNToyMzowMlBN
ICswODAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPj4gT24gVGh1LCBEZWMgMDgsIDIwMTYgYXQg
MDU6MjM6MDRQTSArMDgwMCwgWXVhbiBZYW8gd3JvdGU6DQo+ID4+ID4gRnJvbTogWXVhbiBZYW8g
PHlhby55dWFuQG54cC5jb20+DQo+ID4+DQo+ID4+IFNhbWUgcHJvYmxlbSBpbiB0aGlzIHN1Ympl
Y3QgdG9vLg0KPiA+Pg0KPiA+PiA+DQo+ID4+ID4gbmV3IGNvbXBhdGlibGUgc3RyaW5nOiAiZnNs
LGxzMTAxMmEtcXNwaSIuDQo+ID4+ID4NCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWFuIFlhbyA8
eWFvLnl1YW5AbnhwLmNvbT4NCj4gPj4gPiAtLS0NCj4gPj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9mc2wtcXVhZHNwaS50eHQgfCAxICsNCj4gPj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4+DQo+ID4+IEFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCj4g
PiBBbmQgZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gZm9yIHRoaXMgc3ViamVjdD8NCj4gDQo+
IFRoZSBwcm9ibGVtIGlzIHlvdSBoYXZlIGEgc3BhY2UgaW4gdGhlIGNvbXBhdGlibGUgc3RyaW5n
OiAiZnNsLCBsczEwMTJhLXFzcGkiDQo+IHJhdGhlciB0aGFuICJmc2wsbHMxMDEyYS1xc3BpIg0K
PiANCj4gQWxzbywgSSBwcmVmZXIgImR0L2JpbmRpbmdzOiAiIGFzIHRoZSBiZWdpbm5pbmcgb2Yg
YmluZGluZyBwYXRjaCBzdWJqZWN0cy4NCj4gDQoNCk9rLCBHZXQgaXQuDQoNClRoYW5rcyBmb3Ig
eW91ciBjb21tZW50cy4NCkkgd2lsbCBzZW5kIHYyIHNvb24uDQo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Zhiqiang Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v4 1/2] Documentation: DT: Add entry for Freescale
 LS1043a-QDS board
Date: Fri, 18 Mar 2016 02:09:02 +0000
Message-ID: <AM4PR04MB21483DC9FB7C2A092C9735DA848C0@AM4PR04MB2148.eurprd04.prod.outlook.com>
References: <1457403939-12080-1-git-send-email-Zhiqiang.Hou@nxp.com>
 <20160317151334.GA32689@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160317151334.GA32689@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Shaohui Xie <shaohui.xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIFttYWlsdG86cm9iaEBrZXJuZWwub3JnXQ0KPiBTZW50OiAyMDE2xOoz1MIxN8jVIDIzOjE0
DQo+IFRvOiBaaGlxaWFuZyBIb3UgPHpoaXFpYW5nLmhvdUBueHAuY29tPg0KPiBDYzogZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBwYXdlbC5tb2xsQGFy
bS5jb207DQo+IGlqYytkZXZpY2V0cmVlQGhlbGxpb24ub3JnLnVrOyBnYWxha0Bjb2RlYXVyb3Jh
Lm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgY2F0YWxpbi5t
YXJpbmFzQGFybS5jb207IHdpbGwuZGVhY29uQGFybS5jb207DQo+IFNjb3R0IFdvb2QgPHNjb3R0
Lndvb2RAbnhwLmNvbT47IHNoYXduZ3VvQGtlcm5lbC5vcmc7IE1pbmdrYWkgSHUNCj4gPG1pbmdr
YWkuaHVAbnhwLmNvbT47IFNoYW9odWkgWGllIDxzaGFvaHVpLnhpZUBueHAuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDEvMl0gRG9jdW1lbnRhdGlvbjogRFQ6IEFkZCBlbnRyeSBmb3Ig
RnJlZXNjYWxlIExTMTA0M2EtDQo+IFFEUyBib2FyZA0KPiANCj4gT24gVHVlLCBNYXIgMDgsIDIw
MTYgYXQgMTA6MjU6MzhBTSArMDgwMCwgWmhpcWlhbmcgSG91IHdyb3RlOg0KPiA+IEZyb206IEhv
dSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IHY0LXYy
Og0KPiA+ICAtIE5vIGNoYW5nZS4NCj4gDQo+IEkgYWxyZWFkeSBhY2tlZCB2Mi4gUGxlYXNlIGFk
ZCBhY2tzIHdoZW4geW91IHNlbmQgc3Vic2VxdWVudCB2ZXJzaW9ucy4NCj4gDQo+IEFja2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KDQpZZXMsIGFuZCB0aGFua3MuDQoNCi0g
WmhpcWlhbmcNCg==
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

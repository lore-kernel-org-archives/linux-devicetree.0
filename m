From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/12] ARM: dts: imx6qdl-apalis: Remove unneeded reg
 property
Date: Sun, 3 Dec 2017 22:48:22 +0000
Message-ID: <1512341301.21715.1.camel@toradex.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
         <1512156285-18451-8-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-8-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Content-ID: <0198B5DBAB825D438F84629C1A2CB3F6-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "fabio.estevam-3arQi8VN3Tc@public.gmane.org" <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

VGhhbmtzIEZhYmlvIGZvciBjYXRjaGluZyB0aGF0IG9uZSENCg0KT24gRnJpLCAyMDE3LTEyLTAx
IGF0IDE3OjI0IC0wMjAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0KPiBGcm9tOiBGYWJpbyBFc3Rl
dmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+DQo+IA0KPiBBcyBkZXNjcmliZWQgaW4NCj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoc2NyZWVuL3N0bXBlLnR4
dA0KPiB0aGVyZSBpcyBubyAncmVnJyBwcm9wZXJ0eSB1bmRlciBzdG1wZV90b3VjaHNjcmVlbiwg
c28gcmVtb3ZlIGl0DQo+IHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIHdhcm5pbmcgd2l0aCBX
PTE6DQo+IA0KPiBhcmNoL2FybS9ib290L2R0cy9pbXg2cS1hcGFsaXMtZXZhbC5kdGI6IFdhcm5p
bmcNCj4gKHVuaXRfYWRkcmVzc192c19yZWcpOiBOb2RlIC9zb2MvYWlwcy1idXNAMjEwMDAwMC9p
MmNAMjFhNDAwMC9zdG1wZTgxDQo+IDFANDEvc3RtcGVfdG91Y2hzY3JlZW4gaGFzIGEgcmVnIG9y
IHJhbmdlcyBwcm9wZXJ0eSwgYnV0IG5vIHVuaXQgbmFtZQ0KPiANCj4gQ2M6IE1hcmNlbCBaaXN3
aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
byBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+DQoNCkFja2VkLWJ5OiBNYXJjZWwgWmlz
d2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCg0KPiAtLS0NCj4gIGFyY2gvYXJt
L2Jvb3QvZHRzL2lteDZxZGwtYXBhbGlzLmR0c2kgfCAxIC0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFk
bC1hcGFsaXMuZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtYXBhbGlzLmR0c2kN
Cj4gaW5kZXggZTgwZmRjYS4uNGU3NzZlMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NnFkbC1hcGFsaXMuZHRzaQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRs
LWFwYWxpcy5kdHNpDQo+IEBAIC0zMzgsNyArMzM4LDYgQEANCj4gIA0KPiAgCQlzdG1wZV90b3Vj
aHNjcmVlbiB7DQo+ICAJCQljb21wYXRpYmxlID0gInN0LHN0bXBlLXRzIjsNCj4gLQkJCXJlZyA9
IDwwPjsNCj4gIAkJCS8qIDMuMjUgTUh6IEFEQyBjbG9jayBzcGVlZCAqLw0KPiAgCQkJc3QsYWRj
LWZyZXEgPSA8MT47DQo+ICAJCQkvKiA4IHNhbXBsZSBhdmVyYWdlIGNvbnRyb2wgKi8=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

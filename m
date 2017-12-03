From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 09/12] ARM: dts: imx6qdl-colibri: Remove unneeded reg
 property
Date: Sun, 3 Dec 2017 23:02:37 +0000
Message-ID: <1512342155.21715.6.camel@toradex.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
         <1512156285-18451-9-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-9-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Content-ID: <0E66C7E8F632C54DAD8614B1258D9B81-wNKe6lTLrGecE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "fabio.estevam-3arQi8VN3Tc@public.gmane.org" <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE3LTEyLTAxIGF0IDE3OjI0IC0wMjAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0K
PiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+DQo+IA0KPiBBcyBk
ZXNjcmliZWQgaW4NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3Rv
dWNoc2NyZWVuL3N0bXBlLnR4dA0KPiB0aGVyZSBpcyBubyAncmVnJyBwcm9wZXJ0eSB1bmRlciBz
dG1wZV90b3VjaHNjcmVlbiwgc28gcmVtb3ZlIGl0DQo+IHRvIGZpeCB0aGUgZm9sbG93aW5nIGJ1
aWxkIHdhcm5pbmcgd2l0aCBXPTE6DQo+IA0KPiBhcmNoL2FybS9ib290L2R0cy9pbXg2ZGwtY29s
aWJyaS1ldmFsLXYzLmR0YjogV2FybmluZw0KPiAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IE5vZGUg
L3NvYy9haXBzLWJ1c0AyMTAwMDAwL2kyY0AyMWE0MDAwL3N0bXBlODENCj4gMUA0MS9zdG1wZV90
b3VjaHNjcmVlbiBoYXMgYSByZWcgb3IgcmFuZ2VzIHByb3BlcnR5LCBidXQgbm8gdW5pdCBuYW1l
DQo+IA0KPiBDYzogU2FuY2hheWFuIE1haXR5IDxtYWl0eXNhbmNoYXlhbkBnbWFpbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZhYmlvLmVzdGV2YW1AbnhwLmNvbT4NCg0K
QWNrZWQtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0K
DQo+IC0tLQ0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kgfCAxIC0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kNCj4gYi9hcmNoL2FybS9ib290L2R0
cy9pbXg2cWRsLWNvbGlicmkuZHRzaQ0KPiBpbmRleCBmYzY2YmJmLi5lNGViMzAwIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRzaQ0KPiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRzaQ0KPiBAQCAtMjc0LDcgKzI3NCw2
IEBADQo+ICANCj4gIAkJc3RtcGVfdG91Y2hzY3JlZW4gew0KPiAgCQkJY29tcGF0aWJsZSA9ICJz
dCxzdG1wZS10cyI7DQo+IC0JCQlyZWcgPSA8MD47DQo+ICAJCQkvKiAzLjI1IE1IeiBBREMgY2xv
Y2sgc3BlZWQgKi8NCj4gIAkJCXN0LGFkYy1mcmVxID0gPDE+Ow0KPiAgCQkJLyogOCBzYW1wbGUg
YXZlcmFnZSBjb250cm9sICov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

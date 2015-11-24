From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] modpost: don't add a trailing wildcard for OF module
 aliases
Date: Tue, 24 Nov 2015 09:07:30 +0100
Message-ID: <1448352450.19513.53.camel@collabora.co.uk>
References: <1447943308-27689-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447943308-27689-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE1LTExLTE5IGF0IDExOjI4IC0wMzAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6Cj4gwqBzY3JpcHRzL21vZC9maWxlMmFsaWFzLmMgfCAzICstLQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMgYi9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKPiBp
bmRleCA1Yjk2MjA2ZTlhYWIuLjY1ZWFhYjhiNzc5OCAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL21v
ZC9maWxlMmFsaWFzLmMKPiArKysgYi9zY3JpcHRzL21vZC9maWxlMmFsaWFzLmMKPiBAQCAtMTI1
LDcgKzEyNSw3IEBAIGRvCj4ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3ByaW50ZihzdHIgKyBzdHJsZW4oc3RyKSwgIioiKTvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoFwKPiDCoH0gd2hpbGUoMCkKPiDCoAo+IC0vKiBBbHdheXMgZW5kIGluIGEg
d2lsZGNhcmQsIGZvciBmdXR1cmUgZXh0ZW5zaW9uICovCj4gKy8qIEVuZCBpbiBhIHdpbGRjYXJk
LCBmb3IgZnV0dXJlIGV4dGVuc2lvbiAqLwo+IMKgc3RhdGljIGlubGluZSB2b2lkIGFkZF93aWxk
Y2FyZChjaGFyICpzdHIpCj4gwqB7Cj4gwqAJaW50IGxlbiA9IHN0cmxlbihzdHIpOwo+IEBAIC03
MDQsNyArNzA0LDYgQEAgc3RhdGljIGludCBkb19vZl9lbnRyeSAoY29uc3QgY2hhciAqZmlsZW5h
bWUsCj4gdm9pZCAqc3ltdmFsLCBjaGFyICphbGlhcykKPiDCoAkJaWYgKGlzc3BhY2UgKCp0bXAp
KQo+IMKgCQkJKnRtcCA9ICdfJzsKPiDCoAo+IC0JYWRkX3dpbGRjYXJkKGFsaWFzKTsKPiDCoAly
ZXR1cm4gMTsKPiDCoH0KPiDCoEFERF9UT19ERVZUQUJMRSgib2YiLCBvZl9kZXZpY2VfaWQsIGRv
X29mX2VudHJ5KTsKClJldmlld2VkLWJ5OiBTam9lcmQgU2ltb25zIDxzam9lcmQuc2ltb25zQGNv
bGxhYm9yYS5jby51az4KCi0tIApTam9lcmQgU2ltb25zCkNvbGxhYm9yYSBMdGQuCg==

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

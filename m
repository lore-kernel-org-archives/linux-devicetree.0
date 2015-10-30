From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clocksource: rockchip: Make the driver more
 compatible
Date: Fri, 30 Oct 2015 11:43:33 +0800
Message-ID: <5632E765.4010207@gmail.com>
References: <1443147298-12603-1-git-send-email-wxt@rock-chips.com>
 <1443147298-12603-2-git-send-email-wxt@rock-chips.com>
 <560A10FB.7040408@linaro.org> <2486591.i0n1KlEQoc@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2486591.i0n1KlEQoc@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLAoK5ZyoIDIwMTXlubQxMOaciDAx5pelIDAzOjE0LCBIZWlrbyBTdMO8Ym5lciDl
hpnpgZM6Cj4gSGkgRGFuaWVsLAo+Cj4gQW0gRGllbnN0YWcsIDI5LiBTZXB0ZW1iZXIgMjAxNSwg
MDY6MTg6MDMgc2NocmllYiBEYW5pZWwgTGV6Y2FubzoKPj4gT24gMDkvMjUvMjAxNSAwNDoxNCBB
TSwgQ2Flc2FyIFdhbmcgd3JvdGU6Cj4+PiBCdWlsZCB0aGUgYXJtNjQgU29DcyAoZS5nLjogUksz
MzY4KSBvbiBSb2NrY2hpcCBwbGF0Zm9ybSwKPj4+IFRoZXJlIGFyZSBzb21lIGZhaWx1cmUgd2l0
aCBidWlsZCB1cCBvbiB0aW1lciBkcml2ZXIgZm9yIHJvY2tjaGlwLgo+Pj4KPj4+IFNheXM6Cj4+
PiAvdG1wL2NjZEFuTnk1LnM6NDc6IEVycm9yOiBtaXNzaW5nIGltbWVkaWF0ZSBleHByZXNzaW9u
IGF0ICBvcGVyYW5kIDEgLS0KPj4+IGBkc2JgCj4+PiAuLi4KPj4+Cj4+PiBUaGUgcHJvYmxlbSB3
YXMgZGlmZmVyZW50IHNlbWFudGljcyBvZiBkc2Igb24gYnR3IGFybTMyIGFuZCBhcm02NCwKPj4+
IEhlcmUgd2UgY2FuIGNvbnZlcnQgdGhlIGRzYiB3aXRoIGluc3RlYWRpbmcgb2YgZHNiKHN5KS5U
aGUgInN5IiBwYXJhbQo+Pj4gaXMgdGhlIGRlZmF1bHQgd2hpY2ggeW91IGFyZSBhbGxvdyB0byBv
bWl0LCBzbyBvbiBhcm0zMiBkc2IoKWFuZCBkc2Ioc3kpCj4+PiBhcmUgdGhlIHNhbWUuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogQ2Flc2FyIFdhbmcgPHd4dEByb2NrLWNoaXBzLmNvbT4KPj4gQWNr
ZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IGFzIHlv
dSBoYXZlICJqdXN0IiBBY2tlZCB0aGVzZSBwYXRjaGVzLCBJIGd1ZXNzIHlvdSBhcmUgZXhwZWN0
aW5nIHRoZW0gdG8gZ28KPiB0aHJvdWdoIHRoZSBzYW1lIHRyZWUgYXMgdGhlIGRldmljZXRyZWUg
Y2hhbmdlcywgcmlnaHQ/CgpJJ20gd29uZGVyIGlmIHNvbWVvbmUgd2lsbCBhcHBseSB0aGlzIHNl
cmllcyBwYXRjaHMgYnV0IHRoZSB3YWl0LjotKQpJbiBmYWN0LCBJJ20gbm8gc3VyZSB0aGF0IHRo
ZSBBY2tlZCBpcyByZWFsbHkgbWVhbmluZy46LQoKPgo+IFRoYW5rcwo+IEhlaWtvCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LXJvY2tj
aGlwIG1haWxpbmcgbGlzdAo+IExpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlw
CgoKLS0gClRoYW5rcywKQ2Flc2FyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlw
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yb2NrY2hpcAo=

From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 6/9] ASoC: rt5616: add mclk property for rt5616 document
Date: Sun, 31 Jan 2016 17:09:51 +0800
Message-ID: <56ADCF5F.1010203@gmail.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
 <1453970618-4383-7-git-send-email-wxt@rock-chips.com>
 <20160129162800.GA10835@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160129162800.GA10835@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

CuWcqCAyMDE25bm0MDHmnIgzMOaXpSAwMDoyOCwgUm9iIEhlcnJpbmcg5YaZ6YGTOgo+IE9uIFRo
dSwgSmFuIDI4LCAyMDE2IGF0IDA0OjQzOjM1UE0gKzA4MDAsIENhZXNhciBXYW5nIHdyb3RlOgo+
PiBUaGlzIHBhdGNoIGFkZCB0aGUgbWNsayBwcm9wZXJ0eSBmb3IgdGhlIENPREVDIGRyaXZlciwK
Pj4gc2luY2Ugc29tZXRpbWUgdGhlIENPREVDIGRyaXZlciBuZWVkcyB0aGUgY2xvY2sgZW5hYmxl
ZC4KPiBzL2FkZC9hZGRzLwo+Cj4gcy9zb21ldGltZS9zb21ldGltZXMvCgpEb25lLCB0aGFua3Mg
Zm9yIHBvaW50aW5nIG91dCB0aGF0LgoKCj4+IFRoZSBzeXN0ZW0gY2xvY2sgb2YgQUxDNTYxNiBj
YW4gYmUgc2VsZWN0ZWQgZnJvbSBNQ0xLLAo+PiBUaGF0J3MgYWxzbyBtYWtlIGFzIHRoZSBjb2Rl
YyBtYXN0ZXIgY2xvY2sgcHJvdmlkZXIsCj4gVGhhdCBhbHNvIG1ha2VzIHRoZSBjb2RlYyB0aGUg
bWFzdGVyIGNsb2NrIHByb3ZpZGVyLgo+CgpEaXR0by4KCj4+IFNpZ25lZC1vZmYtYnk6IENhZXNh
ciBXYW5nIDx3eHRAcm9jay1jaGlwcy5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHY0
Ogo+PiAtIEFkZCB0aGlzIHBhdGNoIGluY2x1ZGVkIGluIGt5bGluIHNlcmllcyBwYXRjaGVzLgo+
Pgo+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ydDU2MTYudHh0
IHwgNiArKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcnQ1NjE2
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ydDU2MTYudHh0
Cj4+IGluZGV4IGVmYzQ4YzYuLmU0MTA4NTggMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ydDU2MTYudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9ydDU2MTYudHh0Cj4+IEBAIC04LDYgKzgsMTIg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4gICAKPj4gICAtIHJlZyA6IFRoZSBJMkMgYWRkcmVz
cyBvZiB0aGUgZGV2aWNlLgo+PiAgIAo+PiArT3B0aW9uYWwgcHJvcGVydGllczoKPj4gKwo+PiAr
LSBjbG9ja3M6IFRoZSBwaGFuZGxlIG9mIHRoZSBtYXN0ZXIgY2xvY2sgdG8gdGhlIENPREVDLgo+
PiArCj4+ICstIGNsb2NrLW5hbWVzOiBTaG91bGQgYmUgIm1jbGsiLgo+PiArCj4+ICAgUGlucyBv
biB0aGUgZGV2aWNlIChmb3IgbGlua2luZyBpbnRvIGF1ZGlvIHJvdXRlcykgZm9yIFJUNTYxNjoK
Pj4gICAKPj4gICAgICogSU4xUAo+PiAtLSAKPj4gMS45LjEKPj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LXJvY2tjaGlwIG1haWxpbmcg
bGlzdAo+IExpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCgoKLS0gClRoYW5r
cywKQ2Flc2FyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yb2NrY2hpcAo=

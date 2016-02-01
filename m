From: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/9] ARM: dts: rockchip: add the leds control for kylin
 board
Date: Mon, 1 Feb 2016 14:40:57 +0800
Message-ID: <56AEFDF9.2030905@gmail.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
 <1453970618-4383-2-git-send-email-wxt@rock-chips.com>
 <2785565.JmZWWova7F@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2785565.JmZWWova7F@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

CgrlnKggMjAxNuW5tDAx5pyIMzHml6UgMTg6NDYsIEhlaWtvIFN0dWVibmVyIOWGmemBkzoKPiBB
bSBEb25uZXJzdGFnLCAyOC4gSmFudWFyIDIwMTYsIDE2OjQzOjMwIHNjaHJpZWIgQ2Flc2FyIFdh
bmc6Cj4+IEFzIHRoZSBreWxpbiBzY2hlbWF0aWMgZHJhd2luZywgYWRkIHRoZSBuZWVkZWQgd29y
ayBsZWQgZm9yCj4+IGt5bGluIGJvYXJkLgo+Pgo+PiBSdW46Cj4+IGVjaG8gMCA+IC9zeXMvY2xh
c3MvbGVkcy9reWxpbjpyZWQ6bGVkL2JyaWdodG5lc3MKPj4gZWNobyAxID4gL3N5cy9jbGFzcy9s
ZWRzL2t5bGluOnJlZDpsZWQvYnJpZ2h0bmVzcwo+Pgo+PiBUaGUgbGVkIGNhbiBub3JtYWwgb24v
b2ZmIG9uIGt5bGluIGJvYXJkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDYWVzYXIgV2FuZyA8d3h0
QHJvY2stY2hpcHMuY29tPgo+IGFwcGxpZWQgdG8gbXkgZHRzMzItYnJhbmNoIGZvciA0LjYKCk9r
YXksIHRoYW5rcy4KSSdtIGFzc3VtaW5nIHRoaXMgcGF0Y2ggaXMgYXBwbGllZCB0byB5b3VyIGxv
Y2FsIGJyYW5jaCBzaW5jZSBJIGhhdmUgbm90IAp5ZXQgc2VlIG9uIHlvdXIgYnJhbmNoWzBdLjot
KQoKYnJhbmNoWzBdOiAKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9n
aXQvbW1pbmQvbGludXgtcm9ja2NoaXAuZ2l0L2xvZy8/aD12NC42LWFybXNvYy9kdHMzMgoKCgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPiBMaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
b2NrY2hpcAoKCi0tIApUaGFua3MsCkNhZXNhcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdApMaW51eC1y
b2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK

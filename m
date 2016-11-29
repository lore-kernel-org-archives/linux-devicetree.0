From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 13/13] clocksource/drivers/rockchip_timer: Prevent
 ftrace recursion
Date: Tue, 29 Nov 2016 18:36:11 +0300
Message-ID: <3CA13FA3-1110-4833-B844-446AF16931C5@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
 <1480427118-5126-1-git-send-email-al.kochet@gmail.com>
 <1480427118-5126-14-git-send-email-al.kochet@gmail.com>
 <7837485.H9nfDmPu0F@diego>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <7837485.H9nfDmPu0F@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8gSGVpa28hClRoYW5rIHlvdSBmb3IgcGF0Y2ggcmV2aWV3IQoKPiAyOSDQvdC+0Y/QsS4g
MjAxNiDQsy4sINCyIDE4OjAxLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiDQvdCw
0L/QuNGB0LDQuyjQsCk6Cj4gCj4geW91IGludHJvZHVjZWQgdGhlIGlzc3VlIHlvdXJzZWxmIGlu
IHBhdGNoIDExLzEzLiBJbiBnZW5lcmFsIGFueSBwYXRjaCBzaG91bGQgCj4gbmV2ZXIgbGVhdmUg
dGhlIGtlcm5lbCBpbiBhIHdvcnNlIHN0YXRlIHRoYW4gaXQgd2FzIGJlZm9yZSwgc28gbm8gcGF0
Y2ggc2hvdWxkIAo+IGV2ZXIgaW50cm9kdWNlIGtub3duIGlzc3VlcyBpdHNlbGYuCgpBZ3JlZS4K
Cj4gSW4gdGhhdCBsaW5lIG9mIHRob3VnaHQsIGRvbid0IHBhdGNoZXMgMTArMTEgaW50cm9kdWNl
IHdhcm5pbmdzIGFib3V0IHVudXNlZCAKPiBmdW5jdGlvbnMgYXMgd2VsbCB3aGVuIGFwcGxpZWQg
d2l0aG91dCBwYXRjaCAxMj8KNyAtIHllcwoxMCAtIG5vdAoxMSAtIHllcwoKPiAyOSDQvdC+0Y/Q
sS4gMjAxNiDQsy4sINCyIDE4OjAzLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiDQ
vdCw0L/QuNGB0LDQuyjQsCk6Cj4gCj4gVGhlbiB3aHkgZG8geW91IG5lZWQgYW5vdGhlciBwYXRj
aCB0byByZW1vdmUgdGhlbSBhbmQgZG9uJ3QgZG8gdGhhdCBpbiB0aGUgCj4gcGF0Y2ggcmVtb3Zp
bmcgdGhlaXIgcmVzcGVjdGl2ZSB1c2FnZT8KCgpUbyBtYWtlIDcgbW9yZSByZWFkYWJsZS4gT3Zl
cndpc2UgcGF0Y2ggbWVzc2VkIHVwIGFuZCB1bnJlYWRhYmxlLgpJdOKAmXMgaGFyZCB0byB0cmFj
ayB3aGF0IGdvaW5nIG9uIGluIHRoZSBwYXRjaC4KCj4gTWF5YmUgbWVyZ2UgdGhlbT8KCkknbGwg
bWVyZ2UgYWxsIG9mIHRoZW0uCgpQLlMuCmhlcmUgY29tbWVudCBmcm9tIGFub3RoZXIgdGhlYWQg
YWJvdXQgdGhlIHBhdGNoZXMuCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9s
aW51eC1hcm0ta2VybmVsLzIwMTYtTm92ZW1iZXIvdGhyZWFkLmh0bWwjNDcwOTU3Cgo+IDI5INC9
0L7Rj9CxLiAyMDE2INCzLiwg0LIgMTg6MDcsIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFy
bS5jb20+INC90LDQv9C40YHQsNC7KNCwKToKPiAKPiAzMjg4IChhbmQgcHJvYmFibHkgYW55dGhp
bmcgbmV3ZXIpIGlzIGlycmVsZXZhbnQgdG8gdGhpcyBkaXNjdXNzaW9uLCBhcwo+IGl0IGhhcyB0
aGUgYXJjaCB0aW1lciBpbnRlcmZhY2UgLSB0aGF0IG1heSBiZSBidXN0ZWQgaW4gb3RoZXIgd2F5
cyAoc3VjaAo+IGFzIG5vdCBiZWluZyBjb3JyZWN0bHkgc2V0IHVwIGJ5IGZpcm13YXJlIGFuZCBu
b3QgYmVpbmcgYWx3YXlzLW9uIGFzIGl0Cj4gc2hvdWxkKSwgYnV0IGZyZXF1ZW5jeSBpcyBub3Qg
b25lIG9mIHRoZW0uIFRoaXMgb25seSBhZmZlY3RzCj4gQ29ydGV4LUE5L0E1IGJhc2VkIHBhcnRz
LgoKClNvIEkgdXBkYXRlIGNvbW1lbnRzIGZvciBwYXRjaGVzLgoKTG9va3MsIGxpa2UgSSBzdHVk
eSBhcmNoZW9sb2d5IHdpdGggbXkgcGF0Y2hlcywgYXMgYWxsIG5ldyBBUk0gY2hpcHMgbm90CmFm
ZmVjdGVkIGJ5IHRoZSBwcm9ibGVtIGFueW1vcmUuCgpSZWdhcmRzLApBbGV4YW5kZXIuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtcm9ja2No
aXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=

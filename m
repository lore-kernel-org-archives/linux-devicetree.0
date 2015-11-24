From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v7 0/6] Build and support rk3036 SoC platform
Date: Tue, 24 Nov 2015 14:49:36 +0800
Message-ID: <56540880.6010601@rock-chips.com>
References: <1446708840-12038-1-git-send-email-zhengxing@rock-chips.com>
 <1518219.zj9d8yfxJz@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1518219.zj9d8yfxJz@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, kmixter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

T0ssIFRoYW5rcyBIZWlrby4gOi0pCgpPbiAyMDE15bm0MTHmnIgyNOaXpSAwODowMywgSGVpa28g
U3TDvGJuZXIgd3JvdGU6Cj4gSGkgWGluZyBaaGVuZywKPgo+IEFtIERvbm5lcnN0YWcsIDUuIE5v
dmVtYmVyIDIwMTUsIDE1OjMzOjU0IHNjaHJpZWIgWGluZyBaaGVuZzoKPj4gSGksCj4+ICAgIFdl
IG5lZWQgdG8gc3VwcG9ydCByazMwMzYgc29jIHBsYXRmb3JtIHZpYSB1cHN0cmVhbSwgdGhlcmUg
YXJlCj4+IHNvbWUgcHJpbWFyeSBwYXJ0cyBmb3IgdGhlIGluaXRpYWwgcmVsZWFzZSBvZiBtaW5p
bXVtIHN5c3RlbTogZHRzLAo+PiBjbGstcGxsLCBzbXAsIGFuZCBjbG9jayB0cmVlIGZvciByazMw
MzYsIGFuZCBhZGRpdGlvbmFsLCB3ZSBjYW4gdXNlCj4+IHRoZXNlIHN0YXJ0dXAgYW5kIHJ1biB0
byBpbml0IHByb2Nlc3NzLgo+IFsuLi5dCj4KPiBhZnRlciB0YWxraW5nIHdpdGggTWlrZSBhbmQg
YWdyZWVpbmcgdGhhdCBJJ20gYWdhaW4gdGFraW5nIHRoZSByZWd1bGFyCj4gY2xvY2sgcGF0Y2hl
cyB0byB0aGVtLCBJJ3ZlIGFwcGxpZWQgYWxsIG9mIHRoaXMgdG8gYXBwcm9wcmlhdGUgYnJhbmNo
ZXMuCj4gSSBkaWQgc29tZSBjb3NtZXRpY3MsIGFzIGV4cGxhaW5lZCBiZWxvdy4KPgo+Cj4+IFhp
bmcgWmhlbmcgKDYpOgo+PiAgICBkdC1iaW5kaW5nczogYWRkIGRvY3VtZW50YXRpb24gb2Ygcmsz
MDM2IGNsb2NrIGNvbnRyb2xsZXIKPj4gICAgY2xrOiByb2NrY2hpcDogYWRkIGR0LWJpbmRpbmcg
aGVhZGVyIGZvciByazMwMzYKPj4gICAgY2xrOiByb2NrY2hpcDogYWRkIG5ldyBwbGwtdHlwZSBm
b3IgcmszMDM2IGFuZCBzaW1pbGFyIHNvY3MKPiAtIHdyYXBwZWQgc29tZSBvdmVybHkgbG9uZyBs
aW5lcywgb3RoZXJ3aXNlIHRoaXMgaXMgc2ltaWxhciB0byB3aGF0Cj4gICAgU3RlcGhlbiBhbHJl
YWR5IHRvb2sgZm9yIHRoZSByazMwNjYtcGxsLXR5cGUuCj4KPgo+PiAgICBjbGs6IHJvY2tjaGlw
OiBhZGQgY2xvY2sgY29udHJvbGxlciBmb3IgcmszMDM2Cj4+ICAgIEFSTTogZHRzOiByb2NrY2hp
cDogYWRkIGNvcmUgcmszMDM2IGR0cwo+IC0gc3BsaXQgb2ZmIHRoZSBldmIgaW50byBhIHNlcGFy
YXRlIHBhdGNoCj4gLSByZW9yZGVyZWQgc29tZSBub2RlcyAocGxlYXNlIG9yZGVyIGJ5IHRoZSBh
ZGRyZXNzICh0aGUgQHh4eHh4eHh4KQo+IC0gcmVvcmRlcmVkIHNvbWUgcHJvcGVydGllcwo+IC0g
Zml4ZWQgdGhlIGdpYyBjcHUgbWFza3MKPgo+Cj4+ICAgIEFSTTogZHRzOiBlbmFibGUgc21wIGZv
ciByazMwMzYKPiBmb2xkZWQgaW50byB0aGUgY29yZSBkdHNpIGFkZGl0aW9uCj4KPgo+IFBsZWFz
ZSB0YWtlIGEgZmluYWwgbG9vayBhdCBbMF0gdG8gbWFrZSBzdXJlIEkgZGlkbid0IG1lc3MgdXAg
YW55dGhpbmcuCj4KPgo+IFRoYW5rcwo+IEhlaWtvCj4KPgo+IFswXQo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L21taW5kL2xpbnV4LXJvY2tjaGlwLmdpdC9s
b2cvP2g9djQuNS1jbGsvbmV4dAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9r
ZXJuZWwvZ2l0L21taW5kL2xpbnV4LXJvY2tjaGlwLmdpdC9sb2cvP2g9djQuNS1hcm1zb2MvZHRz
MzIKPgo+Cj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yb2NrY2hpcAo=

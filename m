From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: raise CPU trip point
 temperature for veyron to 100 degC
Date: Thu, 16 May 2019 09:57:11 -0700
Message-ID: <CAD=FV=XtAMJcNCkV=wm1iNcMo3UenmrCDKJkmS6wtxvtpvLrag@mail.gmail.com>
References: <20190516162942.154823-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190516162942.154823-1-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCA5OjI5IEFNIE1hdHRoaWFzIEthZWhsY2tlIDxt
a2FAY2hyb21pdW0ub3JnPiB3cm90ZToKCj4gVGhpcyB2YWx1ZSBtYXRjaGVzIHdoYXQgaXMgdXNl
ZCBieSB0aGUgZG93bnN0cmVhbSBDaHJvbWUgT1MgMy4xNAo+IGtlcm5lbCwgdGhlICdvZmZpY2lh
bCcga2VybmVsIGZvciB2ZXlyb24gZGV2aWNlcy4gS2VlcCB0aGUgdGVtcGVyYXR1cmUKPiBmb3Ig
J3NwZWVkeScgYXQgOTDCsEMsIGFzIGluIHRoZSBkb3duc3RyZWFtIGtlcm5lbC4KPgo+IEluY3Jl
YXNlIHRoZSB0ZW1wZXJhdHVyZSBmb3IgYSBoYXJkd2FyZSBzaHV0ZG93biB0byAxMjXCsEMsIHdo
aWNoCj4gbWF0Y2hlcyB0aGUgZG93bnN0cmVhbSBjb25maWd1cmF0aW9uIGFuZCBnaXZlcyB0aGUg
c3lzdGVtIGEgY2hhbmNlCj4gdG8gc2h1dCBkb3duIG9yZGVybHkgYXQgdGhlIGNyaXRpY2lhbCB0
cmlwIHBvaW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJv
bWl1bS5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIHBhdGNoIGFkZGVkIHRvIHRoZSBz
ZXJpZXMKPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJvbi1zcGVlZHkuZHRz
IHwgNCArKysrCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24uZHRzaSAgICAgICB8
IDUgKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5
OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1yb2NrY2hpcCBtYWlsaW5n
IGxpc3QKTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCg==

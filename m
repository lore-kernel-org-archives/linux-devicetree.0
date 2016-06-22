From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 0/5] Fix and improve clock controller for the RK322x SoCs
Date: Wed, 22 Jun 2016 09:10:25 +0800
Message-ID: <5769E581.2040903@rock-chips.com>
References: <1466484811-26923-1-git-send-email-zhengxing@rock-chips.com>
 <13345941.K3V3BNYxTY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <13345941.K3V3BNYxTY@phil>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgSGVpa28sCgpPbiAyMDE25bm0MDbmnIgyMuaXpSAwNzowNywgSGVpa28gU3R1ZWJuZXIgd3Jv
dGU6Cj4gQW0gRGllbnN0YWcsIDIxLiBKdW5pIDIwMTYsIDEyOjUzOjI2IHNjaHJpZWIgWGluZyBa
aGVuZzoKPj4gSGksCj4+ICAgIFRoZXNlIHBhdGNoc2V0IGZpeCBzb21lIGNsb2NrcyBidWdzLCBh
bmQgaW1wcm92ZSBjbG9jayBjb25maWd1cmF0aW9uCj4+IGZvciBpMnMvc3BkaWYvTUFDIG9uIFJL
MzIyeCBTb0NzLgo+IGFwcGxpZWQgdG8gbXkgY2xvY2stYnJhbmNoIHdpdGggdGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzOgo+Cj4gLSBmaXhlZCB0aGUgZXJyb3IgaW4gcGF0Y2gxIC0gbWlzc2luZyAiKSIg
aW4KPiAgICAgICAgQ09NUE9TSVRFX0ZSQUMoMCwgImkyczFfZnJhYyIsICJpMnMxX3NyYyIsIENM
S19TRVRfUkFURV9QQVJFTlQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgUkszMjg4X0NMS1NF
TF9DT04oNyksIDAsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgUkszMjg4X0NMS0dBVEVfQ09O
KDApLCAxMSwgR0ZMQUdTKSwKPiArICAgICAgICAgICAgICAgICAgICAgICBSSzI5MjhfQ0xLU0VM
X0NPTig3KSwgMCwKPiArICAgICAgICAgICAgICAgICAgICAgICBSSzI5MjhfQ0xLR0FURV9DT04o
MCksIDExLCBHRkxBR1MsCj4KPiAtIGFkYXB0ZWQgcGF0Y2gyIGFjY29yZGluZ2x5Cj4gLSBzcGxp
dCBvdXQgY2xvY2sgaWQgYWRkaXRpb24gaW50byBzZXBhcmF0ZSBwYXRjaGVzLCBhcyB0aGV5IG5l
ZWQgYSBzaGFyZWQKPiBicmFuY2guIFhpbmcgcGxlYXNlIHJlbWVtYmVyIHRvIGFkZCBjbG9jay1p
ZHMgdG8gdGhlIGhlYWRlciBpbiBzZXBhcmF0ZQo+IHBhdGNoZXMuCj4KPgpTbyBzb3JyeSB0byBt
aXNzIGl0Li4uCk9LLCBJIHdpbGwgYWRkIGNsb2NrLWlkcyB0byB0aGUgaGVhZGVyIGluIHNlcGFy
YXRlIHBhdGNoZXMuCgpUaGFua3MuCgotLSAKLSBYaW5nIFpoZW5nCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXJvY2tjaGlwIG1haWxpbmcg
bGlzdApMaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK

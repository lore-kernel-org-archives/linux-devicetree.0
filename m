From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 02/15] clk: sunxi-ng: Add check for minimal rate to NKM
 PLLs
Date: Wed, 24 Oct 2018 01:48:30 -0700
Message-ID: <154037091085.53599.3262228306180990630@swboyd.mtv.corp.google.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-3-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181023155035.9101-3-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Trimarchi <michael@amarulasolutions.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBKYWdhbiBUZWtpICgyMDE4LTEwLTIzIDA4OjUwOjIyKQo+IFNvbWUgTktNIFBMTHMg
ZG9lc24ndCB3b3JrIHdlbGwgd2hlbiB0aGVpciBvdXRwdXQgY2xvY2sgcmF0ZSBpcyBzZXQgYmVs
b3cKPiBjZXJ0YWluIHJhdGUuCj4gCj4gU28sIGFkZCBzdXBwb3J0IGZvciBtaW5pbWFsIHJhdGUg
Zm9yIHJlbGV2YW50IFBMTHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5A
YW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCgpBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95
ZEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

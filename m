From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 03/15] clk: sunxi-ng: Add check for maximum rate to NKM
 PLLs
Date: Wed, 24 Oct 2018 01:48:48 -0700
Message-ID: <154037092824.53599.14201561893996103915@swboyd.mtv.corp.google.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-4-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181023155035.9101-4-jagan@amarulasolutions.com>
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

UXVvdGluZyBKYWdhbiBUZWtpICgyMDE4LTEwLTIzIDA4OjUwOjIzKQo+IFNvbWUgTktNIFBMTHMs
IGZyZXF1ZW5jeSBjYW4gYmUgc2V0IGFib3ZlIFBMTCB3b3JraW5nIHJhbmdlLgo+IAo+IEFkZCBh
IGNvbnN0cmFpbnQgZm9yIG1heGltdW0gc3VwcG9ydGVkIHJhdGUuIFRoaXMgd2F5LCBkcml2ZXJz
IGNhbgo+IHNwZWNpZnkgd2hpY2ggaXMgbWF4aW11bSBhbGxvd2VkIHJhdGUgZm9yIFBMTC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiAtLS0KCkFja2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

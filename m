From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 2/7] drm/panel: simple: Add ability to override
 typical timing
Date: Sun, 30 Jun 2019 22:55:14 +0200
Message-ID: <20190630205514.GA17046@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-3-dianders@chromium.org>
 <20190630202246.GB15102@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190630202246.GB15102@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: devicetree@vger.kernel.org, =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>, David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon <boris.brezillon@collabora.com>, Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>, Sean Paul <seanpaul@chromium.org>, Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org
List-Id: devicetree@vger.kernel.org

SGkgRG91Z2xhcy4KCj4gPiArCj4gPiArCS8qIE9ubHkgYWRkIHRpbWluZ3MgaWYgb3ZlcnJpZGUg
d2FzIG5vdCB0aGVyZSBvciBmYWlsZWQgdG8gdmFsaWRhdGUgKi8KPiA+ICsJaWYgKG51bSA9PSAw
ICYmIHBhbmVsLT5kZXNjLT5udW1fdGltaW5ncykKPiA+ICsJCW51bSA9IHBhbmVsX3NpbXBsZV9n
ZXRfdGltaW5nc19tb2RlcyhwYW5lbCk7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIE9ubHkgYWRk
IGZpeGVkIG1vZGVzIGlmIHRpbWluZ3Mvb3ZlcnJpZGUgYWRkZWQgbm8gbW9kZS4KPiAKPiBUaGlz
IHBhcnQgSSBmYWlsIHRvIHVuZGVyc3RhbmQuCj4gSWYgd2UgaGF2ZSBhIHBhbmVsIHdoZXJlIHdl
IGluIHBhbmVsLXNpbXBsZSBoYXZlIHNwZWNpZmllZCB0aGUgdGltaW5ncywKPiBhbmQgZG9uZSBz
byB1c2luZyBkaXNwbGF5X3RpbWluZyBzbyB3aXRoIHByb3BlciB7bWluLCB0eXAsIG1heH0gdGhl
biBpdAo+IHNob3VsZCBiZSBwZXJmZWN0bHkgbGVnYWwgdG8gc3BlY2lmeSBhIG1vcmUgcHJlY2lz
ZSB2YXJpYW50IGluIHRoZSBEVAo+IGZpbGUuCj4gT3Igd2hhdCBkaWQgSSBtaXNzIGhlcmU/CgpH
b3QgaXQgbm93LgpJZiBkaXNwbGF5X21vZGUgaXMgdXNlZCBmb3IgdGltaW5ncyB0aGlzIGlzIHdo
YXQgeW91IGNhbGwgImZpeGVkIG1vZGUiLgpIbW0sIGlmIEkgZ290IGNvbmZ1c2VkIHNvbWVvbmUg
ZWxzZSBtYXkgYWxzbyBiZSBjb25mdXNlZCBieSB0aGlzIG5hbWluZy4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

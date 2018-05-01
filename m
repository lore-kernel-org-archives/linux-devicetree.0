From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 10/21] drm/sun4i: Enable DesignWare HDMI for Allwinner
 64-bit SoCs
Date: Wed, 2 May 2018 00:20:48 +0800
Message-ID: <CAGb2v67_WjVOfz0maTU7K9WWEChGjQoYqpc=xZkmy4W64+9DLw@mail.gmail.com>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
 <20180430114058.5061-11-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180430114058.5061-11-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Stephen Boyd <sboyd@kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgNzo0MCBQTSwgSmFnYW4gVGVraSA8amFnYW5AYW1hcnVs
YXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+IEFsbHdpbm5lciA2NC1iaXQgU29DIGxpa2UgSDUvQTY0
IGhhcyBEZXNpZ25XYXJlIEhETUkgc28KPiBlbmFibGUgdGhlbSBhcyBkZWZhdWx0LgoKU2hvdWxk
IHdlIG5vdCBhbHNvIGVuYWJsZSBpdCBieSBkZWZhdWx0IGZvciBTVU44SSAoQTgzVCwgSDMsIFI0
MD8sIGV0Yy4pCgo+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZpZyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9LY29uZmlnCj4g
aW5kZXggZWVlNmJjMGVhZjk3Li42MDQ2OGE3NzlhNjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZp
Zwo+IEBAIC00Miw2ICs0Miw3IEBAIGNvbmZpZyBEUk1fU1VONElfQkFDS0VORAo+Cj4gIGNvbmZp
ZyBEUk1fU1VOOElfRFdfSERNSQo+ICAgICAgICAgdHJpc3RhdGUgIlN1cHBvcnQgZm9yIEFsbHdp
bm5lciB2ZXJzaW9uIG9mIERlc2lnbldhcmUgSERNSSIKPiArICAgICAgIGRlZmF1bHQgQVJNNjQg
JiYgQVJDSF9TVU5YSQo+ICAgICAgICAgZGVwZW5kcyBvbiBEUk1fU1VONEkKPiAgICAgICAgIHNl
bGVjdCBEUk1fRFdfSERNSQo+ICAgICAgICAgaGVscAo+IC0tCj4gMi4xNC4zCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

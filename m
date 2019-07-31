From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Date: Wed, 31 Jul 2019 11:43:47 -0300
Message-ID: <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
 <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
 <20190731143532.GA1935@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190731143532.GA1935@bogon.m.sigxcpu.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, Chris Healy <cphealy@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SGkgR3VpZG8sCgpPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTozNSBBTSBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKCj4gVGhlIGlkZWEgaXMgdG8gaGF2ZQo+Cj4gICAg
ICIlc2FibGluZyBwbGF0Zm9ybSBjbG9ja3MiLCBlbmFibGUgPyAiZW4iIDogImRpcyIpOwo+Cj4g
ZGVwZW5kaW5nIHdoZXRoZXIgY2xvY2tzIGFyZSBlbmFibGVkL2Rpc2FibGVkLgoKWWVzLCBJIHVu
ZGVyc3Rvb2QgdGhlIGlkZWEsIGJ1dCB0aGlzIHdvdWxkIHByaW50OgoKZW5zYWJsaW5nIG9yIGRp
c3NhYmxpbmcgOi0pCgo+ID4gU2FtZSBoZXJlLiBQbGVhc2UgcmV0dXJuICdpbnQnIGluc3RlYWQu
Cj4KPiBUaGlzIGlzIGZyb20gZHJtX2JyaWRnZV9mdW5jcyBzbyB0aGUgcHJvdG90eXBlIGlzIGZp
eGVkLiBJJ20gbm90IHN1cmUKPiBob3cgd2hhdCdzIHRoZSBiZXN0IHdheSB0byBidWJibGUgdXAg
ZmF0YWwgZXJyb3JzIHRocm91Z2ggdGhlIGRybSBsYXllcj8KCk9rLCBzbyBsZXQncyBub3QgY2hh
bmdlIHRoaXMgb25lLgoKPiBJIHdlbnQgZm9yIERSTV9ERVZfRVJST1IoKSBzaW5jZSB0aGF0IHdo
YXQgaSB1c2VkIGluIHRoZSByZXN0IG9mIHRoZQo+IGRyaXZlciBhbmQgdGhlc2Ugb25lcyB3ZXJl
IG9taXNzaW9uLiBIb3BlIHRoYXQncyBvLmsuCgpObyBzdHJvbmcgcHJlZmVyZW5jZXMgaGVyZS4g
SSBqdXN0IHRoaW5rIGRldl9lcnIoKSBlYXNpZXIgdG8gdHlwZSBhbmQgc2hvcnRlci4KClRoYW5r
cyBmb3IgdGhpcyB3b3JrIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

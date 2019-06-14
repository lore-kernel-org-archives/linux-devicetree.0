From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support
 for R40
Date: Fri, 14 Jun 2019 16:26:30 +0530
Message-ID: <CAMty3ZBc-AqbNGZCxRhOPw46iMvEZxoq1oATA46=K29gRYi4Sg@mail.gmail.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
 <20190613185241.22800-3-jagan@amarulasolutions.com>
 <CAGb2v65xuXc4C1jOyM1GbEFVDam5P-6NN0ZhtzwzA7qU5F3nJQ@mail.gmail.com>
 <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v67DY534hXrx2H4jnZXA7jJS7sq2UwYCqw1iAgyLKdNzgA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula <linux-amarula@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgOTowNSBBTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTE6MTkgQU0gQ2hlbi1ZdSBU
c2FpIDx3ZW5zQGNzaWUub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1biAxNCwgMjAxOSBh
dCAyOjUzIEFNIEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gVENPTiBMQ0QwLCBMQ0QxIGluIGFsbHdpbm5lciBSNDAsIGFyZSB1c2VkIGZv
ciBtYW5hZ2luZwo+ID4gPiBMQ0QgaW50ZXJmYWNlcyBsaWtlIFJHQiwgTFZEUyBhbmQgRFNJLgo+
ID4gPgo+ID4gPiBMaWtlIFRDT04gVFYwLCBUVjEgdGhlc2UgTENEMCwgTENEMSBhcmUgYWxzbyBt
YW5hZ2VkIHZpYQo+ID4gPiB0Y29uIHRvcC4KPiA+ID4KPiA+ID4gQWRkIHN1cHBvcnQgZm9yIGl0
LCBpbiB0Y29uIGRyaXZlci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IENoZW4tWXUg
VHNhaSA8d2Vuc0Bjc2llLm9yZz4KPgo+IEkgdGFrZSB0aGF0IGJhY2suCj4KPiBUaGUgVENPTiBv
dXRwdXQgbXV4aW5nICh3aGljaCBzZWxlY3RzIHdoZXRoZXIgVENPTiBMQ0Qgb3IgVENPTiBUVgo+
IG91dHB1dHMgdG8gdGhlIEdQSU8gcGlucykKPiBpcyBub3Qgc3VwcG9ydGVkIHlldC4gUGxlYXNl
IGF0IGxlYXN0IGFkZCBUT0RPIG5vdGVzLCBvciBpZGVhbGx5LAoKQXJlIHlvdSByZWZlcnJpbmcg
YWJvdXQgcG9ydCBzZWxlY3Rpb24/IGl0IGlzIHN1cHBvcnQgaW4Kc3VuOGlfdGNvbl90b3BfZGVf
Y29uZmlnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

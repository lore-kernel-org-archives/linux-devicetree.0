From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v11 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Date: Fri, 24 May 2019 09:23:30 -0300
Message-ID: <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
References: <cover.1557657814.git.agx@sigxcpu.org>
 <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Li Jun <jun.li@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Abel Vesa <abel.vesa@nxp.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgS2lzaG9uLAoKT24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgNzo0OSBBTSBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKPgo+IFRoaXMgYWRkcyBzdXBwb3J0IGZvciB0aGUg
TWl4ZWwgRFBIWSBhcyBmb3VuZCBvbiBpLk1YOCBDUFVzIGJ1dCBzaW5jZQo+IHRoaXMgaXMgYW4g
SVAgY29yZSBpdCB3aWxsIGxpa2VseSBiZSBmb3VuZCBvbiBvdGhlcnMgaW4gdGhlIGZ1dHVyZS4g
U28KPiBpbnN0ZWFkIG9mIGFkZGluZyB0aGlzIHRvIHRoZSBud2wgaG9zdCBkcml2ZXIgbWFrZSBp
dCBhIGdlbmVyaWMgUEhZCj4gZHJpdmVyLgo+Cj4gVGhlIGRyaXZlciBzdXBwb3J0cyB0aGUgaS5N
WDhNUS4gU3VwcG9ydCBmb3IgaS5NWDhRTSBhbmQgaS5NWDhRWFAgY2FuIGJlCj4gYWRkZWQgb25j
ZSB0aGUgbmVjZXNzYXJ5IHN5c3RlbSBjb250cm9sbGVyIGJpdHMgYXJlIGluIHZpYQo+IG1peGVs
X2RwaHlfZGV2ZGF0YS4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2ln
eGNwdS5vcmc+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFz
QG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0Bu
eHAuY29tPgo+IFJldmlld2VkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCldvdWxkIHlv
dSBoYXZlIGFueSBjb21tZW50cyBvbiB0aGlzIHNlcmllcywgcGxlYXNlPwoKVGhhbmtzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

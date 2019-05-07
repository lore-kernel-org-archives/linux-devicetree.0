From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v10 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Date: Tue, 7 May 2019 07:55:23 -0300
Message-ID: <CAOMZO5CQXmmw50J3Pjy8wKOr+BBEo_-B9ChV32bq1Re4_0-4CQ@mail.gmail.com>
References: <cover.1557215047.git.agx@sigxcpu.org>
 <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>, Abel Vesa <abel.vesa@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>, NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBNYXkgNywgMjAxOSBhdCA0OjQ3IEFNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNw
dS5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBNaXhlbCBEUEhZIGFz
IGZvdW5kIG9uIGkuTVg4IENQVXMgYnV0IHNpbmNlCj4gdGhpcyBpcyBhbiBJUCBjb3JlIGl0IHdp
bGwgbGlrZWx5IGJlIGZvdW5kIG9uIG90aGVycyBpbiB0aGUgZnV0dXJlLiBTbwo+IGluc3RlYWQg
b2YgYWRkaW5nIHRoaXMgdG8gdGhlIG53bCBob3N0IGRyaXZlciBtYWtlIGl0IGEgZ2VuZXJpYyBQ
SFkKPiBkcml2ZXIuCj4KPiBUaGUgZHJpdmVyIHN1cHBvcnRzIHRoZSBpLk1YOE1RLiBTdXBwb3J0
IGZvciBpLk1YOFFNIGFuZCBpLk1YOFFYUCBjYW4gYmUKPiBhZGRlZCBvbmNlIHRoZSBuZWNlc3Nh
cnkgc3lzdGVtIGNvbnRyb2xsZXIgYml0cyBhcmUgaW4gdmlhCj4gbWl4ZWxfZHBoeV9kZXZkYXRh
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiBD
by1kZXZlbG9wZWQtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+CgpSZXZp
ZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

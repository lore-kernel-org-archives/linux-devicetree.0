From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v11 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Date: Fri, 24 May 2019 21:31:02 +0530
Message-ID: <69fcb327-8b51-df9e-12d9-d75751974bce@ti.com>
References: <cover.1557657814.git.agx@sigxcpu.org>
 <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
 <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Li Jun <jun.li@nxp.com>, Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Johan Hovold <johan@kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Abel Vesa <abel.vesa@nxp.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Chiras <robert.chiras@nxp.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, "moderated list:ARM/FREESCALE
 IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@list>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiAyNC8wNS8xOSA1OjUzIFBNLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IEhpIEtpc2hv
biwKPiAKPiBPbiBTdW4sIE1heSAxMiwgMjAxOSBhdCA3OjQ5IEFNIEd1aWRvIEfDvG50aGVyIDxh
Z3hAc2lneGNwdS5vcmc+IHdyb3RlOgo+Pgo+PiBUaGlzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIE1p
eGVsIERQSFkgYXMgZm91bmQgb24gaS5NWDggQ1BVcyBidXQgc2luY2UKPj4gdGhpcyBpcyBhbiBJ
UCBjb3JlIGl0IHdpbGwgbGlrZWx5IGJlIGZvdW5kIG9uIG90aGVycyBpbiB0aGUgZnV0dXJlLiBT
bwo+PiBpbnN0ZWFkIG9mIGFkZGluZyB0aGlzIHRvIHRoZSBud2wgaG9zdCBkcml2ZXIgbWFrZSBp
dCBhIGdlbmVyaWMgUEhZCj4+IGRyaXZlci4KPj4KPj4gVGhlIGRyaXZlciBzdXBwb3J0cyB0aGUg
aS5NWDhNUS4gU3VwcG9ydCBmb3IgaS5NWDhRTSBhbmQgaS5NWDhRWFAgY2FuIGJlCj4+IGFkZGVk
IG9uY2UgdGhlIG5lY2Vzc2FyeSBzeXN0ZW0gY29udHJvbGxlciBiaXRzIGFyZSBpbiB2aWEKPj4g
bWl4ZWxfZHBoeV9kZXZkYXRhLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8
YWd4QHNpZ3hjcHUub3JnPgo+PiBDby1kZXZlbG9wZWQtYnk6IFJvYmVydCBDaGlyYXMgPHJvYmVy
dC5jaGlyYXNAbnhwLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0
LmNoaXJhc0BueHAuY29tPgo+PiBSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPgo+PiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IAo+IFdvdWxkIHlvdSBoYXZlIGFueSBjb21tZW50cyBvbiB0aGlzIHNlcmllcywgcGxlYXNl
PwoKSSBkb24ndCBoYXZlIGFueSBjb21tZW50cy4gSSdsbCBxdWV1ZSB0aGlzIG9uY2UgSSBzdGFy
dCBxdWV1aW5nIHBhdGNoZXMgZm9yIHRoZQpuZXh0IG1lcmdlIHdpbmRvdy4KClRoYW5rcwpLaXNo
b24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK

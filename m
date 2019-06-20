From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v11 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Date: Thu, 20 Jun 2019 14:18:53 +0530
Message-ID: <9a872f5b-1544-32a0-bd93-1d6333468114@ti.com>
References: <cover.1557657814.git.agx@sigxcpu.org>
 <2000bc4564175abd7966207a5e9fbb9bb7d82059.1557657814.git.agx@sigxcpu.org>
 <CAOMZO5BaFYJxh1v46n2mdPyc+-jg6LgvoGR1rTE+yHZg_0Z8PA@mail.gmail.com>
 <69fcb327-8b51-df9e-12d9-d75751974bce@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <69fcb327-8b51-df9e-12d9-d75751974bce@ti.com>
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

SGksCgpPbiAyNC8wNS8xOSA5OjMxIFBNLCBLaXNob24gVmlqYXkgQWJyYWhhbSBJIHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDI0LzA1LzE5IDU6NTMgUE0sIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4+IEhp
IEtpc2hvbiwKPj4KPj4gT24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgNzo0OSBBTSBHdWlkbyBHw7xu
dGhlciA8YWd4QHNpZ3hjcHUub3JnPiB3cm90ZToKPj4+Cj4+PiBUaGlzIGFkZHMgc3VwcG9ydCBm
b3IgdGhlIE1peGVsIERQSFkgYXMgZm91bmQgb24gaS5NWDggQ1BVcyBidXQgc2luY2UKPj4+IHRo
aXMgaXMgYW4gSVAgY29yZSBpdCB3aWxsIGxpa2VseSBiZSBmb3VuZCBvbiBvdGhlcnMgaW4gdGhl
IGZ1dHVyZS4gU28KPj4+IGluc3RlYWQgb2YgYWRkaW5nIHRoaXMgdG8gdGhlIG53bCBob3N0IGRy
aXZlciBtYWtlIGl0IGEgZ2VuZXJpYyBQSFkKPj4+IGRyaXZlci4KPj4+Cj4+PiBUaGUgZHJpdmVy
IHN1cHBvcnRzIHRoZSBpLk1YOE1RLiBTdXBwb3J0IGZvciBpLk1YOFFNIGFuZCBpLk1YOFFYUCBj
YW4gYmUKPj4+IGFkZGVkIG9uY2UgdGhlIG5lY2Vzc2FyeSBzeXN0ZW0gY29udHJvbGxlciBiaXRz
IGFyZSBpbiB2aWEKPj4+IG1peGVsX2RwaHlfZGV2ZGF0YS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBS
b2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBS
b2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogRmFi
aW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPj4KPj4gV291bGQgeW91IGhhdmUgYW55IGNvbW1lbnRz
IG9uIHRoaXMgc2VyaWVzLCBwbGVhc2U/Cj4gCj4gSSBkb24ndCBoYXZlIGFueSBjb21tZW50cy4g
SSdsbCBxdWV1ZSB0aGlzIG9uY2UgSSBzdGFydCBxdWV1aW5nIHBhdGNoZXMgZm9yIHRoZQo+IG5l
eHQgbWVyZ2Ugd2luZG93LgoKQ2FuIHlvdSBmaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdh
cm5pbmcgYW5kIHJlcG9zdD8KV0FSTklORzogcXVvdGVkIHN0cmluZyBzcGxpdCBhY3Jvc3MgbGlu
ZXMKIzQyMDogRklMRTogZHJpdmVycy9waHkvZnJlZXNjYWxlL3BoeS1mc2wtaW14OC1taXBpLWRw
aHkuYzoyODA6CisJZGV2X2RiZygmcGh5LT5kZXYsICJoc19wcmVwYXJlOiAldSwgY2xrX3ByZXBh
cmU6ICV1LCAiCisJCSJoc196ZXJvOiAldSwgY2xrX3plcm86ICV1LCAiCgpXQVJOSU5HOiBxdW90
ZWQgc3RyaW5nIHNwbGl0IGFjcm9zcyBsaW5lcwojNDIxOiBGSUxFOiBkcml2ZXJzL3BoeS9mcmVl
c2NhbGUvcGh5LWZzbC1pbXg4LW1pcGktZHBoeS5jOjI4MToKKwkJImhzX3plcm86ICV1LCBjbGtf
emVybzogJXUsICIKKwkJImhzX3RyYWlsOiAldSwgY2xrX3RyYWlsOiAldSwgIgoKV0FSTklORzog
cXVvdGVkIHN0cmluZyBzcGxpdCBhY3Jvc3MgbGluZXMKIzQyMjogRklMRTogZHJpdmVycy9waHkv
ZnJlZXNjYWxlL3BoeS1mc2wtaW14OC1taXBpLWRwaHkuYzoyODI6CisJCSJoc190cmFpbDogJXUs
IGNsa190cmFpbDogJXUsICIKKwkJInJ4aHNfc2V0dGxlOiAldVxuIiwKClRoYW5rcwpLaXNob24K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK

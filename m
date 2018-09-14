From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/8] drm/bridge: add bus flag support
Date: Fri, 14 Sep 2018 12:35:42 +0300
Message-ID: <4703489.BS6gAglWfc@avalon>
References: <20180912183222.25414-1-stefan@agner.ch>
 <CACRpkdZdxLMkECq8BBJHDqKszHPMt2uUPFbwbPVNKXyxu-SWGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACRpkdZdxLMkECq8BBJHDqKszHPMt2uUPFbwbPVNKXyxu-SWGQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, max.krummenacher@toradex.com, Sascha Hauer <kernel@pengutronix.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, sean@poorly.run, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpPbiBGcmlkYXksIDE0IFNlcHRlbWJlciAyMDE4IDEyOjA3OjAzIEVFU1QgTGludXMg
V2FsbGVpaiB3cm90ZToKPiBPbiBXZWQsIFNlcCAxMiwgMjAxOCBhdCA4OjMyIFBNIFN0ZWZhbiBB
Z25lciA8c3RlZmFuQGFnbmVyLmNoPiB3cm90ZToKPiA+IEBMaW51cyBXYWxsZWlqLCBMYXVyZW50
IFBpbmNoYXJ0OiBTaW5jZSB5b3UgaGF2ZSBiZWVuIGludm9sdmVkIGluCj4gPiB0aGUgaW5pdGlh
bCBidXMgdGltaW5ncyBkaXNjdXNzaW9uLCBJIHdvdWxkIGxpa2UgdG8gaGF2ZSB5b3VyIEFjawo+
ID4gb24gYXQgbGVhc3QgcGF0Y2ggMi8zLi4uIElmIHdlIHdhbnQgdG8ga2VlcCB0aGUgc2V0dXAv
aG9sZCB0aW1pbmdzLAo+ID4gdGhlIHBhdGNoc2V0IHNob3VsZCBhbHNvIHdvcmsgd2l0aG91dCB0
aG9zZSB0d28gcGF0Y2hlcy4KPiAKPiBBRkFJQ1QgdGhpcyBlbmRzIHVwIHdpdGggdGhlIFBMMTEx
IGNvZGUgaWRlbnRpY2FsIHRvIHdoYXQgSQo+IHByb3Bvc2VkIGluIG15IGZpcnN0IHBhdGNoIHNl
dCB0byBzdXBwb3J0IHRoZSBsYXRjaGluZyBwcm9wZXJseSwKPiBzbyBJIGFtIHByZXR0eSBtdWNo
IGhhcHB5IGFzIGxvbmcgYXMgbXkgaGFyZHdhcmUgZG9lcyBub3QKPiBmbGlja2VyLiAoUm91Z2gg
Y29uc2Vuc3VzIGFuZCBydW5uaW5nIGNvZGUuKSBJJ20gbm90IHZlcnkgaW52ZXN0ZWQKPiBpbiBl
aXRoZXIgaWRlYSB0byByZXByZXNlbnQgdGhlc2UgdGltaW5ncywgc28KPiBBY2tlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKSSd2ZSBqdXN0IHJlcGxpZWQg
dG8gcGF0Y2ggMy84IHdpdGggYW4gZXhwbGFuYXRpb24gb2Ygd2h5IHdlIGhhdmUgYWRkZWQgdGhp
cyAKcGFydGljdWxhciBBUEksIGFuZCB3aHkgd2UgbmVlZCB0byBrZWVwIGl0LgoKLS0gClJlZ2Fy
ZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=

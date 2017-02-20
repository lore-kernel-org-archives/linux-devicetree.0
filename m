From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/9] gpu: ipu-v3: remove AXI ID setting for IC channel
Date: Mon, 20 Feb 2017 14:04:10 +0100
Message-ID: <1487595850.3878.3.camel@pengutronix.de>
References: <20170217182830.32618-1-l.stach@pengutronix.de>
 <20170217182830.32618-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170217182830.32618-2-l.stach@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE3LTAyLTE3IGF0IDE5OjI4ICswMTAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGlzIGlzIGEgcHJldHR5IG1pbm9yIG9wdGltaXphdGlvbiBmb3IgdGhlIElDIGNoYW5uZWwgdG8g
Z2V0Cj4gb3V0LW9mLW9yZGVyIEFYSSByZXR1cm5zLCBidXQgY2xhc2hlcyB3aXRoIHRoZSBBWEkg
SUQgYXNzaWdubWVudAo+IHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBmb3IgdGhlIGRpc3BsYXkgY2hh
bm5lbHMgb24gUXVhZFBsdXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3Rh
Y2hAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2Ut
Y29udmVydC5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMgYi9kcml2
ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYwo+IGluZGV4IDgwNWI2ZmE3YjVmNC4u
NWUzY2M2YmQ5OGZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2Ut
Y29udmVydC5jCj4gKysrIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMK
PiBAQCAtNjcxLDggKzY3MSw2IEBAIHN0YXRpYyB2b2lkIGluaXRfaWRtYWNfY2hhbm5lbChzdHJ1
Y3QgaXB1X2ltYWdlX2NvbnZlcnRfY3R4ICpjdHgsCj4gIAlpcHVfaWNfdGFza19pZG1hX2luaXQo
Y2hhbi0+aWMsIGNoYW5uZWwsIHdpZHRoLCBoZWlnaHQsCj4gIAkJCSAgICAgIGJ1cnN0X3NpemUs
IHJvdF9tb2RlKTsKPiAgCj4gLQlpcHVfY3BtZW1fc2V0X2F4aV9pZChjaGFubmVsLCAxKTsKPiAt
CgpUaGUgSUMgSURNQUMgY2hhbm5lbHMgd2VyZSBzZXQgdG8gQVhJIElEIDEgdG8gYXZvaWQgc3Rh
cnZpbmcgdGhlIHNjYW5vdXQKY2hhbm5lbHMuIEFYSSBJRCAwIGlzIHNldCB0byB0aGUgaGlnaGVz
dCBRb1MgcHJpb3JpdHkgaW4gaW14NnFfYXhpX2luaXQsCkFYSSBJRCAxIGlzIHNldCBzbGlnaHRs
eSBsb3dlciBmb3IgdGhhdCByZWFzb24uIFRoaXMgc2hvdWxkIGJlIGtlcHQgZm9yCmFsbCB0aGUg
bm9uLXBsdXMgbW9kZWxzLgoKPiAgCWlwdV9pZG1hY19zZXRfZG91YmxlX2J1ZmZlcihjaGFubmVs
LCBjdHgtPmRvdWJsZV9idWZmZXJpbmcpOwo+ICB9Cj4gIAoKcmVnYXJkcwpQaGlsaXBwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

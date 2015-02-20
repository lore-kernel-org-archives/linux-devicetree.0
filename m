From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate
 if no bestdiv is normally found
Date: Fri, 20 Feb 2015 19:20:43 +0000
Message-ID: <20150220192043.GM8656@n2100.arm.linux.org.uk>
References: <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com>
 <20150212093356.GR12209@pengutronix.de>
 <20150212103944.GA1290@victor>
 <20150212122405.GW12209@pengutronix.de>
 <20150212125646.GT8656@n2100.arm.linux.org.uk>
 <20150212134131.GX12209@pengutronix.de> <54DE0BB8.7070004@ti.com>
 <20150213185713.GA12209@pengutronix.de>
 <20150216112724.GN8656@n2100.arm.linux.org.uk>
 <20150220191306.421.58746@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20150220191306.421.58746@quantum>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@pengutronix.de, andy.yan@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBGZWIgMjAsIDIwMTUgYXQgMTE6MTM6MDZBTSAtMDgwMCwgTWlrZSBUdXJxdWV0dGUg
d3JvdGU6Cj4gUXVvdGluZyBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggKDIwMTUtMDItMTYgMDM6
Mjc6MjQpCj4gPiBPbiBGcmksIEZlYiAxMywgMjAxNSBhdCAwNzo1NzoxM1BNICswMTAwLCBTYXNj
aGEgSGF1ZXIgd3JvdGU6Cj4gPiA+IEkgYWdyZWUgdGhhdCBpdCdzIGEgYml0IG9kZCwgYnV0IEkg
dGhpbmsgaXQgaGFzIHRvIGJlIGxpa2UgdGhpcy4KPiA+ID4gQ29uc2lkZXIgdGhhdCB5b3UgcmVx
dWVzdCBhIHJhdGUgb2YgMTAwSHosIGJ1dCB0aGUgY2xvY2sgY2FuIG9ubHkKPiA+ID4gcHJvZHVj
ZSA5OS41SHosIHNvIGR1ZSB0byByb3VuZGluZyBjbGtfcm91bmRfcmF0ZSgpIHJldHVybnMgOTlI
ei4KPiA+ID4gTm93IHdoZW4geW91IHJlcXVlc3QgOTlIeiBmcm9tIGNsa19zZXRfcmF0ZSgpIHRo
ZSA5OS41SHogdmFsdWUKPiA+ID4gY2FuJ3QgYmUgdXNlZCBiZWNhdXNlIGl0J3MgdG9vIGhpZ2gu
Cj4gPiAKPiA+IE1hdGggcm91bmRpbmcgcnVsZXMgbm9ybWFsbHkgc3RhdGUgdGhhdCBhbnl0aGlu
ZyBvZiAuNSBhbmQgZ3JlYXRlcgo+ID4gc2hvdWxkIGJlIHJvdW5kZWQgdXAsIG5vdCByb3VuZGVk
IGRvd24uICBTbywgZm9yIDk5LjVIeiwgeW91IHJlYWxseQo+ID4gb3VnaHQgdG8gYmUgcmV0dXJu
aW5nIDEwMEh6LCBub3QgOTlIei4KPiA+IAo+ID4gSG93ZXZlciwgeW91IGRvIGhhdmUgYSBwb2lu
dCBmb3IgOTkuNEh6LCB3aGljaCB3b3VsZCBiZSByZXR1cm5lZCBhcwo+ID4gOTlIeiwgYW5kIHdo
ZW4gc2V0LCBpdCB3b3VsZCByZXN1bHQgaW4gc29tZXRoaW5nIHdoaWNoIGlzbid0IDk5LjRIei4K
PiAKPiBNb3JlIHByYWN0aWNhbGx5LCB0aGlzIGFnYWluIHJhaXNlcyB0aGUgaXNzdWUgb2Ygd2hl
dGhlciBvciBub3QgdW5zaWduZWQKPiBsb25nIHJhdGUgc2hvdWxkIGJlIGluIG1pbGxpaGVydHog
b3Igc29tZXRoaW5nIG90aGVyIHRoYW4gaGVydHouCgpZb3Ugc3RpbGwgZ2V0IHRoZSBzYW1lIGlz
c3VlIGlmIGl0J3MgbWlsbGloZXJ0ei4gIFRha2UgMTAgMi8zcmRzIEh6LgpJcyAxMC42NjYgSHog
bGVzcyB0aGFuIDEwIDIvM3JkcyBIej8KCi0tIApGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBs
aW5lOiBjdXJyZW50bHkgYXQgMTAuNU1icHMgZG93biA0MDBrYnBzIHVwCmFjY29yZGluZyB0byBz
cGVlZHRlc3QubmV0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=

From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate
 if no bestdiv is normally found
Date: Fri, 13 Feb 2015 19:57:13 +0100
Message-ID: <20150213185713.GA12209@pengutronix.de>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
 <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com>
 <20150212093356.GR12209@pengutronix.de>
 <20150212103944.GA1290@victor>
 <20150212122405.GW12209@pengutronix.de>
 <20150212125646.GT8656@n2100.arm.linux.org.uk>
 <20150212134131.GX12209@pengutronix.de> <54DE0BB8.7070004@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <54DE0BB8.7070004@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, mturquette@linaro.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kernel@pengutronix.de, andy.yan@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBGZWIgMTMsIDIwMTUgYXQgMDQ6MzU6MzZQTSArMDIwMCwgVG9taSBWYWxrZWluZW4g
d3JvdGU6Cj4gT24gMTIvMDIvMTUgMTU6NDEsIFNhc2NoYSBIYXVlciB3cm90ZToKPiAKPiA+IFRv
bWlzIHBhdGNoIGlzIGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgY2xrX3NldF9yYXRlKGNs
a19yb3VuZF9yYXRlKHJhdGUpKQo+ID4gaXMgZXF1YWwgdG8gY2xrX3JvdW5kX3JhdGUocmF0ZSku
IFNvIHdoZW4gdGhpcyBhc3N1bXB0aW9uIGlzIHdyb25nIHRoZW4KPiA+IGl0IHNob3VsZCBzaW1w
bHkgYmUgcmV2ZXJ0ZWQuCj4gCj4gV2hlbiBpcyBpdCBub3QgZXF1YWw/Cj4gCj4gSSBhZ3JlZSB0
aGF0IGRvaW5nIGNsa19zZXRfcmF0ZShjbGssIGNsa19yb3VuZF9yYXRlKGNsaywgcmF0ZSkpIGlz
Cj4gcG9pbnRsZXNzLCBidXQgc2hvdWxkbid0IGl0IHN0aWxsIHdvcms/Cj4gCj4gQW5kIHdlIGNh
biBmb3JnZXQgYWJvdXQgY2xrX3JvdW5kX3JhdGUuIFdpdGhvdXQgbXkgcGF0Y2gsIHRoaXMgd291
bGQKPiBiZWhhdmUgb2RkbHkgYWxzbzoKPiAKPiByYXRlID0gY2xrX2dldF9yYXRlKGNsayk7Cj4g
Y2xrX3NldF9yYXRlKGNsaywgcmF0ZSk7Cj4gCj4gVGhlIGVuZCByZXN1bHQgY291bGQgYmUgc29t
ZXRoaW5nIGVsc2UgdGhhbiAncmF0ZScuCgpJIGFncmVlIHRoYXQgaXQncyBhIGJpdCBvZGQsIGJ1
dCBJIHRoaW5rIGl0IGhhcyB0byBiZSBsaWtlIHRoaXMuCkNvbnNpZGVyIHRoYXQgeW91IHJlcXVl
c3QgYSByYXRlIG9mIDEwMEh6LCBidXQgdGhlIGNsb2NrIGNhbiBvbmx5CnByb2R1Y2UgOTkuNUh6
LCBzbyBkdWUgdG8gcm91bmRpbmcgY2xrX3JvdW5kX3JhdGUoKSByZXR1cm5zIDk5SHouCk5vdyB3
aGVuIHlvdSByZXF1ZXN0IDk5SHogZnJvbSBjbGtfc2V0X3JhdGUoKSB0aGUgOTkuNUh6IHZhbHVl
CmNhbid0IGJlIHVzZWQgYmVjYXVzZSBpdCdzIHRvbyBoaWdoLgoKU2FzY2hhCgotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKUGVpbmVyIFN0ci4gNi04LCAzMTEzNyBIaWxk
ZXNoZWltLCBHZXJtYW55IHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

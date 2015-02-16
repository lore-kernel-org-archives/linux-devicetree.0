From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RFC v9 01/20] clk: divider: Correct parent clk round rate
 if no bestdiv is normally found
Date: Mon, 16 Feb 2015 11:27:24 +0000
Message-ID: <20150216112724.GN8656@n2100.arm.linux.org.uk>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
 <1423720903-24806-2-git-send-email-Ying.Liu@freescale.com>
 <20150212093356.GR12209@pengutronix.de>
 <20150212103944.GA1290@victor>
 <20150212122405.GW12209@pengutronix.de>
 <20150212125646.GT8656@n2100.arm.linux.org.uk>
 <20150212134131.GX12209@pengutronix.de> <54DE0BB8.7070004@ti.com>
 <20150213185713.GA12209@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20150213185713.GA12209@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, mturquette@linaro.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@pengutronix.de, andy.yan@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBGZWIgMTMsIDIwMTUgYXQgMDc6NTc6MTNQTSArMDEwMCwgU2FzY2hhIEhhdWVyIHdy
b3RlOgo+IEkgYWdyZWUgdGhhdCBpdCdzIGEgYml0IG9kZCwgYnV0IEkgdGhpbmsgaXQgaGFzIHRv
IGJlIGxpa2UgdGhpcy4KPiBDb25zaWRlciB0aGF0IHlvdSByZXF1ZXN0IGEgcmF0ZSBvZiAxMDBI
eiwgYnV0IHRoZSBjbG9jayBjYW4gb25seQo+IHByb2R1Y2UgOTkuNUh6LCBzbyBkdWUgdG8gcm91
bmRpbmcgY2xrX3JvdW5kX3JhdGUoKSByZXR1cm5zIDk5SHouCj4gTm93IHdoZW4geW91IHJlcXVl
c3QgOTlIeiBmcm9tIGNsa19zZXRfcmF0ZSgpIHRoZSA5OS41SHogdmFsdWUKPiBjYW4ndCBiZSB1
c2VkIGJlY2F1c2UgaXQncyB0b28gaGlnaC4KCk1hdGggcm91bmRpbmcgcnVsZXMgbm9ybWFsbHkg
c3RhdGUgdGhhdCBhbnl0aGluZyBvZiAuNSBhbmQgZ3JlYXRlcgpzaG91bGQgYmUgcm91bmRlZCB1
cCwgbm90IHJvdW5kZWQgZG93bi4gIFNvLCBmb3IgOTkuNUh6LCB5b3UgcmVhbGx5Cm91Z2h0IHRv
IGJlIHJldHVybmluZyAxMDBIeiwgbm90IDk5SHouCgpIb3dldmVyLCB5b3UgZG8gaGF2ZSBhIHBv
aW50IGZvciA5OS40SHosIHdoaWNoIHdvdWxkIGJlIHJldHVybmVkIGFzCjk5SHosIGFuZCB3aGVu
IHNldCwgaXQgd291bGQgcmVzdWx0IGluIHNvbWV0aGluZyB3aGljaCBpc24ndCA5OS40SHouCgot
LSAKRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZTogY3VycmVudGx5IGF0IDEwLjVNYnBz
IGRvd24gNDAwa2JwcyB1cAphY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

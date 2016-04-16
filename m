From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 1/9] ARM: imx: clk-vf610: fix DCU clock tree
Date: Fri, 15 Apr 2016 17:31:28 -0700
Message-ID: <20160416003128.GJ26353@codeaurora.org>
References: <1459834121-25997-1-git-send-email-stefan@agner.ch>
 <1459834121-25997-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1459834121-25997-2-git-send-email-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>
Cc: jianwei.wang.chn@gmail.com, meng.yi@nxp.com, pawel.moll@arm.com, alison.wang@freescale.com, daniel.vetter@ffwll.ch, mturquette@baylibre.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, mark.rutland@arm.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, alexander.stein@systec-electronic.com
List-Id: devicetree@vger.kernel.org

T24gMDQvMDQsIFN0ZWZhbiBBZ25lciB3cm90ZToKPiBTaW1pbGFyIHRvIGFuIGVhcmxpZXIgZml4
IGZvciB0aGUgU0FJIGNsb2NrcywgdGhlIERDVSBjbG9jayBoaWVyYXJjaHkKPiBtaXhlcyB0aGUg
YnVzIGNsb2NrIHdpdGggdGhlIGRpc3BsYXkgY29udHJvbGxlcnMgcGl4ZWwgY2xvY2suIFRlc3Rz
Cj4gaGF2ZSBzaG93biB0aGF0IHRoZSBnYXRlcyBpbiBDQ01fQ0NHUjMvOSByZWdpc3RlcnMgZG8g
bm90IGNvbnRyb2wKPiB0aGUgRENVIHBpeGVsIGNsb2NrLCBidXQgb25seSB0aGUgcmVnaXN0ZXIg
YWNjZXNzIGNsb2NrIChidXMgY2xvY2spLgo+IAo+IEZpeCB0aGlzIGJ5IGRlZmluaW5nIHRoZSBw
YXJlbnQgY2xvY2sgb2YgVkY2MTBfQ0xLX0RDVXggdG8gYmUgdGhlIGJ1cwo+IGNsb2NrIChpcGdf
YnVzKS4KPiAKPiBTaW5jZSB0aGUgY2xvY2sgaGFzIG5vdCBiZWVuIHVzZWQgZmFyLCB0aGVyZSBh
cmUgbm8gZnVydGhlciBjaGFuZ2VzCj4gbmVlZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
biBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+IC0tLQoKQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8
c2JveWRAY29kZWF1cm9yYS5vcmc+CgotLSAKUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBD
b2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

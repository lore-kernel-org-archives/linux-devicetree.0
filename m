From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/6] clk: sunxi-ng: set the parent rate when adjustin CPUX
 clock on A33
Date: Wed, 14 Dec 2016 04:54:14 +0800
Message-ID: <306991481662454@web33j.yandex.ru>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-3-icenowy@aosc.xyz>
 <20161213154451.y4wcrqhtcc5sqli7@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213154451.y4wcrqhtcc5sqli7@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Quentin Schulz <quentin.schulz@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org

CgoxMy4xMi4yMDE2LCAyMzo0NCwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gT24gVHVlLCBEZWMgMTMsIDIwMTYgYXQgMTE6MjI6NDhQTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gwqBUaGUgQ1BVWCBjbG9jayBvbiBBMzMsIHdoaWNo
IGlzIGZvciB0aGUgQ29ydGV4LUE3IGNvcmVzLCBpcyBkZXNpZ25lZCB0bwo+PiDCoGJlIGNoYW5n
ZWFibGUgYnkgY2hhbmdpbmcgdGhlIHJhdGUgb2YgUExMX0NQVVguCj4+Cj4+IMKgQWRkIENMS19T
RVRfUkFURV9QQVJFTlQgZmxhZyB0byB0aGlzIGNsb2NrLgo+Pgo+PiDCoFNpZ25lZC1vZmYtYnk6
IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4KPiBBY2tlZC1ieTogTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+CgpFeGN1c2UgbWUsIGhhdmUg
eW91IG1lcmdlZCB0aGlzIHBhdGNoPwoKSWYgbWVyZ2VkLCBJIHdvbid0IGNvbnRhaW4gaXQgaW4g
bXkgUEFUQ0ggdjIsIHRodXMgdGhlIFBBVENIIHYyIHdpbGwgY29udGFpbgpvbmx5IGFuIHVwZGF0
ZWQgT1BQIHBhdGNoLgoKPgo+IFRoYW5rcyEKPiBNYXhpbWUKPgo+IC0tCj4gTWF4aW1lIFJpcGFy
ZCwgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 0/7] Timer & SPI support for Allwinner suniv F1C100s
Date: Mon, 18 Mar 2019 09:04:39 +0100
Message-ID: <c741ed1a-ef02-c7c9-846b-c5240c8d07b6@linaro.org>
References: <cover.1549875778.git.mesihkilinc@gmail.com>
 <2485e6c52810df376a0df6eb7f749f35b7b19044.camel@aosc.xyz>
 <177e2598-3491-03af-8638-c60e77cc4a34@linaro.org>
 <8e1cf9c7111a423ce7cc32a6759d16e4197b87d9.camel@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8e1cf9c7111a423ce7cc32a6759d16e4197b87d9.camel@aosc.xyz>
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
To: Icenowy Zheng <icenowy@aosc.xyz>, Thomas Gleixner <tglx@linutronix.de>, Mesih Kilinc <mesihkilinc@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

T24gMTgvMDMvMjAxOSAwODoxOCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAxOS0wMy0x
N+aXpeeahCAyMTo1MiArMDEwMO+8jERhbmllbCBMZXpjYW5v5YaZ6YGT77yaCj4+IE9uIDE3LzAz
LzIwMTkgMTg6MzksIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+PiDlnKggMjAxOS0wMi0xMeS4gOea
hCAxMjoyMSArMDMwMO+8jE1lc2loIEtpbGluY+WGmemBk++8mgo+Pj4+IFRoaXMgaXMgZm9sbG93
dXAgc2VyaWVzIGZvciBGMUMxMDBzIGluaXRpYWwgc3VwcG9ydCBwYXRjaHNldC4gCj4+Pj4gQWxs
IHBhdGNoZXMgbWVyZ2VkIGV4Y2VwdCBwYXRjaCAxIH4gMiB3aGljaCBpcyByZWxhdGVkIHRvIHRp
bWVyLgo+Pj4+IEkgYW0gcmVzZW5kaW5nIHRob3NlIHNpbmNlIHRoZXkgYXJlIGFscmVhZHkgaGF2
ZSBBY2tlZCB0YWdzLgo+Pj4KPj4+IFBpbmcuCj4+Pgo+Pj4gQ291bGQgeW91IHBsZWFzZSBtZXJn
ZSB0aGVzZSB0aW1lci1yZWxhdGVkIHBhdGNoZXM/Cj4+Cj4+IEhpLAo+Pgo+PiBJIGFja2VkIHRo
ZSB0aW1lci1yZWxhdGVkIHBhdGNoZXMuIElmIHlvdSByZXNlbmQgdGhlIHBhdGNoZXMgd2l0aCBt
eQo+PiBhY2tlZC1ieSBJIHdpbGwgY29uc2lkZXIgdGhlbSB0byBnbyB0aHJvdWdoIHRoZSBhbGx3
aW5uZXIgdHJlZS4KPj4KPj4gRG8geW91IHdhbnQgbWUgdG8gdGFrZSAxIGFuZCAyIHRocm91Z2gg
bXkgdHJlZT8KPiAKPiBQbGVhc2UuIFRoZXkgYWxzbyBoYXZlIHRoZSBBQ0sgZnJvbSBBbGx3aW5u
ZXIvc3VuWGkgbWFpbnRhaW5lci4KCkFwcGxpZWQgZm9yIDUuMi4gVGhhbmtzCgpCeSB0aGUgd2F5
LCBJIGRpZCBub3QgZmluZCBhbnkgdHJhY2Ugb2YgdGhlIGVtYWlsIGluIG15IG1haWxlciwgd2Fz
IEkKVG8nZWQgb3IgQ0MnZWQgZm9yIHRob3NlIHBhdGNoZXMgPwoKCi0tIAogPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

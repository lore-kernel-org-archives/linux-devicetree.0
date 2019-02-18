From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 11/17 v1] clocksource/drivers/ixp4xx: Add DT bindings
Date: Mon, 18 Feb 2019 23:10:19 +0100
Message-ID: <555a839d-3e84-9ba3-271a-4564df0f8e23@linaro.org>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
 <20190203214205.13594-12-linus.walleij@linaro.org>
 <CAL_JsqKd=93Xkp4OAu9GxMMqLrzYWTmr2rv=-NsDnqxMmSavYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKd=93Xkp4OAu9GxMMqLrzYWTmr2rv=-NsDnqxMmSavYA@mail.gmail.com>
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
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tim Harvey <tharvey@gateworks.com>, Krzysztof Halasa <khalasa@piap.pl>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMTgvMDIvMjAxOSAyMjoyNiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gU3VuLCBGZWIgMywg
MjAxOSBhdCAzOjQyIFBNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4g
d3JvdGU6Cj4+Cj4+IFRoaXMgYWRkcyBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIEludGVs
IElYUDR4eAo+PiB0aW1lcnMuCj4+Cj4+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNh
bm9AbGluYXJvLm9yZz4KPj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRl
Pgo+PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gQ2xvY2tzb3Vy
Y2UvdGltZXIgbWFpbnRhaW5lcnM6IEkgYW0gcmVxdWVzdGluZyBhbiBBQ0sgZm9yCj4+IHRoaXMg
b25jZSB5b3UncmUgaGFwcHkgd2l0aCB0aGUgYmluZGluZ3MsIGFzIEkgaW50ZW5kIHRvCj4+IG1l
cmdlIGFsbCBvZiB0aGlzIElYUDR4eCByZXdvcmsgdGhyb3VnaCBBUk0gU29DLgo+PiAtLS0KPj4g
IC4uLi9iaW5kaW5ncy90aW1lci9pbnRlbCxpeHA0eHgtdGltZXIudHh0ICAgICAgfCAxOCArKysr
KysrKysrKysrKysrKysKPj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGlt
ZXIvaW50ZWwsaXhwNHh4LXRpbWVyLnR4dAo+IAo+IFNhbWUgd2lzaCBhbmQgY29tbWVudHMgaGVy
ZS4uLgo+IAo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKVGhh
bmtzLAoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3Jn
PgoKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZh
Y2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8j
IS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9n
Lz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK

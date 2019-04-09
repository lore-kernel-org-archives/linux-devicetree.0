From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/12] arm64: dts: allwinner: orange-pi-3: Enable ethernet
Date: Tue, 9 Apr 2019 09:35:02 +0200
Message-ID: <CACRpkdYGdLEeX8aBJfPQg=8OHcQR_uTJoA1FaO5p1od+VX2Nzg__49750.3427135356$1554795329$gmane$org@mail.gmail.com>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-8-megous@megous.com>
 <20190408074042.74s5qckukcpore3e@flea>
 <20190408232232.fsl2ddthwo2rr4ql@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190408232232.fsl2ddthwo2rr4ql@core.my.home>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, Naveen Gupta <naveen.gupta@cypress.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>open l
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBBcHIgOSwgMjAxOSBhdCAxOjIyIEFNIE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVn
b3VzLmNvbT4gd3JvdGU6Cgo+ID4gPiArICAgICAgICAgICAgICAgIGVuYWJsZS1hY3RpdmUtaGln
aDsKPiA+ID4gKyAgICAgICAgICAgICAgICBncGlvID0gPCZwaW8gMyA2IEdQSU9fQUNUSVZFX0hJ
R0g+OyAvKiBQRDYgKi8KPiA+Cj4gPiBJcyBlbmFibGUtYWN0aXZlLWhpZ2ggc3RpbGwgbmVlZGVk
PyBJdCdzIHJlZHVuZGFudCB3aXRoIHRoZQo+ID4gR1BJT19BQ1RJVkVfSElHSCBmbGFnLgo+Cj4g
TG9va2luZyBhdCB0aGUgY29kZSwgdXNlL25vbi11c2Ugb2YgZW5hYmxlLWFjdGl2ZS1oaWdoIGlu
aGliaXRzCj4gZmxhZ3Mgc3BlY2lmaWVkIGluIGdwaW8gcHJvcGVydHkuIFNvIHRoZSBHUElPX0FD
VElWRV9ISUdIIGZsYWcKPiBpcyBpZ25vcmVkIGhlcmUgKGhhZCBHUElPX0FDVElWRV9MT1cgYmVl
biB1c2VkLCB0aGUga2VybmVsIHdvdWxkCj4gaWdub3JlIGl0IHRvbyBhbmQgcHJpbnQgYSB3YXJu
aW5nKS4KPgo+IFNvIGVuYWJsZS1hY3RpdmUtaGlnaCBpcyBzdGlsbCBuZWNlc3NhcnkgaGVyZS4K
Pgo+IFNlZSBjb21tZW50IGluIGdwaW9saWItb2YuYyB3aGVyZSB0aGlzIGlzIGhhbmRsZWQ6Cj4K
PiAvKgo+ICAqIFRoZSByZWd1bGF0b3IgR1BJTyBoYW5kbGVzIGFyZSBzcGVjaWZpZWQgc3VjaCB0
aGF0IHRoZQo+ICAqIHByZXNlbmNlIG9yIGFic2VuY2Ugb2YgImVuYWJsZS1hY3RpdmUtaGlnaCIg
c29sZWx5IGNvbnRyb2xzCj4gICogdGhlIHBvbGFyaXR5IG9mIHRoZSBHUElPIGxpbmUuIEFueSBw
aGFuZGxlIGZsYWdzIG11c3QKPiAgKiBiZSBhY3RpdmVseSBpZ25vcmVkLgo+ICAqLwoKWWVhaCB0
aGlzIGNhdXNlZCBtZSBzcGVjaWFsIGhlYWRhY2hlIGluIHRoZSBjdXJyZW50IG1lcmdlCndpbmRv
dyBiZWNhdXNlIG9mIGJ1Z2d5IGNvZGUgb24gbXkgcGFydC4KClRoaXMgaXMgYW4gZWZmZWN0IG9m
IHRoaXMgZmxhZyBiZWluZyBkZWZpbmVkIGZvciBwb3dlcnBjCmFnZXMgYmVmb3JlIHdlIHByb3Bl
cmx5IGltcGxlbWVudGVkIGdlbmVyaWMgR1BJTwpiaW5kaW5ncy4gV2UganVzdCBoYXZlIHRvIHJl
c3BlY3QgaXQuCgpTZWU6Cmh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWdwaW8mbT0xNTU0MTc3
NzQ4MjI1MzImdz0yCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

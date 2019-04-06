From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 06/12] net: stmmac: sun8i: force select external PHY when
 no internal one
Date: Sat, 6 Apr 2019 13:24:26 +0300
Message-ID: <36e1e65b-5a8f-f8ae-6c33-07c30beada17@cogentembedded.com>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-7-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190405234514.6183-7-megous@megous.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: megous@megous.com, linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, dri-devel@lists.freedesktop.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, brcm80211-dev-list@cypress.com, Jose Abreu <joabreu@synopsys.com>, Naveen Gupta <naveen.gupta@cypress.com>, Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, Arend van Spriel <arend.vanspriel@broadcom.com>, Alexandre Torgue <alexandre.torgue@st.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, Wright Feng <wright.feng@cypress.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, Maxime Coquelin <mcoquelin.stm32@gmail.co>
List-Id: devicetree@vger.kernel.org

SGVsbG8hCgpPbiAwNi4wNC4yMDE5IDI6NDUsIG1lZ291c0BtZWdvdXMuY29tIHdyb3RlOgoKPiBG
cm9tOiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gCj4gVGhlIFBIWSBzZWxlY3Rp
b24gYml0IGFsc28gZXhpc3RzIG9uIFNvQ3Mgd2l0aG91dCBhbiBpbnRlcm5hbCBQSFk7IGlmCj4g
aXQncyBzZXQgdG8gMSAoaW50ZXJuYWwgUEhZKSB0aGVuIHRoZSBNQUMgd2lsbCBub3QgbWFrZSB1
c2Ugb2YgYW55IFBIWS4KPiAKPiBUaGlzIHByb2JsZW0gYXBwZWFycyB3aGVuIGFkYXB0aW5nIGZv
ciBINiwgd2hpY2ggaGFzIG5vIHJlYWwgaW50ZXJuYWwKPiBQSFkgKHRoZSAiaW50ZXJuYWwgUEhZ
IiBvbiBINiBpcyBub3Qgb24tZGllLCBidXQgb24gYSBjby1wYWNrYWdlZCBBQzIwMAo+IGNoaXAs
IHZpYSBSTUlJIGludGVyZmFjZSBhdCBHUElPIGJhbmsgQSksIGJ1dCB0aGUgUEhZIHNlbGVjdGlv
biBiaXQgaXMKPiBzZXQuCj4gCj4gRm9yY2UgdGhlIFBIWSBzZWxlY3Rpb24gYml0IHRvIDAgd2hl
biBubyBleHRlcm5hbCBQSFkgdG8gc2VsZWN0IHRoaXMKPiBwcm9ibGVtLgoKICAgICJTZWxlY3Qg
dGhpcyBwcm9ibGVtIiBzb3VuZCB3ZWlyZC4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpo
ZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtc3VuOGkuYwo+IGluZGV4IGUzZTNkYzQ0YjMzYi4uYmQzNDBlNzdiMmVhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1
bjhpLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1z
dW44aS5jCj4gQEAgLTkwOCw2ICs5MDgsMTEgQEAgc3RhdGljIGludCBzdW44aV9kd21hY19zZXRf
c3lzY29uKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikKPiAgIAkJICogYWRkcmVzcy4gTm8gbmVl
ZCB0byBtYXNrIGl0IGFnYWluLgo+ICAgCQkgKi8KPiAgIAkJcmVnIHw9IDEgPDwgSDNfRVBIWV9B
RERSX1NISUZUOwo+ICsJfSBlbHNlIHsKPiArCQkvKiBGb3IgU29DcyB3aXRob3V0IGludGVybmFs
IFBIWSB0aGUgUEhZIHNlbGVjdGlvbiBiaXQgc2hvdWxkIGJlCj4gKwkJICogc2V0IHRvIDAgKGV4
dGVybmFsIFBIWSkuCj4gKwkJICovCj4gKwkJcmVnICY9IH4oSDNfRVBIWV9TRUxFQ1QpOwogICAg
Tm8gKCkgc2hvdWxkIGJlIG5lZWRlZCBoZXJlLCBhZGQgKCkgYXJvdW5kIHRoZSBtYWNybyBib2R5
IGlmIHN0aWxsIG5lZWRlZC4KClsuLi5dCgpNQlIsIFNlcmdlaQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

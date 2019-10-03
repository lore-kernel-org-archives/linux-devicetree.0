From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/5] net: ethernet: stmmac: fix warning when w=1 option is
 used during build
Date: Thu, 3 Oct 2019 12:14:06 +0200
Message-ID: <3715b72a-4b7c-32f4-a037-94d2862ad07d@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
 <20190920053817.13754-3-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920053817.13754-3-christophe.roullier@st.com>
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
To: Christophe Roullier <christophe.roullier@st.com>, robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiA5LzIwLzE5IDc6MzggQU0sIENocmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4gVGhp
cyBwYXRjaCBmaXggdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+IAo+IHdhcm5pbmc6IHZhcmlhYmxl
IOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+
ICAgIGludCB2YWwsIHJldDsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVy
IDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4KPiAtLS0KCkFja2VkLWJ5OiBBbGV4YW5kcmUg
VE9SR1VFIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KCj4gICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jIHwgNiArKystLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCj4gaW5kZXggN2U2NjE5
ODY4Y2MxLi4xNjdhNWU5OTk2MGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPiBAQCAtMTg0LDcgKzE4NCw3IEBAIHN0YXRp
YyBpbnQgc3RtMzJtcDFfc2V0X21vZGUoc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0
X2RhdCkKPiAgIHsKPiAgIAlzdHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJz
cF9wcml2Owo+ICAgCXUzMiByZWcgPSBkd21hYy0+bW9kZV9yZWc7Cj4gLQlpbnQgdmFsLCByZXQ7
Cj4gKwlpbnQgdmFsOwo+ICAgCj4gICAJc3dpdGNoIChwbGF0X2RhdC0+aW50ZXJmYWNlKSB7Cj4g
ICAJY2FzZSBQSFlfSU5URVJGQUNFX01PREVfTUlJOgo+IEBAIC0yMjAsOCArMjIwLDggQEAgc3Rh
dGljIGludCBzdG0zMm1wMV9zZXRfbW9kZShzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBs
YXRfZGF0KQo+ICAgCX0KPiAgIAo+ICAgCS8qIE5lZWQgdG8gdXBkYXRlIFBNQ0NMUlIgKGNsZWFy
IHJlZ2lzdGVyKSAqLwo+IC0JcmV0ID0gcmVnbWFwX3dyaXRlKGR3bWFjLT5yZWdtYXAsIHJlZyAr
IFNZU0NGR19QTUNDTFJSX09GRlNFVCwKPiAtCQkJICAgZHdtYWMtPm9wcy0+c3lzY2ZnX2V0aF9t
YXNrKTsKPiArCXJlZ21hcF93cml0ZShkd21hYy0+cmVnbWFwLCByZWcgKyBTWVNDRkdfUE1DQ0xS
Ul9PRkZTRVQsCj4gKwkJICAgICBkd21hYy0+b3BzLT5zeXNjZmdfZXRoX21hc2spOwo+ICAgCj4g
ICAJLyogVXBkYXRlIFBNQ1NFVFIgKHNldCByZWdpc3RlcikgKi8KPiAgIAlyZXR1cm4gcmVnbWFw
X3VwZGF0ZV9iaXRzKGR3bWFjLT5yZWdtYXAsIHJlZywKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

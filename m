From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 4/5] clocksource: add driver for i.MX EPIT timer
Date: Tue, 29 May 2018 15:16:13 -0300
Message-ID: <CAOMZO5AwF6TprHKgiSfky3QoN0=PGBY6-Apy2MCjoThp0daydA@mail.gmail.com>
References: <20180529170436.22711-1-peron.clem@gmail.com>
 <20180529170436.22711-5-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180529170436.22711-5-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Colin Didier <colin.didier@devialet.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBNYXkgMjksIDIwMTggYXQgMjowNCBQTSwgQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5j
bGVtQGdtYWlsLmNvbT4gd3JvdGU6Cgo+ICtzdGF0aWMgaW50IF9faW5pdCBlcGl0X3RpbWVyX2lu
aXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiArewo+ICsgICAgICAgc3RydWN0IGVwaXRfdGlt
ZXIgKmVwaXR0bTsKPiArICAgICAgIHN0cnVjdCBjbGsgKmNsa19pcGc7Cj4gKyAgICAgICBpbnQg
cmV0Owo+ICsKPiArICAgICAgIGVwaXR0bSA9IGt6YWxsb2Moc2l6ZW9mKCplcGl0dG0pLCBHRlBf
S0VSTkVMKTsKPiArICAgICAgIGlmICghZXBpdHRtKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPiArCj4gKyAgICAgICBlcGl0dG0tPmJhc2UgPSBvZl9pb21hcChucCwgMCk7Cj4g
KyAgICAgICBpZiAoIWVwaXR0bS0+YmFzZSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSAtRU5Y
SU87Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0X2tmcmVlOwo+ICsgICAgICAgfQo+ICsKPiAr
ICAgICAgIGVwaXR0bS0+aXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobnAsIDApOwo+ICsgICAg
ICAgaWYgKCFlcGl0dG0tPmlycSkgewo+ICsgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+
ICsgICAgICAgICAgICAgICBnb3RvIG91dF9pb3VubWFwOwo+ICsgICAgICAgfQo+ICsKPiArICAg
ICAgIGNsa19pcGcgPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAsICJpcGciKTsKPiArICAgICAgIGlm
IChJU19FUlIoY2xrX2lwZykpIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJpLk1YIEVQSVQ6
IHVuYWJsZSB0byBnZXQgY2xrX2lwZ1xuIik7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9F
UlIoY2xrX2lwZyk7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0X2lvdW5tYXA7Cj4gKyAgICAg
ICB9Cj4gKwo+ICsgICAgICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNsa19pcGcpOwo+ICsg
ICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBwcl9lcnIoImkuTVggRVBJVDogdW5h
YmxlIHRvIHByZXBhcmUrZW5hYmxlIGNsa19pcGdcbiIpOwo+ICsgICAgICAgICAgICAgICBnb3Rv
IG91dF9jbGtfaXBnX2Rpc2FibGU7CgpUaGlzIHNob3VsZCBiZTogZ290byBvdXRfaW91bm1hcDsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK

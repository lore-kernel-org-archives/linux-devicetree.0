From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v15 06/12] dt-bindings: add document for dw_hdmi
Date: Wed, 03 Dec 2014 17:46:22 +0800
Message-ID: <547EDBEE.70700@rock-chips.com>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>
 <1417544629.3411.15.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417544629.3411.15.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, rmk+kernel@arm.linux.org.uk, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.comLucas Stach <l>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMuaciDAz5pelIDAyOjIzLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+IEhpIEFu
ZHksCj4KPiBBbSBEaWVuc3RhZywgZGVuIDAyLjEyLjIwMTQsIDE1OjQyICswODAwIHNjaHJpZWIg
QW5keSBZYW46Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZHJtL2JyaWRnZS9kd19oZG1pLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kcm0vYnJpZGdlL2R3X2hkbWkudHh0Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAuLjEwN2MxY2EKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHJtL2JyaWRnZS9kd19oZG1pLnR4dAo+PiBAQCAtMCww
ICsxLDQwIEBACj4+ICtEZXNpZ25XYXJlIEhETUkgYnJpZGdlIGJpbmRpbmdzCj4+ICsKPj4gK1Jl
cXVpcmVkIHByb3Blcml0aWVzOgo+PiArLSBjb21wYXRpYmxlOiBwbGF0Zm9ybSBzcGVjaWZpYyBz
dWNoIGFzOgo+PiArICAgKiAiZnNsLGlteDZxLWhkbWkiCj4+ICsgICAqICJmc2wsaW14NmRsLWhk
bWkiCj4+ICsgICAqICJyb2NrY2hpcCxyazMyODgtZHctaGRtaSIKPiBJIHRoaW5rIHdlIHNob3Vs
ZCBhZGQgYSBjb21tb24gY29tcGF0aWJsZSB2YWx1ZSAic25wcyxkdy1oZG1pLXR4IiBoZXJlOgo+
Cj4gCWNvbXBhdGlibGUgPSAiZnNsLGlteDZxLWhkbWkiLCAic25wcyxkdy1oZG1pLXR4IjsKPgo+
PiArLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9s
bGVyJ3MgcmVnaXN0ZXJzLgo+PiArLSBkZGMtaTJjLWJ1czogcGhhbmRsZSBvZiBhbiBJMkMgY29u
dHJvbGxlciB1c2VkIGZvciBEREMgRURJRCBwcm9iaW5nCj4gQmV0dGVyIG1ha2UgZGRjLWkyYy1i
dXMgb3B0aW9uYWwsIHNlZSB0aGUgb3RoZXIgdGhyZWFkIGFib3V0IHRoZSBkZGMgaTJjCj4gbWFz
dGVyLgogICAgIEkgaGF2ZSB0aGUgc2FtZSBpZGVhIHRvbywgYnV0IHRoZSBwYXRjaCBhYm91dCBk
ZGMgaTJjIG1hc3RlciBoYXMgbm90CiAgbGFuZGVkIHlldCwgIGNhbiB3ZSBjaGFuZ2UgdGhlIGRk
Yy1pMmMtYnVzIHRvIG9wdGlvbmFsICBhZnRlciB0aGUgZGRjIAppMmMgbWFzdGVyCiAgcGF0Y2gg
bGFuZD8KPj4gKy0gaW50ZXJydXB0czogVGhlIEhETUkgaW50ZXJydXB0IG51bWJlcgo+PiArCj4+
ICtPcHRpb25hbCBwcm9wZXJ0aWVzCj4+ICstIHJlZy1pby13aWR0aDogdGhlIHdpZHRoIG9mIHRo
ZSByZWc6MSw0LCBkZWZhdWx0IHNldCB0byAxIGlmIG5vdCBwcmVzZW50Cj4+ICsKPj4gK0V4YW1w
bGU6Cj4+ICsJaGRtaTogaGRtaUAwMTIwMDAwIHsKPj4gKwkJY29tcGF0aWJsZSA9ICJmc2wsaW14
NnEtaGRtaSI7Cj4+ICsJCXJlZyA9IDwweDAwMTIwMDAwIDB4OTAwMD47Cj4+ICsJCWludGVycnVw
dHMgPSA8MCAxMTUgMHgwND47Cj4+ICsJCWdwciA9IDwmZ3ByPjsKPj4gKwkJY2xvY2tzID0gPCZj
bGtzIDEyMz4sIDwmY2xrcyAxMjQ+Owo+PiArCQljbG9jay1uYW1lcyA9ICJpYWhiIiwgImlzZnIi
Owo+PiArCQlkZGMtaTJjLWJ1cyA9IDwmaTJjMj47Cj4+ICsKPj4gKwkJcG9ydEAwIHsKPj4gKwkJ
CXJlZyA9IDwwPjsKPj4gKwo+PiArCQkJaGRtaV9tdXhfMDogZW5kcG9pbnQgewo+PiArCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmaXB1MV9kaTBfaGRtaT47Cj4+ICsJCQl9Owo+PiArCQl9Owo+PiAr
Cj4+ICsJCXBvcnRAMSB7Cj4+ICsJCQlyZWcgPSA8MT47Cj4+ICsKPj4gKwkJCWhkbWlfbXV4XzE6
IGVuZHBvaW50IHsKPj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmlwdTFfZGkxX2hkbWk+Owo+
PiArCQkJfTsKPj4gKwkJfTsKPj4gKwl9Owo+IHJlZ2FyZHMKPiBQaGlsaXBwCj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtcm9ja2No
aXAgbWFpbGluZyBsaXN0Cj4gTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK
Pgo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
ZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJp
dmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYt
ZGV2ZWwK

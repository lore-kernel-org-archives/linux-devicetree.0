From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Thu, 04 Dec 2014 00:04:37 +0800
Message-ID: <547F3495.9070206@rock-chips.com>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141203153847.GC11285@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

SGkgUnVzc2VsbDoKCk9uIDIwMTTlubQxMuaciDAz5pelIDIzOjM4LCBSdXNzZWxsIEtpbmcgLSBB
Uk0gTGludXggd3JvdGU6Cj4gT24gV2VkLCBEZWMgMDMsIDIwMTQgYXQgMTE6Mjk6MjZQTSArMDgw
MCwgQW5keSBZYW4gd3JvdGU6Cj4+ICtpbnQgaW14X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKPj4gKwkJICB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIsCj4+ICsJCSAgY29uc3Qgc3RydWN0IGlteF9oZG1pX3BsYXRfZGF0
YSAqcGxhdF9kYXRhKQo+PiAgIHsKPj4gICAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9
IHRvX3BsYXRmb3JtX2RldmljZShkZXYpOwo+PiAtCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
Km9mX2lkID0KPj4gLQkJCQlvZl9tYXRjaF9kZXZpY2UoaW14X2hkbWlfZHRfaWRzLCBkZXYpOwo+
PiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGF0YTsKPj4gICAJc3RydWN0IGRldmljZV9u
b2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPj4gICAJc3RydWN0IGRldmljZV9ub2RlICpkZGNfbm9k
ZTsKPj4gQEAgLTE1OTQsMTkgKzE1NjYsMTYgQEAgc3RhdGljIGludCBpbXhfaGRtaV9iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+PiAg
IAlzdHJ1Y3QgcmVzb3VyY2UgKmlvcmVzOwo+PiAgIAlpbnQgcmV0LCBpcnE7Cj4+ICAgCj4+IC0J
aGRtaSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqaGRtaSksIEdGUF9LRVJORUwpOwo+PiAr
CWhkbWkgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpoZG1pKSwgR0ZQX0tFUk5F
TCk7Cj4+ICAgCWlmICghaGRtaSkKPj4gICAJCXJldHVybiAtRU5PTUVNOwo+PiAgIAo+PiAtCWhk
bWktPmRldiA9IGRldjsKPj4gKwloZG1pLT5wbGF0X2RhdGEgPSBwbGF0X2RhdGE7Cj4+ICsJaGRt
aS0+ZGV2ID0gJnBkZXYtPmRldjsKPj4gKwloZG1pLT5kZXZfdHlwZSA9IHBsYXRfZGF0YS0+ZGV2
X3R5cGU7Cj4+ICAgCWhkbWktPnNhbXBsZV9yYXRlID0gNDgwMDA7Cj4+ICAgCWhkbWktPnJhdGlv
ID0gMTAwOwo+PiAtCj4+IC0JaWYgKG9mX2lkKSB7Cj4+IC0JCWNvbnN0IHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2VfaWQgKmRldmljZV9pZCA9IG9mX2lkLT5kYXRhOwo+PiAtCj4+IC0JCWhkbWktPmRl
dl90eXBlID0gZGV2aWNlX2lkLT5kcml2ZXJfZGF0YTsKPj4gLQl9Cj4+ICsJaGRtaS0+ZW5jb2Rl
ciA9IGVuY29kZXI7Cj4gSSdkIHN1Z2dlc3QgY2hhbmdpbmcgaW14X2hkbWlfYmluZCgpIHRvIHRh
a2UgdGhlIHN0cnVjdCByZXNvdXJjZSBhbmQgaXJxCj4gbnVtYmVyLCBhbmQgYXZvaWRpbmcgdGhl
IHBsYXRmb3JtIGRldmljZSBzdHVmZiBhbHRvZ2V0aGVyIGluIGhlcmUuCj4KICAgIEFjdHVhbGx5
IHRoaXMgaXMgd2hhdCB0aGUgY3VycmVudCBjb2RlIGRvOiB0aGUgcmVzb3VyY2UgYW5kIGlycSBu
dW1iZXIKYXJlIGFsbCBoYW5kbGVkIGluIGlteF9oZG1pX2JpbmQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxA
bGludXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK

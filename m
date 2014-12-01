From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v14 05/12] drm: imx: imx-hdmi: move imx-hdmi to
 bridge/dw_hdmi
Date: Mon, 01 Dec 2014 19:53:54 +0800
Message-ID: <547C56D2.5030302@rock-chips.com>
References: <1417432770-12719-1-git-send-email-andy.yan@rock-chips.com>
 <1417433086-12964-1-git-send-email-andy.yan@rock-chips.com>
 <1417434133.4624.9.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417434133.4624.9.camel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, rmk+kernel@arm.linux.org.uk, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcDoKCk9uIDIwMTTlubQxMuaciDAx5pelIDE5OjQyLCBQaGlsaXBwIFphYmVsIHdy
b3RlOgo+IEhpIEFuZHksCj4KPiBBbSBNb250YWcsIGRlbiAwMS4xMi4yMDE0LCAxOToyNCArMDgw
MCBzY2hyaWViIEFuZHkgWWFuOgo+IFsuLi5dCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9i
cmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwLi4xYmJmM2NhCj4+IC0tLSAvZGV2L251bGwK
Pj4gKysrIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAo+PiBAQCAtMCwwICsxLDU3IEBA
Cj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDExIEZyZWVzY2FsZSBTZW1pY29uZHVjdG9y
LCBJbmMuCj4+ICsgKgo+PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4+ICsg
KiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBM
aWNlbnNlLCBvcgo+PiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPj4g
KyAqLwo+PiArCj4+ICsjaWZuZGVmIF9fRFdfSERNSV9fCj4+ICsjZGVmaW5lIF9fRFdfSERNSV9f
Cj4+ICsKPj4gKyNpbmNsdWRlIDxkcm0vZHJtUC5oPgo+PiArCj4+ICtlbnVtIHsKPj4gKwlSRVNf
OCwKPj4gKwlSRVNfMTAsCj4+ICsJUkVTXzEyLAo+PiArCVJFU19NQVgsCj4+ICt9Owo+PiArCj4+
ICtlbnVtIGR3X2hkbWlfZGV2dHlwZSB7Cj4+ICsJSU1YNlFfSERNSSwKPj4gKwlJTVg2RExfSERN
SSwKPj4gK307Cj4+ICsKPj4gK3N0cnVjdCBtcGxsX2NvbmZpZyB7Cj4+ICsJdW5zaWduZWQgbG9u
ZyBtcGl4ZWxjbG9jazsKPj4gKwlzdHJ1Y3Qgewo+PiArCQl1MTYgY3BjZTsKPj4gKwkJdTE2IGdt
cDsKPj4gKwl9IHJlc1tSRVNfTUFYXTsKPj4gK307Cj4+ICsKPj4gK3N0cnVjdCBjdXJyX2N0cmwg
ewo+PiArCXVuc2lnbmVkIGxvbmcgbXBpeGVsY2xvY2s7Cj4+ICsJdTE2IGN1cnJbUkVTX01BWF07
Cj4+ICt9Owo+PiArCj4+ICtzdHJ1Y3Qgc3ltX3Rlcm0gewo+PiArCXVuc2lnbmVkIGxvbmcgbXBp
eGVsY2xvY2s7Cj4+ICsJdTE2IHN5bV9jdHI7ICAgIC8qY2xvY2sgc3ltYm9sIGFuZCB0cmFuc21p
dHRlciBjb250cm9sKi8KPj4gKwl1MTYgdGVybTsgICAgICAgLyp0cmFuc21pc3Npb24gdGVybWlu
YXRpb24gdmFsdWUqLwo+PiArfTsKPiBzaW5jZSB0aGlzIGlzIGdvaW5nIHRvIGJlIHVzZWQgYnkg
bXVsdGlwbGUgZHJpdmVycywgdGhlIGVudW1zIGFuZAo+IHN0cnVjdHMgc2hvdWxkIGFsbCBiZSBw
cm9wZXJseSBuYW1lc3BhY2VkLiBIb3cgYWJvdXQgRFdfSERNSV9SRVNfeCwKPiBzdHJ1Y3QgZHdf
aGRtaV9tcGxsX2NvbmZpZywgc3RydWN0IGR3X2hkbWlfY3Vycl9jdHJsLCBhbmQgc3RydWN0Cj4g
ZHdfaGRtaV9zeW1fdGVybT8KCiAgIFRoYXQgc291bmRzIGdvb2QsIEkgd2lsbCB0YWtlIHlvdXIg
YWR2aWNlIGluIFBBVENIIFYxNS4KICAgVGhhbmtzCj4+ICtzdHJ1Y3QgZHdfaGRtaV9wbGF0X2Rh
dGEgewo+PiArCWVudW0gZHdfaGRtaV9kZXZ0eXBlIGRldl90eXBlOwo+PiArCWNvbnN0IHN0cnVj
dCBtcGxsX2NvbmZpZyAqbXBsbF9jZmc7Cj4+ICsJY29uc3Qgc3RydWN0IGN1cnJfY3RybCAqY3Vy
X2N0cjsKPj4gKwljb25zdCBzdHJ1Y3Qgc3ltX3Rlcm0gKnN5bV90ZXJtOwo+PiArfTsKPj4gKwo+
PiArdm9pZCBkd19oZG1pX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciwgdm9pZCAqZGF0YSk7Cj4+ICtpbnQgZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+PiArCQkgdm9pZCAqZGF0YSwgc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyLAo+PiArCQkgY29uc3Qgc3RydWN0IGR3X2hkbWlfcGxhdF9kYXRh
ICpwbGF0X2RhdGEpOwo+PiArI2VuZGlmIC8qIF9fSU1YX0hETUlfSF9fICovCj4gcmVnYXJkcwo+
IFBoaWxpcHAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPiBMaW51eC1yb2NrY2hpcEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yb2NrY2hpcAo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnBy
b2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=

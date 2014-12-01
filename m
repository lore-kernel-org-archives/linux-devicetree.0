From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v14 05/12] drm: imx: imx-hdmi: move imx-hdmi to
 bridge/dw_hdmi
Date: Mon, 01 Dec 2014 12:42:13 +0100
Message-ID: <1417434133.4624.9.camel@pengutronix.de>
References: <1417432770-12719-1-git-send-email-andy.yan@rock-chips.com>
 <1417433086-12964-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1417433086-12964-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgQW5keSwKCkFtIE1vbnRhZywgZGVuIDAxLjEyLjIwMTQsIDE5OjI0ICswODAwIHNjaHJpZWIg
QW5keSBZYW46ClsuLi5dCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1p
LmggYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwLi4xYmJmM2NhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUv
ZHJtL2JyaWRnZS9kd19oZG1pLmgKPiBAQCAtMCwwICsxLDU3IEBACj4gKy8qCj4gKyAqIENvcHly
aWdodCAoQykgMjAxMSBGcmVlc2NhbGUgU2VtaWNvbmR1Y3RvciwgSW5jLgo+ICsgKgo+ICsgKiBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeQo+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+ICsgKiAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX19EV19I
RE1JX18KPiArI2RlZmluZSBfX0RXX0hETUlfXwo+ICsKPiArI2luY2x1ZGUgPGRybS9kcm1QLmg+
Cj4gKwo+ICtlbnVtIHsKPiArCVJFU184LAo+ICsJUkVTXzEwLAo+ICsJUkVTXzEyLAo+ICsJUkVT
X01BWCwKPiArfTsKPiArCj4gK2VudW0gZHdfaGRtaV9kZXZ0eXBlIHsKPiArCUlNWDZRX0hETUks
Cj4gKwlJTVg2RExfSERNSSwKPiArfTsKPiArCj4gK3N0cnVjdCBtcGxsX2NvbmZpZyB7Cj4gKwl1
bnNpZ25lZCBsb25nIG1waXhlbGNsb2NrOwo+ICsJc3RydWN0IHsKPiArCQl1MTYgY3BjZTsKPiAr
CQl1MTYgZ21wOwo+ICsJfSByZXNbUkVTX01BWF07Cj4gK307Cj4gKwo+ICtzdHJ1Y3QgY3Vycl9j
dHJsIHsKPiArCXVuc2lnbmVkIGxvbmcgbXBpeGVsY2xvY2s7Cj4gKwl1MTYgY3VycltSRVNfTUFY
XTsKPiArfTsKPiArCj4gK3N0cnVjdCBzeW1fdGVybSB7Cj4gKwl1bnNpZ25lZCBsb25nIG1waXhl
bGNsb2NrOwo+ICsJdTE2IHN5bV9jdHI7ICAgIC8qY2xvY2sgc3ltYm9sIGFuZCB0cmFuc21pdHRl
ciBjb250cm9sKi8KPiArCXUxNiB0ZXJtOyAgICAgICAvKnRyYW5zbWlzc2lvbiB0ZXJtaW5hdGlv
biB2YWx1ZSovCj4gK307CgpzaW5jZSB0aGlzIGlzIGdvaW5nIHRvIGJlIHVzZWQgYnkgbXVsdGlw
bGUgZHJpdmVycywgdGhlIGVudW1zIGFuZApzdHJ1Y3RzIHNob3VsZCBhbGwgYmUgcHJvcGVybHkg
bmFtZXNwYWNlZC4gSG93IGFib3V0IERXX0hETUlfUkVTX3gsCnN0cnVjdCBkd19oZG1pX21wbGxf
Y29uZmlnLCBzdHJ1Y3QgZHdfaGRtaV9jdXJyX2N0cmwsIGFuZCBzdHJ1Y3QKZHdfaGRtaV9zeW1f
dGVybT8KCj4gK3N0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSB7Cj4gKwllbnVtIGR3X2hkbWlfZGV2
dHlwZSBkZXZfdHlwZTsKPiArCWNvbnN0IHN0cnVjdCBtcGxsX2NvbmZpZyAqbXBsbF9jZmc7Cj4g
Kwljb25zdCBzdHJ1Y3QgY3Vycl9jdHJsICpjdXJfY3RyOwo+ICsJY29uc3Qgc3RydWN0IHN5bV90
ZXJtICpzeW1fdGVybTsKPiArfTsKPiArCj4gK3ZvaWQgZHdfaGRtaV91bmJpbmQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpOwo+ICtpbnQgZHdf
aGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+ICsJ
CSB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gKwkJIGNvbnN0IHN0
cnVjdCBkd19oZG1pX3BsYXRfZGF0YSAqcGxhdF9kYXRhKTsKPiArI2VuZGlmIC8qIF9fSU1YX0hE
TUlfSF9fICovCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

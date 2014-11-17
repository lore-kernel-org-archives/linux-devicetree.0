From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v11 02/12] staging: imx-drm: imx-hdmi: return defer if
 can't get ddc i2c adapter
Date: Mon, 17 Nov 2014 09:35:17 +0800
Message-ID: <546950D5.20703@rock-chips.com>
References: <1415972231-8283-1-git-send-email-andy.yan@rock-chips.com>
 <1415972348-8382-1-git-send-email-andy.yan@rock-chips.com>
 <CAGS+omCQ97eo6BhhfCucgeAK8Kq0GtR8jOiv2AF7x=w2d9F8yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAGS+omCQ97eo6BhhfCucgeAK8Kq0GtR8jOiv2AF7x=w2d9F8yw@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Daniel Kurtz <djkurtz@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Xu Jianqun <jay.xu@rock-chips.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, "mark.yao@rock-chips.com" <mark.yao@rock-chips.com>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMeaciDE15pelIDEzOjQxLCBEYW5pZWwgS3VydHogd3JvdGU6Cj4gT24gRnJp
LCBOb3YgMTQsIDIwMTQgYXQgOTozOSBQTSwgQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMu
Y29tPiB3cm90ZToKPj4gZHJtIGRyaXZlciBtYXkgcHJvYmUgYmVmb3JlIHRoZSBpMmMgYnVzLCBz
byB0aGUgZHJpdmVyIHNob3VsZAo+PiBkZWZlciBwcm9iaW5nIHVudGlsIGl0IGlzIGF2YWlsYWJs
ZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+
Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHYxMTogTm9uZQo+PiBDaGFuZ2VzIGluIHYxMDog
Tm9uZQo+PiBDaGFuZ2VzIGluIHY5OiBOb25lCj4+IENoYW5nZXMgaW4gdjg6IE5vbmUKPj4gQ2hh
bmdlcyBpbiB2NzogTm9uZQo+PiBDaGFuZ2VzIGluIHY2OiBOb25lCj4+IENoYW5nZXMgaW4gdjU6
IE5vbmUKPj4gQ2hhbmdlcyBpbiB2NDoKPj4gLSBkZWZlciBwcm9iZSBkZGMgaTJjIGFkYXB0ZXIK
Pj4KPj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+PiBDaGFuZ2VzIGluIHYyOiBOb25lCj4+Cj4+ICAg
ZHJpdmVycy9zdGFnaW5nL2lteC1kcm0vaW14LWhkbWkuYyB8IDUgKysrKy0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvaW14LWRybS9pbXgtaGRtaS5jIGIvZHJpdmVycy9zdGFnaW5nL2lt
eC1kcm0vaW14LWhkbWkuYwo+PiBpbmRleCA3OWRhZWM0Li5jMmIwMzVhIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvaW14LWRybS9pbXgtaGRtaS5jCj4+ICsrKyBiL2RyaXZlcnMvc3Rh
Z2luZy9pbXgtZHJtL2lteC1oZG1pLmMKPj4gQEAgLTE2MTEsOCArMTYxMSwxMSBAQCBzdGF0aWMg
aW50IGlteF9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0
ZXIsIHZvaWQgKmRhdGEpCj4+ICAgICAgICAgIGRkY19ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShu
cCwgImRkYy1pMmMtYnVzIiwgMCk7Cj4+ICAgICAgICAgIGlmIChkZGNfbm9kZSkgewo+PiAgICAg
ICAgICAgICAgICAgIGhkbWktPmRkYyA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShkZGNf
bm9kZSk7Cj4+IC0gICAgICAgICAgICAgICBpZiAoIWhkbWktPmRkYykKPj4gKyAgICAgICAgICAg
ICAgIGlmICghaGRtaS0+ZGRjKSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZGJn
KGhkbWktPmRldiwgImZhaWxlZCB0byByZWFkIGRkYyBub2RlXG4iKTsKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgb2Zfbm9kZV9wdXQoZGRjX25vZGUpOwo+PiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKPj4gKyAgICAgICAgICAgICAgIH0KPiBOaXQ6ICBZ
b3UgY291bGQgbW92ZSAib2Zfbm9kZV9wdXQoKSIgYWJvdmUgImlmICghaGRtaS0+ZGRjKSIsIGFu
ZCBub3QKPiBuZWVkIGl0IGluIHR3byBwbGFjZXMuCiAgdGhhbmtzLCBJIHdpbGwgdGFrZSB5b3Vy
IGFkdmljZQo+Cj4gRWl0aGVyIHdheSwgdGhpcyBvbmUgaXM6Cj4gUmV2aWV3ZWQtYnk6IERhbmll
bCBLdXJ0eiA8ZGprdXJ0ekBjaHJvbWl1bS5vcmc+Cj4KPj4gICAgICAgICAgICAgICAgICBvZl9u
b2RlX3B1dChkZGNfbm9kZSk7Cj4+ICAgICAgICAgIH0gZWxzZSB7Cj4+IC0tCj4+IDEuOS4xCj4+
Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRl
dmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnCmh0dHA6Ly9kcml2
ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1k
ZXZlbAo=

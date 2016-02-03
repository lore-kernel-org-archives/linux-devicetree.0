From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v9 02/14] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Wed, 03 Feb 2016 15:31:09 +0100
Message-ID: <1454509869.3867.50.camel@pengutronix.de>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
 <1452611750-16283-3-git-send-email-p.zabel@pengutronix.de>
 <CAGS+omCf7Xdc3gX1OZO4DUccVRJNx0+oVUsuqu_q_zTC_T8YpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGS+omCf7Xdc3gX1OZO4DUccVRJNx0+oVUsuqu_q_zTC_T8YpA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Sasha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLAoKQW0gTWl0dHdvY2gsIGRlbiAwMy4wMi4yMDE2LCAwMToxMiArMDgwMCBzY2hy
aWViIERhbmllbCBLdXJ0ejoKWy4uLl0KPiA+ICtpbnQgbXRrX2RybV9jcnRjX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0
IGVudW0gbXRrX2RkcF9jb21wX2lkICpwYXRoLCB1bnNpZ25lZCBpbnQgcGF0aF9sZW4pCj4gPiAr
ewpbLi4uXQo+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmRkcF9jb21wX25y
OyBpKyspIHsKPiA+ICsgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBjb21wX2lk
ID0gcGF0aFtpXTsKPiA+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21w
OwoKSSdsbCBjaGVjayBmb3IgKHByaXYtPmNvbXBfbm9kZVtjb21wX2lkXSAhPSBOVUxMKSBoZXJl
LgoKPiA+ICsgICAgICAgICAgICAgICBjb21wID0gcHJpdi0+ZGRwX2NvbXBbY29tcF9pZF07Cj4g
PiArICAgICAgICAgICAgICAgaWYgKCFjb21wKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfZXJyKGRldiwgIkNvbXBvbmVudCAlcyBub3QgaW5pdGlhbGl6ZWRcbiIsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmNvbXBfbm9kZVtjb21wX2lkXS0+ZnVs
bF9uYW1lKTsKPiAKPiBJZiBvbmUgb2YgdGhlIGNvbXBvbmVudHMgaXMgZGlzYWJsZWQgaW4gLmR0
c2ksIHRoZW4gaXRzCj4gcHJpdi0+Y29tcF9ub2RlW2NvbXBfaWRdIHdpbGwgYmUgTlVMTCBoZXJl
LCBhbmQgdHJ5aW5nIHRvIGZ1bGxfbmFtZSB3aWxsIE9PUFMuCgpeXgoKWy4uLl0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMC4uOWRiMjJiNAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKWy4uLl0KPiA+ICtzdGF0aWMgc3Ry
dWN0IGRybV9kcml2ZXIgbXRrX2RybV9kcml2ZXIgPSB7Cj4gPiArICAgICAgIC5kcml2ZXJfZmVh
dHVyZXMgPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklWRVJfUFJJTUUgfAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgRFJJVkVSX0FUT01JQywKPiA+ICsgICAgICAgLnVu
bG9hZCA9IG10a19kcm1fdW5sb2FkLAo+ID4gKyAgICAgICAuc2V0X2J1c2lkID0gZHJtX3BsYXRm
b3JtX3NldF9idXNpZCwKPiAKPiBJIHRoaW5rIHVzaW5nIGRybV9wbGF0Zm9ybV9zZXRfYnVzaWQo
KSBhcyBvdXIgLnNldF9idXNpZCBtYXkgY2F1c2UgYW4gT09QcyBpZgo+IHVzZXJzcGFjZSBkb2Vz
IERSTV9JT0NUTF9TRVRfVkVSU0lPTi4KPiAKPiBkcm1fc2V0dmVyc2lvbigpIHdpbGwgY2FsbHMg
ZHJtX3NldF9idXNpZCgpLCB3aGljaCBjYWxscwo+IGRldi0+ZHJpdmVyLT5zZXRfYnVzaWQoKQo+
IGRybV9wbGF0Zm9ybV9zZXRfYnVzaWQoKSBhY2Nlc3NlcyBkZXYtPnBsYXRmb3JtZGV2LT5pZC4K
PiAKPiBIb3dldmVyLCBkZXYtPnBsYXRmb3JtZGV2IGlzIG9ubHkgc2V0IGJ5Ogo+ICAgZHJtX3Bs
YXRmb3JtX2luaXQoKS0+ZHJtX2dldF9wbGF0Zm9ybV9kZXYoKQo+IAo+IEFuZCwgc2luY2UgbXRr
X2RybV9iaW5kKCkgZG9lcyB0aGUgZHJtX2Rldl9hbGxvYygpIC8KPiBkcm1fZGV2X3JlZ2lzdGVy
KCkgaXRzZWxmIGluc3RlYWQKPiBvZiBjYWxsaW5nIGRybV9nZXRfcGxhdGZvcm1fZGV2KCksIHNv
IGRldi0+cGxhdGZvcm1kZXYgd2lsbCBzdGlsbCBiZSBOVUxMLgo+IAo+IFNvLCB3aHkgZG9uJ3Qg
d2UgY2FsbCBkcm1fcGxhdGZvcm1faW5pdCgpIGluc3RlYWQgYW5kIGltcGxlbWVudCBhIC5sb2Fk
IGNhbGxiYWNrCj4gdG8gZG8gbXRrX2RybV9rbXNfaW5pdCgpPwoKVGhpcyBpcyBkZXByZWNhdGVk
LCBJIGhhZCB1c2VkIGl0IHRoYXQgd2F5IHVudGlsIHY0LgpDYW4gd2UganVzdCBkcm9wIHRoZSBz
ZXRfYnVzaWQgY2FsbGJhY2s/CgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

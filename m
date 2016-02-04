From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v9 03/14] drm/mediatek: Add DSI sub driver
Date: Thu, 4 Feb 2016 20:24:06 +0800
Message-ID: <CAGS+omAyi2_JunXrhAOUgUGS64uZOj7iEG8eURtWMnn0CiaZxQ@mail.gmail.com>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
 <1452611750-16283-4-git-send-email-p.zabel@pengutronix.de>
 <CAGS+omCqKFQ-E_q7x=i95fhZSGgTOVW+_EoiRb++E14Xrob-tA@mail.gmail.com>
 <1454497304.3867.1.camel@pengutronix.de> <1454567865.12573.7.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1454567865.12573.7.camel@mtksdaap41>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Sasha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBGZWIgNCwgMjAxNiBhdCAyOjM3IFBNLCBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PiB3cm90ZToKPiBIaSBQaGlsaXBwOgo+Cj4gT24gV2VkLCAyMDE2LTAyLTAzIGF0IDEyOjAxICsw
MTAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+PiBIaSBEYW5pZWwsCj4+Cj4KPj4gPiA+ICtzdGF0
aWMgdm9pZCBtdGtfb3V0cHV0X2RzaV9kaXNhYmxlKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4+ID4g
PiArewo+PiA+ID4gKyAgICAgICBpZiAoIWRzaS0+ZW5hYmxlZCkKPj4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm47Cj4+ID4gPiArCj4+ID4gPiArICAgICAgIGlmIChkc2ktPnBhbmVsKSB7Cj4+
ID4gPiArICAgICAgICAgICAgICAgaWYgKGRybV9wYW5lbF9kaXNhYmxlKGRzaS0+cGFuZWwpKSB7
Cj4+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoImZhaWxlZCB0byBkaXNh
YmxlIHRoZSBwYW5lbFxuIik7Cj4+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47
Cj4+ID4gPiArICAgICAgICAgICAgICAgfQo+PiA+ID4gKyAgICAgICB9Cj4+ID4gPiArCj4+ID4g
PiArICAgICAgIG10a19kc2lfcG93ZXJvZmYoZHNpKTsKPj4gPgo+PiA+IFRoZSBvcmRlciBpcyBh
IGJpdCBzdXNwaWNpb3VzIGhlcmU7IEkgd291bGQgZXhwZWN0IHRvIHBvd2Vyb2ZmIGRzaQo+PiA+
IGJlZm9yZSB0aGUgcGFuZWwgdG8gbWlycm9yIHRoZSB0dXJuIG9uIG9yZGVyLgo+Pgo+PiBDSywg
Y291bGQgeW91IGNvbW1lbnQgb24gdGhpcz8KPj4KPgo+IEFjY29yZGluZyB0byB0aGUgZXhwZXJp
ZW5jZSBvZiBvdGhlciBNZWRpYXRlayBTb0MsCj4gSW4gbXRrX291dHB1dF9kc2lfZW5hYmxlKCks
IHdlIHNob3VsZCBkbyBwb3dlciBvbiBkc2kgZmlyc3QgYW5kIHRoZW4KPiBwcmVwYXJlIHBhbmVs
IGJlY2F1c2UgZHNpIHNob3VsZCBiZSByZWFkeSB0byByZWNlaXZlIHBhbmVsIHByZXBhcmUgZXJy
b3IKPiBtZXNzYWdlLiBTbyB3ZSBzaG91bGQgZGlzYWJsZSBwYW5lbCBhbmQgdGhlbiBwb3dlciBv
ZmYgZHNpIGluCj4gbXRrX291dHB1dF9kc2lfZGlzYWJsZSgpLgoKVGhlbiB3aGF0IGFib3V0IHRo
ZSBvdGhlciBkaXJlY3Rpb24/ClNob3VsZCB3ZSBiZSBwb3dlcmluZyB1cCBkc2kgZmlyc3QgYmVm
b3JlIGVuYWJsaW5nIHRoZSBwYW5lbCBzbyBEU0kKY2FuIHJlY2VpdmUgYW4gcGFuZWwgZW5hYmxp
bmcgZXJyb3JzPwoKLURhbgoKPgo+PiBJIGNhbiByZW9yZGVyIHRoaXMsIGJ1dCBJJ20gbm90IHN1
cmUgYWJvdXQgdGhlIHJlYXNvbmluZyAod2hhdCBoYXBwZW5zCj4+IGhhcmR3YXJlIHdpc2UgaWYg
d2UganVzdCBjdXQgcGFuZWwgcG93ZXIgdnMuIGlmIHRoZSBEU0kgcGFuZWwgZmlyc3Qgc2Vlcwo+
PiB0aGUgVUxQIHRyYW5zaXRpb24pLiBGdXJ0aGVyLCBJIGRvbid0IGhhdmUgYSBwYW5lbCB0byB0
ZXN0LCBqdXN0IHRoZQo+PiBQUzg2NDAuCj4+Cj4+IHRoYW5rcwo+PiBQaGlsaXBwCj4+Cj4+Cj4K
PiBSZWdhcmRzLAo+IENLCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

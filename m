From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v9 03/14] drm/mediatek: Add DSI sub driver
Date: Thu, 04 Feb 2016 13:48:19 +0100
Message-ID: <1454590099.3356.22.camel@pengutronix.de>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
 <1452611750-16283-4-git-send-email-p.zabel@pengutronix.de>
 <CAGS+omCqKFQ-E_q7x=i95fhZSGgTOVW+_EoiRb++E14Xrob-tA@mail.gmail.com>
 <1454497304.3867.1.camel@pengutronix.de>
 <1454567865.12573.7.camel@mtksdaap41>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "open
 list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Sasha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QW0gRG9ubmVyc3RhZywgZGVuIDA0LjAyLjIwMTYsIDE0OjM3ICswODAwIHNjaHJpZWIgQ0sgSHU6
Cj4gSGkgUGhpbGlwcDoKPiAKPiBPbiBXZWQsIDIwMTYtMDItMDMgYXQgMTI6MDEgKzAxMDAsIFBo
aWxpcHAgWmFiZWwgd3JvdGU6Cj4gPiBIaSBEYW5pZWwsCj4gPiAKPiAKPiA+ID4gPiArc3RhdGlj
IHZvaWQgbXRrX291dHB1dF9kc2lfZGlzYWJsZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ID4gPiA+
ICt7Cj4gPiA+ID4gKyAgICAgICBpZiAoIWRzaS0+ZW5hYmxlZCkKPiA+ID4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGlmIChkc2ktPnBhbmVsKSB7
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChkcm1fcGFuZWxfZGlzYWJsZShkc2ktPnBhbmVs
KSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZmFpbGVkIHRv
IGRpc2FibGUgdGhlIHBhbmVsXG4iKTsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm47Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gPiArICAgICAgIH0KPiA+ID4g
PiArCj4gPiA+ID4gKyAgICAgICBtdGtfZHNpX3Bvd2Vyb2ZmKGRzaSk7Cj4gPiA+IAo+ID4gPiBU
aGUgb3JkZXIgaXMgYSBiaXQgc3VzcGljaW91cyBoZXJlOyBJIHdvdWxkIGV4cGVjdCB0byBwb3dl
cm9mZiBkc2kKPiA+ID4gYmVmb3JlIHRoZSBwYW5lbCB0byBtaXJyb3IgdGhlIHR1cm4gb24gb3Jk
ZXIuCj4gPiAKPiA+IENLLCBjb3VsZCB5b3UgY29tbWVudCBvbiB0aGlzPwo+ID4gCj4gCj4gQWNj
b3JkaW5nIHRvIHRoZSBleHBlcmllbmNlIG9mIG90aGVyIE1lZGlhdGVrIFNvQywKPiBJbiBtdGtf
b3V0cHV0X2RzaV9lbmFibGUoKSwgd2Ugc2hvdWxkIGRvIHBvd2VyIG9uIGRzaSBmaXJzdCBhbmQg
dGhlbgo+IHByZXBhcmUgcGFuZWwgYmVjYXVzZSBkc2kgc2hvdWxkIGJlIHJlYWR5IHRvIHJlY2Vp
dmUgcGFuZWwgcHJlcGFyZSBlcnJvcgo+IG1lc3NhZ2UuIFNvIHdlIHNob3VsZCBkaXNhYmxlIHBh
bmVsIGFuZCB0aGVuIHBvd2VyIG9mZiBkc2kgaW4KPiBtdGtfb3V0cHV0X2RzaV9kaXNhYmxlKCku
Cj4gCj4gPiBJIGNhbiByZW9yZGVyIHRoaXMsIGJ1dCBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIHJl
YXNvbmluZyAod2hhdCBoYXBwZW5zCj4gPiBoYXJkd2FyZSB3aXNlIGlmIHdlIGp1c3QgY3V0IHBh
bmVsIHBvd2VyIHZzLiBpZiB0aGUgRFNJIHBhbmVsIGZpcnN0IHNlZXMKPiA+IHRoZSBVTFAgdHJh
bnNpdGlvbikuIEZ1cnRoZXIsIEkgZG9uJ3QgaGF2ZSBhIHBhbmVsIHRvIHRlc3QsIGp1c3QgdGhl
Cj4gPiBQUzg2NDAuCj4gPiAKPiA+IHRoYW5rcwo+ID4gUGhpbGlwcAoKSSBqdXN0IHJlYWxpemVk
IHRoYXQgdGhpcyBjb2RlIGlzbid0IGV2ZW4gdXNpbmcgZHJtX3BhbmVsX2VuYWJsZSBhbmQKZHJt
X3BhbmVsX3VucHJlcGFyZS4gSSBzdXBwb3NlIHRoZSBvcmRlciBnZW5lcmFsbHkgc2hvdWxkIGJl
OgoKcHJlcGFyZSBhbmQgZW5hYmxlIGRzaSAoYnV0IGRvbid0IHN0YXJ0IHN0cmVhbSB5ZXQpCmRy
bV9wYW5lbF9wcmVwYXJlKCkKZW5hYmxlIGRzaSBvdXRwdXQKZHJtX3BhbmVsX2VuYWJsZSgpCgph
bmQgdG8gZGlzYWJsZToKCmRybV9wYW5lbF9kaXNhYmxlKCkKZGlzYWJsZSBkc2kgb3V0cHV0CmRy
bV9wYW5lbF91bnByZXBhcmUoKQpwb3dlciBvZmYgZHNpCgo/CgpyZWdhcmRzClBoaWxpcHAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

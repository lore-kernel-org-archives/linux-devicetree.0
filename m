From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v6 1/2] drm/bridge: Add sii902x driver
Date: Wed, 8 Jun 2016 10:39:11 +0100
Message-ID: <CACvgo51drsxyZA1YdDx=2x-idq8CKQkJYyPyywhHrGTTjnOzJA@mail.gmail.com>
References: <1465300763-19386-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465300763-19386-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Meng Yi <meng.yi@nxp.com>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alison Wang <alison.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsCgpPbiA3IEp1bmUgMjAxNiBhdCAxMjo1OSwgQm9yaXMgQnJlemlsbG9uCjxib3Jp
cy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPiB3cm90ZToKPiBBZGQgYmFzaWMgc3VwcG9y
dCBmb3IgdGhlIHNpaTkwMnggUkdCIC0+IEhETUkgYnJpZGdlLgo+IFRoaXMgZHJpdmVyIGRvZXMg
bm90IHN1cHBvcnQgYXVkaW8gb3V0cHV0IHlldC4KPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4KPiBUZXN0ZWQtYnk6
IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVycmVAYXRtZWwuY29tPgo+IC0tLQo+IEhlbGxvLAo+
Cj4gVGhpcyBwYXRjaCBpcyBvbmx5IGFkZGluZyBiYXNpYyBzdXBwb3J0IGZvciB0aGUgc2lpOTAy
MiBjaGlwLgo+IEFzIHN0YXRlZCBpbiB0aGUgY29tbWl0IGxvZywgdGhlcmUncyBubyBhdWRpbyBz
dXBwb3J0LCBidXQgdGhlCj4gZHJpdmVyIGFsc28gaGFyZGNvZGVzIGEgbG90IG9mIHRoaW5ncyAo
bGlrZSB0aGUgUkdCIGlucHV0IGZvcm1hdCB0bwo+IHVzZSkuCj4KPiBCZXN0IFJlZ2FyZHMsCj4K
PiBCb3Jpcwo+Cj4gQ2hhbmdlcyBpbiB2NjoKPiAtIHVzZSBIRE1JX0lORk9GUkFNRV9TSVpFKEFW
SSkKPiAtIGZpeCByZXNldF9ncGlvIGluaXRpYWxpemF0aW9uCkknbSBhZnJhaWQgdGhhdCB0aGlz
IG9uZSBpcyBzdGlsbCBidXN0ZWQgOi0oIFNlZSBiZWxvdwoKCj4gKyAgICAgICBzaWk5MDJ4LT5y
ZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQSU9EX09V
VF9MT1cpOwpEb2N1bWVudGF0aW9uIHN0YXRlcyByZXF1aXJlZCwgYWJvdmUgd2UgdXNlIG9wdGlv
bmFsLgoKPiArICAgICAgIGlmIChJU19FUlIoc2lpOTAyeC0+cmVzZXRfZ3BpbykpIHsKZGV2bV9n
cGlvZF9nZXRfb3B0aW9uYWwgcmV0dXJucyBOVUxMIG9uIGVycm9yLCB5ZXQgd2UgdXNlIElTX0VS
Ui4KCj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJldHJpZXZlL3Jl
cXVlc3QgcmVzZXQgZ3BpbzogJWxkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIFBUUl9F
UlIoc2lpOTAyeC0+cmVzZXRfZ3BpbykpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VS
UihzaWk5MDJ4LT5yZXNldF9ncGlvKTsKSWYgdGhlIGdwaW8gaXMgdHJ1bHkgb3B0aW9uYWwgd2Ug
c2hvdWxkbid0IHJldHVybiBoZXJlLiBBbHRlcm5hdGl2ZWx5CnRoZSByZXNldF9ncGlvIE5VTEwg
Y2hlY2sgaW4gc2lpOTAyeF9yZXNldCgpIGNhbiBnby4KClJlZ2FyZHMsCkVtaWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

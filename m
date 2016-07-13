From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Add DPI to eDP bridge driver
Date: Wed, 13 Jul 2016 09:06:44 +0200
Message-ID: <1468393604.3638.5.camel@pengutronix.de>
References: <1468344091-7921-1-git-send-email-p.zabel@pengutronix.de>
 <1468344091-7921-3-git-send-email-p.zabel@pengutronix.de>
 <5785D7E2.1050605@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5785D7E2.1050605@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chris Healy <Chris.Healy@zii.aero>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

SGkgQXJjaGl0LAoKQW0gTWl0dHdvY2gsIGRlbiAxMy4wNy4yMDE2LCAxMToyNSArMDUzMCBzY2hy
aWViIEFyY2hpdCBUYW5lamE6ClsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gPiBpbmRl
eCBhMTQxOTIxNC4uZWJjYWQyOSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gPiBA
QCAtNTgsNiArNTgsMTQgQEAgY29uZmlnIERSTV9TSUk5MDJYCj4gPiAgIAktLS1oZWxwLS0tCj4g
PiAgIAkgIFNpbGljb24gSW1hZ2Ugc2lpOTAyeCBicmlkZ2UgY2hpcCBkcml2ZXIuCj4gPgo+ID4g
K2NvbmZpZyBEUk1fVE9TSElCQV9UQzM1ODc2Nwo+ID4gKwl0cmlzdGF0ZSAiVG9zaGliYSBUQzM1
ODc2NyBlRFAgYnJpZGdlIgo+IAo+IENhbiB3ZSBhZGQgYSAnZGVwZW5kcyBvbiBPRiAnIGhlcmUs
IG9yIHdyYXAgYXJvdW5kIHRoZQo+ICd0Yy0+YnJpZGdlLm9mX25vZGUnIGFjY2VzcyB3aXRoIGEg
Q09ORklHX09GIGNoZWNrPyBJdCBjdXJyZW50bHkKPiBicmVha3MgYnVpbGQgZm9yIG5vbi1PRiBw
bGF0Zm9ybXMuCgpEb25lLgoKWy4uLl0KPiA+ICsJaW50CQkJdGVzdF9wYXR0ZXJuOwo+IAo+IFRo
aXMgc3RpbGwgZG9lc24ndCBzZWVtIHRvIGJlIGluaXRpYWxpemVkLiBEaWRuJ3Qgd2Ugd2FudCB0
aGlzCj4gdG8gYmUgYSBtb2R1bGUgcGFyYW0/IElmIHdlJ3JlIG5vdCBzdXJlIHlldCwgaXQgd291
bGQgYmUgZmluZQo+IGp1c3QgdG8gc2V0IHRjLT50ZXN0X3BhdHRlcm4gZXhwbGljaXRseSB0byAw
IGFuZCBhZGQgYSBjb21tZW50LgoKQW5kIGRvbmUsIHNvcnJ5IEkgZm9yZ290IHRoaXMuIE5vdyB0
aGF0IEkgaGF2ZSBhZGRlZCB0aGUgbW9kdWxlCnBhcmFtZXRlciwgSSBoYXZlIGFuZCBhY3R1YWxs
eSB0ZXN0ZWQgdGhlIHRlc3QgcGF0dGVybiBjb2RlIGFuZApub3RpY2VkIHRoYXQgSSBhbHNvIGhh
dmUgdG8gc2V0IHRoZSBwaXhlbCBjbG9jayByYXRlLiBJJ2xsIHNlbmQKYSBuZXcgdmVyc2lvbiBz
aG9ydGx5LgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK

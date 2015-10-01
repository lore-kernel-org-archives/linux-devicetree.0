From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Thu, 1 Oct 2015 07:58:42 -0500
Message-ID: <CAL_Jsq+aBxjvPyAR3nUtXny6JwgcopSCENrBaGzo7OKXFA1cvg@mail.gmail.com>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de>
 <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
 <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
 <1442823067.3277.35.camel@pengutronix.de>
 <CAL_JsqLcraiS+Yq48-m-xTksohU5wPSPrjtjV2GLzDTSDcUCUA@mail.gmail.com>
 <1443689957.3272.18.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1443689957.3272.18.camel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, "kernel@pengutronix.de" <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBPY3QgMSwgMjAxNSBhdCAzOjU5IEFNLCBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPiB3cm90ZToKPiBBbSBNaXR0d29jaCwgZGVuIDMwLjA5LjIwMTUsIDEyOjEz
IC0wNTAwIHNjaHJpZWIgUm9iIEhlcnJpbmc6Cj4+IE9uIE1vbiwgU2VwIDIxLCAyMDE1IGF0IDM6
MTEgQU0sIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+PiA+
IE5vdGUgaG93IHRoZSBkaXNwbGF5LXN1YnN5c3RlbSBub2RlIG92ZXJsYXBzIHRoZSBsYXJiIG5v
ZGUuIElzIHRoYXQKPj4gPiBhY2NlcHRhYmxlPwo+Pgo+PiBHaXZlbiB3aGF0IHRoZSBncmFwaCBs
b29rcyBsaWtlLCBwZXJoYXBzLiBIb3dldmVyLCBkbyB5b3UgcmVhbGx5IG5lZWQKPj4gYSBjb250
YWluZXIgbm9kZT8gSXQgb25seSBzZXJ2ZXMgdG8gcHJvdmlkZSBhIGxpc3Qgb2Ygbm9kZXMgKGUu
Zy4gYWxsCj4+IHRoZSBjaGlsZHJlbikgdG8gaW5jbHVkZSBhcyBjb21wb25lbnRzLiBUaGVyZSBh
cmUgb3RoZXIgd2F5cyB0bwo+PiBkZXRlcm1pbmUgdGhpcyBsaXN0LiBZb3UgY291bGQgZmluZCBh
bGwgbm9kZXMganVzdCBzZWFyY2hpbmcKPj4gY29tcGF0aWJsZSBzdHJpbmdzIGZvciBlYWNoIGNv
bXBvbmVudC4gWW91IGp1c3QgbmVlZCB0byBiaW5kIHRoZSBkcm0KPj4gZHJpdmVyIHRvIHNvbWUg
b3RoZXIgRFQgbm9kZS4gSXMgdGhlcmUgbm8gbm9kZSB5b3UgY2FuIHBpY2sgYXMgdGhlCj4+IG1h
c3RlciBjb21wb25lbnQ/Cj4KPiBUaGVyZSBpcyB0aGUgbW1zeXMgY2xvY2stY29udHJvbGxlciBu
b2RlIGF0IHRoZSB0b3Agb2YgdGhlIE1NU1lTIGFkZHJlc3MKPiBzcGFjZSAoMHgxNDAwMDAwMC0w
eDE0ZmZmZmZmKToKPgo+ICAgICAgICAgbW1zeXM6IGNsb2NrLWNvbnRyb2xsZXJAMTQwMDAwMDAg
ewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1tbXN5cyIs
ICJzeXNjb24iOwo+ICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDE0MDAwMDAwIDAgMHgxMDAw
PjsKPiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+ICAgICAgICAgfTsKPgo+
IEl0cyByZWdpc3RlciBzcGFjZSBhbHNvIGNvbnRhaW5zIHRoZSBNTVNZU19DT05GSUcgcmVnaW9u
IHRoYXQgY29udHJvbHMKPiB0aGUgbXVsdGlwbGV4ZXJzIGJldHdlZW4gdGhlIGRpc3BsYXkgZnVu
Y3Rpb24gYmxvY2tzLCBzbyB0aGF0IHdvdWxkIGJlIGEKPiBnb29kIGNhbmRpZGF0ZS4KPiBObyBk
cml2ZXIgYmluZHMgdG8gdGhpcyBub2RlIHlldCwgdGhlIGNsb2NrcyBhcmUgcmVnaXN0ZXJlZCB3
aXRoCj4gQ0xLX09GX0RFQ0xBUkUuCj4KPiBJJ2xsIHRyeSB0byBiaW5kIHRvIHRoaXMgbm9kZSBh
bmQgaGF2ZSB0aGUgZHJpdmVyIGZpbmQgc2libGluZyBub2Rlcwo+IHVzaW5nIHRoZWlyIGNvbXBh
dGlibGUgc3RyaW5ncy4KClRoYXQgZG9lc24ndCBzZWVtIGxpa2UgYSBnb29kIGNob2ljZSBzaW5j
ZSB0aGVyZSBhcmUgb3RoZXIgZnVuY3Rpb25zCmluIHRoZSBibG9jay4gSSB3YXMgdGhpbmtpbmcg
b25lIG9mIHRoZSBkaXNwbGF5IHJlbGF0ZWQgYmxvY2tzIGxpa2UKd2hhdGV2ZXIgYmxvY2sgcHJv
dmlkZXMgdGhlIG1haW4gY3J0YyBmdW5jdGlvbnMuCgpSb2IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

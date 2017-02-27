From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/2] of: add devm_ functions for populate and depopulate
Date: Mon, 27 Feb 2017 17:20:53 +0100
Message-ID: <20170227162053.j2gca6zmobpengbb@phenom.ffwll.local>
References: <1487952874-23635-1-git-send-email-benjamin.gaignard@linaro.org>
 <1487952874-23635-2-git-send-email-benjamin.gaignard@linaro.org>
 <CAL_Jsq+z9FcPowoMYXQ4aPfSYfL3D4ENoZxiTTO2pKJjnsRXOw@mail.gmail.com>
 <20170226201157.xzg5b5tyrdlxkeyd@phenom.ffwll.local>
 <CAL_JsqJQcFO_=D=g1KrfSTQdVCXUfE0k25+PQnSxvLZ1pHU=3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJQcFO_=D=g1KrfSTQdVCXUfE0k25+PQnSxvLZ1pHU=3g@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Vincent Abriou <vincent.abriou@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBGZWIgMjcsIDIwMTcgYXQgMDc6MzA6MjRBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBGZWIgMjYsIDIwMTcgYXQgMjoxMSBQTSwgRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDI0LCAyMDE3IGF0IDEwOjMxOjI1
QU0gLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4+IE9uIEZyaSwgRmViIDI0LCAyMDE3IGF0
IDEwOjE0IEFNLCBCZW5qYW1pbiBHYWlnbmFyZAo+ID4+IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5h
cm8ub3JnPiB3cm90ZToKPiA+PiA+IExvdHMgb2YgY2FsbHMgdG8gb2ZfcGxhdGZvcm1fcG9wdWxh
dGUoKSBhcmUgbm90IHVuYmFsYW5jZWQgYnkgYSBjYWxsCj4gPj4gPiB0byBvZl9wbGF0Zm9ybV9k
ZXBvcHVsYXRlKCkuIFRoaXMgY3JlYXRlIGlzc3VlcyB3aGlsZSBkcml2ZXJzIGFyZQo+ID4+ID4g
YmluZC91bmJpbmQuCj4gPj4gPgo+ID4+ID4gSW4gd2F5IHRvIHNvbHZlIHRob3NlIGlzc3VlcyBp
cyB0byBhZGQgZGV2bV9vZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpCj4gPj4gPiB3aGljaCB3aWxsIGNh
bGwgb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZSgpIHdoZW4gdGhlIGRldmljZSBpcyB1bmJvdW5kCj4g
Pj4gPiBmcm9tIHRoZSBidXMuCj4gPj4gPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4g
R2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gPj4gPiAtLS0KPiA+PiA+
IHZlcnNpb24gMjoKPiA+PiA+IC0gc2ltcGxpZnkgZnVuY3Rpb24gcHJvdG90eXBlIHRvIG9ubHkg
a2VlcCBkZXZpY2UgYXMgcGFyYW1ldGVyCj4gPj4gPgo+ID4+ID4gIGRyaXZlcnMvb2YvcGxhdGZv
cm0uYyAgICAgICB8IDcxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4+ID4gIGluY2x1ZGUvbGludXgvb2ZfcGxhdGZvcm0uaCB8IDExICsrKysrKysKPiA+
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IEZvciB0aGlz
IGFuZCBwYXRjaCAyOgo+ID4+Cj4gPj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cj4gPgo+ID4gSXMgdGhpcyBhbiBhY2sgZm9yIG1lcmdpbmcgYm90aCB0aHJvdWdoIGRy
bS1taXNjLCBvciBzaG91bGQgd2UgZG8gYQo+ID4gdG9waWMtYnJhbmNoIGRhbmNlIGhlcmU/Cj4g
Cj4gWW91IGNhbiBhcHBseSBpdCBkaXJlY3RseS4KCk9rLCB0aGlzIHNlZW1zIGxpa2UgYSBwcmV0
dHkgY29vbCBpZGVhLCBzbyBhcHBsaWVkIGJvdGggdG8gZHJtLW1pc2MgZm9yCjQuMTIuCgpDaGVl
cnMsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

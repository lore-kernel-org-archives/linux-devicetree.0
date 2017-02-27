From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] of: add devm_ functions for populate and depopulate
Date: Mon, 27 Feb 2017 07:30:24 -0600
Message-ID: <CAL_JsqJQcFO_=D=g1KrfSTQdVCXUfE0k25+PQnSxvLZ1pHU=3g@mail.gmail.com>
References: <1487952874-23635-1-git-send-email-benjamin.gaignard@linaro.org>
 <1487952874-23635-2-git-send-email-benjamin.gaignard@linaro.org>
 <CAL_Jsq+z9FcPowoMYXQ4aPfSYfL3D4ENoZxiTTO2pKJjnsRXOw@mail.gmail.com>
 <20170226201157.xzg5b5tyrdlxkeyd@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170226201157.xzg5b5tyrdlxkeyd@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBGZWIgMjYsIDIwMTcgYXQgMjoxMSBQTSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPiBPbiBGcmksIEZlYiAyNCwgMjAxNyBhdCAxMDozMToyNUFNIC0wNjAw
LCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gRnJpLCBGZWIgMjQsIDIwMTcgYXQgMTA6MTQgQU0s
IEJlbmphbWluIEdhaWduYXJkCj4+IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPiB3cm90
ZToKPj4gPiBMb3RzIG9mIGNhbGxzIHRvIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkgYXJlIG5vdCB1
bmJhbGFuY2VkIGJ5IGEgY2FsbAo+PiA+IHRvIG9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoKS4gVGhp
cyBjcmVhdGUgaXNzdWVzIHdoaWxlIGRyaXZlcnMgYXJlCj4+ID4gYmluZC91bmJpbmQuCj4+ID4K
Pj4gPiBJbiB3YXkgdG8gc29sdmUgdGhvc2UgaXNzdWVzIGlzIHRvIGFkZCBkZXZtX29mX3BsYXRm
b3JtX3BvcHVsYXRlKCkKPj4gPiB3aGljaCB3aWxsIGNhbGwgb2ZfcGxhdGZvcm1fZGVwb3B1bGF0
ZSgpIHdoZW4gdGhlIGRldmljZSBpcyB1bmJvdW5kCj4+ID4gZnJvbSB0aGUgYnVzLgo+PiA+Cj4+
ID4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxp
bmFyby5vcmc+Cj4+ID4gLS0tCj4+ID4gdmVyc2lvbiAyOgo+PiA+IC0gc2ltcGxpZnkgZnVuY3Rp
b24gcHJvdG90eXBlIHRvIG9ubHkga2VlcCBkZXZpY2UgYXMgcGFyYW1ldGVyCj4+ID4KPj4gPiAg
ZHJpdmVycy9vZi9wbGF0Zm9ybS5jICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+ID4gIGluY2x1ZGUvbGludXgvb2ZfcGxhdGZvcm0uaCB8
IDExICsrKysrKysKPj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspCj4+Cj4+
IEZvciB0aGlzIGFuZCBwYXRjaCAyOgo+Pgo+PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPgo+IElzIHRoaXMgYW4gYWNrIGZvciBtZXJnaW5nIGJvdGggdGhyb3VnaCBk
cm0tbWlzYywgb3Igc2hvdWxkIHdlIGRvIGEKPiB0b3BpYy1icmFuY2ggZGFuY2UgaGVyZT8KCllv
dSBjYW4gYXBwbHkgaXQgZGlyZWN0bHkuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

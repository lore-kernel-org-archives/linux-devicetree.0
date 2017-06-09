From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 19/19] ARM: sun6i: a31s: Enable HDMI display output on the
 MSI Primo81 tablet
Date: Fri, 9 Jun 2017 11:49:44 -0500
Message-ID: <CAL_JsqKv_ko6NUL35kmDCyhiP_b7SMnMe-M2--X_GjJpLO1ECg@mail.gmail.com>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-20-wens@csie.org>
 <20170602194219.hiajr7dt2oikm52q@flea.lan>
 <20170607223625.aofk3cba3w4cvlys@rob-hp-laptop>
 <CAKb7UvgKhgCpeNzUX1ecFPuF6j+KvAWW3vprZ9nnVMBBJFi_zQ@mail.gmail.com>
 <CAGb2v64uxmxptf9VgHO8tT=AbPc+VtDhtG+rVd3Nwf9bEGr8pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v64uxmxptf9VgHO8tT=AbPc+VtDhtG+rVd3Nwf9bEGr8pg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKdW4gOSwgMjAxNyBhdCAxMTowOCBBTSwgQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUu
b3JnPiB3cm90ZToKPiBPbiBUaHUsIEp1biA4LCAyMDE3IGF0IDY6NDcgQU0sIElsaWEgTWlya2lu
IDxpbWlya2luQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4+IE9uIFdlZCwgSnVuIDcsIDIwMTcgYXQg
NjozNiBQTSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiBPbiBGcmks
IEp1biAwMiwgMjAxNyBhdCAwOTo0MjoxOVBNICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+
Pj4+IE9uIEZyaSwgSnVuIDAyLCAyMDE3IGF0IDA2OjEwOjI0UE0gKzA4MDAsIENoZW4tWXUgVHNh
aSB3cm90ZToKPj4+PiA+IFRoZSBNU0kgUHJpbW84MSB0YWJsZXQgaGFzIGEgbWljcm8gSERNSSBj
b25uZWN0b3IgYXQgdGhlIGJvdHRvbS4KPj4+PiA+IFRoaXMgaXMgY29ubmVjdGVkIHRvIHRoZSBT
b0NzIEhETUkgb3V0cHV0Lgo+Pj4+ID4KPj4+PiA+IEVuYWJsZSB0aGUgZGlzcGxheSBwaXBlbGlu
ZSBhbmQgdGhlIEhETUkgb3V0cHV0Lgo+Pj4+ID4KPj4+PiA+IFNpZ25lZC1vZmYtYnk6IENoZW4t
WXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KPj4+PiA+IC0tLQo+Pj4+ID4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N1bjZpLWEzMXMtcHJpbW84MS5kdHMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysr
Cj4+Pj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPj4+PiA+Cj4+Pj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuNmktYTMxcy1wcmltbzgxLmR0cyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N1bjZpLWEzMXMtcHJpbW84MS5kdHMKPj4+PiA+IGluZGV4IGYzNzEy
NzUzZmE0Mi4uMjYxNTRiMmY4N2EzIDEwMDY0NAo+Pj4+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3VuNmktYTMxcy1wcmltbzgxLmR0cwo+Pj4+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
c3VuNmktYTMxcy1wcmltbzgxLmR0cwo+Pj4+ID4gQEAgLTUyLDE3ICs1Miw0MiBAQAo+Pj4+ID4g
IC8gewo+Pj4+ID4gICAgIG1vZGVsID0gIk1TSSBQcmltbzgxIHRhYmxldCI7Cj4+Pj4gPiAgICAg
Y29tcGF0aWJsZSA9ICJtc2kscHJpbW84MSIsICJhbGx3aW5uZXIsc3VuNmktYTMxcyI7Cj4+Pj4g
PiArCj4+Pj4gPiArICAgaGRtaS1jb25uZWN0b3Igewo+Pj4+ID4gKyAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJoZG1pLWNvbm5lY3RvciI7Cj4+Pj4gPiArICAgICAgICAgICB0eXBlID0gImMiOwo+
Pj4+Cj4+Pj4gU2hvdWxkIHdlIGFkZCBhIGNvbm5lY3RvciB0eXBlIGZvciB0aGlzIG9uZT8KPj4+
Cj4+PiBjIGFzIGluIFVTQiBUeXBlIEM/IEknZCBwcmVmZXIgdG8gc2VlIGEgbmV3IGNvbXBhdGli
bGUgc3RyaW5nLiBJcyB0eXBlCj4+PiBldmVuIGRvY3VtZW50ZWQ/Cj4KPiBJbmRlZWQgaXQgaXM6
Cj4KPiBodHRwOi8vZWxpeGlyLmZyZWUtZWxlY3Ryb25zLmNvbS9saW51eC9sYXRlc3Qvc291cmNl
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9oZG1p
LWNvbm5lY3Rvci50eHQjTDYKCi1FVE9PTUFOWUJJTkRJTkdTCgpJIGd1ZXNzIEkgZG9uJ3QgdW5k
ZXJzdGFuZCB0aGUgb3JpZ2luYWwgcXVlc3Rpb24gdGhlbi4gVGhpcyBsb29rcyBmaW5lIHRvIG1l
LgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

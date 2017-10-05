From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/12] of: overlay: clean up device tree overlay code
Date: Thu, 5 Oct 2017 09:53:33 +0300
Message-ID: <3eac16b0-fdd9-fd6c-e1ca-e0de49ce27cb@ti.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJFPHOxrOYNcJCmNvdTA+1RqZxNSZOq6byzDVygUwV0Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqJFPHOxrOYNcJCmNvdTA+1RqZxNSZOq6byzDVygUwV0Ow@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jyri Sarha <jsarha@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

77u/ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgw
IEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0Rv
bWljaWxlOiBIZWxzaW5raQoKT24gMDQvMTAvMTcgMTc6NTYsIFJvYiBIZXJyaW5nIHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDIsIDIwMTcgYXQgMTA6NTMgUE0sICA8ZnJvd2FuZC5saXN0QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+IEZyb206IEZyYW5rIFJvd2FuZCA8ZnJhbmsucm93YW5kQHNvbnkuY29tPgo+
Pgo+PiBJIGhhdmUgZm91bmQgdGhlIGRldmljZSB0cmVlIG92ZXJsYXkgY29kZSB0byBiZSBkaWZm
aWN1bHQgdG8gcmVhZCBhbmQKPj4gbWFpbnRhaW4uICBUaGlzIHBhdGNoIHNlcmllcyBhdHRlbXB0
cyB0byBpbXByb3ZlIHRoYXQgc2l0dWF0aW9uLgo+Pgo+PiBUaGUgY2xlYW51cCBpbmNsdWRlcyBz
b21lIGNoYW5nZXMgdmlzaWJsZSB0byB1c2VycyBvZiBvdmVybGF5cy4gIFRoZQo+PiBvbmx5IGlu
IGtlcm5lbCB1c2VyIG9mIG92ZXJsYXlzIGlzIGZpeGVkIHVwIGZvciB0aG9zZSBjaGFuZ2VzLiAg
VGhlCj4+IGluIGtlcm5lbCB1c2VyIGlzOgo+Pgo+PiAgICBkcml2ZXJzL2dwdS9kcm0vdGlsY2Rj
L3RpbGNkY19zbGF2ZV9jb21wYXQuYwo+IAo+IEF0IHdoYXQgcG9pbnQgY2FuIHdlIHJlbW92ZSB0
aGlzPyBJJ20gYXNzdW1pbmcgYXQgc29tZSBwb2ludCB1c2Vycwo+IHdpbGwgbmVlZCB0byB1cGRh
dGUgdGhlaXIgZHRiJ3MgZm9yIG90aGVyIHJlYXNvbnMgYW5kIHRoaXMgYmVjb21lcwo+IG9ic29s
ZXRlLgoKVG8gYmUgaG9uZXN0LCBJIGhhdmUgbm8gaWRlYSwgb3IgaG93IHRvIGZpbmQgdGhhdCBv
dXQuCgpEbyB3ZSBuZWVkIHRvIGdldCByaWQgb2YgaXQ/IEFmYWlrLCB3ZSBoYXZlbid0IGRvIG11
Y2ggKG9yIGFueT8pCm1haW50ZW5hbmNlIG9uIHRpbGNkY19zbGF2ZV9jb21wYXQuYyBzaW5jZSBp
dCB3YXMgd3JpdHRlbiwgc28gZnJvbSBvdXIKcGVyc3BlY3RpdmUgaXQncyBiZWVuIGEgbWluaW1h
bCBidXJkZW4uIElzIGl0IGNyZWF0aW5nIGJ1cmRlbiBmb3Igb3RoZXJzPwoKSXMgdGhlIGFwcHJv
YWNoIGRvbmUgd2l0aCB0aWxjZGNfc2xhdmVfY29tcGF0LmMgc29tZXRoaW5nIHRoYXQncyBub3QK
cmVjb21tZW5kZWQ/IEknbSBzdXJlIHNpbWlsYXIgc2l0dWF0aW9ucyBoYXBwZW4gd2l0aCBvdGhl
ciBkcml2ZXJzIHRvbywKYW5kIEkgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byBoYXZlIGEgcmVj
b21tZW5kZWQgd2F5IG9mIGtlZXBpbmcKY29tcGF0aWJpbGl0eS4KCiBUb21pCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

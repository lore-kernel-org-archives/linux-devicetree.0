From: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH RFC 03/24] arm64/dts: add switch-delay for meson mali
Date: Tue, 22 May 2018 08:48:43 +0800
Message-ID: <CAKGbVbveF1n=MJrmV2EK7bR+uRAa92rdB=ybHh7xHnwaLM==Xw@mail.gmail.com>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-4-yuq825@gmail.com>
 <70ef1af2-beff-04a1-063f-cfe430c4fdf9@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <70ef1af2-beff-04a1-063f-cfe430c4fdf9@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Simon Shields <simon@lineageos.org>, devicetree@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, Marek Vasut <marex@denx.de>, Andrei Paulau <7134956@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Vasily Khoruzhick <anarsoul@gmail.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Erico Nunes <nunes.erico@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTmVpbCwKCk9LLCBJJ2xsIHJlc2VuZCB0aGVzZSBwYXRjaGVzLgoKUmVnYXJkcywKUWlhbmcK
Ck9uIE1vbiwgTWF5IDIxLCAyMDE4IGF0IDEwOjE2IFBNLCBOZWlsIEFybXN0cm9uZwo8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+IEhpIFl1cSwKPgo+IE9uIDE4LzA1LzIwMTggMTE6
MjcsIFFpYW5nIFl1IHdyb3RlOgo+PiBNZXNvbiBtYWxpIEdQVSBvcGVyYXRlIGluIGhpZ2ggY2xv
Y2sgZnJlcXVlbmN5LCBuZWVkCj4+IHRoaXMgdmFsdWUgYmUgaGlnaCB0byB3b3JrIGluIGEgc3Rh
YmxlIHN0YXRlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNv
bT4KPj4gLS0tCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLW1hbGku
ZHRzaSB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLW1hbGkuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwtbWFsaS5kdHNpCj4+IGluZGV4
IGViMzI3NjY0YTRkOC4uOGJlZDE1MjY3YzljIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLW1hbGkuZHRzaQo+PiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLW1hbGkuZHRzaQo+PiBAQCAtMjMsNiArMjMsNyBAQAo+
PiAgICAgICAgICAgICAgICAgICAgICAgInBwMiIsICJwcG1tdTIiOwo+PiAgICAgICAgICAgICAg
IGNsb2NrcyA9IDwmY2xrYyBDTEtJRF9DTEs4MT4sIDwmY2xrYyBDTEtJRF9NQUxJPjsKPj4gICAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJidXMiLCAiY29yZSI7Cj4+ICsgICAgICAgICAgICAg
c3dpdGNoLWRlbGF5ID0gPDB4ZmZmZj47Cj4+Cj4+ICAgICAgICAgICAgICAgLyoKPj4gICAgICAg
ICAgICAgICAgKiBNYWxpIGNsb2NraW5nIGlzIHByb3ZpZGVkIGJ5IHR3byBpZGVudGljYWwgY2xv
Y2sgcGF0aHMKPj4KPgo+IFBsZWFzZSBDQyA6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IHRvIGhhdmUgdGhlc2UgYW1sb2dpYyBEVCBwYXRjaGVzIHJldmlld2VkIGFuZCBhcHBs
aWVkLgo+Cj4gU2FtZSBmb3IgY292ZXItbGV0dGVyIHRvIGhhdmUgY29udGV4dC4KPgo+IFRoYW5r
cywKPiBOZWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

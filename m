From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Mon, 17 Oct 2016 16:01:21 +0200
Message-ID: <CAMpxmJXT8hcSc0-svbwAq5r_JOFsYV852gtE0vuXL8hHykXnRQ@mail.gmail.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
 <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com>
 <4975084.EGQPv58AK6@avalon> <daf49046-ad0a-d9e2-d744-1e06085c6585@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <daf49046-ad0a-d9e2-d744-1e06085c6585@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan@gmail.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

MjAxNi0xMC0xNyAxNDoyOSBHTVQrMDI6MDAgVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QHRpLmNvbT46Cj4gT24gMTcvMTAvMTYgMTQ6NDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4+
IEhlbGxvLAo+Pgo+PiBPbiBNb25kYXkgMTcgT2N0IDIwMTYgMTA6MzM6NTggVG9taSBWYWxrZWlu
ZW4gd3JvdGU6Cj4+PiBPbiAxNy8xMC8xNiAxMDoxMiwgU2VraGFyIE5vcmkgd3JvdGU6Cj4+Pj4g
T24gTW9uZGF5IDE3IE9jdG9iZXIgMjAxNiAxMToyNiBBTSwgVG9taSBWYWxrZWluZW4gd3JvdGU6
Cj4+Pj4+IE9uIDE1LzEwLzE2IDIwOjQyLCBTZWtoYXIgTm9yaSB3cm90ZToKPj4+Pj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQo+Pj4+Pj4+IGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZGE4NTAuZHRzaQo+Pj4+Pj4+IGluZGV4IGY3OWUxYjkuLjMyOTA4YWUgMTAwNjQ0
Cj4+Pj4+Pj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQo+Pj4+Pj4+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kKPj4+Pj4+PiBAQCAtMzk5LDYgKzQyMCwxNCBA
QAo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmZWRtYTAgMCAxPjsK
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hLW5hbWVzID0gInR4IiwgInJ4IjsK
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgIH07Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsgICAgICAgICAg
ICAgICAgZGlzcGxheTogZGlzcGxheUAyMTMwMDAgewo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInRpLGFtMzN4eC10aWxjZGMiLCAidGksZGE4NTAtdGlsY2Rj
IjsKPj4+Pj4+Cj4+Pj4+PiBUaGlzIHNob3VsZCBpbnN0ZWFkIGJlOgo+Pj4+Pj4KPj4+Pj4+IGNv
bXBhdGlibGUgPSAidGksZGE4NTAtdGlsY2RjIiwgInRpLGFtMzN4eC10aWxjZGMiOwo+Pj4+Pj4K
Pj4+Pj4+IGFzIHRoZSBjbG9zZXN0IG1hdGNoIHNob3VsZCBhcHBlYXIgZmlyc3QgaW4gdGhlIGxp
c3QuCj4+Pj4+Cj4+Pj4+IEFjdHVhbGx5IEkgZG9uJ3QgdGhpbmsgdGhhdCdzIGNvcnJlY3QuIFRo
ZSBMQ0RDIG9uIGRhODUwIGlzIG5vdAo+Pj4+PiBjb21wYXRpYmxlIHdpdGggdGhlIExDREMgb24g
QU0zMzV4LiBJIHRoaW5rIGl0IHNob3VsZCBiZSBqdXN0Cj4+Pj4+ICJ0aSxkYTg1MC10aWxjZGMi
Lgo+Pj4+Cj4+Pj4gU28gaWYgInRpLGFtMzN4eC10aWxjZGMiIGlzIHVzZWQsIHRoZSBkaXNwbGF5
IHdvbnQgd29yayBhdCBhbGw/IElmIHRoYXRzCj4+Pj4gdGhlIGNhc2UsIEkgd29uZGVyIGhvdyB0
aGUgcGF0Y2ggcGFzc2VkIHRlc3RpbmcuIEJhcnRvc3o/Cj4+Pgo+Pj4gQU0zIGhhcyAidmVyc2lv
biAyIiBvZiBMQ0RDLCB3aGVyZWFzIERBODUwIGlzIHYxLiBUaGV5IGFyZSBxdWl0ZQo+Pj4gc2lt
aWxhciwgYnV0IGRpZmZlcmVudC4KPj4+Cj4+PiBUaGUgZHJpdmVyIGdldHMgdGhlIHZlcnNpb24g
bnVtYmVyIGZyb20gTENEQydzIHJlZ2lzdGVyLCBhbmQgYWN0cyBiYXNlZAo+Pj4gb24gdGhhdCwg
c28gYWZhaWsgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGRvZXNuJ3QgcmVhbGx5IGFmZmVjdCB0aGUK
Pj4+IGZ1bmN0aW9uYWxpdHkgKGFzIGxvbmcgYXMgaXQgbWF0Y2hlcykuCj4+Pgo+Pj4gQnV0IGV2
ZW4gaWYgaXQgd29ya3Mgd2l0aCB0aGUgY3VycmVudCBkcml2ZXIsIEkgZG9uJ3QgdGhpbmsKPj4+
ICJ0aSxhbTMzeHgtdGlsY2RjIiBhbmQgInRpLGRhODUwLXRpbGNkYyIgYXJlIGNvbXBhdGlibGUg
aW4gdGhlIEhXIGxldmVsLgo+Pgo+PiBJZiB0aGUgaGFyZHdhcmUgcHJvdmlkZXMgSVAgcmV2aXNp
b24gaW5mb3JtYXRpb24sIGhvdyBhYm91dCBqdXN0ICJ0aSxsY2RjIiA/Cj4KPiBNYXliZSwgYW5k
IEkgYWdyZWUgdGhhdCdzIHRoZSAiY29ycmVjdCIgd2F5LCBidXQgbG9va2luZyBhdCB0aGUgaGlz
dG9yeSwKPiBpdCdzIG5vdCBqdXN0IG9uY2Ugb3IgdHdpY2Ugd2hlbiB3ZSd2ZSBzdWRkZW5seSBm
b3VuZCBvdXQgc29tZQo+IGRpZmZlcmVuY2Ugb3IgYnVnIG9yIHN1Y2ggaW4gYW4gSVAgcmV2aXNp
b24sIG9yIHRoZSBpbnRlZ3JhdGlvbiB0byBhCj4gU29DLCB0aGF0IGNhbid0IGJlIGZvdW5kIGJh
c2VkIG9uIHRoZSBJUCByZXZpc2lvbi4KPgo+IFRoYXQncyB3aHkgSSBmZWVsIGl0J3MgdXN1YWxs
eSBzYWZlciB0byBoYXZlIHRoZSBTb0MgcmV2aXNpb24gdGhlcmUgaW4KPiB0aGUgY29tcGF0aWJs
ZSBzdHJpbmcuCj4KPiBUaGF0IHNhaWQsIHdlIGhhdmUgb25seSBhIGZldyBkaWZmZXJlbnQgb2xk
IFNvQ3Mgd2l0aCBMQ0RDIChjb21wYXJlZCB0bywKPiBzYXksIE9NQVAgRFNTKSBzbyBpbiB0aGlz
IGNhc2UgcGVyaGFwcyBqdXN0ICJ0aSxsY2RjIiB3b3VsZCBiZSBmaW5lLgo+Cj4gIFRvbWkKPgoK
SSBTZWtoYXIgaXMgb2sgd2l0aCB0aGlzLCBJJ2xsIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2ggZm9y
IHRoYXQuCgpUaGFua3MsCkJhcnRvc3oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
Date: Tue, 6 Dec 2016 16:06:40 +0100
Message-ID: <CAMpxmJWM0CDD550+hW6cjcuKxs8Kg7O707tVfAjwXuAeoT2SpA@mail.gmail.com>
References: <1480420624-23544-1-git-send-email-bgolaszewski@baylibre.com>
 <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>
 <a2159347-1cd7-18b1-626a-fe6a272ba85c@ti.com>
 <CAMpxmJUDyZmokJsf=RdP1DwzA_4Xc+Oh3SuSg_OenQOO5mqLvw@mail.gmail.com>
 <e6d7870b-e9fd-242f-0e74-5bae2d2b27f1@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <e6d7870b-e9fd-242f-0e74-5bae2d2b27f1@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-drm <dri-devel@lists.freedesktop.org>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

MjAxNi0xMi0wNiAxNjowMyBHTVQrMDE6MDAgU2VraGFyIE5vcmkgPG5zZWtoYXJAdGkuY29tPjoK
PiBPbiBUdWVzZGF5IDA2IERlY2VtYmVyIDIwMTYgMDY6MzIgUE0sIEJhcnRvc3ogR29sYXN6ZXdz
a2kgd3JvdGU6Cj4+IDIwMTYtMTItMDUgMTM6NDkgR01UKzAxOjAwIFRvbWkgVmFsa2VpbmVuIDx0
b21pLnZhbGtlaW5lbkB0aS5jb20+Ogo+Pj4gT24gMjkvMTEvMTYgMTM6NTcsIEJhcnRvc3ogR29s
YXN6ZXdza2kgd3JvdGU6Cj4+Pj4gQWRkIHRoZSBkdW1iLXZnYS1kYWMgbm9kZSB0byB0aGUgYm9h
cmQgRFQgdG9nZXRoZXIgd2l0aCBjb3JyZXNwb25kaW5nCj4+Pj4gcG9ydHMgYW5kIHZnYSBjb25u
ZWN0b3IuIFRoaXMgYWxsb3dzIHRvIHJldHJpZXZlIHRoZSBlZGlkIGluZm8gZnJvbQo+Pj4+IHRo
ZSBkaXNwbGF5IGF1dG9tYXRpY2FsbHkuCj4+Pj4KPj4+Cj4+PiBJdCdzIGEgYml0IGRpZmZpY3Vs
dCB0byBmb2xsb3cgdGhpcyBhcyB0aGVyZSdzIGJlZW4gc28gbWFueSBwYXRjaGVzCj4+PiBnb2lu
ZyBhcm91bmQuIEJ1dCBJIHRha2UgdGhlIGFib3ZlIGlzIHRoZSBMQ0RDIG5vZGUgaW4gdGhlIGJh
c2UgZGE4NTAKPj4+IGR0c2kgZmlsZT8gSW4gdGhhdCBjYXNlLCB3aGF0IGlzIHRoZSBkaXNwbGF5
X2luIHN1cHBvc2VkIHRvIHByZXNlbnQ/Cj4+PiBJdCdzIHRoZSBmaXJzdCBub2RlIGluIHRoZSAi
ZGlzcGxheSBjaGFpbiIsIHNvIGl0IGhhcyBubyBpbnB1dC4KPj4+Cj4+PiBBbHNvLCBkb24ndCB0
b3VjaCBkYTg1MC5kdHNpIGhlcmUsIGp1c3QgYWRkIHRoZSAicG9ydHMiIG5vZGUgaW4gdGhlCj4+
PiBkYTg1MC1sY2RrLmR0cyBmaWxlLgo+Pj4KPj4+IElmIHRoZSBkYTg1MC5kdHNpIGhhcyBub3Qg
YmVlbiBtZXJnZWQgeWV0LCBJJ2QgY2hhbmdlIHRoZSBuYW1lIG9mIHRoZQo+Pj4gbGNkYyBub2Rl
IHRvIHNvbWV0aGluZyBlbHNlIHRoYW4gImRpc3BsYXkiLiBJdCdzIHJhdGhlciB2YWd1ZS4gSWYg
aXQncwo+Pj4gbmFtZWQgImxjZGMiLCByZWFkaW5nIGRhODUwLWxjZGsuZHRzIGJlY29tZXMgbXVj
aCBlYXNpZXIsIGFzIHlvdSdsbAo+Pj4gcmVmZXIgdG8gImxjZGMiLgo+Pj4KPj4KPj4gVGhlIG5v
ZGUgaXMgYWxyZWFkeSBpbiBTZWtoYXIncyBicmFuY2guCj4KPiBUaGUgbm9kZSBuYW1lIHNob3Vs
ZCBiZSAnZGlzcGxheScgYXMgdGhhdHMgdGhlIGVQQVBSIDEuMSBnZW5lcmljIG5hbWUKPiByZWNv
bW1lbmRhdGlvbi4gVGhlIGxhYmVsIGlzIGFsc28gc2V0IHRvICdkaXNwbGF5JyB0aG91Z2ggYW5k
IHRoYXQgY2FuCj4gYmUgY2hhbmdlZCB0byBsY2RjLgo+Cj4gQSBwcmUtcGF0Y2ggdG8gZml4IHRo
YXQgYmVmb3JlIHdlIG1vZGlmeSB0aGUgbm9kZSBmdXJ0aGVyIGlzIHdlbGNvbWUuCj4KPiBUaGFu
a3MsCj4gU2VraGFyCgpJJ2xsIGluY2x1ZGUgdGhpcyBpbiB2NSB0b2dldGhlciB3aXRoIHRoZSBj
aGFuZ2UgcmVxdWVzdGVkIGJ5IExhdXJlbnQuCgpUaGFua3MsCkJhcnRvc3oKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

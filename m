From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Mon, 17 Oct 2016 09:28:39 +0200
Message-ID: <CAMpxmJXTRZg-BLyT7TBCrfySSaCDVrkEArPpD8cVrAZ4qX0ULQ@mail.gmail.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <1475672732-17111-3-git-send-email-bgolaszewski@baylibre.com>
 <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
 <1e23c3e9-d34b-1d8f-8565-c9932a60fd32@ti.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan@gmail.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Karl Beldan <kbeldan@baylibre.com>, linux-drm <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

MjAxNi0xMC0xNyA5OjEyIEdNVCswMjowMCBTZWtoYXIgTm9yaSA8bnNla2hhckB0aS5jb20+Ogo+
IE9uIE1vbmRheSAxNyBPY3RvYmVyIDIwMTYgMTE6MjYgQU0sIFRvbWkgVmFsa2VpbmVuIHdyb3Rl
Ogo+PiBPbiAxNS8xMC8xNiAyMDo0MiwgU2VraGFyIE5vcmkgd3JvdGU6Cj4+Cj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9k
YTg1MC5kdHNpCj4+Pj4gaW5kZXggZjc5ZTFiOS4uMzI5MDhhZSAxMDA2NDQKPj4+PiAtLS0gYS9h
cmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpCj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
ZGE4NTAuZHRzaQo+Pj4KPj4+PiBAQCAtMzk5LDYgKzQyMCwxNCBAQAo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmVkbWEwIDAgMT47Cj4+Pj4gICAgICAgICAgICAgICAgICAgICBk
bWEtbmFtZXMgPSAidHgiLCAicngiOwo+Pj4+ICAgICAgICAgICAgIH07Cj4+Pj4gKwo+Pj4+ICsg
ICAgICAgICAgIGRpc3BsYXk6IGRpc3BsYXlAMjEzMDAwIHsKPj4+PiArICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidGksYW0zM3h4LXRpbGNkYyIsICJ0aSxkYTg1MC10aWxjZGMiOwo+
Pj4KPj4+IFRoaXMgc2hvdWxkIGluc3RlYWQgYmU6Cj4+Pgo+Pj4gY29tcGF0aWJsZSA9ICJ0aSxk
YTg1MC10aWxjZGMiLCAidGksYW0zM3h4LXRpbGNkYyI7Cj4+Pgo+Pj4gYXMgdGhlIGNsb3Nlc3Qg
bWF0Y2ggc2hvdWxkIGFwcGVhciBmaXJzdCBpbiB0aGUgbGlzdC4KPj4KPj4gQWN0dWFsbHkgSSBk
b24ndCB0aGluayB0aGF0J3MgY29ycmVjdC4gVGhlIExDREMgb24gZGE4NTAgaXMgbm90Cj4+IGNv
bXBhdGlibGUgd2l0aCB0aGUgTENEQyBvbiBBTTMzNXguIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGp1
c3QKPj4gInRpLGRhODUwLXRpbGNkYyIuCj4KPiBTbyBpZiAidGksYW0zM3h4LXRpbGNkYyIgaXMg
dXNlZCwgdGhlIGRpc3BsYXkgd29udCB3b3JrIGF0IGFsbD8gSWYgdGhhdHMKPiB0aGUgY2FzZSwg
SSB3b25kZXIgaG93IHRoZSBwYXRjaCBwYXNzZWQgdGVzdGluZy4gQmFydG9zej8KPgoKREE4NTAg
dXNlcyByZXZpc2lvbiAxIG9mIHRoZSBJUCB3aGlsZSBhbTMzeHggaXMgZXF1aXBwZWQgd2l0aCBy
ZXYgMi4KVGhlIGRyaXZlciByZWFkcyB0aGUgYXBwcm9wcmlhdGUgcmVnaXN0ZXIsIGRldGVjdHMg
dGhlIHJldmlzaW9uIGFuZApzZXRzIHRoZSBjb3JyZXNwb25kaW5nIGZpZWxkIGluIHN0cnVjdCB0
aWxjZGNfZHJtX3ByaXZhdGUgaW4KdGlsY2RjX2xvYWQoKS4KClRoYW5rcywKQmFydG9zegpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

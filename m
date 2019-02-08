From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 05/12] ARM: davinci: da850: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 13:47:56 +0100
Message-ID: <CAMpxmJUXuxEp+424Z_YtAq02XvBzcDAj73LgOBnXE-T0fhmCTQ@mail.gmail.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-6-brgl@bgdev.pl>
 <9d423e18-8c85-731b-388a-1843067db242@ti.com>
 <CAMpxmJW0qMi0BmiK2SOwdagw2-t8+1g20XJR418mWb8f1dwxtQ@mail.gmail.com>
 <acd3f8ca-8ed7-f86a-9bdf-24e4e6e9a6a4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <acd3f8ca-8ed7-f86a-9bdf-24e4e6e9a6a4@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

cHQuLCA4IGx1dCAyMDE5IG8gMTM6MzcgU2VraGFyIE5vcmkgPG5zZWtoYXJAdGkuY29tPiBuYXBp
c2HFgihhKToKPgo+IE9uIDA4LzAyLzE5IDY6MDQgUE0sIEJhcnRvc3ogR29sYXN6ZXdza2kgd3Jv
dGU6Cj4gPiBwdC4sIDggbHV0IDIwMTkgbyAxMzowNiBTZWtoYXIgTm9yaSA8bnNla2hhckB0aS5j
b20+IG5hcGlzYcWCKGEpOgo+ID4+Cj4gPj4gT24gMDQvMDIvMTkgMTA6NDcgUE0sIEJhcnRvc3og
R29sYXN6ZXdza2kgd3JvdGU6Cj4gPj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRhdmluY2lfdGlt
ZXJfY2ZnIGRhODUwX3RpbWVyX2NmZyA9IHsKPiA+Pj4gKyAgICAgLnJlZyA9IHsKPiA+Pj4gKyAg
ICAgICAgICAgICAuc3RhcnQgICAgICAgICAgPSBEQThYWF9USU1FUjY0UDBfQkFTRSwKPiA+Pj4g
KyAgICAgICAgICAgICAuZW5kICAgICAgICAgICAgPSBEQThYWF9USU1FUjY0UDBfQkFTRSArIFNa
XzRLLAo+ID4+Cj4gPj4gU1pfNEsgLSAxCj4gPj4KPiA+PiBUaGlzIHNob3VsZCBoYXZlIHByZXZl
bnRlZCB3YXRjaGRvZyB0aW1lciBmcm9tIGdldHRpbmcgcmVnaXN0ZXJlZC4KPiA+Pgo+ID4+IFRo
YW5rcywKPiA+PiBTZWtoYXIKPiA+Cj4gPiBNeSBjbG9ja3NvdXJjZSBkcml2ZXIgZG9lc24ndCBj
YWxsIHJlcXVlc3RfcmVnaW9uKCkgc28gYSBzdWJzZXF1ZW50Cj4gPiBkZXZtX2lvcmVtYXBfcmVz
b3VyY2UoKSBpbiB0aGUgd2F0Y2hkb2cgZHJpdmVyIHdvdWxkIHN0aWxsIHN1Y2NlZWQuIEkKPiA+
IG5vdyBmaXhlZCBib3RoIHRoZSBtaXNzaW5nIGNhbGwgYW5kIHRoZSB2YWx1ZSBoZXJlLgo+Cj4g
QWgsIGdvdCBpdC4gUGVyaGFwcyBhIGNhbGwgdG8gcmVxdWVzdF9yZWdpb24oKSBzaG91bGQgYmUg
YWRkZWQgdG8gY2F0Y2gKPiBpc3N1ZXM/Cj4KClllcywgdGhhdCdzIHdoYXQgSSBtZWFudCBieSAi
Zml4aW5nIHRoZSBtaXNzaW5nIGNhbGwiLiBJdCB3aWxsIGJlCnRoZXJlIGluIHYzLiBBY3R1YWxs
eSB0aGUga2VybmVsIHNlZW1zIHRvIGJlIG1pc3NpbmcgYSBub24tbWFuYWdlZAppb3JlbWFwX3Jl
c291cmNlKCkgaGVscGVyLiBNYXliZSBJIHNob3VsZCBhZGQgaXQgYXMgd2VsbC4KCkJhcnQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK

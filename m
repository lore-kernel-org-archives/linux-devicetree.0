From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V10 0/3] mtd: read partitions compatible prop for "ofpart" type
Date: Wed, 14 Mar 2018 13:10:41 +0100
Message-ID: <20180314121044.12033-1-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180130201059.4424-1-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, John Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBwYXRjaHNldCBw
cm92aWRlcyBhIHByb3BlciBzdXBwb3J0IGZvciBmbGFzaCBkZXZpY2UgRFQgbm9kZSB3aXRoCiJw
YXJ0aXRpb25zIiBzdWJub2RlIHVzaW5nICJjb21wYXRpYmxlIiBwcm9wZXJ0eS4gSXQncyBhbHJl
YWR5CmRvY3VtZW50ZWQgaW4gdGhlOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbi50eHQKCldlIGJlbGlldmVkIHRoYXQgdmVyc2lvbiA3IHdhcyByZWFkeSB0
byBnbywgYnV0IHNvb24gYWZ0ZXIgbGFuZGluZyBpbgp0aGUgbGludXgtbmV4dCB3ZSBnb3QgYSBy
ZWdyZXNzaW9uIHJlcG9ydCBmcm9tIFBldGVyLiBMYXRlciB2ZXJzaW9ucwp0YWtlcyBhIHNhZmUg
cGF0aCBieToKMSkgUmVzcGVjdGluZyBwYXJzZXJzIG9yZGVyIGFzIHNwZWNpZmllZCBpbiB0aGUg
ZGVmYXVsdC9kcml2ZXItcHJvdmlkZWQKICAgbGlzdC4KMikgTG9va2luZyBhdCAiY29tcGF0aWJs
ZSIgcHJvcGVydHkgb25seSB3aGVuICJvZnBhcnQiIHR5cGUgZ2V0cwogICBzcGVjaWllZC4KClZl
cnNpb24gOSB3YXMgc3VjY2Vzc2Z1bGx5IHRlc3RlZCBieSBQZXRlciBhbmQgdmVyc2lvbiAxMCBq
dXN0IHNxdWFzaGVzCnR3byBjb21taXRzIGludG8gYSBvbmUuCgpJIGRvdWJsZS1jaGVja2VkIHRo
ZSBjb2RlIGFuZCBjYW5ub3QgdGhpbmsgb2YgYW55IHJlZ3Jlc3Npb24gdGhpcyBjb3VsZApjYXVz
ZS4gSSBhbHNvIGhvcGUgdGhpcyBkZXNpZ24gKHJvdWdobHkgZGlzY3Vzc2VkIHdpdGggQm9yaXMp
IGNhbiBiZQphY2NlcHRhYmxlIGZvciB0aGUgbXRkIHN1YnN5c3RlbS4KClRoZSBtb3N0IGltcG9y
dGFudCBwYXRjaCBmcm9tIHRoaXMgcGF0Y2hzZXQgKDEvMykgd2FzIHJldmlld2VkIGJ5IFJvYiBp
bgp0aGUKW1BBVENIIFY2IDEvMl0gbXRkOiBwYXJ0aXRpb25zOiBhZGQgb2ZfbWF0Y2hfdGFibGUg
cGFyc2VyIG1hdGNoaW5nCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY29tbWVudC8xODMx
NTUxLwoKSWYgcG9zc2libGUgdGhpcyBpcyBhIDQuMTcgbWF0ZXJpYWwuCgpSYWZhxYIgTWnFgmVj
a2kgKDMpOgogIG10ZDogcGFydGl0aW9uczogYWRkIG9mX21hdGNoX3RhYmxlIHBhcnNlciBtYXRj
aGluZyBmb3IgdGhlICJvZnBhcnQiCiAgICB0eXBlCiAgbXRkOiByZW5hbWUgIm9mcGFydCIgcGFy
c2VyIHRvICJmaXhlZC1wYXJ0aXRpb25zIiBhcyBpdCBmaXRzIGl0IGJldHRlcgogIG10ZDogb2Zw
YXJ0OiBhZGQgb2ZfbWF0Y2hfdGFibGUgd2l0aCAiZml4ZWQtcGFydGl0aW9ucyIKCiBkcml2ZXJz
L210ZC9tdGRwYXJ0LmMgICAgICAgICAgfCAxMTYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0KIGRyaXZlcnMvbXRkL29mcGFydC5jICAgICAgICAgICB8ICAxOCArKysr
Ky0tCiBpbmNsdWRlL2xpbnV4L210ZC9wYXJ0aXRpb25zLmggfCAgIDEgKwogMyBmaWxlcyBjaGFu
Z2VkLCAxMjEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

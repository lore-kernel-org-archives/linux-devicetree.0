From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: Re: [PATCH 02/15] phy: mvebu-cp110-comphy: Add SMC call support
Date: Wed, 3 Apr 2019 11:02:15 +0200
Message-ID: <CAH76GKOJkrQnMVYFCQJKrvX++5kH4be95ytR7CaL8V5duL27yw@mail.gmail.com>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
 <20190401165131.23370-3-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190401165131.23370-3-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <mw@semihalf.com>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWlxdWVsLAoKcG9uLiwgMSBrd2kgMjAxOSBvIDE4OjUyIE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IG5hcGlzYcWCKGEpOgo+ICtzdGF0aWMgaW50IG12ZWJ1X2Nv
bXBoeV9wb3dlcl9vbihzdHJ1Y3QgcGh5ICpwaHkpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtdmVi
dV9jb21waHlfbGFuZSAqbGFuZSA9IHBoeV9nZXRfZHJ2ZGF0YShwaHkpOwo+ICsgICAgICAgc3Ry
dWN0IG12ZWJ1X2NvbXBoeV9wcml2ICpwcml2ID0gbGFuZS0+cHJpdjsKPiArICAgICAgIHUzMiBm
d19wYXJhbSA9IDA7Cj4gKyAgICAgICBpbnQgZndfbW9kZTsKPiArICAgICAgIGludCByZXQ7Cj4g
Kwo+ICsgICAgICAgZndfbW9kZSA9IG12ZWJ1X2NvbXBoeV9nZXRfZndfbW9kZShsYW5lLT5pZCwg
bGFuZS0+cG9ydCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bGFuZS0+bW9kZSwgbGFuZS0+c3VibW9kZSk7Cj4gKyAgICAgICBpZiAoZndfbW9kZSA8IDApCj4g
KyAgICAgICAgICAgICAgIGdvdG8gdHJ5X2xlZ2FjeTsKPiArCj4gKyAgICAgICAvKiBUcnkgU01D
IGZsb3cgZmlyc3QgKi8KPiArICAgICAgIHN3aXRjaCAobGFuZS0+bW9kZSkgewo+ICsgICAgICAg
Y2FzZSBQSFlfTU9ERV9FVEhFUk5FVDoKPiArICAgICAgICAgICAgICAgZGV2X2RiZyhwcml2LT5k
ZXYsICJzZXQgbGFuZSAlZCB0byBFdGhlcm5ldCBtb2RlXG4iLCBsYW5lLT5pZCk7Cj4gKyAgICAg
ICAgICAgICAgIHN3aXRjaCAobGFuZS0+c3VibW9kZSkgewo+ICsgICAgICAgICAgICAgICBjYXNl
IFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSToKPiArICAgICAgICAgICAgICAgY2FzZSBQSFlfSU5U
RVJGQUNFX01PREVfMjUwMEJBU0VYOgo+ICsgICAgICAgICAgICAgICBjYXNlIFBIWV9JTlRFUkZB
Q0VfTU9ERV8xMEdLUjoKPiArICAgICAgICAgICAgICAgICAgICAgICBmd19wYXJhbSA9IENPTVBI
WV9GV19QQVJBTShmd19tb2RlLCBsYW5lLT5wb3J0KTsKCkl0IHNlZW1zIGl0IHdpbGwgbm90IHdv
cmsgZm9yIFNHTUlJIGFuZCAyNTAwQkFTRVguIEl0IGlzIGJlY2F1c2UgeW91CmFyZSBzZXR0aW5n
IG1heCBzcGVlZCBmb3IgYWxsIGNvbXBoeSBtb2RlcyBpbnNpZGUgQ09NUEhZX0ZXX1BBUkFNCm1h
Y3JvIHdoaWNoIGlzIHdyb25nLiBEaWQgeW91IHRlc3QgaXQ/CkJUVyBjYW4geW91IHBvaW50IHRv
IHNvbWUgcHVibGljIHRlbXBvcmFyeSBnaXQgYnJhbmNoIHdoZXJlIHRoaXMKcGF0Y2hzZXQgY2Fu
IGJlIGZvdW5kPwoKcmVnYXJkcywKR3J6ZWdvcnoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

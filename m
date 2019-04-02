From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 04/15] phy: mvebu-cp110-comphy: Add RXAUI support
Date: Tue, 2 Apr 2019 14:24:13 +0200
Message-ID: <20190402142413.0f9cb90c@xps13>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
 <20190401165131.23370-5-miquel.raynal@bootlin.com>
 <20190402104349.2d61ed39@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402104349.2d61ed39@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWF4aW1lLAoKTWF4aW1lIENoZXZhbGxpZXIgPG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4u
Y29tPiB3cm90ZSBvbiBUdWUsIDIgQXByCjIwMTkgMTA6NDM6NDkgKzAyMDA6Cgo+IEhpIE1pcXVl
bCwKPiAKPiBPbiBNb24sICAxIEFwciAyMDE5IDE4OjUxOjIwICswMjAwCj4gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPkFkZCBzdXBwb3J0IGZv
ciBSWEFVSSBtb2RlIGJ5IGFkZGluZyBhbiBlbnRyeSBpbiB0aGUgQ09NUEhZIG1vZGVzIGxpc3Qu
Cj4gPgo+ID5UaGVyZSBpcyBub3RoaW5nIG1vcmUgdG8gaGFuZGxlIGJlc2lkZXMgYXZvaWRpbmcg
dG8gcmV0dXJuIGFuIGVycm9yIHRvCj4gPnRoZSBjYWxsZXI6IHNvbWVvbmUgdXNpbmcgYSBEVCB1
cGRhdGVkIHdpdGggdGhlIHJpZ2h0ICdwaHlzJyBwcm9wZXJ0eQo+ID53aXRoIGFuIG9sZCBmaXJt
d2FyZSB3b3VsZCBnZXQgYW4gZXJyb3Igd2hlbiBpbml0aWFsaXppbmcgdGhlIGxhbmVzIGluCj4g
PlJYQVVJIG1vZGUsIHdoaWxlIGl0IGNvdWxkIGhhdmUgYWxyZWFkeSBiZWVuIGluaXRpYWxpemVk
IGJ5IGVnLiB0aGUKPiA+Ym9vdGxvYWRlci4gSXQgd291bGQgcHJldmVudCB0aGUgaW50ZXJmYWNl
IHRvIHdvcmsgd2l0aCBubyByZWFzb24uICAKPiAKPiBIb3dldmVyLCB0aGlzIHdvdWxkIG1hc2st
YXdheSBlcnJvcnMgdGhhdCBjb3VsZCBvY2N1ciB3aGVuIHdlIGhhdmUgYQo+IGNvcnJlY3QgZmly
bXdhcmUgYW5kIERULgo+IAo+IE1heWJlIHdlIHNob3VsZCBzaW1wbHkgcmV0dXJuIHRoZSBlcnJv
ciwgdGhpcyBtb2RlIGlzbid0IHN1cHBvcnRlZCBpbgo+IFBQdjIgeWV0IHNvIEkgZG9uJ3QgZXhw
ZWN0IHRoaXMgdG8gYnJlYWsgYW55IGV4aXN0aW5nIHNldHVwcy4KCkkgYW0gZmluZSB3aXRoIHRo
aXMgYXBwcm9hY2ggdG9vLiBJIHRoaW5rIHRoaXMgaXMgYWNjZXB0YWJsZSBmb3IgUlhBVUkKYnV0
IG5vdCBmb3IgdGhlIG90aGVyIFNBVEEvVVNCMy9QQ0llIG1vZGVzIHdoaWNoIGFscmVhZHkgd29y
ayBiZWNhdXNlCm9mIFUtQm9vdCBjb25maWd1cmF0aW9uICh3aGlsZSBSWEFVSSBzZWVtcyB0byBu
b3QgYmUgY29uZmlndXJlZAphbnl3YXkpLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

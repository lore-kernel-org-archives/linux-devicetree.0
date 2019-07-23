From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 14/19] dt-bindings: pci: add PHY properties to Armada
 7K/8K controller bindings
Date: Tue, 23 Jul 2019 10:35:48 +0200
Message-ID: <20190723103548.59d1a652@xps13>
References: <20190627095104.22529-1-miquel.raynal@bootlin.com>
 <20190627122505.25774-1-miquel.raynal@bootlin.com>
 <20190627122505.25774-2-miquel.raynal@bootlin.com>
 <20190722175225.GA13801@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722175225.GA13801@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAyMiBK
dWwgMjAxOSAxMTo1MjoyNSAtMDYwMDoKCj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDI6MjU6
MDBQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEFybWFkYSBDUDExMCBQQ0llIGNv
bnRyb2xsZXIgY2FuIGhhdmUgYSBQSFkgKGZvciBjb25maWd1cmluZyBTRVJERVMKPiA+IGxhbmVz
KS4gRGVzY3JpYmUgdGhlc2UgdHdvIHByb3BlcnRpZXMgaW4gdGhlIGJpbmRpbmdzLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2kt
YXJtYWRhOGsudHh0IHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BjaS9wY2ktYXJtYWRhOGsudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BjaS9wY2ktYXJtYWRhOGsudHh0Cj4gPiBpbmRleCA5ZTNmYzE1ZTFhZjguLmEzNzNhODA1MjRk
YiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
cGNpLWFybWFkYThrLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BjaS9wY2ktYXJtYWRhOGsudHh0Cj4gPiBAQCAtMTcsNiArMTcsMTAgQEAgUmVxdWlyZWQg
cHJvcGVydGllczoKPiA+ICAgICBuYW1lIG11c3QgYmUgImNvcmUiIGZvciB0aGUgZmlyc3QgY2xv
Y2sgYW5kICJyZWciIGZvciB0aGUgc2Vjb25kCj4gPiAgICAgb25lCj4gPiAgCj4gPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiA+ICstIHBoeXM6IHBoYW5kbGUgdG8gdGhlIFBIWSBub2RlIChnZW5l
cmljIFBIWSBiaW5kaW5ncykuCj4gPiArLSBwaHktbmFtZXM6IG5hbWVzIG9mIHRoZSBQSFlzLiAg
Cj4gCj4gSG93IG1hbnk/IElmIG9ubHkgMSwgeW91IGRvbid0IHJlYWxseSBuZWVkIHBoeS1uYW1l
cy4KCkkgdGhvdWdodCBpdCB3YXMgcHJlZmVycmVkIHRvIGFsd2F5cyBhZGQgcGh5LW5hbWVzLCBi
dXQgb2ssIEknbGwgZHJvcAp0aGUgcHJvcGVydHkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

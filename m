From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 14/19] dt-bindings: pci: add PHY properties to Armada
 7K/8K controller bindings
Date: Sat, 24 Aug 2019 12:15:31 +0200
Message-ID: <20190824121531.3dda75bd@xps13>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
 <20190731122126.3049-15-miquel.raynal@bootlin.com>
 <20190821182857.GA9660@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821182857.GA9660@bogus>
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gV2VkLCAyMSBB
dWcgMjAxOSAxMzoyODo1NyAtMDUwMDoKCj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDI6MjE6
MjFQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEFybWFkYSBDUDExMCBQQ0llIGNv
bnRyb2xsZXIgY2FuIGhhdmUgZnJvbSBvbmUgdG8gZm91ciBQSFlzIGZvcgo+ID4gY29uZmlndXJp
bmcgU0VSREVTIGxhbmVzIChQQ0llIHgxLCBQQ0llIHgyIG9yIFBDSWUgeDQpLiBEZXNjcmliZSB0
aGUKPiA+IHBoeXMgYW5kIHBoeS1uYW1lcyBwcm9wZXJ0aWVzIGluIHRoZSBiaW5kaW5ncy4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
cGNpLWFybWFkYThrLnR4dCB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BjaS9wY2ktYXJtYWRhOGsudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BjaS9wY2ktYXJtYWRhOGsudHh0Cj4gPiBpbmRleCA5ZTNmYzE1ZTFhZjguLjdjZjEy
MTYyYWE0ZSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wY2kvcGNpLWFybWFkYThrLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BjaS9wY2ktYXJtYWRhOGsudHh0Cj4gPiBAQCAtMTcsNiArMTcsMTIgQEAgUmVx
dWlyZWQgcHJvcGVydGllczoKPiA+ICAgICBuYW1lIG11c3QgYmUgImNvcmUiIGZvciB0aGUgZmly
c3QgY2xvY2sgYW5kICJyZWciIGZvciB0aGUgc2Vjb25kCj4gPiAgICAgb25lCj4gPiAgCj4gPiAr
T3B0aW9uYWwgcHJvcGVydGllczoKPiA+ICstIHBoeXM6IHBoYW5kbGUocykgdG8gUEhZIG5vZGUo
cykgZm9sbG93aW5nIHRoZSBnZW5lcmljIFBIWSBiaW5kaW5ncy4KPiA+ICsJRWl0aGVyIDEsIDIg
b3IgNCBQSFlzIG1pZ2h0IGJlIG5lZWRlZCBkZXBlbmRpbmcgb24gdGhlIG51bWJlciBvZgo+ID4g
KwlQQ0llIGxhbmVzLgo+ID4gKy0gcGh5LW5hbWVzOiBuYW1lcyBvZiB0aGUgUEhZcy4gIAo+IAo+
IFlvdSBuZWVkIHRvIGVudW1lcmF0ZSB3aGF0IHRoZSBuYW1lcyBhcmUuIEJhc2VkIG9uIHlvdXIg
ZXhhbXBsZSBpbiB2MiwgSSAKPiBkb24ndCB0aGluayB0aGUgbmFtZXMgYXJlIHJlYWxseSB2YWx1
YWJsZSB1bmxlc3MgeW91IGNhbiBza2lwIGxhbmVzLgoKSSBkb24ndCBrbm93IGFueSBzZXR1cCBk
b2luZyBpdCBidXQgeWVzLCBJIHN1cHBvc2UgeW91IGNvdWxkIHNraXAgbGFuZXMuCgpLaXNob24g
YXNrZWQgbWUgdG8gcmViYXNlIG9uIHBoeS1uZXh0LCBJJ2xsIGVudW1lcmF0ZSB0aGUgbmFtZXMg
d2hlbgpyZXNlbmRpbmcuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 00/19] Enhance CP110 COMPHY support
Date: Fri, 23 Aug 2019 09:33:24 +0200
Message-ID: <20190823093324.2d7da1f4@xps13>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
 <4e1c4d27-3676-5efa-1126-8149a8635eb5@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4e1c4d27-3676-5efa-1126-8149a8635eb5@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgS2lzaG9uLAoKS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4gd3JvdGUg
b24gRnJpLCAyMyBBdWcgMjAxOQowODo0NjoxNCArMDUzMDoKCj4gT24gMzEvMDcvMTkgNTo1MSBQ
TSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEFybWFkYSBDUDExMCBoYXZlIGEgQ09NUEhZIElQ
IHdoaWNoIHN1cHBvcnRzIGNvbmZpZ3VyaW5nIFNFUkRFUyBsYW5lcwo+ID4gaW4gb25lIG1vZGUs
IGVpdGhlcjoKPiA+IC0gU0FUQQo+ID4gLSBVU0IzIGhvc3QKPiA+IC0gUENJZSAoc2V2ZXJhbCB3
aWR0aCkKPiA+IC0gRXRoZXJuZXQgKHNldmVyYWwgbW9kZXMpCj4gPiAKPiA+IEFzIG9mIHRvZGF5
LCBvbmx5IGEgZmV3IEV0aGVybmV0IG1vZGVzIGFyZSBzdXBwb3J0ZWQgYW5kIHRoZSBjb2RlIGlz
Cj4gPiBlbWJlZGRlZCBpbiB0aGUgTGludXggZHJpdmVyLiBBIG1vcmUgY29tcGxldGUgQ09NUEhZ
IGRyaXZlciB0aGF0IGNhbgo+ID4gYmUgdXNlZCBieSBib3RoIExpbnV4IGFuZCBVLUJvb3QgaXMg
ZW1iZWRkZWQgaW4gdGhlIGZpcm13YXJlIGFuZCBjYW4KPiA+IGJlIHJ1biB0aHJvdWdoIFNNQyBj
YWxscy4KPiA+IAo+ID4gRmlyc3QgdGhlIGN1cnJlbnQgQ09NUEhZIGRyaXZlciBpcyB1cGRhdGVk
IHRvIHVzZSBTTUMgY2FsbHMgYnV0Cj4gPiBmYWxsYmFja3MgdG8gdGhlIGFscmVhZHkgZXhpc3Rp
bmcgZnVuY3Rpb25zIGlmIHRoZSBmaXJtd2FyZSBpcyBub3QKPiA+IHVwLXRvLWRhdGUuIFRoZW4s
IG1vcmUgRXRoZXJuZXQgbW9kZXMgYXJlIGFkZGVkICh0aHJvdWdoIFNNQyBjYWxscwo+ID4gb25s
eSkuIFNBVEEsIFVTQjNIIGFuZCBQQ0llIG1vZGVzIGFyZSBhbHNvIHN1cHBvcnRlZCBvbmUgYnkg
b25lLgo+ID4gCj4gPiBUaGVyZSBpcyBvbmUgc3VidGxlIGRpZmZlcmVuY2Ugd2l0aCB0aGUgUENJ
ZSBmdW5jdGlvbnM6IHdlIG11c3QgdGVsbAo+ID4gdGhlIGZpcm13YXJlIHRoZSBudW1iZXIgb2Yg
bGFuZXMgdG8gY29uZmlndXJlICh4MSwgeDIgb3IgeDQpLiBUaGlzCj4gPiBwYXJhbWV0ZXIgZGVw
ZW5kcyBvbiB0aGUgbnVtYmVyIG9mIGVudHJpZXMgaW4gdGhlICdwaHlzJyBwcm9wZXJ0eQo+ID4g
ZGVzY3JpYmluZyB0aGUgUENJZSBQSFkuIFdlIHVzZSB0aGUgInN1Ym1vZGUiIHBhcmFtZXRlciBv
ZiB0aGUgZ2VuZXJpYwo+ID4gUEhZIEFQSSB0byBjYXJyeSB0aGlzIHZhbHVlLiBUaGUgQXJtYWRh
LThrIFBDSWUgZHJpdmVyIGhhcyBiZWVuCj4gPiB1cGRhdGVkIHRvIGZvbGxvdyB0aGlzIGlkZWEg
YW5kIHRoaXMgY2hhbmdlIGhhcyBiZWVuIG1lcmdlZCBhbHJlYWR5Ogo+ID4gaHR0cDovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzEwNzI3NjMvICAKPiAKPiBTb21lIG9mIHRoZSBwYXRjaGVz
IGFyZSBub3QgYXBwbHlpbmcgY2xlYW5seS4gQ2FyZSB0byByZXNlbmQgdGhlIHNlcmllcyBhZnRl
cgo+IHJlYmFzaW5nIHRvIHBoeSAtbmV4dD8KClN1cmUsIEknbGwgZG8gaXQgYXNhcC4KClRoYW5r
cyEKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK

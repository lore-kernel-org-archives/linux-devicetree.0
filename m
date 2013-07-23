From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v8 00/28] MBus DT binding for Armada 370/XP and Kirkwood
Date: Tue, 23 Jul 2013 12:36:47 -0300
Message-ID: <20130723153645.GA5296@localhost>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130723152406.GH6846@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130723152406.GH6846@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKdWwgMjMsIDIwMTMgYXQgMDU6MjQ6MDZQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3Jv
dGU6Cj4gT24gVHVlLCBKdWwgMjMsIDIwMTMgYXQgMTA6MzE6MDRBTSAtMDMwMCwgRXplcXVpZWwg
R2FyY2lhIHdyb3RlOgo+ID4gQWZ0ZXIgQW5kcmV3IEx1bm4gcmVwb3J0ZWQgWzFdIHRoaXMgd29y
ayBuZWVkIHRvIHRha2UgYWNjb3VudCBvZiBLaXJrd29vZAo+ID4gdG8gcHJldmVudCBicmVha2lu
ZyBQQ0llIG9uIHN1Y2ggcGxhdGZvcm0sIGhlcmUncyBhIG5ldyB2ZXJzaW9uIGFkZGluZwo+ID4g
TUJ1cyBEVCBiaW5kaW5nIGZvciBLaXJrd29vZCBhbmQgaW4gcGFydGljdWxhciB1c2luZyBpdCB0
byBkZWNsYXJlIFBDSWUKPiA+IHByb3Blcmx5Lgo+IAo+IEhpIEV6ZXF1aWVsCj4gCj4gSSBib290
IHRlc3RlZCBvbiBteSBLaXJrd29vZCBRTkFQLiBCb3RoIERUIGFuZCBsZWdhY3kgc3R5bGUuIEJv
dGggYm9vdAo+IE8uSy4gTXkgZGV2aWNlIGRvZXMgbm90IGFjdHVhbGx5IGhhdmUgYW55IFBDSSBk
ZXZpY2VzIG9uIHRoZSBidXMsIHNvCj4gaXQgaXMgbm90IHRvbyBnb29kIGEgdGVzdC4gQnV0IGF0
IGxlYXN0IHRoZSByZWdyZXNzaW9uIGlzIGdvbmUuCj4gCj4gVGVzdGVkLWJ5OiBBbmRyZXcgTHVu
biA8YW5kcmV3QGx1bm4uY2g+Cj4gCgpHb29kIQoKSHVnZSB0aGFua3MgZm9yIHRoZSB0ZXN0IQoK
SmFzb246IEhvdyBhYm91dCBwaWNraW5nIHRoaXMgdXA/IEFzIEkgYWxyZWFkeSBzYWlkLCBJIHRo
aW5rIGl0J3MgYmV0dGVyCnRvIGhhdmUgdGhpcyBtZXJnZWQgc29vbmVyIHRoYW4gbGF0ZXIsIGFu
ZCBnZXQgcGVvcGxlIHRvIHN0YXJ0IHVzaW5nIGl0LgoKSSdtIHJlYWR5IHRvIGZpeCBhdCBvbmNl
IHdoYXRldmVyIGlzc3VlcyBtaWdodCBhcHBlYXIuCi0tIApFemVxdWllbCBHYXJjw61hLCBGcmVl
IEVsZWN0cm9ucwpFbWJlZGRlZCBMaW51eCwgS2VybmVsIGFuZCBBbmRyb2lkIEVuZ2luZWVyaW5n
Cmh0dHA6Ly9mcmVlLWVsZWN0cm9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

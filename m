From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/10] usb: ehci-orion: avoid double PHY initialization
Date: Mon, 21 Jan 2019 10:55:59 +0100
Message-ID: <20190121105559.1fd49dc8@xps13>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-4-miquel.raynal@bootlin.com>
 <874la6lypx.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <874la6lypx.fsf@FE-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgR3JlZ29yeSwKCkdyZWdvcnkgQ0xFTUVOVCA8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29t
PiB3cm90ZSBvbiBGcmksIDE4IEphbiAyMDE5CjE3OjI1OjMwICswMTAwOgoKPiBIaSBNaXF1ZWws
Cj4gIAo+ICBPbiB2ZW4uLCBqYW52LiAxMSAyMDE5LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiA+IE5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGUg
UEhZIGZyb20gdGhlIGRyaXZlcidzIHByb2JlLiBJdCBpcyBkb25lIGJ5Cj4gPiB0aGUgY29yZSBh
dXRvbWF0aWNhbGx5IGFuZCBkb2luZyBpdCB0d2ljZSB3b3VsZCBpbmNyZW1lbnQgdGhlICAKPiAK
PiBEbyB5b3Uga25vdyBleGFjdGx5IHdoaWNoIGNvcmUgdGFrZSBjYXJlIG9mIGl0PwoKVGhlIE9y
aW9uJ3MgcHJvYmUgZnVuY3Rpb24gY2FsbHMgdXNiX2FkZF9oY2QoKSB3aGljaCBoYW5kbGVzIFBI
WQppbml0aWFsaXphdGlvbiAoaW5pdCwgc2V0IG1vZGUsIHBvd2VyIG9uKS4KCj4gCj4gV2hlbiB0
aGUgcGh5IHN1cHBvcnQgd2FzIGFkZGVkIHRvIHRoaXMgZHJpdmVyIHRoZXJlIHdhcyBub3Qgc3Vj
aAo+IGZlYXR1cmUuIEkgbWFkZSBzb21lIHJlc2VhcmNoIGFuZCBmb3VuZCB0aGF0IHJlY2VudGx5
IChsZXNzIHRoYW4gb25lCj4geWVhciBhZ28pIGEgc2VyaWVzIHdhcyBhZGRlZCB0byBpbml0aWFs
aXplIFBIWXMgYXQgSENEIGxldmVsWzFdLiBJIHRoaW5rCj4gdGhhdCBvdXIgcGxhdGZvcm0gd2Fz
IGZvcmdvdHRlbiBpbiB0aGUgY29udmVyc2lvbi4KCkFGQUlDUyB0aGUgY29udmVyc2lvbiB3YXMg
YXBwbGllZCB0byBlaGNpLXBsYXRmb3JtLmMgYnV0IG5vdCB0byBvdGhlcgpkcml2ZXJzIHNvIHll
cywgdGhpcyBvbmUgd2FzIGxlZnQgYXNpZGUgYnV0IHRoZXJlIGFyZSBtYXliZSBvdGhlcnMgaW4K
dGhlIHNhbWUgc2l0dWF0aW9uLgoKPiAKPiBDb3VsZCB5b3UgY2hlY2sgdGhhdCB3ZSBhcmUgbm93
IGFsaWduZWQgd2l0aCB0aGUgcmVxdWlyZW1lbnQgb2YgdGhpcwo+IHNlcmllcz8KClRoZXJlIGhh
cyBiZWVuIHF1aXRlIGEgZmV3IGV2b2x1dGlvbnMgc2luY2UgdGhpcyBzZXJpZXMgYnV0IGZvciB3
aGF0IEkKdW5kZXJzdGFuZCwgeWVzIHdlIGFyZS4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

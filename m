From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 0/2] Update 64-bit DT with new NAND controller bindings
Date: Tue, 27 Feb 2018 17:50:31 +0100
Message-ID: <87inaijs14.fsf@bootlin.com>
References: <20180219222045.1927-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180219222045.1927-1-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Mon, 19 Feb 2018 23:20:43 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWlxdWVsLAogCiBPbiBsdW4uLCBmw6l2ci4gMTkgMjAxOCwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+Cj4gVGhlc2UgdHdvIHBh
dGNoZXMgaGF2ZSBhbHJlYWR5IGJlZW4gc3VibWl0dGVkIGFuZCBhY2NlcHRlZCBieSBHcmVnb3J5
Cj4gYW5kIHdlcmUgc3RhY2tlZCBmb3IgNC4xNy4gQnV0IHNpbmNlIHRoZW4gYSBzbWFsbCBtb2Rp
ZmljYXRpb24gaGFwcGVuZWQKPiBkdWUgdG8gYSByZXF1ZXN0IGZyb20gUm9iIEhlcnJpbmcuIEFs
c28sIGFybWFkYS1jcDExMC1bbWFzdGVyL3NsYXZlXS5kdHNpCj4gZmlsZXMgYmVjYW1lIGFybWFk
YS1jcDExMC5kdHNpIGR1ZSB0byB0aGUgRFQgZGUtZHVwbGljYXRpb24gd29yayBmcm9tCj4gVGhv
bWFzIFBldGF6em9uaS4gVGhpcyBzbWFsbCBzZXJpZXMgc2hvdWxkIHJlcGxhY2UgdGhlIHR3byBw
YXRjaGVzCj4gbGF5aW5nIGluIHRoZSBtdmVidSB0cmVlIGFuZCBzaG91bGQgYXBwbHkgY2xlYW5s
eS4KPgo+IFRoYW5rIHlvdSwKPiBNaXF1w6hsCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAgLSBS
ZW5hbWVkIGEgTkFORCBwcm9wZXJ0eTogcy9tYXJ2ZWxsLHJiL25hbmQtcmIvIHdoaWNoIGlzIGFs
cmVhZHkKPiAgICAgZG9jdW1lbnRlZC4KPiAgIC0gUmViYXNlZCBvbiB2NC4xNi1yYzEuCj4KPiBN
aXF1ZWwgUmF5bmFsICgyKToKPiAgIGFybTY0OiBkdHM6IG1hcnZlbGw6IHVzZSByZXdvcmtlZCBO
QU5EIGNvbnRyb2xsZXIgZHJpdmVyIG9uIEFybWFkYSA3Swo+ICAgYXJtNjQ6IGR0czogbWFydmVs
bDogdXNlIHJld29ya2VkIE5BTkQgY29udHJvbGxlciBkcml2ZXIgb24gQXJtYWRhIDhLCgoKQm90
aCBhcHBsaWVkIG9uIG12ZWJ1L2R0NjQKClRoYW5rcywKCkdyZWdvcnkKCj4KPiAgYXJjaC9hcm02
NC9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS03MDQwLWRiLmR0cyB8IDUwICsrKysrKysrKysrKysr
KystLS0tLS0tLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtODA0MC1k
Yi5kdHMgfCA0NCArKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L21hcnZlbGwvYXJtYWRhLWNwMTEwLmR0c2kgIHwgIDggKystLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA2MSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKPgo+IC0tIAo+IDIuMTQuMQo+Cgot
LSAKR3JlZ29yeSBDbGVtZW50LCBCb290bGluIChmb3JtZXJseSBGcmVlIEVsZWN0cm9ucykKRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwOi8vYm9vdGxpbi5jb20KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

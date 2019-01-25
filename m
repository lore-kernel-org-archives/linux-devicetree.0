From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 04/10] usb: ehci-orion: add S2RAM support
Date: Fri, 25 Jan 2019 11:35:38 +0100
Message-ID: <20190125113538.24d5ca02@xps13>
References: <20190121112336.23489-5-miquel.raynal@bootlin.com>
 <Pine.LNX.4.44L0.1901231456060.1564-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.44L0.1901231456060.1564-100000@iolanthe.rowland.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgQWxhbiwKCkFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+IHdyb3RlIG9u
IFdlZCwgMjMgSmFuIDIwMTkKMTQ6NTg6NDQgLTA1MDAgKEVTVCk6Cgo+IE9uIE1vbiwgMjEgSmFu
IDIwMTksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gCj4gPiBBZGQgc3VzcGVuZC9yZXN1bWUgY2Fs
bGJhY2tzIHRvIHJlc2V0IHRoZSBob3N0IGNvbnRyb2xsZXIgcHJvcGVybHkKPiA+IGR1cmluZyBT
MlJBTSBvcGVyYXRpb24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L2Vo
Y2ktb3Jpb24uYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
aG9zdC9laGNpLW9yaW9uLmMgYi9kcml2ZXJzL3VzYi9ob3N0L2VoY2ktb3Jpb24uYwo+ID4gaW5k
ZXggMzEwOWYwODI5NDllLi5kYWIyMmFhNTdjMGIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9ob3N0L2VoY2ktb3Jpb24uYwo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC9laGNpLW9yaW9u
LmMKPiA+IEBAIC0xODIsNiArMTgyLDMwIEBAIHN0YXRpYyBpbnQgZWhjaV9vcmlvbl9kcnZfcmVz
ZXQoc3RydWN0IHVzYl9oY2QgKmhjZCkKPiA+ICAJcmV0dXJuIHJldDsKPiA+ICB9Cj4gPiAgCj4g
PiArc3RhdGljIGludCBfX21heWJlX3VudXNlZCBlaGNpX29yaW9uX2Rydl9zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKPiA+ICt7Cj4gPiArCXN0cnVjdCB1c2JfaGNkICpoY2QgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiA+ICsJc3RydWN0IGVoY2lfaGNkICplaGNpID0gaGNkX3RvX2VoY2ko
aGNkKTsKPiA+ICsKPiA+ICsJZWhjaV9wcmVwYXJlX3BvcnRzX2Zvcl9jb250cm9sbGVyX3N1c3Bl
bmQoZWhjaSwKPiA+ICsJCQkJCQkgIGRldmljZV9tYXlfd2FrZXVwKGRldikpOwo+ID4gKwo+ID4g
KwlyZXR1cm4gZWhjaV9zdXNwZW5kKGhjZCwgZmFsc2UpOyAgCj4gCj4gVGhpcyBpcyBhIGxpdHRs
ZSBvZGQuICBXaHkgbm90IGp1c3QgY2FsbAo+IAo+IAllaGNpX3N1c3BlbmQoaGNkLCBkZXZpY2Vf
bWF5X3dha2V1cChkZXYpKTsKPiAKPiBkaXJlY3RseSBhbmQgbGV0IGl0IHRha2UgY2FyZSBvZiBj
YWxsaW5nCj4gZWhjaV9wcmVwYXJlX3BvcnRzX2Zvcl9jb250cm9sbGVyX3N1c3BlbmQoKSBmb3Ig
eW91PyAgSWYgeW91IGhhdmUgYQo+IGdvb2QgcmVhc29uIGZvciBkb2luZyB0aGluZ3MgdGhpcyB3
YXksIHBsZWFzZSBtZW50aW9uIHRoYXQgcmVhc29uIGluCj4gdGhlIENoYW5nZWxvZy4KClRoZXJl
IGlzIG5vIHJlYXNvbiwgSSB0aGluayBJIGdvdCB0aGUgaW5zcGlyYXRpb24gZnJvbSBhbiBvdGhl
ciBkcml2ZXIKY2FsbGluZyBtYW51YWxseSBlaGNpX3ByZXBhcmVfcG9ydHNfZm9yX2NvbnRyb2xs
ZXJfc3VzcGVuZCgpLCBidXQgSSBkaWQKbm90IGNoZWNrIGl0IHdhcyBhbHJlYWR5IHRha2VuIGNh
cmUgb2YgYnkgZWhjaV9zdXNwZW5kL3Jlc3VtZSgpLgoKQ2FsbCByZW1vdmVkIGluIGJvdGggcGF0
aHMsIHRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

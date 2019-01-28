From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 04/10] usb: ehci-orion: add S2RAM support
Date: Mon, 28 Jan 2019 11:33:50 +0100
Message-ID: <20190128113350.603b2be3@xps13>
References: <20190125103925.15753-5-miquel.raynal@bootlin.com>
 <Pine.LNX.4.44L0.1901252152190.18583-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.44L0.1901252152190.18583-100000@netrider.rowland.org>
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
IEZyaSwgMjUgSmFuIDIwMTkKMjE6NTY6MjcgLTA1MDAgKEVTVCk6Cgo+IE9uIEZyaSwgMjUgSmFu
IDIwMTksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gCj4gPiBBZGQgc3VzcGVuZC9yZXN1bWUgY2Fs
bGJhY2tzIHRvIHJlc2V0IHRoZSBob3N0IGNvbnRyb2xsZXIgcHJvcGVybHkKPiA+IGR1cmluZyBT
MlJBTSBvcGVyYXRpb24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L2Vo
Y2ktb3Jpb24uYyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L2Vo
Y2ktb3Jpb24uYyBiL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1vcmlvbi5jCj4gPiBpbmRleCAzMTA5
ZjA4Mjk0OWUuLjBkYWIwOTliNWQxNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3Qv
ZWhjaS1vcmlvbi5jCj4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L2VoY2ktb3Jpb24uYwo+ID4g
QEAgLTE4Miw2ICsxODIsMjMgQEAgc3RhdGljIGludCBlaGNpX29yaW9uX2Rydl9yZXNldChzdHJ1
Y3QgdXNiX2hjZCAqaGNkKQo+ID4gIAlyZXR1cm4gcmV0Owo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIGVoY2lfb3Jpb25fZHJ2X3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ID4gK3sKPiA+ICsJc3RydWN0IHVzYl9oY2QgKmhjZCA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+ID4gKwo+ID4gKwlyZXR1cm4gZWhjaV9zdXNwZW5kKGhjZCwgZGV2aWNlX21heV93
YWtldXAoZGV2KSk7ICAKPiAKPiBPa2F5LCBnb29kLgo+IAo+ID4gK30KPiA+ICsKPiA+ICtzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIGVoY2lfb3Jpb25fZHJ2X3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4gPiArewo+ID4gKwlzdHJ1Y3QgdXNiX2hjZCAqaGNkID0gZGV2X2dldF9kcnZkYXRh
KGRldik7Cj4gPiArCj4gPiArCXJldHVybiBlaGNpX3Jlc3VtZShoY2QsIGRldmljZV9tYXlfd2Fr
ZXVwKGRldikpOyAgCj4gCj4gTm90IHNvIGdvb2QuICBUaGUgc2Vjb25kIGFyZ3VtZW50IGhlcmUg
aXMgZm9yY2VfcmVzZXQ7IHByZXN1bWFibHkgeW91IAo+IHdhbnQgaXQgYWx3YXlzIHRvIGJlIGZh
bHNlLiAgKE5vdGUgdGhhdCB0aGUgdjMgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIAo+IGRpZCBub3Qg
Y2FsbCBkZXZpY2VfbWF5X3dha2V1cCgpIGluIGVoY2lfb3Jpb25fZHJ2X3Jlc3VtZS4pCj4gCj4g
WWVzLCB0aGUgQVBJIGlzIG5vdCBzeW1tZXRyaWNhbC4gIFNvIHN1ZSBtZS4uLgoKT2ggcmlnaHQs
IEkgY29tcGxldGVseSBvdmVybG9va2VkIHRoYXQgb25lLiBJbmRlZWQgdGhlIHNlY29uZCBwYXJh
bWV0ZXIKc2hvdWxkIGJlICJmYWxzZSIsIGFzIGluIHRoZSB2My4gRG8geW91IG1pbmQgaWYgSSBz
ZW5kIGEgdjUgb25seSBmb3IKdGhpcyBwYXRjaD8gSWYgdGhlIHJlc3QgbG9va3MgZ29vZCB0byB5
b3Ugb2YgY291cnNlLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

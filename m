From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 02/10] usb: host: xhci: mvebu: add reset on resume quirk
Date: Mon, 21 Jan 2019 11:54:22 +0100
Message-ID: <20190121115422.5db1bd99@xps13>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-3-miquel.raynal@bootlin.com>
 <878szilzpq.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <878szilzpq.fsf@FE-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgR3JlZ29yeSwKCkdyZWdvcnkgQ0xFTUVOVCA8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29t
PiB3cm90ZSBvbiBGcmksIDE4IEphbiAyMDE5CjE3OjA0OjAxICswMTAwOgoKPiBIaSBNaXF1ZWws
Cj4gIAo+ICBPbiB2ZW4uLCBqYW52LiAxMSAyMDE5LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiA+IEZyb206IE9mZXIgSGVpZmV0eiA8b2ZlcmhA
bWFydmVsbC5jb20+Cj4gPgo+ID4gVGhlIG12ZWJ1IHhIQ0kgaG9zdCBkcml2ZXIgZG9lcyBub3Qg
aGF2ZSBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0LiBVc2Ugb2YKPiA+IHRoZSBYSENJX1JFU0VUX09O
X1JFU1VNRSBxdWlyayBpcyBtYW5kYXRvcnkgaW4gb3JkZXIgdG8gYXZvaWQgZmFpbHVyZXMKPiA+
IGFmdGVyIHJlc3VtZS4gVGhpcyB3aWxsIHdvcmsgb25seSBpZiBubyBVU0IgZGV2aWNlIGlzIHBs
dWdnZWQtaW4uCj4gPgo+ID4gV2hpbGUgYXQgaXQsIG1lbnRpb24gaW4gdGhlIEtjb25maWcgZmls
ZSB0aGF0IHRoaXMgSVAgaXMgYWxzbyBwcmVzZW50Cj4gPiBvbiB0aGUgQTM3MDAgU29DLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IE9mZXIgSGVpZmV0eiA8b2ZlcmhAbWFydmVsbC5jb20+Cj4gPiBb
bWlxdWVsLnJheW5hbEBib290bGluLmNvbTogUmV3b3JkIHRoZSBjb21taXQgbWVzc2FnZV0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L0tjb25maWcgICAgICB8ICA0ICsrLS0KPiA+
ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXZlYnUuYyB8IDExICsrKysrKysrKysrCj4gPiAgZHJp
dmVycy91c2IvaG9zdC94aGNpLW12ZWJ1LmggfCAgNiArKysrKysKPiA+ICBkcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcGxhdC5jICB8ICA3ICsrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2hvc3QvS2NvbmZpZyBiL2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZwo+ID4gaW5kZXggMTY3
NThiMTJhNWU5Li4xM2Q1OWJlNmE2YWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0
L0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZwo+ID4gQEAgLTY5LDEz
ICs2OSwxMyBAQCBjb25maWcgVVNCX1hIQ0lfTVRLCj4gPiAgCSAgSWYgdW5zdXJlLCBzYXkgTi4K
PiA+ICAKPiA+ICBjb25maWcgVVNCX1hIQ0lfTVZFQlUKPiA+IC0JdHJpc3RhdGUgInhIQ0kgc3Vw
cG9ydCBmb3IgTWFydmVsbCBBcm1hZGEgMzc1LzM4eCIKPiA+ICsJdHJpc3RhdGUgInhIQ0kgc3Vw
cG9ydCBmb3IgTWFydmVsbCBBcm1hZGEgMzc1LzM4eC8zNzAwIiAgCj4gCj4gSSB3b3VsZCBuYW1l
IGl0IDM3eHggdG8gYmUgY29uc2lzdGVudCB3aXRoIDM4eAo+IAo+ID4gIAlzZWxlY3QgVVNCX1hI
Q0lfUExBVEZPUk0KPiA+ICAJZGVwZW5kcyBvbiBIQVNfSU9NRU0KPiA+ICAJZGVwZW5kcyBvbiBB
UkNIX01WRUJVIHx8IENPTVBJTEVfVEVTVAo+ID4gIAktLS1oZWxwLS0tCj4gPiAgCSAgU2F5ICdZ
JyB0byBlbmFibGUgdGhlIHN1cHBvcnQgZm9yIHRoZSB4SENJIGhvc3QgY29udHJvbGxlcgo+ID4g
LQkgIGZvdW5kIGluIE1hcnZlbGwgQXJtYWRhIDM3NS8zOHggQVJNIFNPQ3MuCj4gPiArCSAgZm91
bmQgaW4gTWFydmVsbCBBcm1hZGEgMzc1LzM4eC8zNzAwIEFSTSBTT0NzLiAgCj4gc2FtZSBoZXJl
Cj4gCgpTdXJlIQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

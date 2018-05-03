From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 04/17] irqchip/irq-mvebu-icu: fix wrong user data retrieval
Date: Thu, 3 May 2018 16:57:35 +0200
Message-ID: <20180503165735.3e248f29@xps13>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-5-miquel.raynal@bootlin.com>
 <20180430154913.64d94375@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180430154913.64d94375@windsurf>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgVGhvbWFzLAoKT24gTW9uLCAzMCBBcHIgMjAxOCAxNTo0OToxMyArMDIwMCwgVGhvbWFzIFBl
dGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+
IAo+IEluIHRoZSB0aXRsZSwgSSB0aGluayAidXNlciBkYXRhIiBpcyBub3QgcmVhbGx5IGFwcHJv
cHJpYXRlLiAicHJpdmF0ZQo+IGRhdGUiIG9yICJkZXZpY2UgcHJpdmF0ZSBkYXRhIiBtYXliZSA/
CgpTdXJlLCBJIHdpbGwgY2hhbmdlIHRvICJmaXggd3JvbmcgcHJpdmF0ZSBkYXRhIHJldHJpZXZh
bCIuCgo+IAo+IE9uIFNhdCwgMjEgQXByIDIwMTggMTU6NTU6MjQgKzAyMDAsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBUaGUgaXJxX2RvbWFpbiBzdHJ1Y3R1cmUgaGFzIGFuIGhvc3RfZGF0YSBw
b2ludGVyIHRoYXQganVzdCBzdG9yZXMgdXNlcgo+ID4gZGF0YS4gSXQgaXMgbWVhbnQgdG8gbm90
IGJlIHRvdWNoZWQgYnkgdGhlIElSUSBjb3JlLiBIb3dldmVyLCB3aGVuIGl0Cj4gPiBjb21lcyB0
byBNU0ksIHRoZSBNU0kgbGF5ZXIgYWRkcyBpdHMgb3duIHByaXZhdGUgZGF0YSB0aGVyZSB3aXRo
IGEKPiA+IHN0cnVjdHVyZSB0aGF0IGFsc28gaGFzIGEgaG9zdF9kYXRhIHBvaW50ZXIuCj4gPiAK
PiA+IEJlY2F1c2UgdGhpcyBJUlEgZG9tYWluIGlzIGFuIE1TSSBkb21haW4sIHRvIGFjY2VzcyB1
c2VyIGRhdGEgd2Ugc2hvdWxkCj4gPiBkbyBhIGQtPmhvc3RfZGF0YS0+aG9zdF9kYXRhLCBhbHNv
IHdyYXBwZWQgYXMKPiA+ICdwbGF0Zm9ybV9tc2lfZ2V0X2hvc3RfZGF0YSgpJy4KPiA+IAo+ID4g
VGhpcyBidWcgd2FzIGx5aW5nIHRoZXJlIHNpbGVudGx5IGJlY2F1c2UgdGhlICdpY3UnIHN0cnVj
dHVyZSByZXRyaWV2ZWQKPiA+IHRoaXMgd2F5IHdhcyBqdXN0IGNhbGxlZCBieSBkZXZfZXJyKCks
IG9ubHkgcHJvZHVjaW5nIGEKPiA+ICcoTlVMTCBkZXZpY2UgKik6JyBvdXRwdXQgb24gdGhlIGNv
bnNvbGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+ICAKPiAKPiBPdGhlcndpc2U6Cj4gCj4gUmV2aWV3ZWQtYnk6IFRob21h
cyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXD
qGwKCi0tIApNaXF1ZWwgUmF5bmFsLCBCb290bGluIChmb3JtZXJseSBGcmVlIEVsZWN0cm9ucykK
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==

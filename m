From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 09/14] irqchip/irq-mvebu-icu: add support for System
 Error Interrupts (SEI)
Date: Tue, 21 Aug 2018 17:41:51 +0200
Message-ID: <20180821174151.7fc7314b@xps13>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-10-miquel.raynal@bootlin.com>
 <a88f62c0-7d7c-71da-fa45-487f7573dbb1@arm.com>
 <20180821110825.2fbec982@xps13>
 <07e90507-1d51-6435-b006-c46f865a636c@arm.com>
 <20180821122819.726c434b@xps13>
 <9c3168e2-3653-5359-7ddb-9e6ac1b47bb8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9c3168e2-3653-5359-7ddb-9e6ac1b47bb8@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgTWFyYywKCk1hcmMgWnluZ2llciA8bWFyYy56eW5naWVyQGFybS5jb20+IHdyb3RlIG9uIFR1
ZSwgMjEgQXVnIDIwMTggMTE6Mzc6NDcKKzAxMDA6Cgo+IE9uIDIxLzA4LzE4IDExOjI4LCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgTWFyYywKPiA+IAo+ID4gTWFyYyBaeW5naWVyIDxtYXJj
Lnp5bmdpZXJAYXJtLmNvbT4gd3JvdGUgb24gVHVlLCAyMSBBdWcgMjAxOCAxMDoxOTowNAo+ID4g
KzAxMDA6Cj4gPiAgIAo+ID4+IE9uIDIxLzA4LzE4IDEwOjA4LCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
OiAgCj4gPj4+IEhpIE1hcmMsCj4gPj4+Cj4gPj4+IEknbSBmaW5lIHdpdGggdGhlIHJlc3Qgb2Yg
dGhlIGNvbW1lbnRzLCBwbGVhc2UgZmluZCBqdXN0IG9uZSBsYXN0Cj4gPj4+IHF1ZXN0aW9uIGJl
bG93Lgo+ID4+Pgo+ID4+PiBbLi4uXQo+ID4+PiAgICAgCj4gPj4+Pj4gQEAgLTEzMywxMiArMTY0
LDM2IEBAIG12ZWJ1X2ljdV9pcnFfZG9tYWluX3RyYW5zbGF0ZShzdHJ1Y3QgaXJxX2RvbWFpbiAq
ZCwgc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYywKPiA+Pj4+PiAgCQlyZXR1cm4gLUVJTlZBTDsK
PiA+Pj4+PiAgCX0KPiA+Pj4+PiAgCj4gPj4+Pj4gLQkvKiBNYXNrIHRoZSB0eXBlIHRvIHByZXZl
bnQgd3JvbmcgRFQgY29uZmlndXJhdGlvbiAqLwo+ID4+Pj4+IC0JKnR5cGUgPSBmd3NwZWMtPnBh
cmFtWzJdICYgSVJRX1RZUEVfU0VOU0VfTUFTSzsKPiA+Pj4+PiArCS8qCj4gPj4+Pj4gKwkgKiBU
aGUgSUNVIHJlY2VpdmVzIGxldmVsLWludGVycnVwdHMuIE1TSSBTRUkgYXJlCj4gPj4+Pj4gKwkg
KiBlZGdlLWludGVycnVwdHMgd2hpbGUgTVNJIE5TUiBhcmUgbGV2ZWwtaW50ZXJydXB0cy4gVXBk
YXRlIHRoZSB0eXBlCj4gPj4+Pj4gKwkgKiBhY2NvcmRpbmdseSBmb3IgdGhlIHBhcmVudCBpcnFj
aGlwLgo+ID4+Pj4+ICsJICovCj4gPj4+Pj4gKwlpZiAobXNpX2RhdGEtPnN1YnNldF9kYXRhLT5p
Y3VfZ3JvdXAgPT0gSUNVX0dSUF9TRUkpCj4gPj4+Pj4gKwkJKnR5cGUgPSBJUlFfVFlQRV9FREdF
X1JJU0lORzsgICAgICAKPiA+Pj4+Cj4gPj4+PiBUaGF0J3MgaW50ZXJlc3RpbmcuIEhvdyBpcyB0
aGUgcmVzYW1wbGluZyBkb25lIGhlcmU/ICAgIAo+ID4+Pgo+ID4+PiBJJ20gbm90IHN1cmUgdG8g
dW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24uIFdoYXQgZG9lcyAncmVzYW1wbGluZycgbWVhbnMKPiA+
Pj4gaW4gc3VjaCBjb250ZXh0PyBNU0kgU0VJcyBhcmUgb2YgdHlwZSAiZWRnZSIgYW5kIHVzZSB0
aGUgdHJhZGl0aW9uYWwKPiA+Pj4gTVNJIHNpZ25hbGxpbmcgaW5mcmFzdHJ1Y3R1cmUuIEknbSBh
c2tpbmcgdG8gYmUgc3VyZSBub3QgdG8gaWdub3JlCj4gPj4+IHNvbWV0aGluZyB3cm9uZyBpbiBt
eSBjb2RlLiAgICAKPiA+Pgo+ID4+IFlvdSBzZWVtcyB0byBiZSB0dXJuaW5nIGEgbGV2ZWwgaW50
ZXJydXB0IGludG8gYW4gZWRnZS4gIAo+ID4gCj4gPiBJZiBpcyBhbiBTRUkgaW50ZXJydXB0LCBp
dCBjYW5ub3QgYmUgYSBsZXZlbCBpbnRlcnJ1cHQgYW5kIHRoZSB0eXBlCj4gPiB3aWxsIGJlIElS
UV9UWVBFX0VER0VfUklTSU5HLgo+ID4gICAKPiA+PiBZb3UgY2FuIGRvIHRoYXQsCj4gPj4gYnV0
IG9ubHkgaWYgeW91IHJlc2FtcGxlIHRoZSBsZXZlbCBvbiBFT0kgKGFuZCByZWdlbmVyYXRlIHRo
ZQo+ID4+IGNvcnJlc3BvbmRpbmcgZWRnZSBpZiB0aGUgbGV2ZWwgaXMgc3RpbGwgaGlnaCkuICAK
PiA+IAo+ID4gV2hhdCBpcyBiZWZvcmUgaXMgYSAnJiBJUlFfVFlQRV9TRU5TRV9NQVNLJyBvcGVy
YXRpb24uIEluIHRoZW9yeSwKPiA+ICp0eXBlIGNvdWxkIGJlIGFueXRoaW5nIG9mIElSUV9UWVBF
X3tFREdFLExFVkVMfV8qIGF0IHRoaXMgbW9tZW50LiBCdXQsCj4gPiBhcyBzdGF0ZWQgYWJvdmUs
IGl0IGNhbm5vdCBiZSBhbnl0aGluZyBlbHNlIHRoYW4gSVJRX1RZUEVfRURHRV9SSVNJTkcuCj4g
PiBJIHRob3VnaHQgbW9yZSBjbGVhciB0byBlbmZvcmNlIGl0IGJ1dCBpZiB0aGlzIHVuY2xlYXIg
YW5kIHVzZWxlc3MsCj4gPiBsZXQncyBkcm9wIGl0PyAgCj4gCj4gSSB0aGluayBvdmVycmlkaW5n
IHRoZSB0cmlnZ2VyIHRoYXQgd2F5IGlzIHZlcnkgY29uZnVzaW5nLiBFaXRoZXIgaXQKPiBjb21l
cyBmcm9tIERULCBvciBpdCBjb21lcyBmcm9tIHRoZSBNU0kgZnJhbXdvcmsuIEluIGJvdGggY2Fz
ZXMsIGl0IGhhcwo+IHRvIGJlIGNvcnJlY3QsIGFuZCBvdmVycmlkaW5nIGl0IGlzIGp1c3QgcGFw
ZXJpbmcgb3ZlciBvdGhlciBidWdzLgo+IAo+IEknZCByYXRoZXIgeW91IHB1dCBhIFdBUk5fT04g
aWYgeW91IGVuY291bnRlciBhbiBpbGxlZ2FsIGludGVycnVwdCB0cmlnZ2VyLgoKRmluZSBieSBt
ZS4KClRoYW5rcyBmb3IgYWxsIHRoZSBndWlkYW5jZSwgSSdsbCBzZW5kIGEgbmV3IGl0ZXJhdGlv
biBBU0FQICh3aXRoIHRoZQpiaW5kaW5ncyB1cGRhdGVkKS4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=

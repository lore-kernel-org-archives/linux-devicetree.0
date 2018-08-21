From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 09/14] irqchip/irq-mvebu-icu: add support for System
 Error Interrupts (SEI)
Date: Tue, 21 Aug 2018 12:28:19 +0200
Message-ID: <20180821122819.726c434b@xps13>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-10-miquel.raynal@bootlin.com>
 <a88f62c0-7d7c-71da-fa45-487f7573dbb1@arm.com>
 <20180821110825.2fbec982@xps13>
 <07e90507-1d51-6435-b006-c46f865a636c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <07e90507-1d51-6435-b006-c46f865a636c@arm.com>
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
ZSwgMjEgQXVnIDIwMTggMTA6MTk6MDQKKzAxMDA6Cgo+IE9uIDIxLzA4LzE4IDEwOjA4LCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgTWFyYywKPiA+IAo+ID4gSSdtIGZpbmUgd2l0aCB0aGUg
cmVzdCBvZiB0aGUgY29tbWVudHMsIHBsZWFzZSBmaW5kIGp1c3Qgb25lIGxhc3QKPiA+IHF1ZXN0
aW9uIGJlbG93Lgo+ID4gCj4gPiBbLi4uXQo+ID4gICAKPiA+Pj4gQEAgLTEzMywxMiArMTY0LDM2
IEBAIG12ZWJ1X2ljdV9pcnFfZG9tYWluX3RyYW5zbGF0ZShzdHJ1Y3QgaXJxX2RvbWFpbiAqZCwg
c3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYywKPiA+Pj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPj4+
ICAJfQo+ID4+PiAgCj4gPj4+IC0JLyogTWFzayB0aGUgdHlwZSB0byBwcmV2ZW50IHdyb25nIERU
IGNvbmZpZ3VyYXRpb24gKi8KPiA+Pj4gLQkqdHlwZSA9IGZ3c3BlYy0+cGFyYW1bMl0gJiBJUlFf
VFlQRV9TRU5TRV9NQVNLOwo+ID4+PiArCS8qCj4gPj4+ICsJICogVGhlIElDVSByZWNlaXZlcyBs
ZXZlbC1pbnRlcnJ1cHRzLiBNU0kgU0VJIGFyZQo+ID4+PiArCSAqIGVkZ2UtaW50ZXJydXB0cyB3
aGlsZSBNU0kgTlNSIGFyZSBsZXZlbC1pbnRlcnJ1cHRzLiBVcGRhdGUgdGhlIHR5cGUKPiA+Pj4g
KwkgKiBhY2NvcmRpbmdseSBmb3IgdGhlIHBhcmVudCBpcnFjaGlwLgo+ID4+PiArCSAqLwo+ID4+
PiArCWlmIChtc2lfZGF0YS0+c3Vic2V0X2RhdGEtPmljdV9ncm91cCA9PSBJQ1VfR1JQX1NFSSkK
PiA+Pj4gKwkJKnR5cGUgPSBJUlFfVFlQRV9FREdFX1JJU0lORzsgICAgCj4gPj4KPiA+PiBUaGF0
J3MgaW50ZXJlc3RpbmcuIEhvdyBpcyB0aGUgcmVzYW1wbGluZyBkb25lIGhlcmU/ICAKPiA+IAo+
ID4gSSdtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uLiBXaGF0IGRvZXMgJ3Jl
c2FtcGxpbmcnIG1lYW5zCj4gPiBpbiBzdWNoIGNvbnRleHQ/IE1TSSBTRUlzIGFyZSBvZiB0eXBl
ICJlZGdlIiBhbmQgdXNlIHRoZSB0cmFkaXRpb25hbAo+ID4gTVNJIHNpZ25hbGxpbmcgaW5mcmFz
dHJ1Y3R1cmUuIEknbSBhc2tpbmcgdG8gYmUgc3VyZSBub3QgdG8gaWdub3JlCj4gPiBzb21ldGhp
bmcgd3JvbmcgaW4gbXkgY29kZS4gIAo+IAo+IFlvdSBzZWVtcyB0byBiZSB0dXJuaW5nIGEgbGV2
ZWwgaW50ZXJydXB0IGludG8gYW4gZWRnZS4KCklmIGlzIGFuIFNFSSBpbnRlcnJ1cHQsIGl0IGNh
bm5vdCBiZSBhIGxldmVsIGludGVycnVwdCBhbmQgdGhlIHR5cGUKd2lsbCBiZSBJUlFfVFlQRV9F
REdFX1JJU0lORy4KCj4gWW91IGNhbiBkbyB0aGF0LAo+IGJ1dCBvbmx5IGlmIHlvdSByZXNhbXBs
ZSB0aGUgbGV2ZWwgb24gRU9JIChhbmQgcmVnZW5lcmF0ZSB0aGUKPiBjb3JyZXNwb25kaW5nIGVk
Z2UgaWYgdGhlIGxldmVsIGlzIHN0aWxsIGhpZ2gpLgoKV2hhdCBpcyBiZWZvcmUgaXMgYSAnJiBJ
UlFfVFlQRV9TRU5TRV9NQVNLJyBvcGVyYXRpb24uIEluIHRoZW9yeSwKKnR5cGUgY291bGQgYmUg
YW55dGhpbmcgb2YgSVJRX1RZUEVfe0VER0UsTEVWRUx9XyogYXQgdGhpcyBtb21lbnQuIEJ1dCwK
YXMgc3RhdGVkIGFib3ZlLCBpdCBjYW5ub3QgYmUgYW55dGhpbmcgZWxzZSB0aGFuIElSUV9UWVBF
X0VER0VfUklTSU5HLgpJIHRob3VnaHQgbW9yZSBjbGVhciB0byBlbmZvcmNlIGl0IGJ1dCBpZiB0
aGlzIHVuY2xlYXIgYW5kIHVzZWxlc3MsCmxldCdzIGRyb3AgaXQ/CgoKPiAKPiBPciBhbSBJIHJl
YWRpbmcgaXQgdGhlIHdyb25nIHdheT8KCk5vLCB0aGF0J3MgcHJvYmFibHkgbWUgbm90IHVuZGVy
c3RhbmRpbmcgY29ycmVjdGx5IHRoZSBwdXJwb3NlIG9mIHRoZQphYm92ZSBmdW5jdGlvbi4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=

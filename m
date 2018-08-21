From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 09/14] irqchip/irq-mvebu-icu: add support for System
 Error Interrupts (SEI)
Date: Tue, 21 Aug 2018 11:08:25 +0200
Message-ID: <20180821110825.2fbec982@xps13>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-10-miquel.raynal@bootlin.com>
 <a88f62c0-7d7c-71da-fa45-487f7573dbb1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a88f62c0-7d7c-71da-fa45-487f7573dbb1@arm.com>
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

SGkgTWFyYywKCkknbSBmaW5lIHdpdGggdGhlIHJlc3Qgb2YgdGhlIGNvbW1lbnRzLCBwbGVhc2Ug
ZmluZCBqdXN0IG9uZSBsYXN0CnF1ZXN0aW9uIGJlbG93LgoKWy4uLl0KCj4gPiBAQCAtMTMzLDEy
ICsxNjQsMzYgQEAgbXZlYnVfaWN1X2lycV9kb21haW5fdHJhbnNsYXRlKHN0cnVjdCBpcnFfZG9t
YWluICpkLCBzdHJ1Y3QgaXJxX2Z3c3BlYyAqZndzcGVjLAo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7
Cj4gPiAgCX0KPiA+ICAKPiA+IC0JLyogTWFzayB0aGUgdHlwZSB0byBwcmV2ZW50IHdyb25nIERU
IGNvbmZpZ3VyYXRpb24gKi8KPiA+IC0JKnR5cGUgPSBmd3NwZWMtPnBhcmFtWzJdICYgSVJRX1RZ
UEVfU0VOU0VfTUFTSzsKPiA+ICsJLyoKPiA+ICsJICogVGhlIElDVSByZWNlaXZlcyBsZXZlbC1p
bnRlcnJ1cHRzLiBNU0kgU0VJIGFyZQo+ID4gKwkgKiBlZGdlLWludGVycnVwdHMgd2hpbGUgTVNJ
IE5TUiBhcmUgbGV2ZWwtaW50ZXJydXB0cy4gVXBkYXRlIHRoZSB0eXBlCj4gPiArCSAqIGFjY29y
ZGluZ2x5IGZvciB0aGUgcGFyZW50IGlycWNoaXAuCj4gPiArCSAqLwo+ID4gKwlpZiAobXNpX2Rh
dGEtPnN1YnNldF9kYXRhLT5pY3VfZ3JvdXAgPT0gSUNVX0dSUF9TRUkpCj4gPiArCQkqdHlwZSA9
IElSUV9UWVBFX0VER0VfUklTSU5HOyAgCj4gCj4gVGhhdCdzIGludGVyZXN0aW5nLiBIb3cgaXMg
dGhlIHJlc2FtcGxpbmcgZG9uZSBoZXJlPwoKSSdtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQgdGhl
IHF1ZXN0aW9uLiBXaGF0IGRvZXMgJ3Jlc2FtcGxpbmcnIG1lYW5zCmluIHN1Y2ggY29udGV4dD8g
TVNJIFNFSXMgYXJlIG9mIHR5cGUgImVkZ2UiIGFuZCB1c2UgdGhlIHRyYWRpdGlvbmFsCk1TSSBz
aWduYWxsaW5nIGluZnJhc3RydWN0dXJlLiBJJ20gYXNraW5nIHRvIGJlIHN1cmUgbm90IHRvIGln
bm9yZQpzb21ldGhpbmcgd3JvbmcgaW4gbXkgY29kZS4KCj4gCj4gPiAgCj4gPiAgCXJldHVybiAw
Owo+ID4gIH0KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

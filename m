From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 06/17] irqchip/irq-mvebu-icu: switch to regmap
Date: Thu, 3 May 2018 17:05:34 +0200
Message-ID: <20180503170534.6b42510e@xps13>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-7-miquel.raynal@bootlin.com>
 <20180430155352.1b24d1d8@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180430155352.1b24d1d8@windsurf>
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

SGkgVGhvbWFzLCBHcmVnb3J5LAoKT24gTW9uLCAzMCBBcHIgMjAxOCAxNTo1Mzo1MiArMDIwMCwg
VGhvbWFzIFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+
IEhlbGxvLAo+IAo+IE9uIFNhdCwgMjEgQXByIDIwMTggMTU6NTU6MjYgKzAyMDAsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBUaGUgSUNVIERUIG5vZGVzIGhhdmUgbm93IHRoZSAnc3lzY29uJyBj
b21wYXRpYmxlLCB3ZSBjYW4gc3dpdGNoIHRvICAKPiAKPiBoYXZlIG5vdyAtPiBub3cgaGF2ZQo+
IAo+ID4gcmVnbWFwIGJlZm9yZSBzcGxpdHRpbmcgdGhlIGNvZGUgdG8gc3VwcG9ydCBtdWx0aXBs
ZSBwbGF0Zm9ybSBkZXZpY2VzIHRvCj4gPiBiZSBwcm9iZWQgKG9uZSBmb3IgdGhlIElDVSwgb25l
IHBlciBpbnRlcnJ1cHQgZ3JvdXApLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiAgCj4gCj4gQXMgSSBleHBsYWluZWQgaW4g
dGhlIHJldmlldyBvZiBQQVRDSCAwMy8xNywgSSB0aGluayB3ZSBjb3VsZCBzaW1wbHkKPiBjcmVh
dGUgdGhlIHJlZ21hcCBpbiB0aGUgLT5wcm9iZSgpIG9mIHRoZSBwYXJlbnQgZGV2aWNlLCBpbnN0
ZWFkIG9mCj4gdXNpbmcgdGhlICJzeXNjb24iIHByb3BlcnR5LCB3aGljaCBpcyBtYWlubHkgdXNl
ZnVsIHdoZW4gdGhlcmUgaXMgbm8KPiBwYXJlbnQgZGV2aWNlLgoKVGhpcyBpcyBhIG11Y2ggYmV0
dGVyIGlkZWEgdGhhbiBhZGRpbmcgdGhlICdzeXNjb24nIGNvbXBhdGlibGUuIEkgd2lsbAp3b3Jr
IG9uIGl0LgoKPiAKPiBUaGUgcmVzdCBvZiB0aGUgY29udmVyc2lvbiB0byByZWdtYXAgbG9va3Mg
Z29vZCBvdGhlcndpc2UuCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRob21hcwoKVGhhbmtzLApN
aXF1w6hsCgotLSAKTWlxdWVsIFJheW5hbCwgQm9vdGxpbiAoZm9ybWVybHkgRnJlZSBFbGVjdHJv
bnMpCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=

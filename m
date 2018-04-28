From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 13/17] dt-bindings/interrupt-controller: update Marvell
 ICU bindings
Date: Sat, 28 Apr 2018 12:42:04 +0200
Message-ID: <20180428124204.3f305405@xps13>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-14-miquel.raynal@bootlin.com>
 <20180427204723.hz2ef5f7fhaid3aj@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180427204723.hz2ef5f7fhaid3aj@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLAoKT24gRnJpLCAyNyBBcHIgMjAxOCAxNTo0NzoyMyAtMDUwMCwgUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFNhdCwgQXByIDIxLCAyMDE4IGF0IDAzOjU1
OjMzUE0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBDaGFuZ2UgdGhlIGRvY3VtZW50
YXRpb24gdG8gcmVmbGVjdCB0aGUgbmV3IGJpbmRpbmdzIHVzZWQgZm9yIE1hcnZlbGwKPiA+IElD
VS4gVGhpcyBpbnZvbHZlcyBkZXNjcmliaW5nIGVhY2ggaW50ZXJydXB0IGdyb3VwIGFzIGEgc3Vi
bm9kZSBvZiB0aGUKPiA+IElDVSBub2RlLiBFYWNoIG9mIHRoZW0gaGF2aW5nIHRoZWlyIG93biBj
b21wYXRpYmxlLiAgCj4gCj4gV2h5Pwo+IAo+IFRoaXMgYnJlYWtzIGNvbXBhdGliaWxpdHkuCgpJ
dCBkb2VzIGluZGVlZC4KClRoZSBwcm9ibGVtIGNvbWVzIGZyb20gdGhlIGluYWJpbGl0eSB0byBo
YW5kbGUgbXVsdGlwbGUgTVNJIHBhcmVudHMKZm9yIG9uZSBkZXZpY2UgYW5kIHRoZSBmYWN0IHRo
YXQgdGhlIEFQSSB3YXMgbm90IGRlc2lnbmVkIGluIHRoaXMgd2F5CmF0IGFsbC4gSSB3b3VsZCBu
b3QgcmlzayBteXNlbGYgdG8gZXhwbGFpbiB0aGUgTVNJIGFyY2FuYSBidXQgSSBzdWdnZXN0Cnlv
dSB0byBoYXZlIGEgbG9vayBhdCB0aGlzIHRocmVhZCB3aGljaCBsZWQgdG8gdGhpcyBzZXJpZXM6
CgpodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9hcm0ta2VybmVsL21zZzY0NTExNS5odG1s
CgpPZiBjb3Vyc2UgSSBhbSBvcGVuIHRvIHN1Z2dlc3Rpb25zLgoKVGhhbmtzLApNaXF1w6hsCiAK
PiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9tYXJ2ZWxsLGljdS50eHQgIHwgNjAgKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkgIAoKCgotLSAKTWlx
dWVsIFJheW5hbCwgQm9vdGxpbiAoZm9ybWVybHkgRnJlZSBFbGVjdHJvbnMpCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

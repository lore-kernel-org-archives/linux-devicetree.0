From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 08/17] irqchip/irq-mvebu-icu: disociate ICU and NSR
Date: Fri, 29 Jun 2018 14:30:28 +0200
Message-ID: <20180629143028.4059e860@xps13>
References: <20180622151432.1566-1-miquel.raynal@bootlin.com>
 <20180622151432.1566-9-miquel.raynal@bootlin.com>
 <0d666052-b1f5-a27a-1bc8-fa3ede9e388a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0d666052-b1f5-a27a-1bc8-fa3ede9e388a@arm.com>
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

SGkgTWFyYywKClsuLi5dCgo+ID4gLQkvKgo+ID4gLQkgKiBXZSdyZSBwcm9iZWQgYWZ0ZXIgTVNJ
IGRvbWFpbnMgaGF2ZSBiZWVuIHJlc29sdmVkLCBzbyBmb3JjZQo+ID4gLQkgKiByZXNvbHV0aW9u
IGhlcmUuCj4gPiAtCSAqLwo+ID4gLQlwZGV2LT5kZXYubXNpX2RvbWFpbiA9IG9mX21zaV9nZXRf
ZG9tYWluKCZwZGV2LT5kZXYsIG5vZGUsCj4gPiAtCQkJCQkJIERPTUFJTl9CVVNfUExBVEZPUk1f
TVNJKTsKPiA+IC0JaWYgKCFwZGV2LT5kZXYubXNpX2RvbWFpbikKPiA+IC0JCXJldHVybiAtRVBS
T0JFX0RFRkVSOwo+ID4gLQo+ID4gLQlnaWNwX2RuID0gaXJxX2RvbWFpbl9nZXRfb2Zfbm9kZShw
ZGV2LT5kZXYubXNpX2RvbWFpbik7Cj4gPiAtCWlmICghZ2ljcF9kbikKPiA+IC0JCXJldHVybiAt
RU5PREVWOwo+ID4gLQo+ID4gIAkvKgo+ID4gIAkgKiBDbGVhbiBhbGwgSUNVIGludGVycnVwdHMg
d2l0aCB0eXBlIFNQSV9OU1IsIHJlcXVpcmVkIHRvCj4gPiAgCSAqIGF2b2lkIHVucHJlZGljdGFi
bGUgU1BJIGFzc2lnbm1lbnRzIGRvbmUgYnkgZmlybXdhcmUuCj4gPiBAQCAtMjgyLDE2ICsyOTcs
OSBAQCBzdGF0aWMgaW50IG12ZWJ1X2ljdV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ID4gIAkJCXJlZ21hcF93cml0ZShpY3UtPnJlZ21hcCwgSUNVX0lOVF9DRkcoaSksIDAp
Owo+ID4gIAl9Cj4gPiAgCj4gPiAtCWlycV9kb21haW4gPQo+ID4gLQkJcGxhdGZvcm1fbXNpX2Ny
ZWF0ZV9kZXZpY2VfZG9tYWluKCZwZGV2LT5kZXYsIElDVV9NQVhfSVJRUywKPiA+IC0JCQkJCQkg
IG12ZWJ1X2ljdV93cml0ZV9tc2csCj4gPiAtCQkJCQkJICAmbXZlYnVfaWN1X2RvbWFpbl9vcHMs
IGljdSk7Cj4gPiAtCWlmICghaXJxX2RvbWFpbikgewo+ID4gLQkJZGV2X2VycigmcGRldi0+ZGV2
LCAiRmFpbGVkIHRvIGNyZWF0ZSBJQ1UgZG9tYWluXG4iKTsKPiA+IC0JCXJldHVybiAtRU5PTUVN
Owo+ID4gLQl9Cj4gPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGljdSk7ICAKPiAKPiBX
aGF0IGlzIHRoZSB1cHNob3Qgb2YgcGFzc2luZyB0aGlzIGljdSBwb2ludGVyIGFzIHBhcnQgb2Yg
dGhlIHBsYXRmb3JtCj4gZGV2aWNlIHN0cnVjdHVyZSBpbnN0ZWFkIG9mIHNpbXBseSBwYXNzaW5n
IGl0IGFzIGEgcGFyYW1ldGVyPyBJcwo+IGFueXRoaW5nIGVsc2UgdXNpbmcgaXQ/CgpOb3QgYXQg
dGhpcyBzdGFnZSBvZiB0aGUgc2VyaWVzLCBidXQgcmlnaHQgYWZ0ZXIgdGhlIHBhdGNoCiJpcnFj
aGlwL2lycS1tdmVidS1pY3U6IHN1cHBvcnQgSUNVIHN1Ym5vZGVzIiBkb2VzIHRoZSBmb2xsb3dp
bmc6CgpAQCAtMjk5LDcgKzM1NiwxMCBAQCBzdGF0aWMgaW50IG12ZWJ1X2ljdV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
aWN1KTsKIAotCXJldHVybiBtdmVidV9pY3Vfc3Vic2V0X3Byb2JlKHBkZXYpOworCWlmIChpY3Ut
PmxlZ2FjeV9iaW5kaW5ncykKKwkJcmV0dXJuIG12ZWJ1X2ljdV9zdWJzZXRfcHJvYmUocGRldik7
CisJZWxzZQorCQlyZXR1cm4gZGV2bV9vZl9wbGF0Zm9ybV9wb3B1bGF0ZSgmcGRldi0+ZGV2KTsK
IH0KICAKVXNpbmcgZHJpdmVyIGRhdGEgaW4gYm90aCBjYXNlcyB3YXMsIGZyb20gbXkgcG9pbnQg
b2YgdmlldywgdGhlIGVhc2llc3QKKG1lYW53aGlsZSwgSSdsbCBzaW1wbGlmeSBpdCB0aGFua3Mg
dG8gYW5vdGhlciBjb21tZW50IHlvdSBtYWRlKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

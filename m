From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 10/14] dt-bindings/interrupt-controller: update
 Marvell ICU bindings
Date: Mon, 16 Jul 2018 21:38:19 +0200
Message-ID: <20180716213819.48e13e4d@windsurf>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-11-miquel.raynal@bootlin.com>
 <20180716152734.GA4581@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716152734.GA4581@rob-hp-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpPbiBNb24sIDE2IEp1bCAyMDE4IDA5OjI3OjM0IC0wNjAwLCBSb2IgSGVycmluZyB3
cm90ZToKCj4gPiArUmVxdWlyZWQgcHJvcGVydGllcyBmb3IgdGhlIGljdV9uc3IvaWN1X3NlaSBz
dWJub2RlczoKPiA+ICsKPiA+ICstIGNvbXBhdGlibGU6IFNob3VsZCBiZSAibWFydmVsbCxjcDEx
MC1pY3UtbnNyIiBvciAibWFydmVsbCxjcDExMC1pY3Utc2VpIi4KPiA+ICsgIAo+IAo+IEkgcmFp
c2VkIHRoaXMgYmVmb3JlIGFuZCBzdGlsbCBkb24ndCB1bmRlcnN0YW5kLiBZb3UgaGFkIDQgdHlw
ZXMgYmVmb3JlIAo+IGFuZCBub3cgeW91IG9ubHkgaGF2ZSAyIHR5cGVzPyBIb3cgZG8geW91IGhh
bmRsZSBTUiBhbmQgUkVJIHdpdGggdGhlIG5ldyAKPiBiaW5kaW5nPwoKQXMgSSByZXBsaWVkIHRv
IGEgZGlmZmVyZW50IGUtbWFpbCwgdGhlIGN1cnJlbnQgYmluZGluZyBwcmV0ZW5kZWQgdG8Kc3Vw
cG9ydCBTUiwgU0VJIGFuZCBSRUksIGJ1dCBpdCBkZWZpbml0ZWx5IGNvdWxkIG5vdC4KClRoZSBJ
Q1UgY29sbGVjdHMgd2lyZWQgaW50ZXJydXB0cyBmcm9tIHRoZSBDUCwgYW5kIGZvcndhcmRzIHRo
ZW0gdG8gdGhlCkFQIGFzIE1TSXMuIEFuZCBjb250cmFyeSB0byB3aGF0IHdlIHRob3VnaHQgd2hl
biBkZXNpZ25pbmcgdGhlIGN1cnJlbnQKYmluZGluZywgdGhlIHRhcmdldCBvZiB0aGUgTVNJcyBp
cyBkaWZmZXJlbnQgZGVwZW5kaW5nIG9uIHRoZSB0eXBlIG9mCmludGVycnVwdC4gTlNScyBnbyB0
byB0aGUgR0lDUCBjb250cm9sbGVyIGluIHRoZSBBUCwgU0VJcyBnbyB0byBhCnNwZWNpYWwgU0VJ
IGNvbnRyb2xsZXIgaW4gdGhlIEFQLCBSRUlzIGdvIHRvIGEgc3BlY2lhbCBSRUkgY29udHJvbGxl
cgppbiB0aGUgQVAuCgpJbiBvcmRlciB0byByZXByZXNlbnQgdGhhdCBpbiB0aGUgRGV2aWNlIFRy
ZWUsIHlvdSBuZWVkIHRvIGhhdmUgYQpkaWZmZXJlbnQgbXNpLXBhcmVudCBwcm9wZXJ0eSBmb3Ig
ZWFjaCBvZiBOU1IsIFNFSSBhbmQgUkVJLiBUaGlzIGlzIG5vdApzb21ldGhpbmcgdGhhdCB0aGUg
Y3VycmVudCBicm9rZW4gYmluZGluZyBhbGxvd3MgdG8gZXhwcmVzcywgYW5kIGl0J3MKdGhlIHJl
YXNvbiB3aHkgd2UncmUgbWlncmF0aW5nIHRvIHRoaXMgbmV3IGJpbmRpbmcuCgpTbyBldmVuIGlm
IHRoZSBjdXJyZW50IGJpbmRpbmcgZG9jdW1lbnRzIHRoYXQgaXQgc3VwcG9ydHMgTlNSLCBTRUks
IFJFSQphbmQgU1IsIGl0IGRlZmluaXRlbHkgY2Fubm90IHN1cHBvcnQgYW55dGhpbmcgYnV0IE5T
Ui4gVGhlcmVmb3JlLCB0aGUKaW50cm9kdWN0aW9uIG9mIHRoZSBuZXcgYmluZGluZyBieSBNaXF1
w6hsIGRvZXMgbm90IGludHJvZHVjZSBhbnkKcmVncmVzc2lvbiBpbiBmdW5jdGlvbmFsaXR5OiBp
dCBzaW1wbHkgYWxsb3dzIHRvIHJlYWxseSBzdXBwb3J0IFNFSXMuCgpEb2VzIHRoaXMgZXhwbGFu
YXRpb24gY2xhcmlmeSB0aGUgc2l0dWF0aW9uLCBhbmQgd2hhdCB3ZSdyZSB0cnlpbmcgdG8KYWNo
aWV2ZSA/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxp
biAoZm9ybWVybHkgRnJlZSBFbGVjdHJvbnMpCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

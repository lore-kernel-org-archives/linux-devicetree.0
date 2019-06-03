From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH resend 0/2] Marvell A7k/A8k thermal throttling
Date: Mon, 03 Jun 2019 16:26:50 +0200
Message-ID: <87sgsqkamt.fsf@FE-laptop>
References: <20190521142504.31558-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190521142504.31558-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JpdGVzOgoKPiBIZWxs
bywKPgo+IFRoaXMgc2VyaWVzIHdvcmtzIG9uIHRvcCBvZiBHcmVnb3J5J3Mgc2VyaWVzIGFkZGlu
ZyBib3RoIENQVWZyZXEgKGFscmVhZHkKPiBtZXJnZWQpIGFuZCBhIHN1aXRhYmxlIEFQODA2IGNs
b2NrIGRyaXZlci4gVGhlc2UgdHdvIHBhdGNoZXMgY2FuIGZseQo+IGFzLWlzIGFuZCBkbyBub3Qg
ZGVwZW5kIG9uIEdyZWdvcnkncyB3b3JrIHRvIGFwcGx5IGFuZCBzaG91bGQgcHJvYmFibHkKPiBt
ZXJnZWQgaW5kZXBlbmRlbnRseS4KPgo+IFdpdGggaGlzIHBhdGNoZXMsIGFsbCB0aGUgcGllY2Vz
IHdoZXJlIGF2YWlsYWJsZSB0byBlbmFibGUgdGhlcm1hbAo+IHRocm90dGxpbmcgb24gdGhlIEFQ
ODA2IGVtYmVkZGVkIGluIE1hcnZlbGwgQXJtYWRhIDdrLzhrIFNvQ3MuIFRoaXMgaXMKPiBqdXN0
IHRoZSBnbHVlIHRvIG1ha2UgaXQgYWN0dWFsbHkgd29yay4KPgo+IFBhdGNoIDEgY2hhbmdlcyB0
aGUgY29yZSBudW1iZXJpbmcgaW4gdGhlIHRoZXJtYWwtem9uZSBub2RlIHRvIGJlIGluCj4gc3lu
YyB3aXRoIHRoZSBDUFUgbnVtYmVyaW5nIGluIHRoZSBEVCAoZnJvbSAwIHRvIDMgaW5zdGVhZCBv
ZiBmcm9tIDEKPiB0byA0KS4gUGF0Y2ggMiBhZGRzIHRyaXAgcG9pbnRzIGFuZCBjb29saW5nIG1h
cHMgdG8gYWN0dWFsbHkgZW5hYmxlCj4gdGhlIGZlYXR1cmUuCj4KPiBUZXN0ZWQgd2l0aCBhbiBB
cm1hZGEgN2sgREIuCj4KPiBUaGFua3MsCj4gTWlxdcOobAo+Cj4gTWlxdWVsIFJheW5hbCAoMik6
Cj4gICBhcm02NDogZHRzOiBtYXJ2ZWxsOiBDaGFuZ2UgY29yZSBudW1iZXJpbmcgaW4gQVA4MDYg
dGhlcm1hbC1ub2RlCj4gICBhcm02NDogZHRzOiBtYXJ2ZWxsOiBFbmFibGUgQVA4MDYgdGhlcm1h
bCB0aHJvdHRsaW5nIHdpdGggQ1BVZnJlcQoKQm90aCBwYWN0aGVzIGFwcGxpZWQgb24gbXZlYnUv
ZHQ2NAoKVGhhbmtzLAoKR3JlZ29yeQoKPgo+ICAuLi4vYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEt
YXA4MDYtZHVhbC5kdHNpICAgfCAgIDIgKwo+ICAuLi4vYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEt
YXA4MDYtcXVhZC5kdHNpICAgfCAgIDUgKwo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwv
YXJtYWRhLWFwODA2LmR0c2kgfCAxMTAgKysrKysrKysrKysrKysrLS0tCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMTAzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Cj4gLS0gCj4gMi4xOS4x
Cj4KCi0tIApHcmVnb3J5IENsZW1lbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

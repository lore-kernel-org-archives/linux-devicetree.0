From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] ARM: at91: spi: request all csgpio in spi probe
Date: Fri, 1 Aug 2014 01:05:24 +0800
Message-ID: <1EB953D9-8221-47A0-9025-0C39DD09B631@jcrosoft.com>
References: <b033d16ec31d26a895726ee72ec89b43943dfbae.1406547656.git.jiri.prchal@aksignal.cz>
 <20140728122103.GR9532@piout.net> <53D64ADA.1000102@aksignal.cz>
 <20140728223859.GA3214@piout.net> <20140729100017.31f0b1be@bbrezillon>
 <20140731155906.GH3214@piout.net>
 <C5B462AE-B1D2-4067-91EB-44FDF49D28FA@jcrosoft.com>
 <20140731164836.GI3214@piout.net>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140731164836.GI3214@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>, =?utf-8?Q?Ji=C5=99=C3=AD_Prchal?= <jiri.prchal@aksignal.cz>, devicetree@vger.kernel.org, Nicolas FERRE <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, voice.shen@atmel.com, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Ck9uIEF1ZyAxLCAyMDE0LCBhdCAxMjo0OCBBTSwgQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGZyZWUtZWxlY3Ryb25zLmNvbT4gd3JvdGU6Cgo+IAo+IE9uIDAxLzA4LzIwMTQg
YXQgMDA6MTA6MDUgKzA4MDAsIEplYW4tQ2hyaXN0b3BoZSBQTEFHTklPTC1WSUxMQVJEIHdyb3Rl
IDoKPj4+Pj4gV2hpbGUgdGhpcyBzb2x2ZXMgdGhlIHBhcnRpY3VsYXIgaXNzdWUgSmnFmcOtIGlz
IHNlZWluZywgdGhpcyB3aWxsIG5vdAo+Pj4+PiBzb2x2ZSB0aGUgY2FzZSB3aGVyZSBQQTE0IChD
UzApIGlzIG5vdCB1c2VkIGJ5IHRoZSBzcGkgZHJpdmVyIGF0IGFsbC4gSXQKPj4+Pj4gd2lsbCBy
ZW1haW5lZCBtdXhlZCBhcyBDUzAgYW5kIHRvZ2dsZSB3aGVuIHRoZSBzcGkgbWFzdGVyIG5lZWRz
IHRvCj4+Pj4+IGFjY2VzcyBDUzAgdW50aWwgYW5vdGhlciBkcml2ZXIgbXV4ZXMgaXQgdG8gc29t
ZXRoaW5nIGVsc2UuIEkgc3RpbGwKPj4+Pj4gYmVsaWV2ZSB3ZSBzaG91bGQgZXhwbGljaXRseSBh
c2sgcGluY3RybCB0byBtdXggdGhlbSBhcyBncGlvcy4KPj4gCj4+IFRoaXMgaXMgbm90IHRoZSBq
b2Igb2YgdGhlIGtlcm5lbCBidXQgdG8gdGhlIGJvb3Rsb2FkZXIKPj4gbm8gdGhlIHBpbmN0cmwg
YmluZGluZyBpcyBub3QgaGVyZSBhbmQgd2lsbCBuZXZlciBiZSBoZXJlIHRoZSBjb25maWd1cmUg
YSBwaW4gYXMgYSBHUElPIG9yCj4gCj4gVGhpcyBpcyBleGFjdGx5IHdoYXQgQVQ5MV9QRVJJUEhf
R1BJTyBkb2VzIHRob3VnaC4gQW55d2F5LCBub3QgcmVxdWVzdAo+IHRoZSBwaW5tdXhpbmcgaW4g
dGhlIGRyaXZlciBpcyBub3QgYSBnb29kIGlkZWEsIHRoZW4gbm90aGluZyBwcmV2ZW50cwo+IGFu
b3RoZXIgZHJpdmVyIHRvIHJlcXVlc3QgdGhlbSB0byBkbyBzb21ldGhpbmcgY29tcGxldGVseSBk
aWZmZXJlbnQuCgpoZXJlIGl04oCZcyB0aGUgc2FtZSBpc3N1ZSBpZiB5b3UgbmVlZCB0byBwaW4g
YXMgR1BJTyB1c2UgdGhlIEdQSU8gQVBJIG5vdCB0aGUgcGluY3RybAoKQVQ5MV9QRVJJUEhfR1BJ
TyBpcyB1c2UgdGhlIHNldCBzcGVjaWZpYyBwaW5tdXggKGJvdW5jaW5nICYgZXRj4oCmKQoKCj4g
Cj4+IHRvIGEgc3BlY2lmaWMgc3RhdGUuIFRoaXMgdGhlIGpvYiBvZiB0aGUgZHJpdmVyIG9yIHRo
ZSBib290bG9hZGVyCj4+IAo+IAo+IEkgYWdyZWUgdGhhdCBpdCBtdXN0IG5vdCBhbGxvdyB0byBz
ZXQgdGhlIHN0YXRlLCB3ZSBhcmUgdGFsa2luZyBhYm91dAo+IG11eGluZy4KPiAKPiAKPiAtLSAK
PiBBbGV4YW5kcmUgQmVsbG9uaSwgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRlZCBMaW51eCwgS2Vy
bmVsIGFuZCBBbmRyb2lkIGVuZ2luZWVyaW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK

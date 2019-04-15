From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: Add DMA support for sun8i
Date: Mon, 15 Apr 2019 08:58:59 +0200
Message-ID: <20190415085859.21f69396@xps13>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
 <20190404162111.22618-3-miquel.raynal@bootlin.com>
 <20190414110549.5c91829d@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190414110549.5c91829d@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDE0IEFwcgoyMDE5IDExOjA1OjQ5ICswMjAwOgoKPiBPbiBUaHUsICA0
IEFwciAyMDE5IDE4OjIxOjEwICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBBbGx3aW5uZXIgTkFORCBjb250cm9sbGVycyBjYW4g
bWFrZSB1c2Ugb2YgRE1BIHRvIGVuaGFuY2UgdGhlIEkvTwo+ID4gdGhyb3VnaHB1dCB0aGFua3Mg
dG8gRUNDIHBpcGVsaW5pbmcuIERNQSBoYW5kbGluZyB3aXRoIHN1bjhpIE5BTkQgSVAKPiA+IGlz
IGEgYml0IGRpZmZlcmVudCB0aGFuIHdpdGggdGhlIG9sZGVyIFNvQ3MsIGhlbmNlIHRoZSBpbnRy
b2R1Y3Rpb24gb2YKPiA+IGEgbmV3IGNvbXBhdGlibGUgdG8gaGFuZGxlOgo+ID4gKiB0aGUgZGlm
ZmVyZW5jZXMgYmV0d2VlbiByZWdpc3RlciBvZmZzZXRzLAo+ID4gKiB0aGUgYnVyc3QgbGVuZ3Ro
IGNoYW5nZSBmcm9tIDQgdG8gbWluaW11bSA4LAo+ID4gKiBkcml2ZSBTUkFNIGFjY2Vzc2VzIHRo
cm91Z2ggdGhlIEFIQiBidXMgaW5zdGVhZCBvZiB0aGUgTUJVUy4gIAo+IAo+IEhtLCBub3cgdGhh
dCB5b3Uga25vdyBNQlVTIGFjY2Vzc2VzIGFyZSB3b3JraW5nIGZpbmUgKElJUkMsIHRoYXQncyB3
aGF0Cj4geW91IHVzZWQgZm9yIHRoZSBTUEwgRE1BLWJhc2VkIGltcGxlbWVudGF0aW9uKSwgd2h5
IG5vdCBkaXJlY3RseSB1c2UKPiBNQlVTIGFjY2Vzc2VzIG9uIEEzMz8gSSBtZWFuLCBpdCdzIGxp
a2VseSBmYXN0ZXIgdGhhbiBnb2luZyB0aHJvdWdoCj4gdGhlIERNQSBlbmdpbmUgKHdoaWNoIGlz
IHNoYXJlZCBieSBzZXZlcmFsIElQcyksIGFuZCBBRkFJUiwgdGhlIE1CVVMKPiBzZXR1cCBpcyBw
cmV0dHkgc2ltcGxlLgoKQmVjYXVzZSBhbGwgdGhlIGRyaXZlciBpcyBhbHJlYWR5IGluIHNoYXBl
IHRvIHVzZSB0aGUgZXh0ZXJuYWwgRE1BCmVuZ2luZSBhbmQgaXQgd2FzIHZlcnkgZWFzeSBhbmQg
cXVpY2sgKGhhdmUgYSBsb29rIGF0IHRoZSBkaWZmIG9mIHRoZQp2MykgdG8gdXNlIGl0IGFnYWlu
LgoKSG93ZXZlciwgdGhlIGNob2ljZSBJIGFtIGRlc2NyaWJpbmcgaGVyZSBpcyBub3QgRE1BIHZz
LiBNQlVTIChvciBNRE1BKSwKaXQgaXMgTUJVUyB2cy4gQUhCLCBpdCBpcyBqdXN0IGFib3V0IHRo
ZSBidXMgdGhhdCB3aWxsIGFjY2VzcyB0aGUgU1JBTQoodGhpcyBpcyB3aGF0IHdlIGhhdmUgdW5k
ZXJzdG9vZCB3aXRoIE1heGltZSBmcm9tIHRoZSBkYXRhc2hlZXRzIGFuZAp0aGUgdGVzdHMgd2Ug
aGF2ZSBkb25lKS4gRm9yIHRoaXMgY2hvaWNlLCB3ZSB0ZXN0ZWQgd2l0aCBib3RoIGJ1c2VzOiBu
bwp0aHJvdWdocHV0IGNoYW5nZSBzbyB3ZSB0aGluayB0aGF0IGl0IGlzIG5vdCBhIGJvdHRsZW5l
Y2sgYW55d2F5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

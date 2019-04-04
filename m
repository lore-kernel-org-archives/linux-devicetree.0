From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] Sun8i NAND DMA support
Date: Thu,  4 Apr 2019 18:21:08 +0200
Message-ID: <20190404162111.22618-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpUaGlzIHNlcmllcyBpbXByb3ZlcyB0aGUgTkFORCB0aHJvdWdocHV0IG9uIHN1bjhp
IHBsYXRmb3JtcyBieSBhZGRpbmcKRE1BIHN1cHBvcnQuIFRoaXMgaW5jcmVhc2UgY29tZXMgZnJv
bSB0aGUgRUNDIHBpcGVsaW5pbmcgZmVhdHVyZS4KCkJlY2F1c2UgTkFORCBETUEgaGFuZGxpbmcg
aGFzIGNoYW5nZWQgYmV0d2VlbiBBMTArIGFuZCBBMzMgU29Dcywgd2UKbXVzdCBpbnRyb2R1Y2Ug
YSBuZXcgY29tcGF0aWJsZS4gRFQgaXMgdXBkYXRlZCB3aXRoIHRoaXMgbmV3CmNvbXBhdGlibGUg
aW4gYWRkaXRpb24gd2l0aCB0aGUgdXN1YWwgRE1BIHByb3BlcnRpZXMuCgpUZXN0ZWQgb24gYW4g
QTMzLU9saW51eGluby4KClRoYW5rcywKTWlxdcOobAoKCk1pcXVlbCBSYXluYWwgKDMpOgogIGR0
LWJpbmRpbmdzOiBtdGQ6IHN1bnhpOiBBZGQgbmV3IGNvbXBhdGlibGUKICBtdGQ6IHJhd25hbmQ6
IHN1bnhpOiBBZGQgRE1BIHN1cHBvcnQgZm9yIHN1bjhpCiAgQVJNOiBkdHM6IHN1bnhpOiBJbXBy
b3ZlIHN1bjhpIE5BTkQgdHJhbnNmZXJzIGJ5IHVzaW5nIERNQQoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zdW54aS1uYW5kLnR4dCAgICB8ICA3ICstCiBhcmNoL2FybS9ib290L2R0cy9z
dW44aS1hMjMtYTMzLmR0c2kgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jICAgICAgICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKystLQogMyBmaWxl
cyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK

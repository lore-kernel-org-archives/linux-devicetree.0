From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROME mode
Date: Mon, 26 Mar 2018 15:04:51 +0200
Message-ID: <20180326150451.0d398bdd@xps13>
References: <20180321083618.18355-1-boris.brezillon@bootlin.com>
 <20180321105327.27a28987@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180321105327.27a28987@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgQm9yaXMsCgpPbiBXZWQsIDIxIE1hciAyMDE4IDEwOjUzOjI3ICswMTAwLCBCb3JpcyBCcmV6
aWxsb24KPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgMjEg
TWFyIDIwMTggMDk6MzY6MTggKzAxMDAKPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGlzIG1vZGUgaXMgbm90IHVzZWQgYnkgYW55
IGV4aXN0aW5nIHNldHVwIGFuZCBzaG91bGQgbm90IGJlIHVzZWQKPiA+IGJlY2F1c2UgaXQgb3Zl
cnJpZGVzIHRoZSBCQk1zLiBMZXQncyBqdXN0IHJlbW92ZSBpdCBiZWZvcmUgc29tZW9uZSAgCj4g
Cj4gCSAgICAgXiAnb3ZlcndyaXRlcycgbm90ICdvdmVycmlkZXMnCj4gCj4gPiBzdGFydHMgdXNp
bmcgaXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3N1bnhpLW5hbmQudHh0ICAgICAgICAgfCAgIDQgKy0KPiA+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdW54aV9uYW5kLmMgICAgICAgICAgICAgICAgICB8IDE1NSArKystLS0tLS0tLS0tLS0t
LS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEzNyBkZWxldGlv
bnMoLSkKClRlc3RlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KClRoYW5rcywKTWlxdcOobAoKLS0gCk1pcXVlbCBSYXluYWwsIEJvb3RsaW4gKGZvcm1lcmx5
IEZyZWUgRWxlY3Ryb25zKQpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

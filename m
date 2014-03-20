From: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 09:33:39 +0100
Message-ID: <201403200933.39382.jbe@pengutronix.de>
References: <1395235406-13449-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395235406-13449-1-git-send-email-y>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, y@karo-electronics.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, Lothar =?utf-8?q?Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: devicetree@vger.kernel.org

SGkgTG90aGFyLAoKT24gV2VkbmVzZGF5IDE5IE1hcmNoIDIwMTQgMTQ6MjM6MjYgeUBrYXJvLWVs
ZWN0cm9uaWNzLmRlIHdyb3RlOgo+IFdpdGggYSBmbGFzaC1iYXNlZCBCQlQgdGhlcmUgaXMgbm8g
cmVhc29uIHRvIG1vdmUgdGhlIEZhY3RvcnkgQmFkCj4gQmxvY2sgTWFya2VyIGZyb20gdGhlIGRh
dGEgYXJlYSBidWZmZXIgKHRvIHdoZXJlIGl0IGlzIG1hcHBlZCBieSB0aGUKPiBHUE1JIE5BTkQg
Y29udHJvbGxlcikgdG8gdGhlIE9PQiBidWZmZXIuIFRodXMsIG1ha2UgdGhpcyBmZWF0dXJlCj4g
Y29uZmlndXJhYmxlIHZpYSBEVC4gVGhpcyBpcyByZXF1aXJlZCBmb3IgdGhlIEthLVJvIGVsZWN0
cm9uaWNzCj4gcGxhdGZvcm1zLgo+IFsuLi5dCgpIb3cgZG8geW91IGNyZWF0ZSB0aGUgQkJUIHRo
ZSB2ZXJ5IGZpcnN0IHRpbWUgd2l0aCB2YWx1YWJsZSBkYXRhIHdoZW4gdGhlIE5BTkQgCmFscmVh
ZHkgY29udGFpbnMgZmFjdG9yeSBiYWQgYmxvY2tzPwoKamJlCgotLSAKUGVuZ3V0cm9uaXggZS5L
LiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgSnVlcmdlbiBC
ZWlzZXJ0IMKgIMKgIMKgIMKgIMKgIMKgIHwKTGludXggU29sdXRpb25zIGZvciBTY2llbmNlIGFu
ZCBJbmR1c3RyeSDCoCDCoCDCoHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

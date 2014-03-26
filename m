From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Date: Wed, 26 Mar 2014 18:41:43 +0800
Message-ID: <5332AEE7.2040402@freescale.com>
References: <532BCFCC.4080205@freescale.com>	<1395399017-19005-1-git-send-email-LW@KARO-electronics.de>	<20140324095902.GB11377@localhost>
 <20140326095156.3e5585b8@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140326095156.3e5585b8@ipc1.ka-ro>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

5LqOIDIwMTTlubQwM+aciDI25pelIDE2OjUxLCBMb3RoYXIgV2HDn21hbm4g5YaZ6YGTOgo+IEkg
ZG9uJ3Qgc2VlIHdoeSB0aGlzIHNob3VsZCBub3QgYmUgc3VwcG9ydGVkIG9uIGkuTVgyOCAoaS5N
WDIzIGRvZXNuJ3QKPiBkbyBieXRlc3dhcHBpbmcgYW55d2F5LCBzbyB0aGlzIHdvdWxkbid0IGNo
YW5nZSBhbnl0aGluZyBmb3IgaS5NWDIzKS4KPiBUaGUgcGFydGl0aW9ucyB1c2VkIGJ5IExpbnV4
IG5lZWQgbm90IG5lY2Vzc2FyaWx5IGJlIGFjY2Vzc2libGUgZm9yIHRoZQo+IEJvb3QgUk9NIGNv
ZGUgKGFuZCB2aWNlIHZlcnNhKS4KQnV0IHRoZSBmaXJzdCBwYXJ0aXRpb24gdXNlZCB0byBzdG9y
ZSB0aGUgdS1ib290IGlzIGFjY2Vzc2libGUgZm9yIHRoZSBST00uCgpQbGVhc2Ugc2VlICJGaWd1
cmUgMTItMTMiIGluIHRoZSAxMi4xMi4xLjEyOgogICAiSW4gb3JkZXIgdG8gcHJlc2VydmUgdGhl
IEJJIChiYWQgYmxvY2sgaW5mb3JtYXRpb24pLCBmbGFzaCB1cGRhdGVyIApvciBnYW5nIHByb2dy
YW1tZXIKYXBwbGljYXRpb25zIG5lZWQgdG8gc3dhcCBCYWQgQmxvY2sgSW5mb3JtYXRpb24gKEJJ
KSBkYXRhIHRvIGJ5dGUgMCBvZiAKbWV0YWRhdGEgYXJlYSBmb3IKZXZlcnkgcGFnZSBiZWZvcmUg
cHJvZ3JhbW1pbmcgTkFORCBGbGFzaC4gUk9NIHdoZW4gbG9hZGluZyBmaXJtd2FyZSwgCmNvcGll
cyBiYWNrCnRoZSB2YWx1ZSBhdCBtZXRhZGF0YVswXSB0byBCSSBvZmZzZXQgaW4gcGFnZSBkYXRh
LiBUaGUgZm9sbG93aW5nIGZpZ3VyZSAKc2hvd3MgaG93IHRoZQpmYWN0b3J5IGJhZCBibG9jayBt
YXJrZXIgaXMgcHJlc2VydmVkLiIKClNvIHBsZWFzZSB0aGUgaW14Mjggc2hvdWxkIF9OT1RfIHN1
cHBvcnQgdGhpcyBmZWF0dXJlLgoKdGhhbmtzCkh1YW5nIFNoaWppZQoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

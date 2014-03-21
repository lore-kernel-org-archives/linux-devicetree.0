From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Fri, 21 Mar 2014 13:36:12 +0800
Message-ID: <532BCFCC.4080205@freescale.com>
References: <1395235406-13449-1-git-send-email-y>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395235406-13449-1-git-send-email-y>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: y@karo-electronics.de
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@karo-electronics.de>
List-Id: devicetree@vger.kernel.org

5LqOIDIwMTTlubQwM+aciDE55pelIDIxOjIzLCB5QGthcm8tZWxlY3Ryb25pY3MuZGUg5YaZ6YGT
Ogo+ICsJLyogU2V0IHVwIHN3YXBfYmxvY2tfbWFyaywgbXVzdCBiZSBzZXQgYmVmb3JlIHRoZSBn
cG1pX3NldF9nZW9tZXRyeSgpICovCj4gKwlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9vbCh0aGlz
LT5kZXYtPm9mX25vZGUsICJmc2wsbm8tYmxvY2ttYXJrLXN3YXAiKSkKPiArCQl0aGlzLT5zd2Fw
X2Jsb2NrX21hcmsgPSAhR1BNSV9JU19NWDIzKHRoaXMpOwoKCk91ciBST00gZ3V5IGhhZCBjb25m
aXJtZWQgdGhhdCB0aGUgUm9tIHdpbGwgZGlzYWJsZSB0aGUgc3dhcHBpbmcgaWYgd2UgCnNldCB0
aGUgRElTQkJNIGJpdC4KQnV0IHBsZWFzZSBkbyBub3QgY2hhbmdlIGFueSBsb2dpYyBmb3IgaW14
MjMvaW14MjguCgpJIHJlYWxseSBkbyBub3Qga25vdyB3aGF0J3MgdGhlIGJlbmVmaXQgd2UgY2Fu
IGdldCBmcm9tIHRoaXMgcGF0Y2guClBsZWFzZSBzZW5kIHRoZSBuZXcgdmVyc2lvbiBhYm91dCB0
aGlzIHBhdGNoIGlmIHlvdSB3YW50IHRoaXMgZmVhdHVyZS4KCgp0aGFua3MKSHVhbmcgU2hpamll
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=

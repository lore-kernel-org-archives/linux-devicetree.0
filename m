From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] ARM: dts: zynq: Enable PL clocks for Parallella
Date: Thu, 6 Nov 2014 09:33:54 -0800
Message-ID: <e78290abdb85497081f502e5886bf045@BL2FFO11FD057.protection.gbl>
References: <1415294531-8942-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1415294531-8942-1-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "open
 list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Andreas Olofsson <andreas@adapteva.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michal Simek <michal.simek@xilinx.com>, stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, Olof Johansson <olof@lixom.net>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgQW5kcmVhcywKCk9uIFRodSwgMjAxNC0xMS0wNiBhdCAwNjoyMlBNICswMTAwLCBBbmRyZWFz
IEbDpHJiZXIgd3JvdGU6Cj4gVGhlIFBhcmFsbGVsbGEgYm9hcmQgY29tZXMgd2l0aCBhIFUtQm9v
dCBib290bG9hZGVyIHRoYXQgbG9hZHMgb25lIG9mCj4gdHdvIHByZWRlZmluZWQgRlBHQSBiaXRz
dHJlYW1zIGJlZm9yZSBib290aW5nIHRoZSBrZXJuZWwuIEJvdGggZGVmaW5lIGFuCj4gQVhJIGlu
dGVyZmFjZSB0byB0aGUgb24tYm9hcmQgRXBpcGhhbnkgcHJvY2Vzc29yLgo+IAo+IEVuYWJsZSBj
bG9ja3MgRkNMSzAuLkZDTEszIGZvciB0aGUgUHJvZ3JhbW1hYmxlIExvZ2ljIGJ5IGRlZmF1bHQu
Cj4gCj4gT3RoZXJ3aXNlIGFjY2Vzc2luZywgZS5nLiwgdGhlIEVTWVNSRVNFVCByZWdpc3RlciBm
cmVlemVzIHRoZSBib2FyZCwKPiBhcyBzZWVuIHdpdGggdGhlIEVwaXBoYW55IFNESyB0b29scyBl
LXJlc2V0IGFuZCBlLWh3LXJldiwgdXNpbmcgL2Rldi9tZW0uCgpZZWFoLCB0aGlzIGlzIHRoZSBw
cm9ibGVtLiBCeXBhc3NpbmcgdGhlIGtlcm5lbCBiYW5naW5nIG9uIG1lbW9yeQpkaXJlY3RseSB0
aHJvdWdoIC9kZXYvbWVtIGRvZXMgbm90IGxlYXZlIGFueSBjaGFuY2Ugb2YgZW5hYmxpbmcgY2xv
Y2tzIG9uCmRlbWFuZCB0aHJvdWdoIHRoZSBwcm9wZXIgaW50ZXJmYWNlcy4KClRob3VnaCwgdGhp
cyBpcyBhIHZhbGlkIHdvcmthcm91bmQgZm9yIHRoZSBpbW1lZGlhdGUgcHJvYmxlbSwgbG9uZ2Vy
CnRlcm0sIHlvdSBzaG91bGQgY29uc2lkZXIgYWRkaW5nIHNvbWUga2luZCBvZiBwcm9wZXIga2Vy
bmVsIGRyaXZlciBmb3IKdGhpcyBpbnRlcmZhY2UgdGhhdCB3b3VsZCB0aGVuIHVzZSB0aGUgY2xv
Y2sgZnJhbWV3b3JrIHRvIGNvbnRyb2wgdGhlCnJlcXVpcmVkIGNsb2NrcyBkeW5hbWljYWxseS4K
CglTw7ZyZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK

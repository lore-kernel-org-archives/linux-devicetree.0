From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Date: Thu, 20 Mar 2014 10:20:29 +0100
Message-ID: <20140320102029.4327a6c0@ipc1.ka-ro>
References: <1395235406-13449-1-git-send-email-y>
 <201403200933.39382.jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201403200933.39382.jbe@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Juergen Beisert <jbe@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, y@karo-electronics.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpKdWVyZ2VuIEJlaXNlcnQgd3JvdGU6Cj4gSGkgTG90aGFyLAo+IAo+IE9uIFdlZG5lc2Rh
eSAxOSBNYXJjaCAyMDE0IDE0OjIzOjI2IHlAa2Fyby1lbGVjdHJvbmljcy5kZSB3cm90ZToKPiA+
IFdpdGggYSBmbGFzaC1iYXNlZCBCQlQgdGhlcmUgaXMgbm8gcmVhc29uIHRvIG1vdmUgdGhlIEZh
Y3RvcnkgQmFkCj4gPiBCbG9jayBNYXJrZXIgZnJvbSB0aGUgZGF0YSBhcmVhIGJ1ZmZlciAodG8g
d2hlcmUgaXQgaXMgbWFwcGVkIGJ5IHRoZQo+ID4gR1BNSSBOQU5EIGNvbnRyb2xsZXIpIHRvIHRo
ZSBPT0IgYnVmZmVyLiBUaHVzLCBtYWtlIHRoaXMgZmVhdHVyZQo+ID4gY29uZmlndXJhYmxlIHZp
YSBEVC4gVGhpcyBpcyByZXF1aXJlZCBmb3IgdGhlIEthLVJvIGVsZWN0cm9uaWNzCj4gPiBwbGF0
Zm9ybXMuCj4gPiBbLi4uXQo+IAo+IEhvdyBkbyB5b3UgY3JlYXRlIHRoZSBCQlQgdGhlIHZlcnkg
Zmlyc3QgdGltZSB3aXRoIHZhbHVhYmxlIGRhdGEgd2hlbiB0aGUgTkFORCAKPiBhbHJlYWR5IGNv
bnRhaW5zIGZhY3RvcnkgYmFkIGJsb2Nrcz8KPiAKV2l0aCB0aGUgZmxhc2h0b29sIHRoYXQgZG9l
cyB0aGUgaW5pdGlhbCBmbGFzaCBwcm9ncmFtbWluZy4KCgpMb3RoYXIgV2HDn21hbm4KLS0gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CgpLYS1SbyBlbGVjdHJvbmljcyBHbWJIIHwgUGFzY2Fsc3RyYcOfZSAyMiB8IEQgLSA1MjA3NiBB
YWNoZW4KUGhvbmU6ICs0OSAyNDA4IDE0MDItMCB8IEZheDogKzQ5IDI0MDggMTQwMi0xMApHZXNj
aMOkZnRzZsO8aHJlcjogTWF0dGhpYXMgS2F1c3NlbgpIYW5kZWxzcmVnaXN0ZXJlaW50cmFnOiBB
bXRzZ2VyaWNodCBBYWNoZW4sIEhSQiA0OTk2Cgp3d3cua2Fyby1lbGVjdHJvbmljcy5kZSB8IGlu
Zm9Aa2Fyby1lbGVjdHJvbmljcy5kZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

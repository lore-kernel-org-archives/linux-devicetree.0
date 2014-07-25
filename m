From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND RFC V2] devicetree: Dialog Semiconductor consolidate
 existing vendor prefixes to standardise on 'dlg'
Date: Fri, 25 Jul 2014 08:00:02 +0100
Message-ID: <20140725070002.GH7063@lee--X1>
References: <201407241554.s6OFsqbW031651@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201407241554.s6OFsqbW031651@swsrvapps-01.diasemi.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, LINUX SH <linux-sh@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Shawn Guo <shawn.guo@freescale.com>, Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, DEVICE TREE <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnaud Ebalard <arno@natisbad.org>, Rob Herring <robh+dt@kernel.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, Martin Fuzzey <mfuzzey@parkeon.com>, Support Opensource <support.opensource@diasemi.com>, LINUX KERNEL <linux-kernel@vger.kernel.org>, Simon
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyNCBKdWwgMjAxNCwgT3BlbnNvdXJjZSBbU3RldmUgVHdpc3NdIHdyb3RlOgoKPiBG
cm9tOiBTdGV2ZSBUd2lzcyA8c3R3aXNzLm9wZW5zb3VyY2VAZGlhc2VtaS5jb20+Cj4gCj4gVGhp
cyBwYXRjaCBzZXJpZXMgdXBkYXRlcyB0aGUgZGV2aWNlIHRyZWUgdmVuZG9yIHByZWZpeCBmb3IK
PiBEaWFsb2cgU2VtaWNvbmR1Y3Rvci4KPiAKPiBWYXJpb3VzIG1ldGhvZHMgYXJlIGN1cnJlbnRs
eSB1c2VkIHRocm91Z2hvdXQgdGhlIGtlcm5lbDogJ2RpYXNlbWknLAo+ICdkaWFsb2cnIGFuZCAn
ZGxnJy4gT3RoZXJzIGhhdmUgYWxzbyBiZWVuIHN1Z2dlc3RlZC4KPiAKPiBUaGlzIHBhdGNoIHNl
dCBhaW1zIHRvIGNvbnNvbGlkYXRlIHRoZSB1c2FnZSBvZiB0aGUgdmVuZG9yIHByZWZpeCB0bwo+
IHVzZSBhIGNvbW1vbiBzdGFuZGFyZC4gVGhlIHByZWZpeCAnZGxnJyBpcyB1c2VkLgo+IAo+IAo+
IFNpZ25lZC1vZmYtYnk6IFN0ZXZlIFR3aXNzIDxzdHdpc3Mub3BlbnNvdXJjZUBkaWFzZW1pLmNv
bT4KCkRpZG4ndCBJIEFjayB0aGUgTUZEIHBhcnRzIGFscmVhZHk/CgotLSAKTGVlIEpvbmVzCkxp
bmFybyBTVE1pY3JvZWxlY3Ryb25pY3MgTGFuZGluZyBUZWFtIExlYWQKTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: opos6ul/opos6uldev: rework device tree
 to support i.MX6ULL
Date: Tue, 3 Sep 2019 09:38:11 +0200
Message-ID: <194bd606-e4bf-d8fd-ece2-cbec1f5e025f@armadeus.com>
References: <20190724120623.2385-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190724120623.2385-1-sebastien.szymanski@armadeus.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGVsbG8sCgpPbiA3LzI0LzE5IDI6MDYgUE0sIFPDqWJhc3RpZW4gU3p5bWFuc2tpIHdyb3RlOgo+
IFJld29yayB0aGUgZGV2aWNlIHRyZWVzIG9mIHRoZSBPUE9TNlVMIGFuZCBPUE9TNlVMRGV2IGJv
YXJkcyB0byBzdXBwb3J0Cj4gdGhlIE9QT1M2VUwgU29NIHdpdGggYW4gaS5NWDZVTEwgU29DLiAg
VGhlIGRldmljZSB0cmVlcyBhcmUgbm93IGFzCj4gZm9sbG93aW5nOgo+IAo+IC0gaW14NnVsLWlt
eDZ1bGwtb3BvczZ1bC5kdHNpCj4gICBjb21tb24gZm9yIGJvdGggaS5NWDZVTCBhbmQgaS5NWDZV
TEwgT1BPUzZVTCBTb00uCj4gLSBpbXg2dWwtb3BvczZ1bC5kdHNpCj4gICBmb3IgaS5NWDZVTCBP
UE9TNlVMIFNvTS4gSXQgaW5jbHVkZXMgaW14NnVsLmR0c2kgYW5kCj4gICBpbXg2dWwtaW14NnVs
bC1vcG9zNnVsLmR0c2kuCj4gLSBpbXg2dWxsLW9wb3M2dWwuZHRzaQo+ICAgZm9yIGkuTVg2VUxM
IE9QT1M2VUwgU29NLiBJdCBpbmNsdWRlcyBpbXg2dWxsLmR0c2kgYW5kCj4gICBpbXg2dWwtaW14
NnVsbC1vcG9zNnVsLmR0c2kuCj4gCj4gLSBpbXg2dWwtaW14NnVsbC1vcG9zNnVsZGV2LmR0c2kK
PiAgIE9QT1M2VUxEZXYgYmFzZSBkZXZpY2UgdHJlZS4KPiAtIGlteDZ1bC1vcG9zNnVsZGV2LmR0
cwo+ICAgT1BPUzZVTERldiBib2FyZCB3aXRoIGFuIGkuTVg2VUwgT1BPUzZVTCBTb00uIEl0IGlu
Y2x1ZGVzCj4gICBpbXg2dWwtb3BvczZ1bC5kdHNpIGFuZCBpbXg2dWwtaW14NnVsbC1vcG9zNnVs
ZGV2ZHRzaS4KPiAtIGlteDZ1bGwtb3BvczZ1bGRldi5kdHMKPiAgIE9QT1M2VUxEZXYgYm9hcmQg
d2l0aCBhbiBpLk1YNlVMTCBPUE9TNlVMIFNvTS4gSXQgaW5jbHVkZXMKPiAgIGlteDZ1bGwtb3Bv
czZ1bC5kdHNpIGFuZCBpbXg2dWwtaW14NnVsbC1vcG9zNnVsZGV2ZHRzaS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+Cj4gLS0tCj4gCj4gQ2hhbmdlcyBmb3IgdjI6Cj4gLSBleHBsYWluIHRoZSBmaWxlIGhp
ZXJhcmNoeSBpbiB0aGUgY29tbWl0IGxvZwo+IC0gdXNlIE1JVCBsaWNlbnNlIGluc3RlYWQgb2Yg
WDExCj4gLSBDaGFuZ2UgY29tcGF0aWJsZSBwcm9wZXJ0aWVzIHRvICJhcm1hZGV1cyxpbXg2e3Vs
LHVsbH0tb3BvczZ1bCIgYW5kCj4gICAiYXJtYWRldXMsaW14Nnt1bCx1bGx9LW9wb3M2dWxkZXYi
IHRvIGZvbGxvdyB0aGUgYmluZGluZ3Mgb2YgdGhlCj4gICBBcm1hZGV1cyBib2FyZHMgYWxyZWFk
eSBzdXBwb3J0ZWQuCgpnZW50bGUgcGluZy4uLgoKUmVnYXJkcywKClPDqWJhc3RpZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

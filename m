From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH] ARM: dts: imx6ull: fix pinmux input_val for uart5 rx pin
Date: Thu, 30 Aug 2018 15:25:24 +0200
Message-ID: <218369fa-8ec1-fd3c-dd2e-b4821e11cb62@armadeus.com>
References: <20180830124702.12572-1-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180830124702.12572-1-hs@denx.de>
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
To: Heiko Schocher <hs@denx.de>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiAwOC8zMC8yMDE4IDAyOjQ3IFBNLCBIZWlrbyBTY2hvY2hlciB3cm90ZToKPiBvbiB0
aGUgaW14NnVsbCB0aGUgaW5wdXRfdmFsIGZvciB1YXJ0NSByeCBmdW5jdGlvbgo+IG9mIHBpbiBN
WDZVTF9QQURfVUFSVDVfUlhfREFUQV9fVUFSVDVfRENFX1JYCj4gaXMgNyBhbmQgbm90IDUgYXMg
b24gdGhlIGlteDZ1bC4gV2l0aCB0aGlzCj4gcGF0Y2gsIGNvbnNvbGUgb24gYW4gaW14NnVsbCBi
YXNlZCBib2FyZCB3b3Jrcwo+IHdpdGggdWFydDUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGVpa28g
U2Nob2NoZXIgPGhzQGRlbnguZGU+CgpUaGlzIGlzIGFscmVhZHkgZml4ZWQgb24gdjQuMTktcmMx
IGFuZCBhbHNvIG9uIGEgZmV3IG90aGVycyBQQURzIHRoYXQKaGF2ZSBzaW1pbGFyIGlzc3VlLgpN
b3Jlb3ZlciBzaWduYWxzIGNvbW1vbiBmb3IgYm90aCBpLk1YNlVMIGFuZCBpLk1YNlVMTCBzaG91
bGQgaGF2ZQpJTVg2VUxfIGFzIHByZWZpeDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3NoYXduZ3VvL2xpbnV4LmdpdC9jb21taXQvP2g9Zm9yLW5leHQm
aWQ9Mzg3MzAxZDViODhlMmZlOTFkZTliYWY0Y2EyNWY3NzFjYzYzM2Y3MAoKUmVnYXJkcywKCj4g
Cj4gLS0tCj4gCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwtcGluZnVuYy5oIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9pbXg2dWxsLXBpbmZ1bmMuaCBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwt
cGluZnVuYy5oCj4gaW5kZXggZmRjNDZiYjA5Y2MxYS4uZDgzNWFlYWU1NDg1YiAxMDA2NDQKPiAt
LS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLXBpbmZ1bmMuaAo+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZ1bGwtcGluZnVuYy5oCj4gQEAgLTYxLDUgKzYxLDYgQEAKPiAgI2RlZmlu
ZSBNWDZVTExfUEFEX0NTSV9EQVRBMDVfX0VTQUlfVFhfQ0xLICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwMUY4IDB4MDQ4NCAweDAwMDAgMHg5IDB4MAo+ICAjZGVmaW5lIE1YNlVMTF9QQURfQ1NJ
X0RBVEEwNl9fRVNBSV9UWDVfUlgwICAgICAgICAgICAgICAgICAgICAgICAweDAxRkMgMHgwNDg4
IDB4MDAwMCAweDkgMHgwCj4gICNkZWZpbmUgTVg2VUxMX1BBRF9DU0lfREFUQTA3X19FU0FJX1Qw
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDIwMCAweDA0OEMgMHgwMDAwIDB4OSAweDAK
PiArI2RlZmluZSBNWDZVTExfUEFEX1VBUlQ1X1JYX0RBVEFfX1VBUlQ1X0RDRV9SWAkJMHgwMEMw
IDB4MDM0QyAweDA2NDQgMCA3Cj4gIAo+ICAjZW5kaWYgLyogX19EVFNfSU1YNlVMTF9QSU5GVU5D
X0ggKi8KPiAKCgotLSAKU8OpYmFzdGllbiBTenltYW5za2kKU29mdHdhcmUgZW5naW5lZXIsIEFy
bWFkZXVzIFN5c3RlbXMKVGVsOiArMzMgKDApOSA3MiAyOSA0MSA0NApGYXg6ICszMyAoMCk5IDcy
IDI4IDc5IDI2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==

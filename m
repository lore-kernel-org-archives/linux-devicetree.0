From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 5/6] mfd: dt: Add bindings for the Aspeed SoC Display
 Controller (GFX)
Date: Tue, 3 Jan 2017 17:49:54 +0000
Message-ID: <20170103174954.GF27589@dell>
References: <20161206025321.1792-1-andrew@aj.id.au>
 <20161206025321.1792-6-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161206025321.1792-6-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAwNiBEZWMgMjAxNiwgQW5kcmV3IEplZmZlcnkgd3JvdGU6Cgo+IFRoZSBBc3BlZWQg
U29DIERpc3BsYXkgQ29udHJvbGxlciBpcyBwcmVzZW50ZWQgYXMgYSBzeXNjb24gZGV2aWNlIHRv
Cj4gYXJiaXRyYXRlIGFjY2VzcyBieSBkaXNwbGF5IGFuZCBwaW5tdXggZHJpdmVycy4gVmlkZW8g
cGlubXV4Cj4gY29uZmlndXJhdGlvbiBvbiBmaWZ0aCBnZW5lcmF0aW9uIFNvQ3MgZGVwZW5kcyBv
biBiaXRzIGluIGJvdGggdGhlCj4gU3lzdGVtIENvbnRyb2wgVW5pdCBhbmQgdGhlIERpc3BsYXkg
Q29udHJvbGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFq
LmlkLmF1Pgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQXBwbGll
ZCB3aXRoIEFja3MsIHRoYW5rcy4KCj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9zeXNjb24vYXNwZWVkLWdmeC50eHQgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24vYXNwZWVkLWdmeC50eHQK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9z
eXNjb24vYXNwZWVkLWdmeC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL3N5c2Nvbi9hc3BlZWQtZ2Z4LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5hZWE1MzcwZWZkOTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24vYXNwZWVkLWdmeC50eHQKPiBA
QCAtMCwwICsxLDE3IEBACj4gKyogRGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIEFzcGVlZCBTb0Mg
RGlzcGxheSBDb250cm9sbGVyIChHRlgpCj4gKwo+ICtUaGUgQXNwZWVkIFNvQyBEaXNwbGF5IENv
bnRyb2xsZXIgcHJpbWFyaWx5IGRvZXMgYXMgaXRzIG5hbWUgc3VnZ2VzdHMsIGJ1dCBhbHNvCj4g
K3BhcnRpY2lwYXRlcyBpbiBwaW5tdXggcmVxdWVzdHMgb24gdGhlIGc1IFNvQ3MuIEl0IGlzIHRo
ZXJlZm9yZSBjb25zaWRlcmVkIGEKPiArc3lzY29uIGRldmljZS4KPiArCj4gK1JlcXVpcmVkIHBy
b3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZToJCSJhc3BlZWQsYXN0MjUwMC1nZngiLCAic3lzY29u
Igo+ICstIHJlZzoJCQljb250YWlucyBvZmZzZXQvbGVuZ3RoIHZhbHVlIG9mIHRoZSBHRlggbWVt
b3J5Cj4gKwkJCXJlZ2lvbi4KPiArCj4gK0V4YW1wbGU6Cj4gKwo+ICtnZng6IGRpc3BsYXlAMWU2
ZTYwMDAgewo+ICsJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1nZngiLCAic3lzY29uIjsK
PiArCXJlZyA9IDwweDFlNmU2MDAwIDB4MTAwMD47Cj4gK307CgotLSAKTGVlIEpvbmVzCkxpbmFy
byBTVE1pY3JvZWxlY3Ryb25pY3MgTGFuZGluZyBUZWFtIExlYWQKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK

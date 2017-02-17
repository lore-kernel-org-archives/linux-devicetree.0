From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: Re: [PATCH 4/5] sprd_serial: switch comptible string to sc-uart
Date: Fri, 17 Feb 2017 15:35:11 +0800
Message-ID: <20170217073511.GB8767@spreadtrum.com>
References: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1487063952-7113-5-git-send-email-chunyan.zhang@spreadtrum.com>
 <1761969.45NG6Q1Iyc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1761969.45NG6Q1Iyc@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, gregkh@linuxfoundation.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24g5ZubLCAgMuaciCAxNiwgMjAxNyBhdCAwMjozMTozOOS4i+WNiCArMDEwMCwgQXJuZCBCZXJn
bWFubiB3cm90ZToKPiBPbiBUdWVzZGF5LCBGZWJydWFyeSAxNCwgMjAxNyA1OjE5OjExIFBNIENF
VCBDaHVueWFuIFpoYW5nIHdyb3RlOgo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHNlcmlhbF9pZHNbXSA9IHsKPiA+IC0gICAgICAgey5jb21wYXRpYmxlID0gInNwcmQsc2M5
ODM2LXVhcnQiLH0sCj4gPiArICAgICAgIHsuY29tcGF0aWJsZSA9ICJzcHJkLHNjLXVhcnQiLH0s
Cj4gPiAgICAgICAgIHt9Cj4gCj4gV2UgcmVhbGx5IG5lZWQgdGhpcyB0byBiZSBzcGVjaWZpYywg
aW4gY2FzZSBTcHJlYWR0cnVtIGV2ZXIKPiBtYWtlcyBhIHNsaWdodGx5IGRpZmZlcmVudCBVQVJU
IHRoYXQgaXMgbm90IDEwMCUgY29tcGF0aWJsZQo+IHdpdGggdGhpcyBvbmUuIEFsc28sIHlvdSBj
YW4ndCByZW1vdmUgdGhlIHN0cmluZyB5b3UgYWxyZWFkeSBoYXZlLAo+IG9ubHkgYWRkIHRvIGl0
Lgo+Cj4gTm9ybWFsbHkgd2hlbiB5b3UgaGF2ZSBhIG5ldyBjaGlwIHRoYXQgaXMgY29tcGF0aWJs
ZSB3aXRoIG9uZQo+IHdlIGFscmVhZHkgaGF2ZSBhIGRyaXZlciBmb3IsIHdlIG1hcmsgdGhlIGRl
dmljZSBhcyBjb21wYXRpYmxlCj4gd2l0aCB0aGUgb2xkIG9uZSBhbmQgYXZvaWQgaGF2aW5nIHRv
IGNoYW5nZSB0aGUgZHJpdmVyLCBlLmcuCj4gCj4gCWNvbXBhdGlibGUgPSAic3ByZCxzYzk5OTUt
dWFydCIsICJzcHJkLHNjOTgzNi11YXJ0IjsKPiAKPiBUaGlzIHdheSwgdGhlIGRyaXZlciBjb3Vs
ZCBsYXRlciBiZSBjaGFuZ2VkIHRvIGhhbmRsZSBhbnl0aGluZwo+IHRoYXQgaXMgY29tcGF0aWJs
ZSB3aXRoIHNjOTk5NSBkaWZmZXJlbnRseSBmcm9tIHNjOTgzNiwgYnV0Cj4gYnkgZGVmYXVsdCBp
dCB3b3VsZCBtYXRjaCB0aGUgb3JpZ2luYWwgc3RyaW5nLgo+IAoKUmlnaHQsIEkndmUgYWRkcmVz
c2VkIHRoaXMgd2hlbiBJIHJlY2VpdmVkIHRoZSBzYW1lIGNvbW1lbnRzIGZyb20KUm9iIEhlcnJp
bmcgOikKClRoYW5rcyBmb3IgeW91ciBjb21tZW50cywKQ2h1bnlhbgogCj4gCUFybmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

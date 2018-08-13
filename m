From: Tao Huang <huangtao@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add idle-states to device tree for
 rk3399
Date: Mon, 13 Aug 2018 16:59:24 +0800
Message-ID: <fe65548d-3c98-968c-c9e1-c90dfad12502@rock-chips.com>
References: <1467793254-10808-1-git-send-email-wxt@rock-chips.com>
 <5620784.b19SH5PkdR@phil>
 <ae312dc3-f640-ecf3-049a-c8576bb83330@rock-chips.com>
 <3578407.YVa0lydFsh@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3578407.YVa0lydFsh@phil>
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
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dbasehore@chromium.org, Xing Zheng <zhengxing@rock-chips.com>, linux-rockchip@lists.infradead.org, tony.xie@rock-chips.com, Catalin Marinas <catalin.marinas@arm.com>, Brian Norris <briannorris@chromium.org>, Will Deacon <will.deacon@arm.com>, dianders@chromium.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, David Wu <david.wu@rock-chips.com>, cf@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

T24gMjAxOOW5tDA45pyIMTPml6UgMTY6MjUsIEhlaWtvIFN0dWVibmVyIHdyb3RlOgo+IEhpIFRh
bywKPgo+IEFtIFNvbm50YWcsIDEyLiBBdWd1c3QgMjAxOCwgMTg6MjQ6NDUgQ0VTVCBzY2hyaWVi
IFRhbyBIdWFuZzoKPj4gT24gMjAxOOW5tDA45pyIMTDml6UgMDQ6MDksIEhlaWtvIFN0dWVibmVy
IHdyb3RlOgo+Pj4gQW0gTWl0dHdvY2gsIDYuIEp1bGkgMjAxNiwgMTA6MjA6NTQgQ0VTVCBzY2hy
aWViIENhZXNhciBXYW5nOgo+Pj4KPj4+PiAgYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9y
azMzOTkuZHRzaSB8IDE4ICsrKysrKysrKysrKysrKysrKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcm9ja2NoaXAvcmszMzk5LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3Jr
MzM5OS5kdHNpCj4+Pj4gaW5kZXggYTZkZDYyMy4uMTJjZTI2NSAxMDA2NDQKPj4+PiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5OS5kdHNpCj4+Pj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTkuZHRzaQo+Pj4+IEBAIC0xMDEsNiArMTAxLDE4
IEBACj4+Pj4gIAkJCX07Cj4+Pj4gIAkJfTsKPj4+PiAgCj4+Pj4gKwkJaWRsZS1zdGF0ZXMgewo+
Pj4+ICsJCQllbnRyeS1tZXRob2QgPSAicHNjaSI7Cj4+Pj4gKwkJCWNwdV9zbGVlcDogY3B1LXNs
ZWVwLTAgewo+Pj4+ICsJCQkJY29tcGF0aWJsZSA9ICJhcm0saWRsZS1zdGF0ZSI7Cj4+Pj4gKwkJ
CQlsb2NhbC10aW1lci1zdG9wOwo+Pj4+ICsJCQkJYXJtLHBzY2ktc3VzcGVuZC1wYXJhbSA9IDww
eDAwMTAwMDA+Owo+Pj4+ICsJCQkJZW50cnktbGF0ZW5jeS11cyA9IDwzNTA+Owo+Pj4+ICsJCQkJ
ZXhpdC1sYXRlbmN5LXVzID0gPDYwMD47Cj4+Pj4gKwkJCQltaW4tcmVzaWRlbmN5LXVzID0gPDEx
NTA+Owo+Pj4gTG9va2luZyBhdCB0aGUgY2hyb21lb3Mga2VybmVsLCB0aGVyZSBhcmUgc29tZSBt
b3JlIHBhdGNoZXMgYWRhcHRpbmcKPj4+IHRoaXMgaWRsZS1zdGF0ZSB0byB1c2UgZGlmZmVyZW50
IHRpbWluZ3MuCj4+IFllcywgd2UgaGF2ZSBhbm90aGVyIHZhbHVlcy4gU28gdGhlIHZhbHVlcyBv
ZiB0aGlzIHBhdGNoIGFyZSB3cm9uZy4KPj4+IFRoZXJlIGFsc28gd2FzIGEgY2x1c3Rlci1pZGxl
IHN0YXRlIGFkZGVkIGZvciBhIHdoaWxlIGJ1dCB0aGF0IHNlZW1zIHRvCj4+PiBjYXVzZSBhdWRp
byBpc3N1ZXMgYWNjb3JkaW5nIHRvIHRoZSBDck9TIGhpc3RvcnkuCj4+IERNQSBvciBBdWRpbyBk
cml2ZXIgc2hvdWxkIGFkZCBQTV9RT1NfQ1BVX0RNQV9MQVRFTkNZIG9yIG90aGVyIG1ldGhvZHMg
dG8gYXZvaWQgdGhlIGVmZmVjdHMgb2YgaWRsZS4KPj4gSWRsZSBpdHNlbGYgaXMgZ29vZC4KPiBU
aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBEbyB5b3Uga25vdyBpZiBzb21lIGZyb20gUm9j
a2NoaXAgcGxhbnMKPiBvbiBzdWJtaXR0aW5nIGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoIHdp
dGggY2hhbmdlZCB0aW1pbmdzIGFuZAo+IGNsdXN0ZXItc2xlZXA/CgpPa2F5LiBJIHdpbGwgYXJy
YW5nZSBlbmdpbmVlciB0byBzdWJtaXQgdGhlIHBhdGNoLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

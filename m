From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 08/10] gpio: Add gpio driver for Actions OWL S900 SoC
Date: Wed, 21 Feb 2018 23:38:33 +0100
Message-ID: <aa4ce18d-fd83-c7f1-22fc-59538881ea51@suse.de>
References: <20180221160044.15089-1-manivannan.sadhasivam@linaro.org>
 <20180221160044.15089-9-manivannan.sadhasivam@linaro.org>
 <CAHp75VfLkmZp7HwX-du4EYdtJ8h=y59OrSbu53Ltf-_kFfpczg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAHp75VfLkmZp7HwX-du4EYdtJ8h=y59OrSbu53Ltf-_kFfpczg@mail.gmail.com>
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
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, hzhang@ucrobotics.com, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amit.kucheria@linaro.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, 96boards@ucrobotics.com, bdong@ucrobotics.com, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

QW0gMjEuMDIuMjAxOCB1bSAyMDoxMyBzY2hyaWViIEFuZHkgU2hldmNoZW5rbzoKPiBPbiBXZWQs
IEZlYiAyMSwgMjAxOCBhdCA2OjAwIFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0KPiA8bWFuaXZh
bm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+IHdyb3RlOgo+PiBBZGQgZ3BpbyBkcml2ZXIgZm9y
IEFjdGlvbnMgU2VtaSBPV0wgZmFtaWx5IFM5MDAgU29DLiBTZXQgb2YgcmVnaXN0ZXJzCj4+IGNv
bnRyb2xsaW5nIHRoZSBncGlvIHNoYXJlcyB0aGUgc2FtZSByZWdpc3RlciByYW5nZSB3aXRoIHBp
bmN0cmwgYmxvY2suCj4+Cj4+IEdQSU8gcmVnaXN0ZXJzIGFyZSBvcmdhbml6ZWQgYXMgNiBiYW5r
cyBhbmQgZWFjaCBiYW5rIGNvbnRyb2xzIHRoZQo+PiBtYXhpbXVtIG9mIDMyIGdwaW9zLgo+IAo+
PiArc3RhdGljIHZvaWQgb3dsX2dwaW9fc2V0X3JlZyh2b2lkIF9faW9tZW0gKmJhc2UsIHVuc2ln
bmVkIGludCBwaW4sIGludCBmbGFnKQo+PiArewo+PiArICAgICAgIHUzMiB2YWw7Cj4+ICsKPj4g
KyAgICAgICBpZiAoZmxhZykgewo+PiArICAgICAgICAgICAgICAgdmFsID0gcmVhZGwoYmFzZSk7
Cj4+ICsgICAgICAgICAgICAgICB2YWwgfD0gQklUKHBpbik7Cj4+ICsgICAgICAgICAgICAgICB3
cml0ZWwodmFsLCBiYXNlKTsKPj4gKyAgICAgICB9IGVsc2Ugewo+PiArICAgICAgICAgICAgICAg
dmFsID0gcmVhZGwoYmFzZSk7Cj4+ICsgICAgICAgICAgICAgICB2YWwgJj0gfkJJVChwaW4pOwo+
PiArICAgICAgICAgICAgICAgd3JpdGVsKHZhbCwgYmFzZSk7Cj4+ICsgICAgICAgfQo+PiArfQo+
IAo+IFdoeSBub3QgdG8gdXNlIHRoZSBzYW1lIHBhdHRlcm4gYXMgYmVsb3c/Cj4gCj4gcmVhZGwo
KQo+IGlmICgpCj4gIC4uLgo+IGVsc2UKPiAuLi4KPiB3cml0ZWwoKQo+IAo+ID8KCkFuZCBzaG91
bGRuJ3QgdGhhdCBiZSByZWFkbF9yZWxheGVkKCkgYW5kIHdyaXRlbF9yZWxheGVkKCk/CgpSZWdh
cmRzLApBbmRyZWFzCgotLSAKU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkKR0Y6IEZlbGl4IEltZW5kw7ZyZmZlciwgSmFuZSBTbWl0aGFyZCwg
R3JhaGFtIE5vcnRvbgpIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

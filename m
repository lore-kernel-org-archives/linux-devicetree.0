From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5] drm/mediatek: fixed the calc method of data rate per
 lane
Date: Fri, 18 Nov 2016 13:17:35 +0800
Message-ID: <1479446255.24375.3.camel@mtksdaap41>
References: <1479266454-31892-1-git-send-email-jitao.shi@mediatek.com>
 <1479361006.13083.7.camel@mtksdaap41>
 <CAGS+omBpdRH5ZnvcApX_pevwSBHwUon77DhhjX0p9aQXuOy4DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGS+omBpdRH5ZnvcApX_pevwSBHwUon77DhhjX0p9aQXuOy4DA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, dri-devel <dri-devel@lists.freedesktop.org>, Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <yingjoe.chen@mediatek.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.o>
List-Id: devicetree@vger.kernel.org

SGksIERhbmllbDoKCk9uIEZyaSwgMjAxNi0xMS0xOCBhdCAxMToyMiArMDgwMCwgRGFuaWVsIEt1
cnR6IHdyb3RlOgo+IEhpIENLLAo+IAo+IE9uIFRodSwgTm92IDE3LCAyMDE2IGF0IDE6MzYgUE0s
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4gSGksIEppdGFvOgo+ID4KPiA+
Cj4gPiBPbiBXZWQsIDIwMTYtMTEtMTYgYXQgMTE6MjAgKzA4MDAsIEppdGFvIFNoaSB3cm90ZToK
PiA+PiBUdW5lIGRzaSBmcmFtZSByYXRlIGJ5IHBpeGVsIGNsb2NrLCBkc2kgYWRkIHNvbWUgZXh0
cmEgc2lnbmFsIChpLmUuCj4gPj4gVGxweCwgVGhzLXByZXBhcmUsIFRocy16ZXJvLCBUaHMtdHJh
aWwsVGhzLWV4aXQpIHdoZW4gZW50ZXIgYW5kIGV4aXQgTFAKPiA+PiBtb2RlLCB0aG9zZSBzaWdu
YWxzIHdpbGwgY2F1c2UgaC10aW1lIGxhcmdlciB0aGFuIG5vcm1hbCBhbmQgcmVkdWNlIEZQUy4K
PiA+PiBTbyBuZWVkIHRvIG11bHRpcGx5IGEgY29lZmZpY2llbnQgdG8gb2Zmc2V0IHRoZSBleHRy
YSBzaWduYWwncyBlZmZlY3QuCj4gPj4gICBjb2VmZmljaWVudCA9ICgoaHRvdGFsKmJwcC9sYW5l
X251bWJlcikrVGxweCtUaHNfcHJlcCtUaHNfemVybysKPiA+PiAgICAgICAgICAgICAgICBUaHNf
dHJhaWwrVGhzX2V4aXQpLyhodG90YWwqYnBwL2xhbmVfbnVtYmVyKQo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4KPiA+IEl0IGxv
b2tzIGdvb2QgdG8gbWUuCj4gPiBCdXQgdGhpcyBwYXRjaCBjb25mbGljdCB3aXRoIFsxXSB3aGlj
aCBpcyBvbmUgcGF0Y2ggb2YgTVQyNzAxIHNlcmllcy4gSQo+ID4gd2FudCB0byBhcHBseSBNVDI3
MDEgcGF0Y2hlcyBmaXJzdCwgc28gcGxlYXNlIGhlbHAgdG8gcmVmaW5lIHRoaXMgcGF0Y2gKPiA+
IGJhc2VkIG9uIE1UMjcwMSBwYXRjaGVzLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlIE1UMjcwMSBE
U0kgcGF0Y2hlcyBhcmUgcXVpdGUgcmVhZHkgeWV0IChJIGp1c3QKPiByZXZpZXdlZCB0aGUgb25l
IGJlbG93KS4KPiBDYW4gd2UgaW5zdGVhZCBsYW5kIEppdGFvJ3Mgc21hbGwgdGFyZ2V0ZWQgY2hh
bmdlIGZpcnN0LCBhbmQgdGhlbgo+IHJlYmFzZSB0aGUgTVQyNzAxIHNlcmllcyBvbiB0b3AuCj4g
Cj4gVGhhbmtzLAo+IC1EYW4KCgpNVDI3MDEgc2VyaWVzIGxvb2tzIHN0aWxsIGhhdmUgc29tZSBk
ZWZlY3QgdG8gYmUgZml4ZWQuClRoZXJlZm9yZSwgSSB3b3VsZCBhcHBseSB0aGlzIHBhdGNoIGZp
cnN0LgpUaGFua3MgZm9yIHlvdXIgaGVscC4KClJlZ2FyZHMsCkNLCgo+ID4KPiA+IFsxXSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk0MjI4MjEvCj4gPgo+ID4gUmVnYXJkcywK
PiA+IENLCj4gPgo+ID4+IC0tLQo+ID4+IENoYW5nZSBzaW5jZSB2NDoKPiA+PiAgLSB0dW5lIHRo
ZSBjYWxjIGNvbW1lbnQgbW9yZSBjbGVhci4KPiA+PiAgLSBkZWZpbmUgdGhlIHBoeSB0aW1pbmdz
IGFzIGNvbnN0YW50cy4KPiA+Pgo+ID4+IENobmFnZSBzaW5jZSB2MzoKPiA+PiAgLSB3cmFwcCB0
aGUgY29tbWl0IG1zZy4KPiA+PiAgLSBmaXggYWxpZ25tZW50IG9mIHNvbWUgbGluZXMuCj4gPj4K
PiA+PiBDaGFuZ2Ugc2luY2UgdjI6Cj4gPj4gIC0gbW92ZSBwaHkgdGltaW5nIGJhY2sgdG8gZHNp
X3BoeV90aW1jb25maWcuCj4gPj4KPiA+PiBDaGFuZ2Ugc2luY2UgdjE6Cj4gPj4gIC0gcGh5X3Rp
bWluZzIgYW5kIHBoeV90aW1pbmczIHJlZmVyIGNsb2NrIGN5Y2xlIHRpbWUuCj4gPj4gIC0gZGVm
aW5lIHZhbHVlcyBvZiBMUFggSFNfUFJQUiBIU19aRVJPIEhTX1RSQUlMIFRBX0dPIFRBX1NVUkUg
VEFfR0VUIERBX0hTX0VYSVQuCj4gPj4gLS0tCj4gPj4KPiA+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

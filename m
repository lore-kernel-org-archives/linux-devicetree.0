From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v5] drm/mediatek: fixed the calc method of data rate per
 lane
Date: Fri, 18 Nov 2016 11:22:37 +0800
Message-ID: <CAGS+omBpdRH5ZnvcApX_pevwSBHwUon77DhhjX0p9aQXuOy4DA@mail.gmail.com>
References: <1479266454-31892-1-git-send-email-jitao.shi@mediatek.com>
 <1479361006.13083.7.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479361006.13083.7.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, dri-devel <dri-devel@lists.freedesktop.org>, =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <yingjoe.chen@mediatek.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa cheng <cawa.cheng@mediatek.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sha>
List-Id: devicetree@vger.kernel.org

SGkgQ0ssCgpPbiBUaHUsIE5vdiAxNywgMjAxNiBhdCAxOjM2IFBNLCBDSyBIdSA8Y2suaHVAbWVk
aWF0ZWsuY29tPiB3cm90ZToKPiBIaSwgSml0YW86Cj4KPgo+IE9uIFdlZCwgMjAxNi0xMS0xNiBh
dCAxMToyMCArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+PiBUdW5lIGRzaSBmcmFtZSByYXRlIGJ5
IHBpeGVsIGNsb2NrLCBkc2kgYWRkIHNvbWUgZXh0cmEgc2lnbmFsIChpLmUuCj4+IFRscHgsIFRo
cy1wcmVwYXJlLCBUaHMtemVybywgVGhzLXRyYWlsLFRocy1leGl0KSB3aGVuIGVudGVyIGFuZCBl
eGl0IExQCj4+IG1vZGUsIHRob3NlIHNpZ25hbHMgd2lsbCBjYXVzZSBoLXRpbWUgbGFyZ2VyIHRo
YW4gbm9ybWFsIGFuZCByZWR1Y2UgRlBTLgo+PiBTbyBuZWVkIHRvIG11bHRpcGx5IGEgY29lZmZp
Y2llbnQgdG8gb2Zmc2V0IHRoZSBleHRyYSBzaWduYWwncyBlZmZlY3QuCj4+ICAgY29lZmZpY2ll
bnQgPSAoKGh0b3RhbCpicHAvbGFuZV9udW1iZXIpK1RscHgrVGhzX3ByZXArVGhzX3plcm8rCj4+
ICAgICAgICAgICAgICAgIFRoc190cmFpbCtUaHNfZXhpdCkvKGh0b3RhbCpicHAvbGFuZV9udW1i
ZXIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNv
bT4KPgo+IEl0IGxvb2tzIGdvb2QgdG8gbWUuCj4gQnV0IHRoaXMgcGF0Y2ggY29uZmxpY3Qgd2l0
aCBbMV0gd2hpY2ggaXMgb25lIHBhdGNoIG9mIE1UMjcwMSBzZXJpZXMuIEkKPiB3YW50IHRvIGFw
cGx5IE1UMjcwMSBwYXRjaGVzIGZpcnN0LCBzbyBwbGVhc2UgaGVscCB0byByZWZpbmUgdGhpcyBw
YXRjaAo+IGJhc2VkIG9uIE1UMjcwMSBwYXRjaGVzLgoKSSBkb24ndCB0aGluayB0aGUgTVQyNzAx
IERTSSBwYXRjaGVzIGFyZSBxdWl0ZSByZWFkeSB5ZXQgKEkganVzdApyZXZpZXdlZCB0aGUgb25l
IGJlbG93KS4KQ2FuIHdlIGluc3RlYWQgbGFuZCBKaXRhbydzIHNtYWxsIHRhcmdldGVkIGNoYW5n
ZSBmaXJzdCwgYW5kIHRoZW4KcmViYXNlIHRoZSBNVDI3MDEgc2VyaWVzIG9uIHRvcC4KClRoYW5r
cywKLURhbgoKPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk0MjI4
MjEvCj4KPiBSZWdhcmRzLAo+IENLCj4KPj4gLS0tCj4+IENoYW5nZSBzaW5jZSB2NDoKPj4gIC0g
dHVuZSB0aGUgY2FsYyBjb21tZW50IG1vcmUgY2xlYXIuCj4+ICAtIGRlZmluZSB0aGUgcGh5IHRp
bWluZ3MgYXMgY29uc3RhbnRzLgo+Pgo+PiBDaG5hZ2Ugc2luY2UgdjM6Cj4+ICAtIHdyYXBwIHRo
ZSBjb21taXQgbXNnLgo+PiAgLSBmaXggYWxpZ25tZW50IG9mIHNvbWUgbGluZXMuCj4+Cj4+IENo
YW5nZSBzaW5jZSB2MjoKPj4gIC0gbW92ZSBwaHkgdGltaW5nIGJhY2sgdG8gZHNpX3BoeV90aW1j
b25maWcuCj4+Cj4+IENoYW5nZSBzaW5jZSB2MToKPj4gIC0gcGh5X3RpbWluZzIgYW5kIHBoeV90
aW1pbmczIHJlZmVyIGNsb2NrIGN5Y2xlIHRpbWUuCj4+ICAtIGRlZmluZSB2YWx1ZXMgb2YgTFBY
IEhTX1BSUFIgSFNfWkVSTyBIU19UUkFJTCBUQV9HTyBUQV9TVVJFIFRBX0dFVCBEQV9IU19FWElU
Lgo+PiAtLS0KPj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

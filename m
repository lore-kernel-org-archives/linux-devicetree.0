From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Wed, 1 Mar 2017 09:22:24 +0100
Message-ID: <20170301092224.169dc7ae@bbrezillon>
References: <CAHp75VcKjYYAw8gw8yYXrd-vzZo50WOQ06AzPx+0g9Zakzjm-w@mail.gmail.com>
 <20170221162133.jch6yzpotj4s7zob@piout.net>
 <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
 <CAHp75Vc54+GR99qM8vUDfQnehFx0g5q137k-w5XY3023UZyr5w@mail.gmail.com>
 <20170221171438.e5hvruoixafpcdps@piout.net>
 <CACiLriSdRM4ZfoDsxFhf6ZVwAtacJOJ28M8CvOg6kC_XN0T-Mw@mail.gmail.com>
 <20170224081430.GB19663@samfundet.no>
 <20170224092742.3ce205e2@bbrezillon>
 <20170224085209.GA27812@samfundet.no>
 <20170224095509.777da771@bbrezillon>
 <20170224090435.GA11313@samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170224090435.GA11313@samfundet.no>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Josh Wu <rainyfeeling@outlook.com>, "open
 list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?SMOldmFyZA==?= Skinnemoen <hskinne>
List-Id: devicetree@vger.kernel.org

SGkgSGFucy1DaHJpc3RpYW4sCgpPbiBGcmksIDI0IEZlYiAyMDE3IDEwOjA0OjM1ICswMTAwCkhh
bnMtQ2hyaXN0aWFuIE5vcmVuIEVndHZlZHQgPGVndHZlZHRAc2FtZnVuZGV0Lm5vPiB3cm90ZToK
Cj4gQXJvdW5kIEZyaSAyNCBGZWIgMjAxNyAwOTo1NTowOSArMDEwMCBvciB0aGVyZWFib3V0LCBC
b3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBPbiBGcmksIDI0IEZlYiAyMDE3IDA5OjUyOjA5ICsw
MTAwCj4gPiBIYW5zLUNocmlzdGlhbiBOb3JlbiBFZ3R2ZWR0IDxlZ3R2ZWR0QHNhbWZ1bmRldC5u
bz4gd3JvdGU6ICAKPiA+PiBBcm91bmQgRnJpIDI0IEZlYiAyMDE3IDA5OjI3OjQyICswMTAwIG9y
IHRoZXJlYWJvdXQsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4+ID4gT24gRnJpLCAyNCBG
ZWIgMjAxNyAwOToxNDozMCArMDEwMCBIYW5zLUNocmlzdGlhbiBOb3JlbiBFZ3R2ZWR0IDxlZ3R2
ZWR0QHNhbWZ1bmRldC5ubz4gd3JvdGU6ICAgIAo+ID4+ID4+IEFyb3VuZCBUaHUgMjMgRmViIDIw
MTcgMjE6MTg6MTMgLTA4MDAgb3IgdGhlcmVhYm91dCwgSMOldmFyZCBTa2lubmVtb2VuIHdyb3Rl
OiAgICAKPiA+PiA+PiA+IE9uIFR1ZSwgRmViIDIxLCAyMDE3IGF0IDk6MTQgQU0sIEFsZXhhbmRy
ZSBCZWxsb25pCj4gPj4gPj4gPiA8YWxleGFuZHJlLmJlbGxvbmlAZnJlZS1lbGVjdHJvbnMuY29t
PiB3cm90ZTogICAgICAKPiA+PiA+PiA+PiBPbiAyMS8wMi8yMDE3IGF0IDE4OjQzOjM1ICswMjAw
LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6ICAgICAgCj4gPj4gCj4gPj4gPHNuaXBwPgo+ID4+ICAg
Cj4gPj4gPj4gPj4gSWYgbm9ib2R5IGNvbXBsYWlucyBhYm91dCB0aGUgNC4xMCBicmVha2FnZSwg
WW91J2xsIGhhdmUgcGxlbnR5IG9mIHRpbWUKPiA+PiA+PiA+PiB0byByZW1vdmUgaXQgZm9yIDQu
MTIgICAgICAKPiA+PiA+PiA+IAo+ID4+ID4+ID4gSSdtIGZpbmUgd2l0aCB0aGF0LCBidXQgSSBo
YXZlbid0IHB1dCBtdWNoIGVmZm9ydCBpbnRvIGtlZXBpbmcgaXQKPiA+PiA+PiA+IGFsaXZlIGxh
dGVseS4gSWYgSGFucy1DaHJpc3RpYW4gYWdyZWVzLCBJJ20gd2lsbGluZyB0byBwb3N0IGEgcGF0
Y2ggdG8KPiA+PiA+PiA+IHJlbW92ZSBpdCwgb3IgYWNrIHNvbWVvbmUgZWxzZSdzIHBhdGNoLiAg
ICAgIAo+ID4+ID4+IAo+ID4+ID4+IFRoZW4gbGV0cyBwbGFuIHRoaXMgZm9yIDQuMTIsIGVpdGhl
ciB5b3UgSMOldmFyZCB3aGlwIHVwIGEgcGF0Y2ggb3IgSSBjYW4KPiA+PiA+PiBldmVudHVhbGx5
IGRvIGl0Lgo+ID4+ID4+IAo+ID4+ID4+IEkgY2FuIHB1c2ggaXQgdGhyb3VnaCB0aGUgbGludXgt
YXZyMzIgZ2l0IHRyZWUgb24ga2VybmVsLm9yZy4KPiA+PiA+PiAgICAgCj4gPj4gPiAKPiA+PiA+
IENhbiB5b3UgZG8gdGhhdCBqdXN0IGFmdGVyIDQuMTEtcmMxIGlzIHJlbGVhc2VkIGFuZCBwcm92
aWRlIGEgdG9waWMKPiA+PiA+IGJyYW5jaCBJIGNhbiBwdWxsIGluIG15IG5hbmQvbmV4dCBicmFu
Y2gsIHNvIHRoYXQgSSBjYW4gcmV3b3JrIHRoaXMKPiA+PiA+IHBhdGNoIGFuZCBkcm9wIGFsbCB0
aGUgcGRhdGEtY29tcGF0IGNvZGUgKGFzIHN1Z2dlc3RlZCBieSBBbmR5KS4gICAgCj4gPj4gCj4g
Pj4gT0ssIEkgd2lsbCB0cnkgdG8gcHJlcGFyZSBpdCBkdXJpbmcgdGhlIHdlZWtlbmQuCj4gPj4g
Cj4gPj4gQW55IHJlYXNvbiB0byB3YWl0IGZvciA0LjExLXJjMT8gQUZBSUsgTGludXMgcHJlZmVy
cyB0aGUgbGFyZ2VyIGNoYW5nZXMKPiA+PiBiZWZvcmUgaGUgc3RhcnRzIHRhZ2dpbmcgcmMncy4K
PiA+PiAgIAo+ID4gCj4gPiBPaCwgc28geW91IHdhbnQgdG8gcXVldWUgaXQgZm9yIDQuMTEsIHRo
YXQncyBldmVuIGJldHRlci4gIAo+IAo+IFBlcmhhcHMgSSBtaXN1bmRlcnN0b29kIHlvdSwgYnkg
YWZ0ZXIgNC4xMS1yYzEgeW91IG1lYW4gcXVldWUgaXQgZm9yIDQuMTI/Cj4gCj4gSSB3aWxsIHNl
ZSB3aGF0IEkgZ2V0IGFyb3VuZCB0byBkbyBpbiB0aGUgd2Vla2VuZCwgaXQgc2hvdWxkIGJlIHBy
ZXR0eQo+IHN0cmFpZ2h0Zm9yd2FyZCwganVzdCB3YW50IHRvIG1ha2Ugc3VyZSB3ZSByZW1vdmUg
YWxsIHRoZSBiaXRzLgo+IAoKQW55IHByb2dyZXNzIG9uIHRoaXM/IEkgcGxhbiB0byBzZW5kIGEg
bmV3IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgc29vbgphbmQgSSdkIGxpa2UgdG8ga25vdyBpZiBJ
IHNob3VsZCBkcm9wIHBkYXRhL2F2cjMyIHN1cHBvcnQgb3Igbm90LiBOb3RlCnRoYXQgSSdtIHRh
cmdldGluZyA0LjEyLCBzbywgYXMgbG9uZyBhcyB5b3UgZHJvcCBhdnIzMiBzdXBwb3J0IGluIDQu
MTIKd2Ugc2hvdWxkIGJlIGdvb2QuCgpUaGFua3MsCgpCb3JpcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

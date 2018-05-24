From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/5] gpio: syscon: Add gpio-syscon for rockchip
Date: Thu, 24 May 2018 10:47:59 +0200
Message-ID: <CACRpkdYrHyGmMOi-qNTRxC=TR1wMnM30PxdHfNAApmZ0ucnjJg@mail.gmail.com>
References: <1526614328-6869-1-git-send-email-djw@t-chip.com.cn>
 <1685755.J6GI985WX3@diego>
 <CACRpkdYCdNZ=ASw1uz4zKXC4AMd1EGbvG_G5K5cwSpH5eGPgKA@mail.gmail.com>
 <2044895.BqI5yRtle6@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2044895.BqI5yRtle6@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Wayne Chou <zxf@t-chip.com.cn>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Levin Du <djw@t-chip.com.cn>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMTA6MzUgQU0sIEhlaWtvIFN0w7xibmVyIDxoZWlrb0Bz
bnRlY2guZGU+IHdyb3RlOgo+IEFtIERvbm5lcnN0YWcsIDI0LiBNYWkgMjAxOCwgMTA6Mjg6NDQg
Q0VTVCBzY2hyaWViIExpbnVzIFdhbGxlaWo6Cj4+IE9uIFdlZCwgTWF5IDIzLCAyMDE4IGF0IDU6
MTIgUE0sIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+PiA+IFNvIHRo
ZSBncGlvIGNvbnRyb2xsZXIgc2hvdWxkIGRlZmluaXRseSBhbHNvIGJlIGEgc3Vibm9kZS4KPj4g
Pgo+PiA+IFRoZSBncGlvIGluIHF1ZXN0aW9uIGlzIGNhbGxlZCAibXV0ZSIsIHNvIEknZCB0aGlu
ayB0aGUgZ3Bpby1zeXNjb24gZHJpdmVyCj4+ID4gc2hvdWxkIGp1c3QgZGVmaW5lIGEgInJvY2tj
aGlwLHJrMzMyOC1ncGlvLW11dGUiIGNvbXBhdGlibGUgYW5kIGNvbnRhaW4KPj4gPiBhbGwgdGhl
IHJlZ2lzdGVyIHZvb2RvbyBpbiB0aGUgZHJpdmVyIGl0c2VsZiBhbmQgbm90IGRlZmluZSBpdCBp
biB0aGUgZHQuCj4+ID4KPj4gPiBTbyBpdCBzaG91bGQgcHJvYmFibHkgbG9vayBsaWtlCj4+ID4K
Pj4gPiBncmY6IHN5c2NvbiBhdCBmZjEwMDAwMCB7Cj4+ID4KPj4gPiAgICAgICAgIGNvbXBhdGli
bGUgPSAicm9ja2NoaXAscmszMzI4LWdyZiIsICJzeXNjb24iLCAic2ltcGxlLW1mZCI7Cj4+ID4K
Pj4gPiAgICAgICAgIFthbGwgdGhlIG90aGVyIHN5c2NvbiBzdWItZGV2aWNlc10KPj4gPgo+PiA+
ICAgICAgICAgZ3Bpb19tdXRlOiBncGlvLW11dGUgewo+PiA+Cj4+ID4gICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzI4LWdwaW8tbXV0ZSI7Cj4+ID4gICAgICAgICAg
ICAgICAgIGdwaW8tY29udHJvbGxlcjsKPj4gPiAgICAgICAgICAgICAgICAgI2dwaW8tY2VsbHMg
PSA8Mj47Cj4+ID4KPj4gPiAgICAgICAgIH07Cj4+Cj4+IEknbSBzY2VwdGljLgo+Pgo+PiBUaGF0
IGRvZXNuJ3Qgc291bmQgbGlrZSAiZ2VuZXJhbCBwdXJwb3NlIGlucHV0IG91dHB1dCIgYXQgYWxs
Lgo+Pgo+PiBJdCBzb3VuZHMgbGlrZSBzcGVjaWFsIHB1cnBvc2UsIGZvciBhIG11dGUgYnV0dG9u
Lgo+Pgo+PiBEb2VzIGl0IHVzZSBJUlE/IEkgd291bGQgcmVjb21tZW5kIGltcGxlbWVudGluZwo+
PiBkcml2ZXJzL2lucHV0L2tleWJvYXJkL3N5c2Nvbi1rZXlzLmMgaW4gdGhlIHNhbWUgdmVpbgo+
PiBhcyBkcml2ZXJzL2xlZHMvbGVkcy1zeXNjb24uYyBzbyB5b3UgY2FuIGF2b2lkIGluZGlyZWN0
aW9uCj4+IHRocm91Z2ggR1BJTyBmb3Igbm8gZ29vZCByZWFzb24gYXQgYWxsLgo+Cj4gVG8gcXVv
dGUgTGV2aW4gZnJvbSB0aGUgb3RoZXIgbWFpbDoKPiAtLS0tLS0tLQo+IFRoZSAibXV0ZSIgcGlu
IGlzIGEgb3V0cHV0IG9ubHkgR1BJTywgd2hpY2ggaXMgYWxyZWFkeSBzdXBwb3J0ZWQgYnkKPiBz
ZXR0aW5nIGZsYWdzIGluIHRoZSBncGlvLXN5c2Nvbgo+ICAgZHJpdmVyLiBBbmQgeWVzLCB0aGlz
IHBpbiBoYXMgYSBkZWZpbmVkIGZ1bmN0aW9uLCBidXQgY2FuIGFsc28gYmUgdXNlZAo+IGZvciBn
ZW5lcmFsIHB1cnBvc2Ugb3BlcmF0aW9uLgo+IC0tLS0tLS0tCj4KPiBTbyB0byBzdW1tYXJpemUs
IHRoZSBkb2N1bWVudGF0aW9uIGNhbGxzIGl0ICJtdXRlIiwgYnV0IGl0IGlzIHVzYWJsZSBhcwo+
IGEgZ2VuZXJhbCBwaW4sIHdoaWNoIGlzIHRoZSByZWFzb24gTGV2aW4gaXMgd29ya2luZyBvbiBp
dCAtIGJlY2F1c2Ugb24gaGlzCj4gYm9hcmQgdGhpcyBwaW4gaXMgdXNlZCB0byBzd2l0Y2ggYmV0
d2VlbiB0d28gdm9sdGFnZXMgKGFrYSBhIGdwaW8tcmVndWxhdG9yKQo+IGZvciB0aGUgc2RtbWMg
Y29udHJvbGxlciBbMy4zViArIDEuOFZdLgoKT0sgdGhlbiwgSSB3YXMgd3JvbmchIDopCgpHbyBh
aGVhZCB3aXRoIHRoaXMsIHNvcnJ5IGZvciB0aGUgZnV6ei4KCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==

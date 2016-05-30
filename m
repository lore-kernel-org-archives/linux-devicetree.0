From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [RFC v2 3/5] drm/mediatek: add *driver_data for different
 hardware settings
Date: Mon, 30 May 2016 18:26:44 +0800
Message-ID: <1464604004.21437.19.camel@mtksdaap41>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
 <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
 <1463996582.30093.5.camel@mtksdaap41>
 <1464334313.31149.16.camel@mtksdaap41>
 <CACvgo52xB0KwumC75u2dxfz_yv2PNE0Gem+0t8dqV9qn+pPRLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACvgo52xB0KwumC75u2dxfz_yv2PNE0Gem+0t8dqV9qn+pPRLg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgRW1pbCwKClRoYW5rcyBmb3IgeW91ciByZXZpZXcuCgpPbiBGcmksIDIwMTYtMDUtMjcgYXQg
MTA6MjQgKzAxMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBPbiAyNyBNYXkgMjAxNiBhdCAwODoz
MSwgWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4gSGkgQ0ssCj4gPgo+
ID4KPiA+IE9uIE1vbiwgMjAxNi0wNS0yMyBhdCAxNzo0MyArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4g
Pj4gSGksIFlUOgo+ID4+Cj4gPj4gT25lIGNvbW1lbnQgYmVsb3cuCj4gPj4KPiA+PiBPbiBGcmks
IDIwMTYtMDUtMjAgYXQgMjM6MDUgKzA4MDAsIHl0LnNoZW5AbWVkaWF0ZWsuY29tIHdyb3RlOgo+
ID4+ID4gRnJvbTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Cj4gPj4gPgo+ID4+ID4g
VGhlcmUgYXJlIHNvbWUgaGFyZHdhcmUgc2V0dGluZ3MgY2hhbmdlZCwgYmV0d2VlbiBNVDgxNzMg
JiBNVDI3MDE6Cj4gPj4gPiBESVNQX09WTCBhZGRyZXNzIG9mZnNldCBjaGFuZ2VkLCBjb2xvciBm
b3JtYXQgZGVmaW5pdGlvbiBjaGFuZ2VkLgo+ID4+ID4gRElTUF9SRE1BIGZpZm8gc2l6ZSBjaGFu
Z2VkLgo+ID4+ID4gRElTUF9DT0xPUiBvZmZzZXQgY2hhbmdlZC4KPiA+PiA+Cj4gPj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4KPiA+PiA+IC0tLQo+ID4+
ID4gKwo+ID4+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0
YSAqbXRrX292bF9nZXRfZHJpdmVyX2RhdGEoCj4gPj4gPiArICAgc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiA+PiA+ICt7Cj4gPj4gPiArICAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCAqb2ZfaWQgPQo+ID4+ID4gKyAgICAgICAgICAgb2ZfbWF0Y2hfZGV2aWNlKG10a19kaXNwX292
bF9kcml2ZXJfZHRfbWF0Y2gsICZwZGV2LT5kZXYpOwo+ID4+ID4gKwo+ID4+ID4gKyAgIHJldHVy
biAoc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0YSAqKW9mX2lkLT5kYXRhOwo+ID4+ID4g
K30KPiA+PiA+ICsKPiA+PiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtfZGRwX2NvbXBfZHJp
dmVyX2RhdGEgKm10a19yZG1hX2dldF9kcml2ZXJfZGF0YSgKPiA+PiA+ICsgICBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4+ID4gK3sKPiA+PiA+ICsgICBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkICpvZl9pZCA9Cj4gPj4gPiArICAgICAgICAgICBvZl9tYXRjaF9kZXZpY2UobXRr
X2Rpc3BfcmRtYV9kcml2ZXJfZHRfbWF0Y2gsICZwZGV2LT5kZXYpOwo+ID4+ID4gKwo+ID4+ID4g
KyAgIHJldHVybiAoc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0YSAqKW9mX2lkLT5kYXRh
Owo+ID4+ID4gK30KPiA+PiA+ICsKPiA+PiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtfZGRw
X2NvbXBfZHJpdmVyX2RhdGEgKm10a19jb2xvcl9nZXRfZHJpdmVyX2RhdGEoCj4gPj4gPiArICAg
c3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+ID4+ID4gK3sKPiA+PiA+ICsgICBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZCA9Cj4gPj4gPiArICAgICAgICAgICBvZl9tYXRjaF9ub2Rl
KG10a19kaXNwX2NvbG9yX2RyaXZlcl9kdF9tYXRjaCwgbm9kZSk7Cj4gPj4gPiArCj4gPj4gPiAr
ICAgcmV0dXJuIChzdHJ1Y3QgbXRrX2RkcF9jb21wX2RyaXZlcl9kYXRhICopb2ZfaWQtPmRhdGE7
Cj4gPj4gPiArfQo+ID4+ID4gKwo+ID4+Cj4gPj4gVGhlc2UgdGhyZWUgZnVuY3Rpb25zIGxvb2tz
IHRoZSBzYW1lIHdpdGggZGlmZmVyZW50IHBhcmFtZXRlcjoKPiA+PiBtdGtfZGlzcF9vdmxfZHJp
dmVyX2R0X21hdGNoLCBtdGtfZGlzcF9yZG1hX2RyaXZlcl9kdF9tYXRjaCwgYW5kCj4gPj4gbXRr
X2Rpc3BfY29sb3JfZHJpdmVyX2R0X21hdGNoLiBTbyBtZXJnZSB0aGVtIHRvIHByZXZlbnQgZHVw
bGljYXRlZAo+ID4+IGNvZGUuCj4gPiBPSywgSSdsbCBkbyB0aGlzIGluIHRoZSBuZXh0IHZlcnNp
b24uCj4gCj4gQWxzbyBwcmVzZXJ2ZSB0aGUgY29uc3QtbmVzcyBvZiB0aGUgZGF0YSAtIGRvbid0
IGNhc3QgaXQgYXdheSBvbiB0aGUKPiByZXR1cm4gbGluZS4KPiBOb3RlIHRoYXQgdGhlIGZ1bmN0
aW9uIHJldHVybiB0eXBlIChhbmQgc29tZSBvZiB0aGUgdXNlcnMgb2Ygc2FpZAo+IGZ1bmN0aW9u
cykgc2hvdWxkIGJlIHVwZGF0ZWQgYXMgd2VsbC4KT0ssIEkgd2lsbCBjaGVjayB0aGlzIHBhcnQu
Cgo+IAo+IC1FbWlsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

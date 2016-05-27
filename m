From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [RFC v2 3/5] drm/mediatek: add *driver_data for different
 hardware settings
Date: Fri, 27 May 2016 10:24:57 +0100
Message-ID: <CACvgo52xB0KwumC75u2dxfz_yv2PNE0Gem+0t8dqV9qn+pPRLg@mail.gmail.com>
References: <1463756736-46573-1-git-send-email-yt.shen@mediatek.com>
 <1463756736-46573-4-git-send-email-yt.shen@mediatek.com>
 <1463996582.30093.5.camel@mtksdaap41>
 <1464334313.31149.16.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1464334313.31149.16.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMjcgTWF5IDIwMTYgYXQgMDg6MzEsIFlUIFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPiB3
cm90ZToKPiBIaSBDSywKPgo+Cj4gT24gTW9uLCAyMDE2LTA1LTIzIGF0IDE3OjQzICswODAwLCBD
SyBIdSB3cm90ZToKPj4gSGksIFlUOgo+Pgo+PiBPbmUgY29tbWVudCBiZWxvdy4KPj4KPj4gT24g
RnJpLCAyMDE2LTA1LTIwIGF0IDIzOjA1ICswODAwLCB5dC5zaGVuQG1lZGlhdGVrLmNvbSB3cm90
ZToKPj4gPiBGcm9tOiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4KPj4gPgo+PiA+IFRo
ZXJlIGFyZSBzb21lIGhhcmR3YXJlIHNldHRpbmdzIGNoYW5nZWQsIGJldHdlZW4gTVQ4MTczICYg
TVQyNzAxOgo+PiA+IERJU1BfT1ZMIGFkZHJlc3Mgb2Zmc2V0IGNoYW5nZWQsIGNvbG9yIGZvcm1h
dCBkZWZpbml0aW9uIGNoYW5nZWQuCj4+ID4gRElTUF9SRE1BIGZpZm8gc2l6ZSBjaGFuZ2VkLgo+
PiA+IERJU1BfQ09MT1Igb2Zmc2V0IGNoYW5nZWQuCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
VCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4KPj4gPiAtLS0KPj4gPiArCj4+ID4gK3N0YXRp
YyBpbmxpbmUgc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0YSAqbXRrX292bF9nZXRfZHJp
dmVyX2RhdGEoCj4+ID4gKyAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ID4gK3sK
Pj4gPiArICAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2ZfaWQgPQo+PiA+ICsgICAgICAg
ICAgIG9mX21hdGNoX2RldmljZShtdGtfZGlzcF9vdmxfZHJpdmVyX2R0X21hdGNoLCAmcGRldi0+
ZGV2KTsKPj4gPiArCj4+ID4gKyAgIHJldHVybiAoc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJf
ZGF0YSAqKW9mX2lkLT5kYXRhOwo+PiA+ICt9Cj4+ID4gKwo+PiA+ICtzdGF0aWMgaW5saW5lIHN0
cnVjdCBtdGtfZGRwX2NvbXBfZHJpdmVyX2RhdGEgKm10a19yZG1hX2dldF9kcml2ZXJfZGF0YSgK
Pj4gPiArICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gPiArewo+PiA+ICsgICBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZCA9Cj4+ID4gKyAgICAgICAgICAgb2ZfbWF0
Y2hfZGV2aWNlKG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoLCAmcGRldi0+ZGV2KTsKPj4g
PiArCj4+ID4gKyAgIHJldHVybiAoc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0YSAqKW9m
X2lkLT5kYXRhOwo+PiA+ICt9Cj4+ID4gKwo+PiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGtf
ZGRwX2NvbXBfZHJpdmVyX2RhdGEgKm10a19jb2xvcl9nZXRfZHJpdmVyX2RhdGEoCj4+ID4gKyAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPj4gPiArewo+PiA+ICsgICBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkICpvZl9pZCA9Cj4+ID4gKyAgICAgICAgICAgb2ZfbWF0Y2hfbm9kZShtdGtf
ZGlzcF9jb2xvcl9kcml2ZXJfZHRfbWF0Y2gsIG5vZGUpOwo+PiA+ICsKPj4gPiArICAgcmV0dXJu
IChzdHJ1Y3QgbXRrX2RkcF9jb21wX2RyaXZlcl9kYXRhICopb2ZfaWQtPmRhdGE7Cj4+ID4gK30K
Pj4gPiArCj4+Cj4+IFRoZXNlIHRocmVlIGZ1bmN0aW9ucyBsb29rcyB0aGUgc2FtZSB3aXRoIGRp
ZmZlcmVudCBwYXJhbWV0ZXI6Cj4+IG10a19kaXNwX292bF9kcml2ZXJfZHRfbWF0Y2gsIG10a19k
aXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoLCBhbmQKPj4gbXRrX2Rpc3BfY29sb3JfZHJpdmVyX2R0
X21hdGNoLiBTbyBtZXJnZSB0aGVtIHRvIHByZXZlbnQgZHVwbGljYXRlZAo+PiBjb2RlLgo+IE9L
LCBJJ2xsIGRvIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCkFsc28gcHJlc2VydmUgdGhlIGNv
bnN0LW5lc3Mgb2YgdGhlIGRhdGEgLSBkb24ndCBjYXN0IGl0IGF3YXkgb24gdGhlCnJldHVybiBs
aW5lLgpOb3RlIHRoYXQgdGhlIGZ1bmN0aW9uIHJldHVybiB0eXBlIChhbmQgc29tZSBvZiB0aGUg
dXNlcnMgb2Ygc2FpZApmdW5jdGlvbnMpIHNob3VsZCBiZSB1cGRhdGVkIGFzIHdlbGwuCgotRW1p
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

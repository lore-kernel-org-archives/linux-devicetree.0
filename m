From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: interrupt-controller: add DT
 binding for meson GPIO interrupt controller
Date: Thu, 27 Oct 2016 11:40:44 +0200
Message-ID: <1477561244.2482.198.camel@baylibre.com>
References: <1476890480-8884-1-git-send-email-jbrunet@baylibre.com>
 <1476890480-8884-3-git-send-email-jbrunet@baylibre.com>
 <20161026214234.4q6wmecehqh6q32o@rob-hp-laptop>
 <20161027093205.GA27135@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161027093205.GA27135@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE2LTEwLTI3IGF0IDEwOjMyICswMTAwLCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4g
T24gV2VkLCBPY3QgMjYsIDIwMTYgYXQgMDQ6NDI6MzVQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gPiAKPiA+IE9uIFdlZCwgT2N0IDE5LCAyMDE2IGF0IDA1OjIxOjEzUE0gKzAyMDAsIEpl
cm9tZSBCcnVuZXQgd3JvdGU6Cj4gPiA+IAo+ID4gPiAKPiA+ID4gVGhpcyBjb21taXQgYWRkcyB0
aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgZGVzY3JpcHRpb24gZm9yCj4gPiA+IEFtbG9naWMncyBH
UElPCj4gPiA+IGludGVycnVwdCBjb250cm9sbGVyIGF2YWlsYWJsZSBvbiB0aGUgbWVzb244LCBt
ZXNvbjhiIGFuZCBneGJiCj4gPiA+IFNvQyBmYW1pbGllcwo+ID4gPiAKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gPiA+IC0tLQo+ID4g
PiBSb2IsIEkgZGlkIG5vdCBpbmNsdWRlIHRoZSBBY2sgeW91IGdhdmUgZm9yIHRoZSBSRkMgYXMg
YmluZGluZ3MKPiA+ID4gaGF2ZSBzbGlnaHRseQo+ID4gPiBjaGFuZ2VkLiBPbmx5IHRoZSBpbnRl
cnJ1cHQgcHJvcGVydHkgaGFzIGJlIHJlbW92ZWQgZm9sbG93aW5nIGEKPiA+ID4gZGlzY3Vzc2lv
biBJCj4gPiA+IGhhZCB3aXRoIE1hcmMKPiA+IAo+ID4gQXMgTWFyayBSIGFscmVhZHkgc2FpZCwg
eW91IHNob3VsZCBrZWVwIHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5Lgo+IAo+IFRvIGJlIGNsZWFy
LCB0aGUgaW50ZXJydXB0IHJvdXRpbmcgc2hvdWxkIGJlIGRlc2NyaWJlZCAqc29tZWhvdyosCj4g
dGhvdWdoCj4gSSBkb24ndCB0aGluayB0aGUgZ2VuZXJpYyBpbnRlcnJ1cHRzIHByb3BlcnR5IGlz
IGNvcnJlY3QsIGFzIHRoaXMgaXMKPiBhbgo+IGludGVycnVwdCAqcm91dGVyKiwgaS5lLiB0aGlz
IGRldmljZSBkb2Vzbid0IG93biB0aGUgaW50ZXJydXB0LCBpdAo+IGp1c3QKPiBqb2lucyB0d28g
cGFydHMgb2YgdGhlIGxpbmUgdG9nZXRoZXIgKGFuZCBzbyBmbGFncyBhcmUgbWVhbmluZ2xlc3Mp
Lgo+IAo+IFRoYW5rcywKPiBNYXJrLgoKSW5kZWVkIE1hcmssCgpJIGFscmVhZHkgcmV3cml0dGVu
IHRoZSBkcml2ZXIgdGFraW5nIE1hcmMncyBjb21tZW50IGludG8gYWNjb3VudC4KVGhlcmUgd2ls
bCBiZSAyIHByb3BlcnRpZXMgYWRkZWQgdG8gdGhlIERUOgrCoC3CoG1lc29uLHVwc3RyZWFtLWlu
dGVycnVwdHMgOiBhbiBhcnJheSB3aXRoIHRoZSA4IGdpYyBpbnRlcnJ1cHQgdXNlZAphcyBvdXRw
dXQgb2YgdGhlIGNvbnRyb2xsZXIKLSDCoG1lc29uLG51bS1pbnB1dC1tdXggOiB0aGUgbnVtYmVy
IG9mIGlucHV0cyAocGFkcykgYXZhaWxhYmxlIHRvIHRoZQptdXhlcwoKSSdtIGxvb2tpbmcgZm9y
IHNvbHV0aW9uIHRvIHRoZSAiY3JlYXRlIG1hcHBpbmciIGlzc3VlIHdlIGhhdmUgaW4KcGluY3Ry
bCAocGF0Y2ggNCkgYmVmb3JlIHBvc3RpbmcgYSB2My4KCklmIHlvdSB0aGluayB0aGVzZSBwcm9w
ZXJ0aWVzIHNob3VsZCBiZSBkaWZmZXJlbnQsIGZlZWwgZnJlZSB0byB0ZWxsIG1lCm5vdy4KClRo
eApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK

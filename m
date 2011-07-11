From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH] ARM: mmp: remove builtin gpio driver support
Date: Mon, 11 Jul 2011 19:44:09 +0800
Message-ID: <CAMPhdO_q=bzt4XVs=wmdqB=D=A9XrYXe96BqpQdnqMikG8ToQA@mail.gmail.com>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
	<20110710040218.GA10912@ponder.secretlab.ca>
	<1310360751.4621.6.camel@Lily>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1310360751.4621.6.camel@Lily>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: Haojian Zhuang <hzhuang1@marvell.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "nico@fluxnic.net" <nico@fluxnic.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, "samuel.ortiz@intel.com" <samuel.ortiz@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "alan@linux.intel.com" <alan@linux.intel.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBKdWwgMTEsIDIwMTEgYXQgMTowNSBQTSwgSGFvamlhbiBaaHVhbmcKPGhhb2ppYW4u
emh1YW5nQG1hcnZlbGwuY29tPiB3cm90ZToKPiBPbiBTYXQsIDIwMTEtMDctMDkgYXQgMjE6MDIg
LTA3MDAsIEdyYW50IExpa2VseSB3cm90ZToKPj4gT24gRnJpLCBKdWwgMDgsIDIwMTEgYXQgMDY6
MjA6MThQTSArMDgwMCwgSGFvamlhbiBaaHVhbmcgd3JvdGU6Cj4+ID4gUmVtb3ZlIGJ1aWx0aW4g
Z3BpbyBkcml2ZXIgc3VwcG9ydCBmb3JtIG1tcC4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IEhh
b2ppYW4gWmh1YW5nIDxoYW9qaWFuLnpodWFuZ0BtYXJ2ZWxsLmNvbT4KPj4KPj4gSGkgSGFvamlh
bi4KPj4KPj4gSSdtIG5vdCBjbGVhciB3aGF0IHRoaXMgcGF0Y2ggaXMgaW50ZW5kaW5nIHRvIGRv
LiDCoEkgdW5kZXJzdGFuZCB0aGF0Cj4+IGl0IHJlbW92ZXMgdGhlIG1tcC1zcGVjaWZpYyBncGlv
IHN1cHBvcnQsIGJ1dCBJIGxvb2tzIGxpa2UgZG9uJ3Qgc2VlIHRoZSBjb2RlCj4+IHRoYXQgcmVw
bGFjZXMgaXQsIHdoaWNoIHdvdWxkIG1lYW4gdGhhdCBhcHBseWluZyB0aGlzIHBhdGNoIGJyZWFr
cwo+PiBncGlvIG9uIG1tcCBwbGF0Zm9ybXMuCj4+Cj4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/
Cj4+Cj4gSSdtIHNvcnJ5IHRoYXQgSSBzaG91bGRuJ3QgbG9vcCB0aGlzIHBhdGNoIHNpbmNlIG15
IG5ldyBncGlvIGRyaXZlcgo+IGlzbid0IGNvbnRhaW5lZCBpbiB0aGlzIHBhdGNoIHNlcmllcy4K
Pgo+IEknbSB3aWxsaW5nIHRvIGFkZCBvbmUgb3BlcmF0aW9uIHRvIHNlbGVjdCB1c2luZyBvcmln
aW5hbCBncGlvIGRyaXZlciBvcgo+IHRoZSBuZXcgb25lLiBTaW5jZSB0aGUgb3JpZ2luYWwgZ3Bp
byBkcml2ZXIgaXMgc2hhcmVkIGJldHdlZW4gQVJDSC1QWEEKPiBhbmQgQVJDSC1tbXAuIEkgZG9u
J3Qgd2FudCBwYXRjaCBicmVha2luZyB0aGUgaW1wbGVtZW50YXRpb24gaW4KPiBBUkNILVBYQS4K
ClRoZSBidWlsdC1pbiB2ZXJzaW9uIGlzIHVzZWQgZm9yIHRob3NlIHRpbWluZyBjcml0aWNhbCBz
aXR1YXRpb25zLiBJbiBzb21lCmJlc3QgY2FzZXMsIGl0IGNhbiBiZSBvcHRpbWl6ZWQgdG8gb25s
eSBvbmUgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbiwgd2hpY2gKaXMgZXh0cmVtZWx5IHVzZWZ1bCBm
b3IgdGhvc2UgYml0LWJhbmdpbmcgb3BlcmF0aW9ucyBsaWtlIEkyQy9TUEkgZW11bGF0aW9uCndp
dGggR1BJTy4KCj4KPiBUaGFua3MKPiBIYW9qaWFuCj4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

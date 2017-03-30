From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 1/2] drm/bridge: ti-tfp410: support hpd via gpio
Date: Thu, 30 Mar 2017 15:19:05 +0530
Message-ID: <ecd1c4b5-c1c7-ece2-4139-a4d6cfb48da3@codeaurora.org>
References: <2e47786ab3d04078ae70d0c4064f7c4d@rwthex-s1-b.rwth-ad.de>
 <093b4e9c0ae6413499e5bf8ec309fa41@rwthex-s1-b.rwth-ad.de>
 <6dfb2b66ec2a408dabe80d703f411ce0@rwthex-s1-b.rwth-ad.de>
 <d6b2391f-3e4a-2761-b6a0-8997d2c78600@codeaurora.org>
 <f87195b3-bd89-d698-c935-4e3aa97c01e2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f87195b3-bd89-d698-c935-4e3aa97c01e2@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Igor Grinberg <grinberg@compulab.co.il>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgpPbiAwMy8yOC8yMDE3IDA3OjAyIFBNLCBKeXJpIFNhcmhhIHdyb3RlOgo+IE9uIDAzLzI3LzE3
IDA4OjU4LCBBcmNoaXQgVGFuZWphIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMDMvMDcvMjAxNyAw
MzoyMSBBTSwgQ2hyaXN0b3BoZXIgU3BpbnJhdGggd3JvdGU6Cj4+PiBIaSBGYWJpbywKPj4+Cj4+
PiBPbiAwMy8wNi8yMDE3IDEwOjQ2IFBNLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+Pj4+IEhpIENo
cmlzdG9waGVyLAo+Pj4+Cj4+Pj4gT24gTW9uLCBNYXIgNiwgMjAxNyBhdCA2OjQwIFBNLAo+Pj4+
IDxjaHJpc3RvcGhlci5zcGlucmF0aEByd3RoLWFhY2hlbi5kZT4gd3JvdGU6Cj4+Pj4+IEZyb206
IENocmlzdG9waGVyIFNwaW5yYXRoIDxjaHJpc3RvcGhlci5zcGlucmF0aEByd3RoLWFhY2hlbi5k
ZT4KPj4+Pj4KPj4+Pj4gT24gc29tZSBib2FyZHMgdGhlIGhwZCBwaW4gb2YgYSBoZG1pIGNvbm5l
Y3RvciBpcyB3aXJlZCB1cCB0byBhIGdwaW8KPj4+Pj4gcGluLiBTaW5jZSBpbiB0aGUgRFJNIHdv
cmxkIHRoZSB0ZnA0MTAgZHJpdmVyIGlzIHJlc3BvbnNpYmxlIGZvcgo+Pj4+PiBoYW5kbGluZyB0
aGUgY29ubmVjdG9yLCBhZGQgc3VwcG9ydCBmb3IgaHBkIGdwaW9zIGluIHRoaXMgdmVyeSBkcml2
ZXIuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIFNwaW5yYXRoCj4+Pj4+
IDxjaHJpc3RvcGhlci5zcGlucmF0aEByd3RoLWFhY2hlbi5kZT4KPj4+Pj4gLS0tCj4+Pj4+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIHwgNzIKPj4+Pj4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4+Pgo+IC4uLgo+Pj4KPj4KPj4gVGhlIHBhdGNo
IGxvb2tzIGdvb2QgdG8gbWUuCj4+Cj4+IEp5cmksCj4+Cj4+IElzIGl0IHBvc3NpYmxlIGZvciB5
b3UgdG8gdmVyaWZ5IHRoaXMgb24gQmVhZ2xlYm9uZSBwbGF0Zm9ybT8KPj4KPgo+IElmIEkgcmVh
ZCBteSBCZWFnbGVCb25lIERWSS1EIENhcGUgZG9jcyByaWdodCwgaXQgZG9lcyBub3QgaGF2ZSB0
aGUgSFBECj4gcGluIGNvbm5lY3RlZC4gQXQgbGVhc3QgaXQgZG9lcyBub3QgbWVudGlvbiBhbnkg
Z3BpbyB0aGF0IGNvdWxkIGJlIHVzZWQKPiBmb3IgdGhlIHB1cnBvc2UuIFNvIEkgY2FuIG5vdCBl
YXNpbHkgdGVzdCB0aGlzIHBhdGNoIGluIHJlYWwgd29ybGQKPiBzaXR1YXRpb24uIEZvciB3aGF0
IGl0IGlzIHdvcnRoIHRoZSBwYXRjaCBsb29rcyBvayB0byBtZSB0b28uCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXcuIEkgbG9va2VkIGF0IHRoZSB0ZnA0MTAgZGF0YSBzaGVldFsxXSwgdGhlcmUgaXNu
J3QKYSBIUEQgcGluIG9uIHRoZSBjaGlwIGF0IGFsbC4gTXkgZ3Vlc3MgaXMgdGhhdCBib2FyZHMg
dXNpbmcgdGZwNDEwIG1vc3QKbGlrZWx5IGhhdmUgdGhlIEhQRCBwaW4gcm91dGVkIHRvIHRoZSBT
b0MgZnJvbSB0aGUgSERNSSBjb25uZWN0b3IKKHdpdGggYSBsZXZlbCBzaGlmdGVyL3NoaWVsZCBp
biBiZXR3ZWVuKS4KCldlIHdvdWxkIGV2ZW50dWFsbHkgbmVlZCB0byBtb3ZlIHRoZSBib3RoIGRk
YyBhbmQgaHBkIHN0dWZmIHRvCmEgZ2VuZXJpYyBoZG1pIGNvbm5lY3RvciBkcml2ZXIgbGF0ZXIg
b24uIEkndmUgcXVldWVkIHRoaXMgdG8KZHJtLW1pc2MtbmV4dC4KClsxXTogaHR0cDovL3d3dy50
aS5jb20vbGl0L2RzL3N5bWxpbmsvdGZwNDEwLnBkZgoKQXJjaGl0Cgo+Cj4gQmVzdCByZWdhcmRz
LAo+IEp5cmkKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo+CgotLSAKUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50
ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRh
dGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

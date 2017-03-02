From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4 v3] ARM: gemini: select
	MIGHT_HAVE_PCI
Date: Fri, 3 Mar 2017 00:31:31 +0100
Message-ID: <CACRpkdZ-9tZPNOnMvA7-Rudg7QPVs=N5SPBd+i59EFb4VjmSYA@mail.gmail.com>
References: <20170227190720.31409-1-linus.walleij@linaro.org>
 <20170227190720.31409-3-linus.walleij@linaro.org>
 <20170302162931.tyngslqsr2axy5qx@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <20170302162931.tyngslqsr2axy5qx@rob-hp-laptop>
List-Unsubscribe: <https://lists.openwrt.org/cgi-bin/mailman/options/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=unsubscribe>
List-Archive: <http://lists.openwrt.org/pipermail/openwrt-devel/>
List-Post: <mailto:openwrt-devel@lists.openwrt.org>
List-Help: <mailto:openwrt-devel-request@lists.openwrt.org?subject=help>
List-Subscribe: <https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=subscribe>
Errors-To: openwrt-devel-bounces@lists.openwrt.org
Sender: "openwrt-devel" <openwrt-devel-bounces@lists.openwrt.org>
To: Rob Herring <robh@kernel.org>
Cc: openwrt-devel@openwrt.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Feng-Hsin Chiang <john453@faraday-tech.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-pci <linux-pci@vger.kernel.org>, Greentime Hu <green.hu@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Janos Laube <janos.dev@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBNYXIgMiwgMjAxNyBhdCA1OjI5IFBNLCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBNb24sIEZlYiAyNywgMjAxNyBhdCAwODowNzoxOVBNICswMTAwLCBM
aW51cyBXYWxsZWlqIHdyb3RlOgo+PiBBcyB3ZSBoYXZlIGEgUENJIGRyaXZlciBmb3IgdGhlIEdl
bWluaSwgd2Ugc2hvdWxkIHNlbGVjdAo+PiBNSUdIVF9IQVZFX1BDSS4KPj4KPj4gQ2M6IEphbm9z
IExhdWJlIDxqYW5vcy5kZXZAZ21haWwuY29tPgo+PiBDYzogUGF1bGl1cyBaYWxlY2thcyA8cGF1
bGl1cy56YWxlY2thc0BnbWFpbC5jb20+Cj4+IENjOiBIYW5zIFVsbGkgS3JvbGwgPHVsbGkua3Jv
bGxAZ29vZ2xlbWFpbC5jb20+Cj4+IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdt
YWlsLmNvbT4KPj4gQ2M6IEZlbmctSHNpbiBDaGlhbmcgPGpvaG40NTNAZmFyYWRheS10ZWNoLmNv
bT4KPj4gQ2M6IEdyZWVudGltZSBIdSA8Z3JlZW4uaHVAZ21haWwuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiBD
aGFuZ2VMb2cgdjEtPnYyLT52MzoKPj4gLSBObyBjaGFuZ2VzCj4+Cj4+IFBDSSBtYWludGFpbmVy
czogdGhpcyBpcyBGWUkgb25seSwgSSB3aWxsIGZ1bm5lbCB0aGlzIHRvIHRoZSBBUk0KPj4gU29D
IHRyZWUgb25jZSB3ZSBhcmUgZG9uZSB3aXRoIHRoZSBQQ0kgZHJpdmVyLgo+PiAtLS0KPj4gIGFy
Y2gvYXJtL21hY2gtZ2VtaW5pL0tjb25maWcgfCAxICsKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1nZW1pbmkvS2NvbmZp
ZyBiL2FyY2gvYXJtL21hY2gtZ2VtaW5pL0tjb25maWcKPj4gaW5kZXggYTVlZTVmYmFiNzk2Li4y
MWY4OWE0YzE2ZmUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtZ2VtaW5pL0tjb25maWcK
Pj4gKysrIGIvYXJjaC9hcm0vbWFjaC1nZW1pbmkvS2NvbmZpZwo+PiBAQCAtNiw2ICs2LDcgQEAg
bWVudWNvbmZpZyBBUkNIX0dFTUlOSQo+PiAgICAgICBzZWxlY3QgRlRUTVIwMTBfVElNRVIKPj4g
ICAgICAgc2VsZWN0IEdQSU9fR0VNSU5JCj4+ICAgICAgIHNlbGVjdCBHUElPTElCCj4+ICsgICAg
IHNlbGVjdCBNSUdIVF9IQVZFX1BDSQo+Cj4gRG9lc24ndCBNdWx0aS1wbGF0Zm9ybSBkbyB0aGlz
IGZvciB5b3U/CgpPaCBpdCBkb2VzLCBJIGp1c3QgbWlzc2VkIHRoYXQuCgo+IElmIG5vdCwgSU1P
LCB3ZSBzaG91bGQgZG8gdGhhdAo+IG9yIGtpbGwgdGhpcyBvcHRpb24uIFdlIGRvbid0IGRvIGFu
IG9wdGlvbiBsaWtlIHRoaXMgZm9yIEkyQywgU1BJLAo+IGRpc3BsYXksIGFueXRoaW5nIGVsc2Ug
KHdlbGwsIGV4Y2VwdCBHUElPTElCIDspKS4KCkkga2lsbGVkIEFSQ0hfV0FOVF9PUFRJT05BTF9H
UElPTElCIGF0IGxlYXN0CnRoYXQgdGhpbmcgd2FzIHJlYWxseSBjb25mdXNpbmcuCgpNYXliZSB3
ZSBzaG91bGQgaGF2ZSBNVUxUSVBMQVRGT1JNIHNlbGVjdApHUElPTElCIHRvby4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCm9wZW53cnQtZGV2ZWwgbWFpbGluZyBsaXN0Cm9wZW53cnQtZGV2ZWxAbGlzdHMub3Blbndy
dC5vcmcKaHR0cHM6Ly9saXN0cy5vcGVud3J0Lm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8v
b3BlbndydC1kZXZlbAo=

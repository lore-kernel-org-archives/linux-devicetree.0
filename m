From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [RFC 2/3] drm/mediatek: add support for Mediatek SoC MT2701
Date: Mon, 16 May 2016 19:39:41 +0800
Message-ID: <1463398781.13038.4.camel@mtksdaap41>
References: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
 <1463053795-55455-3-git-send-email-yt.shen@mediatek.com>
 <1463111956.12239.15.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463111956.12239.15.camel@mtksdaap41>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgQ0ssCk9uIEZyaSwgMjAxNi0wNS0xMyBhdCAxMTo1OSArMDgwMCwgQ0sgSHUgd3JvdGU6Cj4g
SGksIFlUOgo+IAo+IE9uIFRodSwgMjAxNi0wNS0xMiBhdCAxOTo0OSArMDgwMCwgeXQuc2hlbkBt
ZWRpYXRlay5jb20gd3JvdGU6Cj4gPiBGcm9tOiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNv
bT4KPiA+IAo+ID4gVGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhdGVrIE1UMjcw
MSBESVNQIHN1YnN5c3RlbS4KPiA+IFRoZXJlIGlzIG9ubHkgb25lIE9WTCBlbmdpbmUgaW4gTVQy
NzAxLCBhbmQgd2UgaGF2ZSBzaGFkb3cKPiA+IHJlZ2lzdGVyIHN1cHBvcnQgaGVyZS4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Cj4gPiAtLS0K
PiAKPiA+IEBAIC0zODUsMTIgKzQyMiwxNiBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfYXRv
bWljX2JlZ2luKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+ICAJCW10a19jcnRjLT5ldmVudCA9
IHN0YXRlLT5iYXNlLmV2ZW50Owo+ID4gIAkJc3RhdGUtPmJhc2UuZXZlbnQgPSBOVUxMOwo+ID4g
IAl9Cj4gPiArCj4gPiArCWlmIChwcml2LT5kYXRhLT5zaGFkb3dfcmVnaXN0ZXIpCj4gPiArCQlt
dGtfZGlzcF9tdXRleF9hY3F1aXJlKG10a19jcnRjLT5tdXRleCk7Cj4gPiAgfQo+ID4gIAo+ID4g
QEAgLTQwOSw2ICs0NTAsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2F0b21pY19mbHVz
aChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gPiAgCX0KPiA+ICAJaWYgKHBlbmRpbmdfcGxhbmVz
KQo+ID4gIAkJbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gdHJ1ZTsKPiA+ICsKPiA+ICsJaWYg
KHByaXYtPmRhdGEtPnNoYWRvd19yZWdpc3Rlcikgewo+ID4gKwkJbXRrX2NydGNfZGRwX2NvbmZp
ZyhjcnRjKTsKPiA+ICsJCW10a19kaXNwX211dGV4X3JlbGVhc2UobXRrX2NydGMtPm11dGV4KTsK
PiA+ICsJfQo+ID4gIH0KPiA+ICAKPiAKPiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGNhbGwgbXRr
X2Rpc3BfbXV0ZXhfYWNxdWlyZSgpIGFuZAo+IG10a19kaXNwX211dGV4X3JlbGVhc2UoKSBhcyBu
ZWFyIGFzIHBvc3NpYmxlIHRvIHByZXZlbnQgbXV0ZXggbG9ja2VkIGZvcgo+IGEgbG9uZyB0aW1l
LiBBbGwgSFcgcmVnaXN0ZXIgYWNjZXNzIG9mIHRoaXMgYXRvbWljIHNldHRpbmcgaXMgaW4KPiBt
dGtfY3J0Y19kZHBfY29uZmlnKCksIHNvIGl0J3MgYmV0dGVyIHRvIG1vdmUgbXRrX2Rpc3BfbXV0
ZXhfYWNxdWlyZSgpCj4ganVzdCBiZWZvcmUgbXRrX2NydGNfZGRwX2NvbmZpZygpLgo+IAo+IFJl
Z2FyZHMsCj4gQ0sKSSdsbCBkbyB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uICBUaGFua3MgZm9y
IHRoZSByZXZpZXcuCgpSZWdhcmRzLAp5dC5zaGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

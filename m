From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC v2 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
Date: Mon, 02 Nov 2015 12:35:27 +0100
Message-ID: <1446464127.3442.37.camel@pengutronix.de>
References: <1446430166-7378-1-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1446430166-7378-1-git-send-email-jitao.shi@mediatek.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgSml0YW8sCgpBbSBNb250YWcsIGRlbiAwMi4xMS4yMDE1LCAxMDowOSArMDgwMCBzY2hyaWVi
IEppdGFvIFNoaToKPiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgRFQgcHJvcGVydGllcyBzdXBwb3J0
ZWQgYnkKPiBwczg2NDAgRFNJLWVEUCBjb252ZXJ0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0
YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0ICB8ICAgNDMgKysrKysrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9w
czg2NDAudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3BzODY0MC50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAuLjdlZGM1NDcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3BzODY0MC50eHQKPiBA
QCAtMCwwICsxLDQzIEBACj4gK3BzODY0MC1icmlkZ2UgYmluZGluZ3MKPiArCj4gK1JlcXVpcmVk
IHByb3BlcnRpZXM6Cj4gKwktIGNvbXBhdGlibGU6ICJwYXJhZGUscHM4NjQwIgo+ICsJLSByZWc6
IGZpcnN0IHBhZ2UgYWRkcmVzcyBvZiB0aGUgYnJpZGdlLgo+ICsJLSBzbGVlcC1ncGlvczogT0Yg
ZGV2aWNlLXRyZWUgZ3BpbyBzcGVjaWZpY2F0aW9uIGZvciBQRF8gcGluLgo+ICsJLSByZXNldC1n
cGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVjaWZpY2F0aW9uIGZvciByZXNldCBwaW4uCj4g
KwktIG1vZGUtc2VsLWdwaW9zOiBPRiBkZXZpY2UtdHJlZSBncGlvIHNwZWNpZmljYXRpb24gZm9y
IG1vZGUtc2VsIHBpbi4KPiArCS0gdmRkMTItc3VwcGx5OiBPRiBkZXZpY2UtdHJlZSByZWd1bGF0
b3Igc3BlY2lmaWNhdGlvbiBmb3IgMS4yViBwb3dlci4KPiArCS0gdmRkMzMtc3VwcGx5OiBPRiBk
ZXZpY2UtdHJlZSByZWd1bGF0b3Igc3BlY2lmaWNhdGlvbiBmb3IgMy4zViBwb3dlci4KPiArCS0g
cG9ydHM6IFRoZSBkZXZpY2Ugbm9kZSBjYW4gY29udGFpbiB2aWRlbyBpbnRlcmZhY2UgcG9ydCBu
b2RlcyBwZXIKPiArCQkgdGhlIHZpZGVvLWludGVyZmFjZXMgYmluZFsxXS4gRm9yIHBvcnRAMCxz
ZXQgdGhlIHJlZyA9IDwwPiBhcwo+ICsJCSBwczg2NDAgZHNpIGluIGFuZCBwb3J0QDEsc2V0IHRo
ZSByZWcgPSA8MT4gYXMgcHM4NjQwIGVEUCBvdXQuCj4gKwo+ICtbMV06IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ICsKPiArRXhh
bXBsZToKPiArCWVkcC1icmlkZ2VAMTggewo+ICsJCWNvbXBhdGlibGUgPSAicGFyYWRlLHBzODY0
MCI7Cj4gKwkJcmVnID0gPDB4MTg+Owo+ICsJCXNsZWVwLWdwaW9zID0gPCZwaW8gMTE2IEdQSU9f
QUNUSVZFX0hJR0g+Owo+ICsJCXJlc2V0LWdwaW9zID0gPCZwaW8gMTE1IEdQSU9fQUNUSVZFX0hJ
R0g+Owo+ICsJCW1vZGUtc2VsLWdwaW9zID0gPCZwaW8gOTIgR1BJT19BQ1RJVkVfSElHSD47Cj4g
KwkJcHM4NjQwLTF2Mi1zdXBwbHkgPSA8JnBzODY0MF9maXhlZF8xdjI+Owo+ICsJCXBzODY0MC0z
djMtc3VwcGx5ID0gPCZtdDYzOTdfdmdwMl9yZWc+OwoKVGhlc2UgdHdvIHNob3VsZCBiZSB1cGRh
dGVkIHRvIHRoZSBuZXcgcmVndWxhdG9yIHByb3BlcnR5IG5hbWVzLgoKcmVnYXJkcwpQaGlsaXBw
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

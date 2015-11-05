From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v5 12/12] dt-bindings: hdmi-connector: add DDC I2C bus
 phandle documentation
Date: Wed, 4 Nov 2015 21:34:46 -0600
Message-ID: <20151105033446.GA9490@rob-hp-laptop>
References: <1446637509-6418-1-git-send-email-p.zabel@pengutronix.de>
 <1446637509-6418-13-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1446637509-6418-13-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBOb3YgMDQsIDIwMTUgYXQgMTI6NDU6MDlQTSArMDEwMCwgUGhpbGlwcCBaYWJlbCB3
cm90ZToKPiBBZGQgYW4gb3B0aW9uYWwgZGRjLWkyYy1idXMgcGhhbmRsZSBwcm9wZXJ0eSB0aGF0
IHBvaW50cyB0bwo+IGFuIEkyQyBtYXN0ZXIgY29udHJvbGxlciB0aGF0IGhhbmRsZXMgdGhlIGNv
bm5lY3RvciBEREMgcGlucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmlkZW8vaGRtaS1jb25uZWN0b3IudHh0IHwgMSArCgpUaGlzIG9uZSB3aWxsIGhhdmUg
dG8gbW92ZSB0byBiaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci8gYXMgd2VsbC4gCk90aGVyd2lz
ZToKCkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92aWRlby9oZG1pLWNvbm5lY3Rvci50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vaGRtaS1jb25uZWN0b3IudHh0Cj4gaW5kZXggYWNk
NTY2OC4uNTA4YWVlNCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdmlkZW8vaGRtaS1jb25uZWN0b3IudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3ZpZGVvL2hkbWktY29ubmVjdG9yLnR4dAo+IEBAIC04LDYgKzgsNyBA
QCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICAtIGxhYmVs
OiBhIHN5bWJvbGljIG5hbWUgZm9yIHRoZSBjb25uZWN0b3IKPiAgLSBocGQtZ3Bpb3M6IEhQRCBH
UElPIG51bWJlcgo+ICstIGRkYy1pMmMtYnVzOiBwaGFuZGxlIGxpbmsgdG8gdGhlIEkyQyBjb250
cm9sbGVyIHVzZWQgZm9yIEREQyBFRElEIHByb2JpbmcKPiAgCj4gIFJlcXVpcmVkIG5vZGVzOgo+
ICAtIFZpZGVvIHBvcnQgZm9yIEhETUkgaW5wdXQKPiAtLSAKPiAyLjYuMQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

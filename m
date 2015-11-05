From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC v5 01/12] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Thu, 05 Nov 2015 15:59:30 +0100
Message-ID: <1446735570.3894.105.camel@pengutronix.de>
References: <1446637509-6418-1-git-send-email-p.zabel@pengutronix.de>
 <1446637509-6418-2-git-send-email-p.zabel@pengutronix.de>
 <20151105032806.GA4368@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20151105032806.GA4368@rob-hp-laptop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

QW0gTWl0dHdvY2gsIGRlbiAwNC4xMS4yMDE1LCAyMToyOCAtMDYwMCBzY2hyaWViIFJvYiBIZXJy
aW5nOgo+IE9uIFdlZCwgTm92IDA0LCAyMDE1IGF0IDEyOjQ0OjU4UE0gKzAxMDAsIFBoaWxpcHAg
WmFiZWwgd3JvdGU6Cj4gPiBGcm9tOiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gCj4g
PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgZGlzcGxheSBz
dWJzeXN0ZW0gaW4KPiA+IE1lZGlhdGVrIE1UODE3MyBTb0NzLgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiAKPiBJZiB0aGlzIHdhc24ndCBhbiBS
RkMsIEknZCBhY2sgaXQuIDopIE9uZSB0aGluZyB5b3UgbWlzc2VkIGJlbG93IHRob3VnaC4KCkFs
cmlnaHQsIHRoYW5rcyBmb3IgeW91ciBoZWxwIGluIHNvcnRpbmcgdGhlc2UgYmluZGluZ3Mgb3V0
LgoKWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMC4uY2MzZDg4NAo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKWy4uLl0KPiA+ICtESVNQIGZ1bmN0aW9uIGJs
b2Nrcwo+ID4gKz09PT09PT09PT09PT09PT09PT09Cj4gPiArCj4gPiArQSBkaXNwbGF5IHN0cmVh
bSBzdGFydHMgYXQgYSBzb3VyY2UgZnVuY3Rpb24gYmxvY2sgdGhhdCByZWFkcyBwaXhlbCBkYXRh
IGZyb20KPiA+ICttZW1vcnkgYW5kIGVuZHMgd2l0aCBhIHNpbmsgZnVuY3Rpb24gYmxvY2sgdGhh
dCBkcml2ZXMgcGl4ZWxzIG9uIGEgZGlzcGxheQo+ID4gK2ludGVyZmFjZSwgb3Igd3JpdGVzIHBp
eGVscyBiYWNrIHRvIG1lbW9yeS4gQWxsIERJU1AgZnVuY3Rpb24gYmxvY2tzIGhhdmUKPiA+ICt0
aGVpciBvd24gcmVnaXN0ZXIgc3BhY2UsIGludGVycnVwdCwgYW5kIGNsb2NrIGdhdGUuIFRoZSBi
bG9ja3MgdGhhdCBjYW4KPiA+ICthY2Nlc3MgbWVtb3J5IGFkZGl0aW9uYWxseSBoYXZlIHRvIGxp
c3QgdGhlIElPTU1VIGFuZCBsb2NhbCBhcmJpdGVyIHRoZXkgYXJlCj4gPiArY29ubmVjdGVkIHRv
Lgo+ID4gKwo+ID4gK0ZvciBhIGRlc2NyaXB0aW9uIG9mIHRoZSBkaXNwbGF5IGludGVyZmFjZSBz
aW5rIGZ1bmN0aW9uIGJsb2Nrcywgc2VlCj4gPiArRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2RybS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0IGFuZAo+ID4gK0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kcm0vbWVkaWF0ZWsvbWVkaWF0ZWssZHBpLnR4dC4KPiAK
PiBOZWVkIHRvIHVwZGF0ZSB0aGVzZSBwYXRocy4KCldpbGwgZG8uCgpyZWdhcmRzClBoaWxpcHAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 4/5] dt: add bindings for ZTE tvenc device
Date: Thu, 19 Jan 2017 18:11:17 +0100
Message-ID: <1484845877.24339.51.camel@pengutronix.de>
References: <1484843100-16284-1-git-send-email-shawnguo@kernel.org>
 <1484843100-16284-5-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484843100-16284-5-git-send-email-shawnguo@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Baoyou Xie <xie.baoyou@zte.com.cn>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>
List-Id: devicetree@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDIwLjAxLjIwMTcsIDAwOjI0ICswODAwIHNjaHJpZWIgU2hhd24gR3Vv
Ogo+IEZyb206IFNoYXduIEd1byA8c2hhd24uZ3VvQGxpbmFyby5vcmc+Cj4gCj4gSXQgYWRkcyBi
aW5kaW5ncyBkb2MgZm9yIFpURSBWT1UgVFYgRW5jb2RlciBkZXZpY2UuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU2hhd24gR3VvIDxzaGF3bi5ndW9AbGluYXJvLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvenRlLHZvdS50eHQgfCAxNSArKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvenRlLHZvdS50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS96dGUsdm91LnR4
dAo+IGluZGV4IDc0MGU1YmQyZTRmNy4uOWMzNTYyODQyMzJiIDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3p0ZSx2b3UudHh0Cj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvenRlLHZvdS50eHQKPiBA
QCAtNDksNiArNDksMTUgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgCSJvc2NfY2xrIgo+ICAJ
InhjbGsiCj4gIAo+ICsqIFRWIEVuY29kZXIgb3V0cHV0IGRldmljZQo+ICsKPiArUmVxdWlyZWQg
cHJvcGVydGllczoKPiArIC0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJ6dGUsengyOTY3MTgtdHZl
bmMiCj4gKyAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIFRW
RU5DIGRldmljZSBJTyByZWdpb24KPiArIC0genRlLHR2ZW5jLXBvd2VyLWNvbnRyb2w6IHRoZSBw
aGFuZGxlIHRvIFNZU0NUUkwgYmxvY2sgZm9sbG93ZWQgYnkgdHdvCj4gKyAgIGludGVnZXIgY2Vs
bHMuICBUaGUgZmlyc3QgY2VsbCBpcyB0aGUgb2Zmc2V0IG9mIFNZU0NUUkwgcmVnaXN0ZXIgdXNl
ZAo+ICsgICB0byBjb250cm9sIFRWIEVuY29kZXIgREFDIHBvd2VyLCBhbmQgdGhlIHNlY29uZCBj
ZWxsIGlzIHRoZSBiaXQgbWFzay4KCkkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IHRoaXMgcGxhdGZv
cm0sIGJ1dCBzaG91bGRuJ3QgdGhpcyBiZSBoYW5kbGVkCndpdGggYSBwcm9wZXIgcG93ZXIgZG9t
YWluIGRyaXZlciwgcmF0aGVyIHRoYW4gYmFzaGluZyBiaXRzIGRpcmVjdGx5PwoKUmVnYXJkcywK
THVjYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

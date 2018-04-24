From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 7/7] dt-bindings: tda998x: add the calibration gpio
Date: Tue, 24 Apr 2018 11:27:47 +0200
Message-ID: <201abf9a-74b0-f8db-0950-403f251b15d6@xs4all.nl>
References: <20180409121529.GA31403@n2100.armlinux.org.uk>
 <E1f5Vj1-0002Lx-Hz@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <E1f5Vj1-0002Lx-Hz@rmk-PC.armlinux.org.uk>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gMDQvMDkvMTggMTQ6MTYsIFJ1c3NlbGwgS2luZyB3cm90ZToKPiBBZGQgdGhlIG9wdGlvbmFs
IGNhbGlicmF0aW9uIGdwaW8gZm9yIGludGVncmF0ZWQgVERBOTk1MCBDRUMgc3VwcG9ydC4KPiBU
aGlzIEdQSU8gY29ycmVzcG9uZHMgd2l0aCB0aGUgaW50ZXJydXB0IGZyb20gdGhlIFREQTk5OHgs
IGFzIHRoZQo+IGNhbGlicmF0aW9uIHJlcXVpcmVzIGRyaXZpbmcgdGhlIGludGVycnVwdCBwaW4g
bG93Lgo+IAo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+CgpB
Y2tlZC1ieTogSGFucyBWZXJrdWlsIDxoYW5zLnZlcmt1aWxAY2lzY28uY29tPgoKUmVnYXJkcywK
CglIYW5zCgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvdGRhOTk4eC50eHQgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS90ZGE5OTh4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90ZGE5OTh4LnR4dAo+IGluZGV4IDI0Y2MyNDY2MTg1YS4u
MWE0ZWFjYTQwZDk0IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS90ZGE5OTh4LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90ZGE5OTh4LnR4dAo+IEBAIC0yNyw2ICsy
Nyw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM7Cj4gIAlpbiBxdWVzdGlvbiBpcyB1c2VkLiBUaGUg
aW1wbGVtZW50YXRpb24gYWxsb3dzIG9uZSBvciB0d28gREFJcy4gSWYgdHdvCj4gIAlEQUlzIGFy
ZSBkZWZpbmVkLCB0aGV5IG11c3QgYmUgb2YgZGlmZmVyZW50IHR5cGUuCj4gIAo+ICsgIC0gbnhw
LGNhbGliLWdwaW9zOiBjYWxpYnJhdGlvbiBHUElPLCB3aGljaCBtdXN0IGNvcnJlc3BvbmQgd2l0
aCB0aGUKPiArCWdwaW8gdXNlZCBmb3IgdGhlIFREQTk5OHggaW50ZXJydXB0IHBpbi4KPiArCj4g
IFsxXSBEb2N1bWVudGF0aW9uL3NvdW5kL2Fsc2Evc29jL0RBSS50eHQKPiAgWzJdIGluY2x1ZGUv
ZHQtYmluZGluZ3MvZGlzcGxheS90ZGE5OTh4LmgKPiAgCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

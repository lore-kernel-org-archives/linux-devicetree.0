From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 05/10] dt-bindings: gpio: Add gpio nodes for Actions S900
 SoC
Date: Wed, 21 Feb 2018 19:05:57 +0100
Message-ID: <ac193690-220e-4160-5dd5-6ddeaea4d5d0@suse.de>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
 <20180217204433.3095-6-manivannan.sadhasivam@linaro.org>
 <20180219203523.rhvbnym7oomzahwi@rob-hp-laptop>
 <20180221145821.bhoxjndibp3bqfxi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221145821.bhoxjndibp3bqfxi@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linus.walleij@linaro.org, liuwei@actions-semi.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gMjEuMDIuMjAxOCB1bSAxNTo1OCBzY2hyaWViIE1hbml2YW5uYW4gU2FkaGFzaXZhbToKPiBI
aSBSb2IsCj4gT24gTW9uLCBGZWIgMTksIDIwMTggYXQgMDI6MzU6MjNQTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4+IE9uIFN1biwgRmViIDE4LCAyMDE4IGF0IDAyOjE0OjI4QU0gKzA1MzAs
IE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPj4+IEFkZCBncGlvIG5vZGVzIGZvciBBY3Rp
b25zIFNlbWkgUzkwMCBTb0MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KPj4+IC0tLQo+Pj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vYWN0aW9ucyxvd2wtZ3Bpby50eHQgICAgICAgICB8
IDE1ICsrKysrKysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
Cj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL2FjdGlvbnMsb3dsLWdwaW8udHh0Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2FjdGlvbnMsb3dsLWdwaW8udHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vYWN0aW9ucyxvd2wtZ3Bpby50eHQK
Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjRjZDRjYjdi
ZmQxYgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwaW8vYWN0aW9ucyxvd2wtZ3Bpby50eHQKPj4+IEBAIC0wLDAgKzEsMTUgQEAK
Pj4+ICsqIEFjdGlvbnMgU2VtaSBPV0wgR1BJTyBjb250cm9sbGVyIGJpbmRpbmdzCj4+PiArCj4+
PiArLSBjb21wYXRpYmxlICAgICAgOiBTaG91bGQgYmUgImFjdGlvbnMsczkwMC1ncGlvIgo+Pj4g
Ky0gcmVnICAgICAgICAgICAgIDogQWRkcmVzcyBhbmQgcmFuZ2Ugb2YgdGhlIEdQSU8gY29udHJv
bGxlciByZWdpc3RlcnMuCj4+PiArLSBncGlvLWNvbnRyb2xsZXIgOiBNYXJrcyB0aGUgZGV2aWNl
IG5vZGUgYXMgYSBHUElPIGNvbnRyb2xsZXIuCj4+PiArLSAjZ3Bpby1jZWxscyAgICAgOiBTaG91
bGQgYmUgPDI+LiBUaGUgZmlyc3QgY2VsbCBpcyB0aGUgZ3BpbyBudW1iZXIgYW5kCj4+PiArICAg
ICAgICAgICAgICAgICAgICB0aGUgc2Vjb25kIGNlbGwgaXMgdXNlZCB0byBzcGVjaWZ5IG9wdGlv
bmFsIHBhcmFtZXRlcnMuCj4+Cj4+IERvZXNuJ3QgZG8gaW50ZXJydXB0cz8KPj4KPiBJbnRlcnJ1
cHQgc3VwcG9ydCB3aWxsIGJlIGFkZGVkIG9uY2UgdGhpcyBiYXNlIGRyaXZlciBnZXRzIGluLgo+
IE9uZSBzdGVwIGF0IGEgdGltZSA7LSkKClJvYiByZWplY3RlZCB0aGF0IHN0ZXAtYnktc3RlcCBh
cHByb2FjaCBmb3IgbXkgUkRBIE1pY3JvIGJpbmRpbmdzLCB3aGljaAppcyB3aHkgaXQgaXMgY3Vy
cmVudGx5IHN0dWNrLiA7KQoKUmVnYXJkcywKQW5kcmVhcwoKLS0gClNVU0UgTGludXggR21iSCwg
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CkdGOiBGZWxpeCBJbWVuZMO2
cmZmZXIsIEphbmUgU21pdGhhcmQsIEdyYWhhbSBOb3J0b24KSFJCIDIxMjg0IChBRyBOw7xybmJl
cmcpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==

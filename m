From: "Enrico Weigelt, metux IT consult" <weigelt@melag.de>
Subject: Re: [PATCH 1/2] rtc: mxc: add a second clock
Date: Mon, 18 May 2015 13:27:01 +0200
Message-ID: <5559CC85.5040703@melag.de>
References: <1431729330-7625-1-git-send-email-tremyfr@gmail.com>
 <1431729330-7625-2-git-send-email-tremyfr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431729330-7625-2-git-send-email-tremyfr@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Reynes <tremyfr@gmail.com>, shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rtc-linux@googlegroups.com
Cc: fabio.estevam@freescale.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gMTYuMDUuMjAxNSB1bSAwMDozNSBzY2hyaWViIFBoaWxpcHBlIFJleW5lczoKPiBUaGUgbXhj
IFJUQyBuZWVkcyB0d28gY2xvY2tzLCBvbmUgZm9yIHRoZSBpbnB1dAo+IHJlZmVyZW5jZSwgYW5k
IG9uZSBmb3IgdGhlIElQLiBCdXQgdGhpcyBkcml2ZXIKPiB3YXMgb25seSB1c2luZyBvbmUgY2xv
Y2sgKGZvciB0aGUgcmVmZXJlbmNlKS4KPiBUaGlzIHBhdGNoIGFkZCB0aGUgc2Vjb25kIGNsb2Nr
IChmb3IgdGhlIElQKS4KCgpEb2VzIHRoaXMgYWxzbyBhcHBseSB0byBNWDUzLCBvciBqdXN0IE1Y
MjEgPwoKCmdyZWV0aW5ncywKLS0KRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQKKzQ5
LTE1MS0yNzU2NTI4NwpNRUxBRyBNZWRpemludGVjaG5payBvSEcgU2l0eiBCZXJsaW4gUmVnaXN0
ZXJnZXJpY2h0IEFHIENoYXJsb3R0ZW5idXJnIEhSQSAyMTMzMyBCCgpXaWNodGlnZXIgSGlud2Vp
czogRGllc2UgTmFjaHJpY2h0IGthbm4gdmVydHJhdWxpY2hlIG9kZXIgbnVyIGbDvHIgZWluZW4g
YmVncmVuenRlbiBQZXJzb25lbmtyZWlzIGJlc3RpbW10ZSBJbmZvcm1hdGlvbmVuIGVudGhhbHRl
bi4gU2llIGlzdCBhdXNzY2hsaWXDn2xpY2ggZsO8ciBkZW5qZW5pZ2VuIGJlc3RpbW10LCBhbiBk
ZW4gc2llIGdlcmljaHRldCB3b3JkZW4gaXN0LiBXZW5uIFNpZSBuaWNodCBkZXIgQWRyZXNzYXQg
ZGllc2VyIEUtTWFpbCBzaW5kLCBkw7xyZmVuIFNpZSBkaWVzZSBuaWNodCBrb3BpZXJlbiwgd2Vp
dGVybGVpdGVuLCB3ZWl0ZXJnZWJlbiBvZGVyIHNpZSBnYW56IG9kZXIgdGVpbHdlaXNlIGluIGly
Z2VuZGVpbmVyIFdlaXNlIG51dHplbi4gU29sbHRlbiBTaWUgZGllc2UgRS1NYWlsIGlycnTDvG1s
aWNoIGVyaGFsdGVuIGhhYmVuLCBzbyBiZW5hY2hyaWNodGlnZW4gU2llIGJpdHRlIGRlbiBBYnNl
bmRlciwgaW5kZW0gU2llIGF1ZiBkaWVzZSBOYWNocmljaHQgYW50d29ydGVuLiBCaXR0ZSBsw7Zz
Y2hlbiBTaWUgaW4gZGllc2VtIEZhbGwgZGllc2UgTmFjaHJpY2h0IHVuZCBhbGxlIEFuaMOkbmdl
LCBvaG5lIGVpbmUgS29waWUgenUgYmVoYWx0ZW4uCkltcG9ydGFudCBOb3RpY2U6IFRoaXMgbWVz
c2FnZSBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbi4g
SXQgaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBpdCB3YXMgYWRkcmVzc2VkIHRvLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWwgeW91IG1h
eSBub3QgY29weSwgZm9yd2FyZCwgZGlzY2xvc2Ugb3Igb3RoZXJ3aXNlIHVzZSBpdCBvciBhbnkg
cGFydCBvZiBpdCBpbiBhbnkgZm9ybSB3aGF0c29ldmVyLiBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBl
bWFpbCBpbiBlcnJvciBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHlpbmcgYW5kIGRl
bGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyB3aXRob3V0IHJldGFpbmluZyBh
IGNvcHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==

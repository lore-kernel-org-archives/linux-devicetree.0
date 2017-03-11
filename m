From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for TP-LINK Archer C5 V2
Date: Sat, 11 Mar 2017 13:05:11 -0800
Message-ID: <855bc957-8a04-47d6-3355-b641c8f393ad@gmail.com>
References: <20170311121453.18534-1-zajec5@gmail.com>
 <20170311172309.GC15842@lunn.ch>
 <CACna6rzxaqnLShMQRovv4Cr5s6XKSG0NQ2RRrQ+TeePt59bG7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACna6rzxaqnLShMQRovv4Cr5s6XKSG0NQ2RRrQ+TeePt59bG7A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, John Crispin <john@phrozen.org>, Rafa?? Mi??ecki <rafal@milecki.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgpPbiAwMy8xMS8yMDE3IDA5OjI3IEFNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gSGkgQW5k
cmV3LAo+IAo+IE9uIDExIE1hcmNoIDIwMTcgYXQgMTg6MjMsIEFuZHJldyBMdW5uIDxhbmRyZXdA
bHVubi5jaD4gd3JvdGU6Cj4+IE9uIFNhdCwgTWFyIDExLCAyMDE3IGF0IDAxOjE0OjUzUE0gKzAx
MDAsIFJhZmE/PyBNaT8/ZWNraSB3cm90ZToKPj4+IEZyb206IFJhZmE/PyBNaT8/ZWNraSA8cmFm
YWxAbWlsZWNraS5wbD4KPj4+Cj4+PiBUaGlzIGlzIEJDTTQ3MDgxQTAgYmFzZWQgaG9tZSByb3V0
ZXIgd2l0aCBCQ000MzIxNyBhbmQgQkNNNDM1MiB3aXJlbGVzcwo+Pj4gY2hpcHNldHMuCj4+Cj4+
IEhhdmUgeW91IG1hZGUgYW55IHByb2dyZXNzIHdpdGggdGhlIEV0aGVybmV0IHN3aXRjaD8gRG9l
cyBhbnlib2R5IGtub3cKPj4gaWYgaXQgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBTRjIvQjUzIERT
QSBkcml2ZXI/Cj4+Cj4+IEkgaGF2ZSBhIERJUiA4NjBsIHYxIHJvdXRlciwgdXNpbmcgdGhlIHNh
bWUgY2hpcHNldC4gSSdtIGludGVyZXN0ZWQgaW4KPj4gdGhlIHN3aXRjaCwgZ2l2ZW4gbXkgRFNB
IG1haW50YWluZXIgcm9sZS4KPiAKPiBJIG1vc3RseSB3b3JrIHdpdGggTEVERS4gSnVzdCBmZXcg
ZGF5cyBhZ28gSSBtYW5hZ2VkIGdldCBrZXJuZWwgNC45Cj4gcnVubmluZyBzdGFibGUgKHRoZXJl
IHdhcyBhIG1lbW9yeSBjb3JydXB0aW9uIGNhdXNlZCBieSBpcHJvYyBQQ0llCj4gY29udHJvbGxl
ciBkcml2ZXIpLiBXaXRoIGtlcm5lbCA0LjkgSSBjYW4gZmluYWxseSBzdGFydCB0ZXN0aW5nIGI1
My4gSQo+IHNob3VsZCBoYXZlIHNvbWUgbmV3cyB3aXRoaW5nIG5ldyB3ZWVrcy4KCkZZSSwgdGhl
IGluaXRpYWwgYjUzIHdvcmsgd2FzIGRvbmUgYnkgdGVzdGluZyBvbjoKLSBCQ001MzAxMCAoU1I0
MDBBQykgYW5kIEJDTTUzMDEyIChCQ005NTMwMTJFUikKLSBCQ001ODI2NSAoTm9ydGhzdGFyIFBs
dXMpCi0gZXh0ZXJuYWxseSBhdHRhY2hlZCBCQ001MzEyNSB0byBhIEJDTTc0NDUKClNvIGxldCBt
ZSBrbm93IGlmIHlvdSBuZWVkIGd1aWRhbmNlL2hlbHAgd2l0aCBnZXR0aW5nIHRoZSA0NzA4LzUz
MDFYCmRldmljZXMgdG8gd29yay4KLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

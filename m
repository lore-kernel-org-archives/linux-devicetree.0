From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: add mtk-timer bindings
Date: Tue, 13 May 2014 06:08:07 -0700
Message-ID: <2e93c984-96d9-4504-bb9a-672a247fb710@BL2FFO11FD034.protection.gbl>
References: <1399938570-11356-1-git-send-email-matthias.bgg@gmail.com>
 <1399938570-11356-3-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1399938570-11356-3-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, linux-doc@vger.kernel.org, thierry.reding@gmail.com, heiko.stuebner@bq.com, linux@arm.linux.org.uk, arnd@arndb.de, daniel.lezcano@linaro.org, florian.vaussard@epfl.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, robh+dt@kernel.org, gregory.clement@free-electrons.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, silvio.fricke@gmail.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

SGkgTWF0dGhpYXMsCgpPbiBUdWUsIDIwMTQtMDUtMTMgYXQgMDE6NDlBTSArMDIwMCwgTWF0dGhp
YXMgQnJ1Z2dlciB3cm90ZToKPiBBZGQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgR2Vu
ZXJhbCBQb3Jwb3NlIFRpbWVyIGRyaXZlciBvZgo+IHRoZSBNZWRpYXRlayBTb0NzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4g
LS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50
eHQgICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvbWVkaWF0ZWssbXRr
LXRpbWVyLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uZDBmMmRm
Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdGltZXIvbWVkaWF0ZWssbXRrLXRpbWVyLnR4dAo+IEBAIC0wLDAgKzEsMTggQEAKPiArTWVk
aWF0ZWsgTVQ2NTg5LCBNVDY1NzcgYW5kIE1UNjU3MiBUaW1lcnMKPiArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICst
IGNvbXBhdGlibGU6IFNob3VsZCBiZSAibWVkaWF0ZWssbXRrNjU4OS10aW1lciIKPiArLSByZWc6
IFNob3VsZCBjb250YWluIGxvY2F0aW9uIGFuZCBsZW5ndGggZm9yIHRpbWVycyByZWdpc3Rlci4K
PiArLSBjbG9ja3M6IHBoYW5kbGUgdG8gdGhlIGNsb2NrIHNvdXJjZTsgdGhlIGZpcnN0IHJlZmVy
cyB0byBhIDEzIE1IeiBmaXhlZAo+ICsJCXN5c3RlbSBjbG9jayBhbmQgdGhlIHNlY29uZCBoYW5k
bGUgdG8gYSAzMiBLSHogZml4ZWQgUlRDCj4gKwkJY2xvY2suCgpBcmUgdGhlc2UgZnJlcXVlbmNp
ZXMgbWFuZGF0b3J5IHRvIHRoZSB0aW1lciBvciBhbiBpbXBsZW1lbnRhdGlvbgpkZXRhaWwgb2Yg
dGhlIFNPQyB5b3UncmUgd29ya2luZyB3aXRoPyBJIHN1c3BlY3QsIGl0IG1pZ2h0IGJlIHBvc3Np
YmxlCnRvIHNlZSB0aGUgc2FtZSB0aW1lciBpbiBhIGRpZmZlcmVudCBTT0MgaW1wbGVtZW50YXRp
b24gd2l0aCBkaWZmZXJlbnQKZnJlcXVlbmNpZXM/IEluIHRoYXQgY2FzZSAtIG9yIHByb2JhYmx5
IGluIGdlbmVyYWwgLSB0aGUgZnJlcXVlbmNpZXMKc2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBi
aW5kaW5nLCBJTUhPLgoKPiArCj4gK0V4YW1wbGVzOgo+ICsKPiArCXRpbWVyIHsKPiArCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10azY1ODktdGltZXIiOwo+ICsJCXJlZyA9IDwweDEwMDA4MDAw
IDB4ODA+Owo+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTMgSVJRX1RZUEVfTEVWRUxfTE9X
PjsKPiArCQljbG9ja3MgPSA8JnN5c3RlbV9jbGs+LCA8JnJ0Y19jbGs+OwoKTWlnaHQgYmUganVz
dCBteSBwZXJzb25hbCBwcmVmZXJlbmNlLCBidXQgeW91IGNvdWxkIGFsc28gYWRkIHRoZSBjbG9j
ay1uYW1lcwpwcm9wZXJ0eSB3aGljaCB3b3VsZCByZWxheCB0aGUgb3JkZXJpbmcgcmVxdWlyZW1l
bnQgYSBiaXQgYW5kIHdvdWxkCmNsZWFybHkgIGlkZW50aWZ5IHRoZSBJUCdzIGNsb2Nrcy4KCglT
w7ZyZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK

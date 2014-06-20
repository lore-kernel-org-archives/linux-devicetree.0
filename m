From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v9 3/3] dt-bindings: add mtk-timer bindings
Date: Fri, 20 Jun 2014 13:36:02 +0100
Message-ID: <20140620123602.GK30188@leverpostej>
References: <1403264929-21325-1-git-send-email-matthias.bgg@gmail.com>
 <1403264929-21325-4-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1403264929-21325-4-git-send-email-matthias.bgg@gmail.com>
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "heiko.stuebner@bq.com" <heiko.stuebner@bq.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "shawn.guo@freescale.com" <shawn.guo@freescale.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "florian.vaussard@epfl.ch" <florian.vaussard@epfl.ch>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "anders.berg@lsi.com" <anders.berg@lsi.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Marc
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKdW4gMjAsIDIwMTQgYXQgMTI6NDg6NDlQTSArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dl
ciB3cm90ZToKPiBBZGQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgR2VuZXJhbCBQb3Jw
b3NlIFRpbWVyIGRyaXZlciBvZgo+IHRoZSBNZWRpYXRlayBTb0NzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQWNrZWQtYnk6
IFPDtnJlbiBCcmlua21hbm4gPHNvcmVuLmJyaW5rbWFubkB4aWxpbnguY29tPgo+IEFja2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvdGlt
ZXIvbWVkaWF0ZWssbXRrLXRpbWVyLnR4dCAgICAgICAgICB8ICAgMTggKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvbWVkaWF0ZWssbXRr
LXRpbWVyLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvbWVkaWF0ZWssbXRrLXRpbWVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aW1lci9tZWRpYXRlayxtdGstdGltZXIudHh0Cj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi4xMGI3ZTA5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9tZWRpYXRlayxtdGstdGlt
ZXIudHh0Cj4gQEAgLTAsMCArMSwxOCBAQAo+ICtNZWRpYXRlayBNVDY1NzcsIE1UNjU3MiBhbmQg
TVQ2NTg5IFRpbWVycwo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogU2hvdWxkIGJlICJt
ZWRpYXRlayxtdDY1NzctdGltZXIiCj4gKy0gcmVnOiBTaG91bGQgY29udGFpbiBsb2NhdGlvbiBh
bmQgbGVuZ3RoIGZvciB0aW1lcnMgcmVnaXN0ZXIuCj4gKy0gY2xvY2tzOiBDbG9ja3MgZHJpdmlu
ZyB0aGUgdGltZXIgaGFyZHdhcmUuIFRoaXMgbGlzdCBzaG91bGQgaW5jbHVkZSB0d28KPiArCWNs
b2Nrcy4gVGhlIG9yZGVyIGlzIHN5c3RlbSBjbG9jayBhbmQgYXMgc2Vjb25kIGNsb2NrIHRoZSBS
VEMgY2xvY2suCj4gKwo+ICtFeGFtcGxlczoKPiArCj4gKwl0aW1lckAxMDAwODAwMCB7Cj4gKwkJ
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY1NzctdGltZXIiOwo+ICsJCXJlZyA9IDwweDEwMDA4
MDAwIDB4ODA+Owo+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTMgSVJRX1RZUEVfTEVWRUxf
TE9XPjsKPiArCQljbG9ja3MgPSA8JnN5c3RlbV9jbGs+LCA8JnJ0Y19jbGs+Owo+ICsJCWNsb2Nr
LW5hbWVzID0gInN5c3RlbS1jbGsiLCAicnRjLWNsayI7CgpUaGVzZSBuYW1lcyBzaG91bGQgYmUg
bWVudGlvbmVkIGFib3ZlLCBvciByZW1vdmVkLgoKVGhpcyBsb29rcyBmaW5lIG90aGVyd2lzZS4K
Ck1hcmsuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==

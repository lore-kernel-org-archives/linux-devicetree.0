From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v9 3/3] dt-bindings: add mtk-timer bindings
Date: Tue, 1 Jul 2014 19:46:32 +0200
Message-ID: <CABuKBeKknz7OEyffKOGK=yk7ZH7fj7Jf9fgPhw2VGbTC-p21qw@mail.gmail.com>
References: <1403264929-21325-1-git-send-email-matthias.bgg@gmail.com>
 <1403264929-21325-4-git-send-email-matthias.bgg@gmail.com>
 <20140620123602.GK30188@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140620123602.GK30188@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "anders.berg@lsi.com" <anders.berg@lsi.com>, "heiko.stuebner@bq.com" <heiko.stuebner@bq.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "shawn.guo@freescale.com" <shawn.guo@freescale.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "florian.vaussard@epfl.ch" <florian.vaussard@epfl.ch>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "arnd@arndb.de" <arnd@arndb.de>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Marc
List-Id: devicetree@vger.kernel.org

MjAxNC0wNi0yMCAxNDozNiBHTVQrMDI6MDAgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT46Cj4gT24gRnJpLCBKdW4gMjAsIDIwMTQgYXQgMTI6NDg6NDlQTSArMDEwMCwgTWF0dGhp
YXMgQnJ1Z2dlciB3cm90ZToKPj4gQWRkIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEdl
bmVyYWwgUG9ycG9zZSBUaW1lciBkcml2ZXIgb2YKPj4gdGhlIE1lZGlhdGVrIFNvQ3MuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+
Cj4+IEFja2VkLWJ5OiBTw7ZyZW4gQnJpbmttYW5uIDxzb3Jlbi5icmlua21hbm5AeGlsaW54LmNv
bT4KPj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAg
Li4uL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50eHQgICAgICAgICAgfCAgIDE4
ICsrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykK
Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGltZXIvbWVkaWF0ZWssbXRrLXRpbWVyLnR4dAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvbWVkaWF0ZWssbXRrLXRpbWVy
LnR4dAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwLi4xMGI3ZTA5Cj4+
IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RpbWVyL21lZGlhdGVrLG10ay10aW1lci50eHQKPj4gQEAgLTAsMCArMSwxOCBAQAo+PiArTWVk
aWF0ZWsgTVQ2NTc3LCBNVDY1NzIgYW5kIE1UNjU4OSBUaW1lcnMKPj4gKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiArCj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+
PiArLSBjb21wYXRpYmxlOiBTaG91bGQgYmUgIm1lZGlhdGVrLG10NjU3Ny10aW1lciIKPj4gKy0g
cmVnOiBTaG91bGQgY29udGFpbiBsb2NhdGlvbiBhbmQgbGVuZ3RoIGZvciB0aW1lcnMgcmVnaXN0
ZXIuCj4+ICstIGNsb2NrczogQ2xvY2tzIGRyaXZpbmcgdGhlIHRpbWVyIGhhcmR3YXJlLiBUaGlz
IGxpc3Qgc2hvdWxkIGluY2x1ZGUgdHdvCj4+ICsgICAgIGNsb2Nrcy4gVGhlIG9yZGVyIGlzIHN5
c3RlbSBjbG9jayBhbmQgYXMgc2Vjb25kIGNsb2NrIHRoZSBSVEMgY2xvY2suCj4+ICsKPj4gK0V4
YW1wbGVzOgo+PiArCj4+ICsgICAgIHRpbWVyQDEwMDA4MDAwIHsKPj4gKyAgICAgICAgICAgICBj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjU3Ny10aW1lciI7Cj4+ICsgICAgICAgICAgICAgcmVn
ID0gPDB4MTAwMDgwMDAgMHg4MD47Cj4+ICsgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDExMyBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+PiArICAgICAgICAgICAgIGNsb2NrcyA9IDwm
c3lzdGVtX2Nsaz4sIDwmcnRjX2Nsaz47Cj4+ICsgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAi
c3lzdGVtLWNsayIsICJydGMtY2xrIjsKPgo+IFRoZXNlIG5hbWVzIHNob3VsZCBiZSBtZW50aW9u
ZWQgYWJvdmUsIG9yIHJlbW92ZWQuCgpJIGFkZGVkIHRoZSBjbG9jay1uYW1lcyB0byBtYWtlIGl0
IHRoZSBjbG9jayBvcmRlciBjbGVhcmVyLCBhcyBpdCBpcwpkb25lIGluIHRoZSBhcm0gc3AsODA0
IFsxXS4KQnV0IEkgdGhpbmsgaXQgaXMgY2xlYXIgZW5vdWdoIHRocm91Z2ggdGhlIHBoYW5kbGUg
bmFtZXMgYW5kIHRoZQpkZXNjcmlwdGlvbiBvZiB0aGUgY2xvY2tzIHByb3BlcnR5LgpTbyBJIHdp
bGwgZGVsZXRlIHRoZSBjbG9jay1uYW1lcyBpbiB0aGUgdjEwIHJvdW5kLgoKQ2hlZXJzLApNYXR0
aGlhcwoKWzFdIGh0dHA6Ly9seHIuZnJlZS1lbGVjdHJvbnMuY29tL3NvdXJjZS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvYXJtLHNwODA0LnR4dAoKPgo+IFRoaXMgbG9v
a3MgZmluZSBvdGhlcndpc2UuCj4KPiBNYXJrLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKCgotLSAKbW90emJs
b2cud29yZHByZXNzLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=

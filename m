From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH RFC 3/5] ARM: dts: at91-sama5d4: use IRQ_TYPE_* to specify
 irq flags
Date: Fri, 26 May 2017 21:17:37 +0200
Message-ID: <8bbb5802-518b-6ae1-6ea2-642b1f0b3d2e@denx.de>
References: <20170526180609.2699-1-uwe@kleine-koenig.org>
 <20170526180609.2699-3-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170526180609.2699-3-uwe@kleine-koenig.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMDUvMjYvMjAxNyAwODowNiBQTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gQWNjb3Jk
aW5nIHRvIHRoZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gYW5kIHRoZSBzb3VyY2UgY29kZSB0aGUg
YXRtZWwtZ3Bpbwo+IGNvbnRyb2xsZXIgdGFrZXMgSVJRX1RZUEVfKiBhcyBpdHMgZmxhZ3MgdmFs
dWVzLCBub3QgR1BJT19BQ1RJVkVfKi4KPiAKPiBUaGlzIHBhdGNoIHVzZXMgdGhlIHJpZ2h0IHZh
cmlhYmxlIHR5cGUgd2hpY2ggeWllbGRzIHRoZSBzYW1lIHJlc3VsdAo+IHdoZW4gY29tcGlsZWQu
IE5vdGUgdGhhdCB0aGlzIG1pZ2h0IGJlIHdyb25nIGFuZCBhY3R1YWxseQo+IElSUV9UWVBFX0xF
VkVMX0xPVyBpcyBpbnRlbmRlZCBieSB0aGUgZHQgYXV0aG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5vcmc+Cj4gLS0tCj4gSGVsbG8s
Cj4gCj4gY2FuIHNvbWVib2R5IHdpdGggdGhlIGhhcmR3YXJlIG9yIGl0J3MgZG9jdW1lbnRhdGlv
biBwbGVhc2UgY2hlY2sgd2hpY2gKPiBmbGFnIGlzIHRoZSByaWdodCBvbmU/CgpJdCdzIGNvcnJl
Y3QsIEkgdGVzdGVkIHRoZSBDQU4sIHNvOgoKQWNrZWQtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPgoKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXQ5
MS1zYW1hNWQ0X21hNWQ0LmR0c2kgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXQ5MS1zYW1hNWQ0X21hNWQ0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1
ZDRfbWE1ZDQuZHRzaQo+IGluZGV4IGI1YTVhOTFiYzJlZi4uYjgxM2ZkZmEyODQyIDEwMDY0NAo+
IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkNF9tYTVkNC5kdHNpCj4gKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW1hNWQ0X21hNWQ0LmR0c2kKPiBAQCAtNzUsNyArNzUs
NyBAQAo+ICAJCQkJCXJlZyA9IDwwPjsKPiAgCQkJCQljbG9ja3MgPSA8JmNsazIwbT47Cj4gIAkJ
CQkJaW50ZXJydXB0LXBhcmVudCA9IDwmcGlvRT47Cj4gLQkJCQkJaW50ZXJydXB0cyA9IDw2IEdQ
SU9fQUNUSVZFX0xPVz47Cj4gKwkJCQkJaW50ZXJydXB0cyA9IDw2IElSUV9UWVBFX0VER0VfUklT
SU5HPjsKPiAgCQkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMD47Cj4gIAkJCQl9Owo+
ICAKPiBAQCAtODQsNyArODQsNyBAQAo+ICAJCQkJCXJlZyA9IDwxPjsKPiAgCQkJCQljbG9ja3Mg
PSA8JmNsazIwbT47Cj4gIAkJCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmcGlvRT47Cj4gLQkJCQkJ
aW50ZXJydXB0cyA9IDw3IEdQSU9fQUNUSVZFX0xPVz47Cj4gKwkJCQkJaW50ZXJydXB0cyA9IDw3
IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiAgCQkJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAw
MDAwMD47Cj4gIAkJCQl9Owo+ICAJCQl9Owo+IAoKCi0tIApCZXN0IHJlZ2FyZHMsCk1hcmVrIFZh
c3V0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==

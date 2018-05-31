From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v4 5/5] ARM: dts: imx6qdl: add missing compatible and
 clock properties for EPIT
Date: Thu, 31 May 2018 11:33:43 +0300
Message-ID: <a4042956-24e1-6132-4606-b5b8f4e30023@mentor.com>
References: <20180530120327.27681-1-peron.clem@gmail.com>
 <20180530120327.27681-6-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180530120327.27681-6-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

T24gMDUvMzAvMjAxOCAwMzowMyBQTSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEZyb206IENv
bGluIERpZGllciA8Y29saW4uZGlkaWVyQGRldmlhbGV0LmNvbT4KPiAKPiBBZGQgbWlzc2luZyBj
b21wYXRpYmxlIGFuZCBjbG9jayBwcm9wZXJ0aWVzIGZvciBFUElUIG5vZGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ29saW4gRGlkaWVyIDxjb2xpbi5kaWRpZXJAZGV2aWFsZXQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IFBlcm9uIDxjbGVtZW50LnBlcm9uQGRldmlhbGV0LmNvbT4KPiBS
ZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPgo+IC0tLQo+
ICBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kgfCAxMCArKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDZxZGwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaQo+IGlu
ZGV4IGMwMDNlNjJiZjI5MC4uMGZlZWM1MTY4NDdhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDZxZGwuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRz
aQo+IEBAIC04NDQsMTMgKzg0NCwyMyBAQAo+ICAJCQl9Owo+ICAKPiAgCQkJZXBpdDE6IGVwaXRA
MjBkMDAwMCB7IC8qIEVQSVQxICovCgplcGl0MTogdGltZXJAMjBkMDAwMCB7IC4uLgoKQW5kIC8q
IEVQSVQxICovIGNvbW1lbnQgY2FuIGJlIHJlbW92ZWQsIGl0IGlzIHF1aXRlIGNsZWFyIGZyb20g
dGhlIHNhbWUKbGluZSBjb250ZXh0LgoKRm9ybWFsbHkgaXQgaXMgYSBzdWJqZWN0IHRvIGFub3Ro
ZXIgcGF0Y2gsIGJ1dCBJIHRoaW5rIHRoaXMgY2FuIGJlCmFjY2VwdGVkIGFzIGEgcGFydCBvZiB0
aGlzIG9uZS4KCj4gKwkJCQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1lcGl0IiwgImZzbCxpbXgz
MS1lcGl0IjsKPiAgCQkJCXJlZyA9IDwweDAyMGQwMDAwIDB4NDAwMD47Cj4gIAkJCQlpbnRlcnJ1
cHRzID0gPDAgNTYgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJCQljbG9ja3MgPSA8JmNsa3Mg
SU1YNlFETF9DTEtfSVBHX1BFUj4sCj4gKwkJCQkJIDwmY2xrcyBJTVg2UURMX0NMS19FUElUMT47
Cj4gKwkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKPiArCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7Cj4gIAkJCX07Cj4gIAo+ICAJCQllcGl0MjogZXBpdEAyMGQ0MDAwIHsgLyogRVBJVDIg
Ki8KClNhbWUgYXMgYWJvdmUuCgo+ICsJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnEtZXBpdCIs
ICJmc2wsaW14MzEtZXBpdCI7Cj4gIAkJCQlyZWcgPSA8MHgwMjBkNDAwMCAweDQwMDA+Owo+ICAJ
CQkJaW50ZXJydXB0cyA9IDwwIDU3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQkJY2xvY2tz
ID0gPCZjbGtzIElNWDZRRExfQ0xLX0lQR19QRVI+LAo+ICsJCQkJCSA8JmNsa3MgSU1YNlFETF9D
TEtfRVBJVDI+Owo+ICsJCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7Cj4gKwkJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+ICAJCQl9Owo+ICAKPiAgCQkJc3JjOiBzcmNAMjBkODAwMCB7Cj4g
CgotLQpXaXRoIGJlc3Qgd2lzaGVzLApWbGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH RFC v2 05/14] ARM: imx6q: clk: Add the video_27m clock
Date: Thu, 18 Dec 2014 11:31:15 +0100
Message-ID: <1418898675.4212.10.camel@pengutronix.de>
References: <1418886696-11636-1-git-send-email-Ying.Liu@freescale.com>
 <1418886696-11636-6-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418886696-11636-6-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liu Ying <Ying.Liu@freescale.com>
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRG9ubmVyc3RhZywgZGVuIDE4LjEyLjIwMTQsIDE1OjExICswODAwIHNjaHJpZWIgTGl1IFlp
bmc6Cj4gVGhpcyBwYXRjaCBzdXBwb3J0cyB0aGUgdmlkZW9fMjdtIGNsb2NrIHdoaWNoIGlzIGEg
Zml4ZWQgZmFjdG9yCj4gY2xvY2sgb2YgdGhlIHBsbDNfcGZkMV81NDBtIGNsb2NrLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IExpdSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgo+IC0tLQo+IHYx
LT52MjoKPiAgKiBOb25lLgo+IAo+ICBhcmNoL2FybS9tYWNoLWlteC9jbGstaW14NnEuYyAgICAg
ICAgICAgICB8IDEgKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDZxZGwtY2xvY2su
aCB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtaW14L2Nsay1pbXg2cS5jIGIvYXJj
aC9hcm0vbWFjaC1pbXgvY2xrLWlteDZxLmMKPiBpbmRleCA0ZTc5ZGE3Li45NDcwZGYzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtaW14L2Nsay1pbXg2cS5jCj4gKysrIGIvYXJjaC9hcm0v
bWFjaC1pbXgvY2xrLWlteDZxLmMKPiBAQCAtMjQ2LDYgKzI0Niw3IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBpbXg2cV9jbG9ja3NfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKmNjbV9ub2RlKQo+ICAJ
Y2xrW0lNWDZRRExfQ0xLX1BMTDNfNjBNXSAgPSBpbXhfY2xrX2ZpeGVkX2ZhY3RvcigicGxsM182
MG0iLCAgInBsbDNfdXNiX290ZyIsICAgMSwgOCk7Cj4gIAljbGtbSU1YNlFETF9DTEtfVFdEXSAg
ICAgICA9IGlteF9jbGtfZml4ZWRfZmFjdG9yKCJ0d2QiLCAgICAgICAiYXJtIiwgICAgICAgICAg
ICAxLCAyKTsKPiAgCWNsa1tJTVg2UURMX0NMS19HUFRfM01dICAgID0gaW14X2Nsa19maXhlZF9m
YWN0b3IoImdwdF8zbSIsICAgICJvc2MiLCAgICAgICAgICAgIDEsIDgpOwo+ICsJY2xrW0lNWDZR
RExfQ0xLX1ZJREVPXzI3TV0gPSBpbXhfY2xrX2ZpeGVkX2ZhY3RvcigidmlkZW9fMjdtIiwgInBs
bDNfcGZkMV81NDBtIiwgMSwgMjApOwoKVGhlIEhETUkgVFggaXNmciBjbG9jayBpbnB1dCBpcyBz
b3VyY2VkIGZyb20gdmlkZW9fMjdtLCB0b28sIGFjY29yZGluZwp0byBUYWJsZSAzMy0xICJIRE1J
IGNsb2NrcyIuCkkgdGhpbmsgdGhlIHBhcmVudCBvZiBjbGtbSU1YNlFETF9DTEtfSERNSV9JU0ZS
XSBzaG91bGQgYmUgY2hhbmdlZCBmcm9tCiJwbGwzX3BmZDFfNTQwbSIgdG8gInZpZGVvXzI3bSIs
IHRoZW4uCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==

From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add QuadSPI controller
Date: Tue, 29 Jan 2019 16:54:23 +0000
Message-ID: <3ff2f0d6-07d2-9ed4-878f-011406f09da3@baylibre.com>
References: <20190129163457.7107-1-ccaione@baylibre.com>
 <1548780179.6869.9.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548780179.6869.9.camel@pengutronix.de>
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
To: Lucas Stach <l.stach@pengutronix.de>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMjkvMDEvMjAxOSAxNjo0MiwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gSGkgQ2FybG8sCgpIaSBM
dWNhcywKCj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNp
Cj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCj4+IEBA
IC01MTYsNiArNTE2LDE5IEBACj4+PiAgwqAJCQl9Owo+Pj4gIMKgCQl9Owo+PiAgIAo+PiArCQlz
cGkwOiBzcGlAMzBiYjAwMDAgewo+IAo+IDMwYmIwMDAwIGlzIHBhcnQgb2YgdGhlIEFJUFMzIGJ1
cyBhZGRyZXNzIHNwYWNlLCBzbyBwbGVhc2UgbW92ZSB0aGlzIHRvCj4gdGhlIGNvcnJlY3QgbG9j
YXRpb24gd2l0aGluIHRoaXMgYnVzIG5vZGUuCgpUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSAiUXVh
ZFNQSS1tZW1vcnkiIHJlZ2lvbiBkb2Vzbid0IGZhbGwgd2l0aGluIHRoZSAKbWVtb3J5IHJhbmdl
IG9mIHRoZSBBSVBTMyBidXMsIHNvIHRoZSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UgaXMgZmFpbGlu
ZyAKd2hlbiBtb3ZpbmcgdGhlIG5vZGUgdGhlcmUuCgo+PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsJCQljb21wYXRpYmxlID0gImZzbCxp
bXg3ZC1xc3BpIjsKPiAKPiBQbGVhc2UgYWRkIGEgImZzbCxpbXg4bXEtcXNwaSIgY29tcGF0aWJs
ZSBoZXJlLCBhcyB3YXMgZG9uZSB3aXRoIGFsbAo+IHRoZSBvdGhlciBub2RlcyBpbiB0aGlzIGZp
bGUsIHNvIHdlIGNhbiBtYXRjaCB0aGlzIGluIHRoZSBkcml2ZXIgc2hvdWxkCj4gdGhlIG5lZWQg
YXJpc2UuCgpUaGlzIGlzIG9kZCBzaW5jZSBhdCBsZWFzdCBmb3IgdGhlIEFtTG9naWMgU29DcyB3
ZSBhcmUgZ29pbmcgZXhhY3RseSBpbiAKdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiB3aGVyZSB3ZSBh
dm9pZCB0byBhZGQgdW5uZWNlc3NhcnkgY29tcGF0aWJsZXMgaWYgCnRoYXQncyBub3Qgc3RyaWN0
bHkgcmVxdWlyZWQuCgo+PiArCQkJcmVnID0gPDB4MzBiYjAwMDAgMHgxMDAwMD4sIDwweDA4MDAw
MDAwIDB4MTAwMDAwMDA+Owo+Pj4gKwkJCXJlZy1uYW1lcyA9ICJRdWFkU1BJIiwgIlF1YWRTUEkt
bWVtb3J5IjsKPj4+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTA3IElSUV9UWVBFX0xFVkVM
X0hJR0g+Owo+Pj4gKwkJCWNsb2NrcyA9IDwmY2xrIElNWDhNUV9DTEtfUVNQSV9ST09UPiwKPj4g
KwkJCTwmY2xrIElNWDhNUV9DTEtfUVNQSV9ST09UPjsKPiAKPiBQbGVhc2UgYWxpZ24gdGhlIHNl
Y29uZCBjbG9jayByZWZlcmVuY2UsIGFzIGlzIGRvbmUgZm9yIGFsbCBvdGhlcgo+IHBlcmlwaGVy
YWwgbm9kZXMgaW4gdGhpcyBmaWxlLgoKSSdsbCBkby4KCkNoZWVycywKCi0tCkNhcmxvIENhaW9u
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwK

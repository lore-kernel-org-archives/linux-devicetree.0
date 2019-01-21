From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/10] usb: ehci-orion: avoid double PHY initialization
Date: Mon, 21 Jan 2019 11:00:47 +0100
Message-ID: <20190121110047.7654a67e@xps13>
References: <20190111133133.24803-1-miquel.raynal@bootlin.com>
 <20190111133133.24803-4-miquel.raynal@bootlin.com>
 <ffb3d79a-a506-5bda-402e-98e67d52933f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ffb3d79a-a506-5bda-402e-98e67d52933f@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgU2VyZ2VpLAoKU2VyZ2VpIFNodHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAY29nZW50ZW1iZWRk
ZWQuY29tPiB3cm90ZSBvbiBGcmksIDExCkphbiAyMDE5IDIxOjAzOjAxICswMzAwOgoKPiBIZWxs
byEKPiAKPiBPbiAwMS8xMS8yMDE5IDA0OjMxIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+
ID4gTm8gbmVlZCB0byBpbml0aWFsaXplIHRoZSBQSFkgZnJvbSB0aGUgZHJpdmVyJ3MgcHJvYmUu
IEl0IGlzIGRvbmUgYnkKPiA+IHRoZSBjb3JlIGF1dG9tYXRpY2FsbHkgYW5kIGRvaW5nIGl0IHR3
aWNlIHdvdWxkIGluY3JlbWVudCB0aGUKPiA+IHBoeS0+cG93ZXJjb3VudCBjb3VudGVyIHRvIDIg
aW5zdGVhZCBvZiAxLiBEdXJpbmcgbGF0ZXIgc3VzcGVuZAo+ID4gb3BlcmF0aW9uLCB0aGUgY291
bnRlciB3aWxsIGJlIGRlY3JlbWVudGVkIHRvIG9uZSwgbm8gcGh5LT5wb3dlcl9vZmYoKQo+ID4g
d2lsbCBvY2N1ciBhbmQgd29yc3QgdGhhbiB0aGF0LCB0aGUgZm9sbG93aW5nIHBoeS0+cG93ZXJf
b24oKSBhdCAgCj4gCj4gICAgV29yc2UuCgpOb3RlZAoKPiAKPiA+IHJlc3VtZSB0aW1lIHdpbGwg
YmUgYWxzbyBza2lwcGVkLCBmYWlsaW5nIHRoZSB3aG9sZSBTMlJBTSBvcGVyYXRpb24uCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktb3Jpb24uYyB8IDI2ICsrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMjMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0
L2VoY2ktb3Jpb24uYyBiL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1vcmlvbi5jCj4gPiBpbmRleCAx
YWQ3MjY0N2EwNjkuLjMxMDlmMDgyOTQ5ZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hv
c3QvZWhjaS1vcmlvbi5jCj4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L2VoY2ktb3Jpb24uYwo+
ID4gQEAgLTI1NywxNSArMjU3LDcgQEAgc3RhdGljIGludCBlaGNpX29yaW9uX2Rydl9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIAlpZiAoSVNfRVJSKHByaXYtPnBoeSkp
IHsKPiA+ICAJCWVyciA9IFBUUl9FUlIocHJpdi0+cGh5KTsKPiA+ICAJCWlmIChlcnIgIT0gLUVO
T1NZUykKPiA+IC0JCQlnb3RvIGVycl9waHlfZ2V0Owo+ID4gLQl9IGVsc2Ugewo+ID4gLQkJZXJy
ID0gcGh5X2luaXQocHJpdi0+cGh5KTsKPiA+IC0JCWlmIChlcnIpCj4gPiAtCQkJZ290byBlcnJf
cGh5X2luaXQ7Cj4gPiAtCj4gPiAtCQllcnIgPSBwaHlfcG93ZXJfb24ocHJpdi0+cGh5KTsKPiA+
IC0JCWlmIChlcnIpCj4gPiAtCQkJZ290byBlcnJfcGh5X3Bvd2VyX29uOwo+ID4gKwkJCWdvdG8g
ZXJyX2Rpc19jbGs7ICAKPiAKPiAgICBGYW1pbGlhciBjb2RlIGluIHVuZmFtaWxpYXIgcGxhY2Uu
IFNvbWVib2R5IG11c3QgaGF2ZSBibGluZGx5IGNvcGllZCBpdC4uLiA6LSkKCkFjdHVhbGx5IGEg
Z2l0IGJsYW1lIHNob3dzIHRoYXQgdGhpcyBjb2RlIGlzIHRoZXJlIHNpbmNlIDIwMTQsIDQgeWVh
cnMKYmVmb3JlIHRoZSBIQ0QgY29yZSBzdXBwb3J0ZWQgUEhZcy4gVGhpcyBkcml2ZXIgd2FzIHBy
b2JhYmx5IGZvcmdvdHRlbgpkdXJpbmcgdGhlIHByb2Nlc3MuIAoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=

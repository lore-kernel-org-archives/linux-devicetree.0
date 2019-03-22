From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/6] dmaengine: sun6i: Add a quirk for additional mbus
 clock
Date: Fri, 22 Mar 2019 18:29:40 +0530
Message-ID: <20190322125940.GE5348@vkoul-mobl>
References: <20190307165829.9086-1-jernej.skrabec@siol.net>
 <20190307165829.9086-3-jernej.skrabec@siol.net>
 <20190316110753.GH5348@vkoul-mobl>
 <2451376.qVWA8nfu3q@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <2451376.qVWA8nfu3q@jernej-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, maxime.ripard@bootlin.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMTYtMDMtMTksIDEyOjIzLCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gSGkhCj4gCj4gRG5l
IHNvYm90YSwgMTYuIG1hcmVjIDIwMTkgb2IgMTI6MDc6NTMgQ0VUIGplIFZpbm9kIEtvdWwgbmFw
aXNhbChhKToKPiA+IE9uIDA3LTAzLTE5LCAxNzo1OCwgSmVybmVqIFNrcmFiZWMgd3JvdGU6Cj4g
PiA+IEg2IERNQSBjb250cm9sbGVyIG5lZWRzIGFkZGl0aW9uYWwgbWJ1cyBjbG9jayB0byBiZSBl
bmFibGVkLgo+ID4gPiAKPiA+ID4gQWRkIGEgcXVpcmsgZm9yIGl0IGFuZCBoYW5kbGUgaXQgYWNj
b3JkaW5nbHkuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVy
bmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gIGRyaXZlcnMvZG1h
L3N1bjZpLWRtYS5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9kbWEvc3VuNmktZG1hLmMgYi9kcml2ZXJzL2RtYS9zdW42aS1kbWEu
Ywo+ID4gPiBpbmRleCAwY2QxM2YxN2ZjMTEuLjc2MTU1NTA4MDMyNSAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9kbWEvc3VuNmktZG1hLmMKPiA+ID4gKysrIGIvZHJpdmVycy9kbWEvc3VuNmkt
ZG1hLmMKPiA+ID4gQEAgLTEyOSw2ICsxMjksNyBAQCBzdHJ1Y3Qgc3VuNmlfZG1hX2NvbmZpZyB7
Cj4gPiA+IAo+ID4gPiAgCXUzMiBkc3RfYnVyc3RfbGVuZ3RoczsKPiA+ID4gIAl1MzIgc3JjX2Fk
ZHJfd2lkdGhzOwo+ID4gPiAgCXUzMiBkc3RfYWRkcl93aWR0aHM7Cj4gPiA+IAo+ID4gPiArCWJv
b2wgbWJ1c19jbGs7Cj4gPiA+IAo+ID4gPiAgfTsKPiA+ID4gIAo+ID4gPiAgLyoKPiA+ID4gCj4g
PiA+IEBAIC0xODIsNiArMTgzLDcgQEAgc3RydWN0IHN1bjZpX2RtYV9kZXYgewo+ID4gPiAKPiA+
ID4gIAlzdHJ1Y3QgZG1hX2RldmljZQlzbGF2ZTsKPiA+ID4gIAl2b2lkIF9faW9tZW0JCSpiYXNl
Owo+ID4gPiAgCXN0cnVjdCBjbGsJCSpjbGs7Cj4gPiA+IAo+ID4gPiArCXN0cnVjdCBjbGsJCSpj
bGtfbWJ1czsKPiA+IAo+ID4gU28gcmF0aGVyIHRoYW4gaGF2ZSBtYnVzX2NsayBhbmQgdGhlbiBh
IHB0ciwgd2h5IG5vdCB1c2UgdGhlIHB0ciBhbmQgdXNlCj4gPiBOVUxMIHZhbHVlIHRvIGNoZWNr
IGZvci4uPwo+ID4gCj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4gY2xrX21i
dXMgd2lsbCBob2xkIGEgcmVmZXJlbmNlIHRvIGEgY2xvY2sgCj4gcmV0cmlldmVkIGJ5IGRldm1f
Y2xrX2dldCgpIHNvIGl0IGhhcyB0byBiZSAic3RydWN0IGNsayAqIi4KPiAKPiBXaGF0IEknbSBt
aXNzaW5nIGhlcmU/CgpJSVJDIHRoZXJlIHdlcmUgdHdvIHZhcmlhYmxlIG9uZSBjbGsgcHRyIGFu
ZCBvbmUgYW4gaW50ZWdlciB0byBtYXJrCnByZXNlbmNlLCB5b3UgbWF5IGJlIGFibGUgdG8gc2tp
cCB2YXJpYWJsZSBhbmQgdXNlIHB0ci4uCi0tIAp+Vmlub2QKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

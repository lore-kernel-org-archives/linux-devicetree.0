From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: Remove useless address and size cells
Date: Tue, 2 Apr 2019 10:19:52 +0200
Message-ID: <20190402101952.657ee274@xps13>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgTWF4aW1lLAoKTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4gd3Jv
dGUgb24gTW9uLCAgMSBBcHIgMjAxOQoyMzoxMzo1NiArMDIwMDoKCj4gVGhlIE5BTkQgY2hpcHMg
aW4gb3VyIERUcyBoYXZlIGFkZHJlc3MgYW5kIHNpemUgY2VsbHMsIGV2ZW4gdGhvdWdoIHRoZXkK
PiBkb24ndCBoYXZlIGFueSBjaGlsZCBub2Rlcy4gUmVtb3ZlIHRoZW0uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcm0vYm9vdC9kdHMvc3VuNWktZ3I4LWNoaXAtcHJvLmR0cyAgICAgICAgICAgICB8IDIg
LS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LW5pbnRlbmRvLW5lcy1jbGFzc2ljLmR0
cyB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW41aS1ncjgtY2hpcC1wcm8uZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3VuNWktZ3I4LWNoaXAtcHJvLmR0cwo+IGluZGV4IDUzM2E0ZWNjMDVlMi4uYTMy
Y2RlM2UzMmViIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjVpLWdyOC1jaGlw
LXByby5kdHMKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdW41aS1ncjgtY2hpcC1wcm8uZHRz
Cj4gQEAgLTEzMyw4ICsxMzMsNiBAQAo+ICAJc3RhdHVzID0gIm9rYXkiOwo+ICAKPiAgCW5hbmRA
MCB7Cj4gLQkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gLQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4g
IAkJcmVnID0gPDA+Owo+ICAJCWFsbHdpbm5lcixyYiA9IDwwPjsKPiAgCQluYW5kLWVjYy1tb2Rl
ID0gImh3IjsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LW5pbnRl
bmRvLW5lcy1jbGFzc2ljLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1uaW50ZW5k
by1uZXMtY2xhc3NpYy5kdHMKPiBpbmRleCAzMmNmMWFiMzNhYWIuLjI0NmRlYzU4NDZhNCAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtbmludGVuZG8tbmVzLWNsYXNz
aWMuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjE2LW5pbnRlbmRvLW5lcy1j
bGFzc2ljLmR0cwo+IEBAIC0zNCw4ICszNCw2IEBACj4gIAo+ICAJLyogMkdiIE1hY3Jvbml4IE1Y
MzBMRjJHMThBQyAoM1YpICovCj4gIAluYW5kQDAgewo+IC0JCSNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+IC0JCSNzaXplLWNlbGxzID0gPDE+Owo+ICAJCXJlZyA9IDwwPjsKPiAgCQlhbGx3aW5uZXIs
cmIgPSA8MD47Cj4gIAkJbmFuZC1lY2MtbW9kZSA9ICJodyI7CgoKUmV2aWV3ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==

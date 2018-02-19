From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [RFC] ARM: dts: imx28-tx28: Pass the memory unit name
Date: Mon, 19 Feb 2018 13:06:24 +0100
Message-ID: <20180219130624.30a5f572@karo-electronics.de>
References: <1518882103-17137-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1518882103-17137-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBTYXQsIDE3IEZlYiAyMDE4IDEzOjQxOjQzIC0wMjAwIEZhYmlvIEVzdGV2YW0gd3Jv
dGU6Cj4gRnJvbTogRmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPgo+IAo+IFBh
c3MgdGhlIG1lbW9yeSB1bml0IG5hbWUgaW4gb3JkZXIgdG8gZml4IHRoZSBmb2xsb3dpbmcKPiBk
dGMgd2FybmluZyB3aXRoIFc9MToKPiAKPiBhcmNoL2FybS9ib290L2R0cy9pbXgyOC10eDI4LmR0
YjogV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IE5vZGUgL21lbW9yeSBoYXMgYSByZWcg
b3IgcmFuZ2VzIHByb3BlcnR5LCBidXQgbm8gdW5pdCBuYW1lCj4gCj4gU2lnbmVkLW9mZi1ieTog
RmFiaW8gRXN0ZXZhbSA8ZmFiaW8uZXN0ZXZhbUBueHAuY29tPgo+IC0tLQo+IEhpLAo+IAo+IEN1
cnJlbnRseSB0aGUgb25seSBkdGMgd2FybmluZ3Mgb2JzZXJ2ZWQgd2l0aCBXPTEgYXJlIHRoZSBv
bmVzOgo+IFdhcm5pbmcgKHVuaXRfYWRkcmVzc192c19yZWcpOiBOb2RlIC9tZW1vcnkgaGFzIGEg
cmVnIG9yIHJhbmdlcyBwcm9wZXJ0eSwgYnV0IG5vIHVuaXQgbmFtZQo+IAo+IElmIHRoaXMgc29s
dXRpb24gY2FuIGJlIGFjY2VwdGVkIEkgY2FuIGNsZWFuIGFsbCB0aGUgb3RoZXIgaS5NWCBkdHMg
ZmlsZXMuCj4gCj4gUGxlYXNlIGFkdmlzZS4KPiAKPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14Mjgt
dHgyOC5kdHMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14MjgtdHgy
OC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9pbXgyOC10eDI4LmR0cwo+IGluZGV4IDhhNGY1YmMu
LmJiZGYwMDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14MjgtdHgyOC5kdHMK
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXgyOC10eDI4LmR0cwo+IEBAIC02NSw4ICs2NSw4
IEBACj4gIAkJdXNib3RnID0gJnVzYjA7Cj4gIAl9Owo+ICAKPiAtCW1lbW9yeSB7Cj4gLQkJcmVn
ID0gPDAgMD47IC8qIHdpbGwgYmUgZmlsbGVkIGluIGJ5IFUtQm9vdCAqLwo+ICsJbWVtb3J5QDQw
MDAwMDAwIHsKPiArCQlyZWcgPSA8MHg0MDAwMDAwMCAwPjsgLyogd2lsbCBiZSBmaWxsZWQgaW4g
YnkgVS1Cb290ICovCj4gIAl9Owo+ICAKPiAgCW9uZXdpcmUgewo+CkkgaGF2ZSBubyBvYmplY3Rp
b25zIHRvIHRoaXMgY2hhbmdlLiBVLUJvb3Qgc3RpbGwgZmluZHMgdGhlIG1lbW9yeSBub2RlCmFu
ZCBwdXRzIHRoZSBjb3JyZWN0IHNpemUgaW50byB0aGUgJ3JlZycgcHJvcGVydHkuCgpBY2tlZC1i
eTogTG90aGFyIFdhw59tYW5uIDxMV0BLQVJPLWVsZWN0cm9uaWNzLmRlPgoKCkxvdGhhciBXYcOf
bWFubgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=

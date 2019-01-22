From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 4/5] ARM: dts: r8a7744: Add DU support
Date: Tue, 22 Jan 2019 19:07:51 +0200
Message-ID: <20190122170751.GB26166@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-5-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1548170749-12773-5-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBKYW4gMjIsIDIwMTkg
YXQgMDM6MjU6NDhQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gQWRkIGR1IG5vZGUgdG8gcjhh
Nzc0NCBTb0MgRFQuIEJvYXJkcyB0aGF0IHdhbnQgdG8gZW5hYmxlIHRoZSBEVQo+IG5lZWQgdG8g
c3BlY2lmeSB0aGUgb3V0cHV0IHRvcG9sb2d5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpJIGV4cGVjdCBTaW1vbiB0byBw
aWNrIHRoaXMgdXAuCgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9yOGE3NzQ0LmR0c2kgfCAx
MSArKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQ0LmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQ0LmR0c2kKPiBpbmRleCA4ZDI1YTBhLi44MzgwNGFh
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDQuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDQuZHRzaQo+IEBAIC0xNjQ1LDggKzE2NDUsMTQgQEAKPiAg
CQl9Owo+ICAKPiAgCQlkdTogZGlzcGxheUBmZWIwMDAwMCB7Cj4gLQkJCXJlZyA9IDwwIDB4ZmVi
MDAwMDAgMCAweDQwMDAwPiwKPiAtCQkJICAgICAgPDAgMHhmZWI5MDAwMCAwIDB4MWM+Owo+ICsJ
CQljb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhhNzc0NCI7Cj4gKwkJCXJlZyA9IDwwIDB4ZmVi
MDAwMDAgMCAweDQwMDAwPjsKPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1NiBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKPiArCQkJCSAgICAgPEdJQ19TUEkgMjY4IElSUV9UWVBFX0xFVkVMX0hJ
R0g+Owo+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcyND4sCj4gKwkJCQkgPCZjcGcgQ1BH
X01PRCA3MjM+Owo+ICsJCQljbG9jay1uYW1lcyA9ICJkdS4wIiwgImR1LjEiOwo+ICsJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+ICAKPiAgCQkJcG9ydHMgewo+ICAJCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gQEAgLTE2NjMsNyArMTY2OSw2IEBACj4gIAkJCQkJfTsKPiAgCQkJCX07Cj4gIAkJ
CX07Cj4gLQkJCS8qIHBsYWNlaG9sZGVyICovCj4gIAkJfTsKPiAgCj4gIAkJcHJyOiBjaGlwaWRA
ZmYwMDAwNDQgewoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

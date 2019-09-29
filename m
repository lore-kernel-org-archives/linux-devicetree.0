From: Vicente Bergas <vicencb@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix usb-c on Hugsun X99 TV Box
Date: Sun, 29 Sep 2019 13:22:17 +0200
Message-ID: <54c67ca8-8428-48ee-9a96-e1216ba02839@gmail.com>
References: <20190929032230.24628-1-npcomplete13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190929032230.24628-1-npcomplete13@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vivek Unune <npcomplete13@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, Felipe Balbi <felipe.balbi@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, akash@openedev.com, ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

T24gU3VuZGF5LCBTZXB0ZW1iZXIgMjksIDIwMTkgNToyMjozMCBBTSBDRVNULCBWaXZlayBVbnVu
ZSB3cm90ZToKPiBGaXggdXNiLWMgb24gWDk5IFRWIEJveC4gVGVzdGVkIHdpdGggYXJtYmlhbiB3
LyBrZXJuZWwgNS4zCj4KPiBTaWduZWQtb2ZmLWJ5OiBWaXZlayBVbnVuZSA8bnBjb21wbGV0ZTEz
QGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTkt
aHVnc3VuLXg5OS5kdHMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jv
Y2tjaGlwL3JrMzM5OS1odWdzdW4teDk5LmR0cyAKPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9j
a2NoaXAvcmszMzk5LWh1Z3N1bi14OTkuZHRzCj4gaW5kZXggMGQxZjVmOWEwZGU5Li5jMTMzZThk
NjRiMmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzOTkt
aHVnc3VuLXg5OS5kdHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM5
OS1odWdzdW4teDk5LmR0cwo+IEBAIC02NDQsNyArNjQ0LDcgQEAKPiAgCXN0YXR1cyA9ICJva2F5
IjsKPiAgCj4gIAl1MnBoeTBfaG9zdDogaG9zdC1wb3J0IHsKPiAtCQlwaHktc3VwcGx5ID0gPCZ2
Y2M1djBfaG9zdD47Cj4gKwkJcGh5LXN1cHBseSA9IDwmdmNjNXYwX3R5cGVjPjsKPiAgCQlzdGF0
dXMgPSAib2theSI7Cj4gIAl9Owo+ICAKPiBAQCAtNzEyLDcgKzcxMiw3IEBACj4gIAo+ICAmdXNi
ZHJkX2R3YzNfMCB7Cj4gIAlzdGF0dXMgPSAib2theSI7Cj4gLQlkcl9tb2RlID0gIm90ZyI7Cj4g
Kwlkcl9tb2RlID0gImhvc3QiOwo+ICB9Owo+ICAKPiAgJnVzYmRyZDNfMSB7CgpIaSBWaXZlaywK
CndoaWNoIGlzIHRoZSByZWxhdGlvbnNoaXAgb2YgeW91ciBwYXRjaCBhbmQgdGhpcyBjb21taXQ6
CgplMWQ5MTQ5ZTgzODlmMTY5MGNkZDRlNDA1Njc2NmRkMjY0ODhhMGZlCmFybTY0OiBkdHM6IHJv
Y2tjaGlwOiBGaXggVVNCMyBUeXBlLUMgb24gcmszMzk5LXNhcHBoaXJlCgp3aXRoIHJlc3BlY3Qg
dG8gdGhpcyBvdGhlciBjb21taXQ6CgpjMDliNzNjZmFjMmE5MzE3ZjExMDQxNjkwNDVjNTE5YzYw
MjFhYTFkCnVzYjogZHdjMzogZG9uJ3Qgc2V0IGdhZGdldC0+aXNfb3RnIGZsYWcKCj8KCkkgZGlk
IG5vdCB0ZXN0IHJldmVydGluZyBlMWQ5MTQ5ZSBzaW5jZSBjMDliNzNjZiB3YXMgYXBwbGllZC4K
ClJlZ2FyZHMsCiAgVmljZW7Dpy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

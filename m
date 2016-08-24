From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2 board
Date: Thu, 25 Aug 2016 07:58:27 +0800
Message-ID: <43951472083107@web23m.yandex.ru>
References: <20160823064451.25997-1-icenowy@aosc.xyz>
 <20160823064451.25997-3-icenowy@aosc.xyz> <20160824193600.GS8103@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160824193600.GS8103@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoyNS4wOC4yMDE2LCAwMzozNiwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gSGksCj4KPiBPbiBUdWUsIEF1ZyAyMywgMjAxNiBhdCAwMjo0NDo1
MVBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoFVBUlQxIGlzIGNvbm5lY3RlZCB0
byB0aGUgYmx1ZXRvb3RoIHBhcnQgb2YgUlRMODcyM0JTIFdpRmkvQlQgY29tYm8gY2FyZAo+PiDC
oG9uIGlOZXQgRDk3OCBSZXYyIGJvYXJkLgo+Pgo+PiDCoEVuYWJsZSB0aGUgVUFSVDEgdG8gbWFr
ZSBpdCBwb3NzaWJsZSB0byB1c2UgdGhlIG1vZGlmaWVkIGhjaWF0dGFjaCBieQo+PiDCoFJlYWx0
ZWsgdG8gZHJpdmUgdGhlIEJUIHBhcnQgb2YgUlRMODcyM0JTLgo+Pgo+PiDCoFNpZ25lZC1vZmYt
Ynk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy54eXo+Cj4KPiBJIGd1ZXNzIHlvdSBjb3Vs
ZCBmb2xkIHRoYXQgcGF0Y2ggaW50byB0aGUgcHJldmlvdXMgb25lLgo+Cj4+IMKgLS0tCj4+IMKg
wqBhcmNoL2FybS9ib290L2R0cy9zdW44aS1hMzMtaW5ldC1kOTc4LXJldjIuZHRzIHwgMTEgKysr
KysrKysrKysKPj4gwqDCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4+Cj4+IMKg
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWEzMy1pbmV0LWQ5NzgtcmV2Mi5k
dHMgYi9hcmNoL2FybS9ib290L2R0cy9zdW44aS1hMzMtaW5ldC1kOTc4LXJldjIuZHRzCj4+IMKg
aW5kZXggNzg4MjNkOC4uM2FjMjJkNCAxMDA2NDQKPj4gwqAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9zdW44aS1hMzMtaW5ldC1kOTc4LXJldjIuZHRzCj4+IMKgKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3VuOGktYTMzLWluZXQtZDk3OC1yZXYyLmR0cwo+PiDCoEBAIC00OCw2ICs0OCwxMCBAQAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoG1vZGVsID0gIklOZXQtRDk3OCBSZXYgMDIiOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAicHJpbXV4LGluZXQtZDk3OC1yZXYyIiwgImFs
bHdpbm5lcixzdW44aS1hMzMiOwo+Pgo+PiDCoCsgYWxpYXNlcyB7Cj4+IMKgKyBzZXJpYWwxID0g
JnVhcnQxOwo+PiDCoCsgfTsKPj4gwqArCj4KPiBJcyB0aGVyZSBhbnkgb3RoZXIgVUFSVCBpbiB0
aGUgc3lzdGVtPwoKc2VyaWFsMCBpcyBkZWZpbmVkIGluIHN1bjhpLXJlZmVyZW5jZS1kZXNpZ24t
dGFibGV0LmR0c2ksIGFzIHJfdWFydC4KCj4KPiBUaGUgYWxpYXMgaXMgbm90IHN1cHBvc2VkIHRv
IGJlIGFib3V0IHRoZSBjb250cm9sbGVyIGluZGV4LCBidXQgdGhlCj4gaW5kZXggaW4gdGhlIGJv
YXJkLCBtZWFuaW5nIHRoYXQgaWYgeW91IG9ubHkgaGF2ZSBhIHNpbmdsZSBVQVJULCB0aGF0Cj4g
d291bGQgYmUgc2VyaWFsMC4KPgo+IFRoYW5rcyEKPiBNYXhpbWUKPgo+IC0tCj4gTWF4aW1lIFJp
cGFyZCwgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH -next] ARM: dts: sun8i: Add NFC node to Allwinner A23/A33
 SoC
Date: Thu, 07 Jul 2016 08:04:41 +0800
Message-ID: <34841467849881@web8m.yandex.ru>
References: <20160706003352.28194-1-icenowy@aosc.xyz>
 <20160706202932.GD4247@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160706202932.GD4247@lukather>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wens@csie.org" <wens@csie.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgowNy4wNy4yMDE2LCAwNDoyOSwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gSGksCj4KPiBPbiBXZWQsIEp1bCAwNiwgMjAxNiBhdCAwODozMzo1
MkFNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoEFkZCBOQU5EIEZsYXNoIGNvbnRy
b2xsZXIgbm9kZSBkZWZpbml0aW9uIHRvIHRoZSBBMjMvQTMzIFNvQy4KPj4KPj4gwqBTaWduZWQt
b2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MueHl6Pgo+Cj4gSGFzIHRoaXMgZXZl
ciBiZWVuIHRlc3RlZD8gT24gd2hhdCBib2FyZCwgd2l0aCB3aGF0IE5BTkQgY2hpcD8KPgo+PiDC
oC0tLQo+PiDCoMKgYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTIzLWEzMy5kdHNpIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKysKPj4gwqDCoDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspCj4+Cj4+IMKgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWEyMy1hMzMu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWEyMy1hMzMuZHRzaQo+PiDCoGluZGV4IDdl
MDVlMDkuLjI3MGMzOGEgMTAwNjQ0Cj4+IMKgLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGkt
YTIzLWEzMy5kdHNpCj4+IMKgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTIzLWEzMy5k
dHNpCj4+IMKgQEAgLTIwOSw2ICsyMDksMTQgQEAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgImFwYjJfdWFydDMiLCAiYXBiMl91YXJ0NCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoH07Cj4+Cj4+IMKgKyBuYW5kX2NsazogY2xrQDAxYzIwMDgwIHsKPj4gwqAr
ICNjbG9jay1jZWxscyA9IDwwPjsKPj4gwqArIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjRp
LWExMC1tb2QwLWNsayI7Cj4+IMKgKyByZWcgPSA8MHgwMWMyMDA4MCAweDQ+Owo+PiDCoCsgY2xv
Y2tzID0gPCZvc2MyNE0+LCA8JnBsbDYgMT47Cj4+IMKgKyBjbG9jay1vdXRwdXQtbmFtZXMgPSAi
bmFuZCI7Cj4+IMKgKyB9Owo+PiDCoCsKPgo+IFRoaXMgc2hvdWxkIGJlIGluIGEgc2VwYXJhdGUg
cGF0Y2guCj4KPiBUaGFua3MhCj4gTWF4aW1lCj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEZyZWUg
RWxlY3Ryb25zCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHA6
Ly9mcmVlLWVsZWN0cm9ucy5jb20KCndpdGggYSBodHRwOi8vbGludXgtc3VueGkub3JnL0Fvc29u
X003NTFzIHRhYmxldCwgKFNLaHluaXggSDI3VUNHOFQyRVRSLUJDIE5BTkQgY2hpcCkuCgpJIHVz
ZWQgdGhlIHBhdGNoc2V0IGF0IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9s
aW51eC1tdGQvMjAxNi1KdW5lLzA2Nzg0OC5odG1sIHRvIGVuc3VyZSB0aGUgTkFORCBjaGlwIHRv
IHdvcmsgcHJvcGVybHkgKG90aGVyd2lzZSB0aGUgY2hpcCBpZCBjYW5ub3QgYmUgY29ycmVjdGx5
IGlkZW50aWZpZWQpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==

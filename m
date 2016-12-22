From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM64: zynqmp: Fix i2c node's compatible string
Date: Thu, 22 Dec 2016 08:35:19 +0100
Message-ID: <d1e69302-8367-7c57-ecd7-f72861c3a49e@xilinx.com>
References: <1482385788-7187-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1482385788-7187-1-git-send-email-moritz.fischer@ettus.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, U-Boot List <u-boot@lists.denx.de>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

T24gMjIuMTIuMjAxNiAwNjo0OSwgTW9yaXR6IEZpc2NoZXIgd3JvdGU6Cj4gRnJvbTogTW9yaXR6
IEZpc2NoZXIgPG1kZkBrZXJuZWwub3JnPgo+IAo+IFRoZSBaeW5xIFVsdHJhc2NhbGUgTVAgdXNl
cyB2ZXJzaW9uIDEuNCBvZiB0aGUgQ2FkZW5jZSBJUCBjb3JlCj4gd2hpY2ggZml4ZXMgc29tZSBz
aWxpY29uIGJ1Z3MgdGhhdCBuZWVkZWQgc29mdHdhcmUgd29ya2Fyb3VuZHMKPiBpbiBWZXJzaW9u
IDEuMCB0aGF0IHdhcyB1c2VkIG9uIFp5bnEgc3lzdGVtcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBN
b3JpdHogRmlzY2hlciA8bWRmQGtlcm5lbC5vcmc+Cj4gQ2M6IE1pY2hhbCBTaW1layA8bWljaGFs
LnNpbWVrQHhpbGlueC5jb20+Cj4gQ2M6IFPDtnJlbiBCcmlua21hbm4gPHNvcmVuLmJyaW5rbWFu
bkB4aWxpbnguY29tPgo+IENjOiBVLUJvb3QgTGlzdCA8dS1ib290QGxpc3RzLmRlbnguZGU+Cj4g
Q2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4gLS0tCj4gCj4gSGkgTWljaGFs
LAo+IAo+IEkgdGhpbmsgdGhpcyBpcyBhIHNsaXAgdXAgYW5kIHNob3VsZCBiZSByMXAxNCBmb3IK
PiBVbHRyYXNjYWxlIFp5bnFNUC4gZHJpdmVycy9pMmMvaTJjLWNhZGVuY2UuYyBhbHJlYWR5IHVz
ZXMgdGhpcy4KPiBJIENjJ2QgdGhlIHUtYm9vdCBsaXN0LCBiZWNhdXNlIHRoZSBzYW1lIGNoYW5n
ZSB3b3VsZCBiZSByZXF1aXJlZCB0aGVyZS4KPiAKPiBDaGVlcnMsCj4gCj4gTW9yaXR6Cj4gCj4g
LS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC5kdHNpIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy94aWxpbngvenlucW1wLmR0c2kKPiBpbmRleCA2OGE5MDgzMy4uYTVhNWY5
MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAuZHRzaQo+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC5kdHNpCj4gQEAgLTE3NSw3
ICsxNzUsNyBAQAo+ICAJCX07Cj4gIAo+ICAJCWkyYzA6IGkyY0BmZjAyMDAwMCB7Cj4gLQkJCWNv
bXBhdGlibGUgPSAiY2RucyxpMmMtcjFwMTAiOwo+ICsJCQljb21wYXRpYmxlID0gImNkbnMsaTJj
LXIxcDE0IjsKCkkgd2FzIGNoZWNraW5nIHRoaXMgaW50ZXJuYWxseSBhbmQgcDEwIGlzIGRvaW5n
IHNvbWV0aGluZyB3aGF0IHAxNApkb2Vzbid0IG5lZWQgdG8gZG8uIFRoYXQncyB3aHkgdGhpcyBz
aG91bGQgYmUKCmNvbXBhdGlibGUgPSAiY2RucyxpMmMtcjFwMTQiLCAiY2RucyxpMmMtcjFwMTAi
OwoKVGhlIHNhbWUgb2YgY291cnNlIGZvciB1LWJvb3Qgd2hlcmUgYWxzbyBwMTQgc2hvdWxkIGJl
IGFkZGVkIHRvIHRoZSBkcml2ZXIuCgpUaGFua3MsCk1pY2hhbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBsaXN0ClUtQm9vdEBs
aXN0cy5kZW54LmRlCmh0dHA6Ly9saXN0cy5kZW54LmRlL21haWxtYW4vbGlzdGluZm8vdS1ib290
Cg==

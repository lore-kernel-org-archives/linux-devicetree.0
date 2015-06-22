From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v6 15/15] ARM: dts: rename the clock of MIPI DSI 'pll_clk'
 to 'sclk_mipi'
Date: Mon, 22 Jun 2015 18:10:41 +0900
Message-ID: <5587D111.9090602@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
 <1434113958-15877-16-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1434113958-15877-16-git-send-email-human.hwang@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hyungwon Hwang <human.hwang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: devicetree@vger.kernel.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

T24gMjAxNeuFhCAwNuyblCAxMuydvCAyMTo1OSwgSHl1bmd3b24gSHdhbmcgd3JvdGU6Cj4gVGhl
IGNsb2NrIHdoaWNoIHdhcyBuYW1lZCBhcyAncGxsX2NsaycgaXMgYWN0dWFsbHkgbm90IHRoZSBj
bG9jayBzb3VyY2UKPiBvZiBQTEwgaW4gTUlQSSBEU0kuIFRoaXMgcGF0Y2ggZml4ZXMgdGhpcyBk
aXNhZ3JlZW1lbnQuCgpNci4gS3VramluIGFuZCBLcnp5c3p0b2YsIGNhbiB5b3UgZ2l2ZSBtZSBB
Y2tlZC1ieSBvciBTaW5nZWQtb2ZmLWJ5PyBJJ2QKbGlrZSB0byBtZXJnZSB0aGlzIHBhdGNoIHRv
IG1haW5saW5lIHRocm91Z2ggZHJtLW5leHQuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEh5dW5nd29uIEh3YW5nIDxodW1hbi5od2FuZ0BzYW1zdW5nLmNvbT4KPiAtLS0K
PiBDaGFuZ2VzIGJlZm9yZToKPiAtIFJlZmVyIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvNjE5MTgxMQo+IENoYW5nZXMgZm9yIHY2Ogo+IC0gTm9uZQo+IAo+ICBhcmNoL2FybS9i
b290L2R0cy9leHlub3M0LmR0c2kgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9l
eHlub3M0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0LmR0c2kKPiBpbmRleCBlMjBj
ZGMyLi4xNTM4ZDdhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQuZHRz
aQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQuZHRzaQo+IEBAIC0xNjcsNyArMTY3
LDcgQEAKPiAgCQlwaHlzID0gPCZtaXBpX3BoeSAxPjsKPiAgCQlwaHktbmFtZXMgPSAiZHNpbSI7
Cj4gIAkJY2xvY2tzID0gPCZjbG9jayBDTEtfRFNJTTA+LCA8JmNsb2NrIENMS19TQ0xLX01JUEkw
PjsKPiAtCQljbG9jay1uYW1lcyA9ICJidXNfY2xrIiwgInBsbF9jbGsiOwo+ICsJCWNsb2NrLW5h
bWVzID0gImJ1c19jbGsiLCAic2Nsa19taXBpIjsKPiAgCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ICAJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCSNzaXplLWNlbGxzID0gPDA+Owo+IC0tCj4g
MS45LjEKPiAKPiAtLQo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBs
aW5lICJ1bnN1YnNjcmliZSBkZXZpY2V0cmVlIiBpbgo+IHRoZSBib2R5IG9mIGEgbWVzc2FnZSB0
byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCj4gTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0
cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

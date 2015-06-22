From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v6 15/15] ARM: dts: rename the clock of MIPI DSI 'pll_clk'
 to 'sclk_mipi'
Date: Mon, 22 Jun 2015 20:42:25 +0900
Message-ID: <5587F4A1.2090502@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
 <1434113958-15877-16-git-send-email-human.hwang@samsung.com>
 <5587D111.9090602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <5587D111.9090602@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hyungwon Hwang <human.hwang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: devicetree@vger.kernel.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

KyBLcnp5c3p0b2YKCk9uIDIwMTXrhYQgMDbsm5QgMjLsnbwgMTg6MTAsIElua2kgRGFlIHdyb3Rl
Ogo+IE9uIDIwMTXrhYQgMDbsm5QgMTLsnbwgMjE6NTksIEh5dW5nd29uIEh3YW5nIHdyb3RlOgo+
PiBUaGUgY2xvY2sgd2hpY2ggd2FzIG5hbWVkIGFzICdwbGxfY2xrJyBpcyBhY3R1YWxseSBub3Qg
dGhlIGNsb2NrIHNvdXJjZQo+PiBvZiBQTEwgaW4gTUlQSSBEU0kuIFRoaXMgcGF0Y2ggZml4ZXMg
dGhpcyBkaXNhZ3JlZW1lbnQuCj4gCj4gTXIuIEt1a2ppbiBhbmQgS3J6eXN6dG9mLCBjYW4geW91
IGdpdmUgbWUgQWNrZWQtYnkgb3IgU2luZ2VkLW9mZi1ieT8gSSdkCj4gbGlrZSB0byBtZXJnZSB0
aGlzIHBhdGNoIHRvIG1haW5saW5lIHRocm91Z2ggZHJtLW5leHQuCj4gCj4gVGhhbmtzLAo+IElu
a2kgRGFlCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEh5dW5nd29uIEh3YW5nIDxodW1hbi5od2Fu
Z0BzYW1zdW5nLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgYmVmb3JlOgo+PiAtIFJlZmVyIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNjE5MTgxMQo+PiBDaGFuZ2VzIGZvciB2NjoK
Pj4gLSBOb25lCj4+Cj4+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M0LmR0c2kgfCAyICstCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczQuZHRzaQo+PiBpbmRleCBlMjBjZGMyLi4xNTM4ZDdhIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0LmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvZXh5bm9zNC5kdHNpCj4+IEBAIC0xNjcsNyArMTY3LDcgQEAKPj4gIAkJcGh5cyA9IDwmbWlw
aV9waHkgMT47Cj4+ICAJCXBoeS1uYW1lcyA9ICJkc2ltIjsKPj4gIAkJY2xvY2tzID0gPCZjbG9j
ayBDTEtfRFNJTTA+LCA8JmNsb2NrIENMS19TQ0xLX01JUEkwPjsKPj4gLQkJY2xvY2stbmFtZXMg
PSAiYnVzX2NsayIsICJwbGxfY2xrIjsKPj4gKwkJY2xvY2stbmFtZXMgPSAiYnVzX2NsayIsICJz
Y2xrX21pcGkiOwo+PiAgCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAgCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPj4gIAkJI3NpemUtY2VsbHMgPSA8MD47Cj4+IC0tCj4+IDEuOS4xCj4+Cj4+IC0t
Cj4+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNj
cmliZSBkZXZpY2V0cmVlIiBpbgo+PiB0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21v
QHZnZXIua2VybmVsLm9yZwo+PiBNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

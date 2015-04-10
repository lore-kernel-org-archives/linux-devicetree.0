From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH v5 12/12] ARM: dts: rename the clock of MIPI DSI 'pll_clk' to
 'sclk_mipi'
Date: Fri, 10 Apr 2015 14:55:30 +0900
Message-ID: <1428645330-1043-13-git-send-email-human.hwang@samsung.com>
References: <1428645330-1043-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1428645330-1043-1-git-send-email-human.hwang@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, inki.dae@samsung.com, daniel@fooishbar.org
Cc: dh09.lee@samsung.com, sw0312.kim@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, cw00.choi@samsung.com
List-Id: devicetree@vger.kernel.org

VGhlIGNsb2NrIHdoaWNoIHdhcyBuYW1lZCBhcyAncGxsX2NsaycgaXMgYWN0dWFsbHkgbm90IHRo
ZSBjbG9jayBzb3VyY2UKb2YgUExMIGluIE1JUEkgRFNJLiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMg
ZGlzYWdyZWVtZW50LgoKU2lnbmVkLW9mZi1ieTogSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5n
QHNhbXN1bmcuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjU6Ci0gTmV3bHkgYWRkZWQKIGFyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczQuZHRzaSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQuZHRzaQppbmRleCA3N2VhNTQ3Li5h
ZDIzNjc1IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0LmR0c2kKKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNC5kdHNpCkBAIC0xNjQsNyArMTY0LDcgQEAKIAkJcGh5
cyA9IDwmbWlwaV9waHkgMT47CiAJCXBoeS1uYW1lcyA9ICJkc2ltIjsKIAkJY2xvY2tzID0gPCZj
bG9jayBDTEtfRFNJTTA+LCA8JmNsb2NrIENMS19TQ0xLX01JUEkwPjsKLQkJY2xvY2stbmFtZXMg
PSAiYnVzX2NsayIsICJwbGxfY2xrIjsKKwkJY2xvY2stbmFtZXMgPSAiYnVzX2NsayIsICJzY2xr
X21pcGkiOwogCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
IAkJI3NpemUtY2VsbHMgPSA8MD47Ci0tCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=

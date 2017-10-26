From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH v2 1/3] mtd: spi-nor: stm32-quadspi: Fix uninitialized error
 return code
Date: Thu, 26 Oct 2017 17:12:33 +0200
Message-ID: <1509030755-19044-2-git-send-email-ludovic.Barre@st.com>
References: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCldpdGggZ2Nj
IDQuMS4yOgoKICAgIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3RtMzItcXVhZHNwaS5jOiBJbiBmdW5j
dGlvbiDigJhzdG0zMl9xc3BpX3R4X3BvbGzigJk6CiAgICBkcml2ZXJzL210ZC9zcGktbm9yL3N0
bTMyLXF1YWRzcGkuYzoyMzA6IHdhcm5pbmc6IOKAmHJldOKAmSBtYXkgYmUgdXNlZCB1bmluaXRp
YWxpemVkIGluIHRoaXMgZnVuY3Rpb24KCkluZGVlZCwgaWYgc3RtMzJfcXNwaV9jbWQubGVuIGlz
IHplcm8sIHJldCB3aWxsIGJlIHVuaW5pdGlhbGl6ZWQuClRoaXMgbGVuZ3RoIGlzIHBhc3NlZCBm
cm9tIG91dHNpZGUgdGhlIGRyaXZlciB1c2luZyB0aGUKc3BpX25vci57cmVhZCx3cml0ZX17LF9y
ZWd9KCkgY2FsbGJhY2tzLgoKU2V2ZXJhbCBmdW5jdGlvbnMgaW4gZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMgKGUuZy4gd3JpdGVfZW5hYmxlKCksCndyaXRlX2Rpc2FibGUoKSwgYW5kIGVy
YXNlX2NoaXAoKSkgY2FsbCBzcGlfbm9yLndyaXRlX3JlZygpIHdpdGggYSB6ZXJvCmxlbmd0aC4K
CkZpeCB0aGlzIGJ5IHJldHVybmluZyBhbiBleHBsaWNpdCB6ZXJvIG9uIHN1Y2Nlc3MuCgpGaXhl
czogMGQ0M2Q3YWIyNzdhMDQ4YyAoIm10ZDogc3BpLW5vcjogYWRkIGRyaXZlciBmb3IgU1RNMzIg
cXVhZCBzcGkgZmxhc2ggY29udHJvbGxlciIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CkFja2VkLWJ5OiBMdWRvdmljIEJhcnJlIDxsdWRv
dmljLmJhcnJlQHN0LmNvbT4KU2lnbmVkLW9mZi1ieTogTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5i
YXJyZUBzdC5jb20+Ci0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9zdG0zMi1xdWFkc3BpLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zdG0zMi1xdWFkc3BpLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3N0bTMyLXF1YWRzcGkuYwppbmRleCA4NmMwOTMxLi5hZDZhM2UxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3N0bTMyLXF1YWRzcGkuYworKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3N0bTMyLXF1YWRzcGkuYwpAQCAtMjQwLDEyICsyNDAsMTIgQEAgc3RhdGlj
IGludCBzdG0zMl9xc3BpX3R4X3BvbGwoc3RydWN0IHN0bTMyX3FzcGkgKnFzcGksCiAJCQkJCQkg
U1RNMzJfUVNQSV9GSUZPX1RJTUVPVVRfVVMpOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyKHFz
cGktPmRldiwgImZpZm8gdGltZW91dCAoc3RhdDolI3gpXG4iLCBzcik7Ci0JCQlicmVhazsKKwkJ
CXJldHVybiByZXQ7CiAJCX0KIAkJdHhfZmlmbyhidWYrKywgcXNwaS0+aW9fYmFzZSArIFFVQURT
UElfRFIpOwogCX0KIAotCXJldHVybiByZXQ7CisJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQg
c3RtMzJfcXNwaV90eF9tbShzdHJ1Y3Qgc3RtMzJfcXNwaSAqcXNwaSwKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=

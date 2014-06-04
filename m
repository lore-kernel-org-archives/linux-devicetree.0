From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH v2 2/5] Documentation: bindings: add the Berlin CPU control doc
Date: Wed,  4 Jun 2014 18:03:43 +0200
Message-ID: <1401897826-11711-3-git-send-email-antoine.tenart@free-electrons.com>
References: <1401897826-11711-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401897826-11711-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIENQVSBjb250cm9sIGNvbXBhdGlibGUsIG5lZWRlZCBmb3IgdGhlIFNNUCBz
dXBwb3J0IG9uCk1hcnZlbGwgQmVybGluIFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvaW5lIFTD
qW5hcnQgPGFudG9pbmUudGVuYXJ0QGZyZWUtZWxlY3Ryb25zLmNvbT4KLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21hcnZlbGwsYmVybGluLnR4dCB8IDE2ICsrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tYXJ2ZWxsLGJlcmxpbi50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21hcnZlbGwsYmVybGlu
LnR4dAppbmRleCAwNjc3MDAzZTE0NzYuLjdmOWIzY2NkZjI1YiAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tYXJ2ZWxsLGJlcmxpbi50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tYXJ2ZWxsLGJlcmxpbi50eHQK
QEAgLTIzLDMgKzIzLDE5IEBAIFNvQyBhbmQgYm9hcmQgdXNlZC4gQ3VycmVudGx5IGtub3duIFNv
QyBjb21wYXRpYmxlcyBhcmU6CiAKIAkuLi4KIH0KKworKiBNYXJ2ZWxsIEJlcmxpbiBDUFUgY29u
dHJvbCBiaW5kaW5ncworCitDUFUgY29udHJvbCByZWdpc3RlciBhbGxvd3MgdmFyaW91cyBvcGVy
YXRpb25zIG9uIENQVXMsIGxpa2UgcmVzZXR0aW5nIHRoZW0KK2luZGVwZW5kZW50bHkuCisKK1Jl
cXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAibWFydmVsbCxiZXJs
aW4tY3B1LWN0cmwiCistIHJlZzogYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBz
ZXQKKworRXhhbXBsZToKKworY3B1LWN0cmxAZjdkZDAwMDAgeworCWNvbXBhdGlibGUgPSAibWFy
dmVsbCxiZXJsaW4tY3B1LWN0cmwiOworCXJlZyA9IDwweGY3ZGQwMDAwIDB4MTAwMDA+OworfTsK
LS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=

From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH v9 21/22] drivers/of: Export of_detach_node()
Date: Tue,  3 May 2016 23:22:52 +1000
Message-ID: <1462281773-26438-22-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462281773-26438-1-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1462281773-26438-1-git-send-email-gwshan@linux.vnet.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, alistair@popple.id.au, aik@ozlabs.ru, linux-pci@vger.kernel.org, Gavin Shan <gwshan@linux.vnet.ibm.com>, robherring2@gmail.com, bhelgaas@google.com, dja@axtens.net
List-Id: devicetree@vger.kernel.org

VGhpcyBleHBvcnRzIG9mX2RldGFjaF9ub2RlKCkgZm9yIFBvd2VyUEMgUG93ZXJOViBQQ0kgaG90
cGx1Zwpkcml2ZXIuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRyb2R1Y2VkLgoKU2lnbmVkLW9m
Zi1ieTogR2F2aW4gU2hhbiA8Z3dzaGFuQGxpbnV4LnZuZXQuaWJtLmNvbT4KLS0tCiBkcml2ZXJz
L29mL2R5bmFtaWMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9vZi9keW5hbWljLmMgYi9kcml2ZXJzL29mL2R5bmFtaWMuYwppbmRl
eCBjNjQ3YmQxLi43NWNlMzBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2R5bmFtaWMuYworKysg
Yi9kcml2ZXJzL29mL2R5bmFtaWMuYwpAQCAtMzExLDYgKzMxMSw3IEBAIGludCBvZl9kZXRhY2hf
bm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogCiAJcmV0dXJuIHJjOwogfQorRVhQT1JUX1NZ
TUJPTF9HUEwob2ZfZGV0YWNoX25vZGUpOwogCiAvKioKICAqIG9mX25vZGVfcmVsZWFzZSgpIC0g
cmVsZWFzZSBhIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBub2RlCi0tIAoyLjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXhwcGMtZGV2IG1haWxp
bmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFi
cy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2

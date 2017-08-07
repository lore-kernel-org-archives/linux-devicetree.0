From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 4/5] ARM: dts: da850-lego-ev3: Add node for LCD display
Date: Mon,  7 Aug 2017 12:39:40 -0500
Message-ID: <1502127581-10517-5-git-send-email-david@lechnology.com>
References: <1502127581-10517-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1502127581-10517-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBhZGRzIGEgbmV3IG5vZGUgZm9yIHRoZSBMRUdPIE1JTkRTVE9STVMgRVYzIExDRCBkaXNw
bGF5LgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+
Ci0tLQoKdjQgY2hhbmdlczoKKiBjaGFuZ2VkIGRjIHRvIGEwCgogYXJjaC9hcm0vYm9vdC9kdHMv
ZGE4NTAtbGVnby1ldjMuZHRzIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2RhODUwLWxlZ28tZXYzLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxlZ28tZXYzLmR0
cwppbmRleCA0NTk4M2MwLi40MTNkYmQ1IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9k
YTg1MC1sZWdvLWV2My5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGVnby1ldjMu
ZHRzCkBAIC0yNDksNiArMjQ5LDE1IEBACiAJCQkweDRjIDB4MDAwMDAwODAgMHgwMDAwMDBmMAog
CQk+OwogCX07CisKKwlldjNfbGNkX3BpbnM6IHBpbm11eF9sY2QgeworCQlwaW5jdHJsLXNpbmds
ZSxiaXRzID0gPAorCQkJLyogU0lNTywgR1AyWzExXSwgR1AyWzEyXSwgQ0xLICovCisJCQkweDE0
IDB4MDAxODgxMDAgMHgwMGZmZmYwMAorCQkJLyogR1A1WzBdICovCisJCQkweDMwIDB4ODAwMDAw
MDAgMHhmMDAwMDAwMAorCQk+OworCX07CiB9OwogCiAmcGluY29uZiB7CkBAIC0zNTcsNiArMzY2
LDIxIEBACiAJfTsKIH07CiAKKyZzcGkxIHsKKwlzdGF0dXMgPSAib2theSI7CisJcGluY3RybC0w
ID0gPCZldjNfbGNkX3BpbnM+OworCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJY3MtZ3Bp
b3MgPSA8JmdwaW8gNDQgR1BJT19BQ1RJVkVfTE9XPjsKKworCWRpc3BsYXlAMHsKKwkJY29tcGF0
aWJsZSA9ICJsZWdvLGV2My1sY2QiOworCQlyZWcgPSA8MD47CisJCXNwaS1tYXgtZnJlcXVlbmN5
ID0gPDEwMDAwMDAwPjsKKwkJYTAtZ3Bpb3MgPSA8JmdwaW8gNDMgR1BJT19BQ1RJVkVfSElHSD47
CisJCXJlc2V0LWdwaW9zID0gPCZncGlvIDgwIEdQSU9fQUNUSVZFX0hJR0g+OworCX07Cit9Owor
CiAmZWhycHdtMCB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

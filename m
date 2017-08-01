From: David Lechner <david@lechnology.com>
Subject: [PATCH v2 3/4] ARM: dts: da850-lego-ev3: Add node for LCD display
Date: Tue,  1 Aug 2017 17:11:49 -0500
Message-ID: <1501625510-16727-4-git-send-email-david@lechnology.com>
References: <1501625510-16727-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1501625510-16727-1-git-send-email-david@lechnology.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBhZGRzIGEgbmV3IG5vZGUgZm9yIHRoZSBMRUdPIE1JTkRTVE9STVMgRVYzIExDRCBkaXNw
bGF5LgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGVnby1ldjMuZHRzIHwgMjQgKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxlZ28tZXYzLmR0cyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2RhODUwLWxlZ28tZXYzLmR0cwppbmRleCA0NTk4M2MwLi4yNDliMzE3IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sZWdvLWV2My5kdHMKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZGE4NTAtbGVnby1ldjMuZHRzCkBAIC0yNDksNiArMjQ5LDE1IEBACiAJCQkweDRj
IDB4MDAwMDAwODAgMHgwMDAwMDBmMAogCQk+OwogCX07CisKKwlldjNfbGNkX3BpbnM6IHBpbm11
eF9sY2QgeworCQlwaW5jdHJsLXNpbmdsZSxiaXRzID0gPAorCQkJLyogU0lNTywgR1AyWzExXSwg
R1AyWzEyXSwgQ0xLICovCisJCQkweDE0IDB4MDAxODgxMDAgMHgwMGZmZmYwMAorCQkJLyogR1A1
WzBdICovCisJCQkweDMwIDB4ODAwMDAwMDAgMHhmMDAwMDAwMAorCQk+OworCX07CiB9OwogCiAm
cGluY29uZiB7CkBAIC0zNTcsNiArMzY2LDIxIEBACiAJfTsKIH07CiAKKyZzcGkxIHsKKwlzdGF0
dXMgPSAib2theSI7CisJcGluY3RybC0wID0gPCZldjNfbGNkX3BpbnM+OworCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7CisJY3MtZ3Bpb3MgPSA8JmdwaW8gNDQgR1BJT19BQ1RJVkVfTE9XPjsK
KworCWRpc3BsYXlAMHsKKwkJY29tcGF0aWJsZSA9ICJsZWdvLGV2My1sY2QiOworCQlyZWcgPSA8
MD47CisJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDEwMDAwMDAwPjsKKwkJZGMtZ3Bpb3MgPSA8Jmdw
aW8gNDMgR1BJT19BQ1RJVkVfSElHSD47CisJCXJlc2V0LWdwaW9zID0gPCZncGlvIDgwIEdQSU9f
QUNUSVZFX0hJR0g+OworCX07Cit9OworCiAmZWhycHdtMCB7CiAJc3RhdHVzID0gIm9rYXkiOwog
fTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

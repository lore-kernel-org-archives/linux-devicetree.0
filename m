From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 23/23] smiapp: Query the V4L2 endpoint for a specific bus
 type
Date: Thu, 13 Sep 2018 00:29:42 +0300
Message-ID: <20180912212942.19641-24-sakari.ailus@linux.intel.com>
References: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, jacopo@jmondi.org, dri-devel@lists.freedesktop.org, slongerbeam@gmail.com, niklas.soderlund@ragnatech.se
List-Id: devicetree@vger.kernel.org

SW5zdGVhZCBvZiBvcHBvcnR1bmlzdGljYWxseSB0cnlpbmcgdG8gZ2F0aGVyIHNvbWUgaW5mb3Jt
YXRpb24gZnJvbSB0aGUKVjRMMiBlbmRwb2ludCwgc2V0IHRoZSBidXMgdHlwZSBhbmQgbGV0IHRo
ZSBWNEwyIGZ3bm9kZSBmcmFtZXdvcmsgZmlndXJlCm91dCB0aGUgY29uZmlndXJhdGlvbi4KClNp
Z25lZC1vZmYtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4K
VGVzdGVkLWJ5OiBTdGV2ZSBMb25nZXJiZWFtIDxzdGV2ZV9sb25nZXJiZWFtQG1lbnRvci5jb20+
Ci0tLQogZHJpdmVycy9tZWRpYS9pMmMvc21pYXBwL3NtaWFwcC1jb3JlLmMgfCA2ICsrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvaTJjL3NtaWFwcC9zbWlhcHAtY29yZS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvc21pYXBwL3Nt
aWFwcC1jb3JlLmMKaW5kZXggMDQ4YWI2Y2ZhYTk3Li4wZDY2MDM0OWIxM2MgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbWVkaWEvaTJjL3NtaWFwcC9zbWlhcHAtY29yZS5jCisrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL3NtaWFwcC9zbWlhcHAtY29yZS5jCkBAIC0yNzc1LDcgKzI3NzUsMTMgQEAgc3RhdGlj
IHN0cnVjdCBzbWlhcHBfaHdjb25maWcgKnNtaWFwcF9nZXRfaHdjb25maWcoc3RydWN0IGRldmlj
ZSAqZGV2KQogCWlmICghZXApCiAJCXJldHVybiBOVUxMOwogCisJYnVzX2NmZy5idXNfdHlwZSA9
IFY0TDJfTUJVU19DU0kyX0RQSFk7CiAJcnZhbCA9IHY0bDJfZndub2RlX2VuZHBvaW50X2FsbG9j
X3BhcnNlKGVwLCAmYnVzX2NmZyk7CisJaWYgKHJ2YWwgPT0gLUVOWElPKSB7CisJCWJ1c19jZmcg
PSAoc3RydWN0IHY0bDJfZndub2RlX2VuZHBvaW50KQorCQkJeyAuYnVzX3R5cGUgPSBWNEwyX01C
VVNfQ0NQMiB9OworCQlydmFsID0gdjRsMl9md25vZGVfZW5kcG9pbnRfYWxsb2NfcGFyc2UoZXAs
ICZidXNfY2ZnKTsKKwl9CiAJaWYgKHJ2YWwpCiAJCWdvdG8gb3V0X2VycjsKIAotLSAKMi4xMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

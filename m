From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v16 06/19] lib: enable building KUnit in lib/
Date: Fri, 20 Sep 2019 16:19:10 -0700
Message-ID: <20190920231923.141900-7-brendanhiggins@google.com>
References: <20190920231923.141900-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190920231923.141900-1-brendanhiggins@google.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com, Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at, torvalds@linux-foundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, logang@deltatee.com
List-Id: devicetree@vger.kernel.org

S1VuaXQgaXMgYSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQg
d2hlbiB1c2VkIGlzCmJ1aWx0IGludG8gdGhlIGtlcm5lbCBhcyBhIHBhcnQgb2YgaXQuIEFkZCBL
VW5pdCB0byB0aGUgbGliIEtjb25maWcgYW5kCk1ha2VmaWxlIHRvIGFsbG93IGl0IHRvIGJlIGFj
dHVhbGx5IGJ1aWx0LgoKU2lnbmVkLW9mZi1ieTogQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuaGln
Z2luc0Bnb29nbGUuY29tPgpDYzogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+
CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWFzYWhp
cm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KQ2M6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgotLS0KIGxpYi9LY29uZmlnLmRlYnVnIHwgMiArKwogbGli
L01ha2VmaWxlICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmRlYnVnIGIvbGliL0tjb25maWcuZGVidWcKaW5kZXgg
NTk2MGUyOTgwYThhLi41ODcwZmJlMTFlOWIgMTAwNjQ0Ci0tLSBhL2xpYi9LY29uZmlnLmRlYnVn
CisrKyBiL2xpYi9LY29uZmlnLmRlYnVnCkBAIC0yMTQ0LDQgKzIxNDQsNiBAQCBjb25maWcgSU9f
U1RSSUNUX0RFVk1FTQogCiBzb3VyY2UgImFyY2gvJChTUkNBUkNIKS9LY29uZmlnLmRlYnVnIgog
Citzb3VyY2UgImxpYi9rdW5pdC9LY29uZmlnIgorCiBlbmRtZW51ICMgS2VybmVsIGhhY2tpbmcK
ZGlmZiAtLWdpdCBhL2xpYi9NYWtlZmlsZSBiL2xpYi9NYWtlZmlsZQppbmRleCAyOWMwMmE5MjQ5
NzMuLjY3ZTc5ZDM3MjRlZCAxMDA2NDQKLS0tIGEvbGliL01ha2VmaWxlCisrKyBiL2xpYi9NYWtl
ZmlsZQpAQCAtOTYsNiArOTYsOCBAQCBvYmotJChDT05GSUdfVEVTVF9NRU1JTklUKSArPSB0ZXN0
X21lbWluaXQubwogCiBvYmotJChDT05GSUdfVEVTVF9MSVZFUEFUQ0gpICs9IGxpdmVwYXRjaC8K
IAorb2JqLSQoQ09ORklHX0tVTklUKSArPSBrdW5pdC8KKwogaWZlcSAoJChDT05GSUdfREVCVUdf
S09CSkVDVCkseSkKIENGTEFHU19rb2JqZWN0Lm8gKz0gLURERUJVRwogQ0ZMQUdTX2tvYmplY3Rf
dWV2ZW50Lm8gKz0gLURERUJVRwotLSAKMi4yMy4wLjM1MS5nYzQzMTcwMzJlNi1nb29nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

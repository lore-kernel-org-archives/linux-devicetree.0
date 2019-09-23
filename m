From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v18 06/19] lib: enable building KUnit in lib/
Date: Mon, 23 Sep 2019 08:35:14 -0700
Message-ID: <20190923153515.0527C207FD@mail.kernel.org>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20190923090249.127984-7-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190923090249.127984-7-brendanhiggins@google.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com, Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at, torvalds@linux-foundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, logang@deltatee.com
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDktMjMgMDI6MDI6MzYpCj4gS1VuaXQgaXMg
YSBuZXcgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayBmb3IgdGhlIGtlcm5lbCBhbmQgd2hlbiB1c2Vk
IGlzCj4gYnVpbHQgaW50byB0aGUga2VybmVsIGFzIGEgcGFydCBvZiBpdC4gQWRkIEtVbml0IHRv
IHRoZSBsaWIgS2NvbmZpZyBhbmQKPiBNYWtlZmlsZSB0byBhbGxvdyBpdCB0byBiZSBhY3R1YWxs
eSBidWlsdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdn
aW5zQGdvb2dsZS5jb20+Cj4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IENjOiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVu
IEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

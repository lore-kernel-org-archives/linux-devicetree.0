From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Date: Tue, 14 May 2019 10:46:55 +0200
Message-ID: <20190514084655.GK2589@hirez.programming.kicks-ass.net>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
 <20190514065643.GC2589@hirez.programming.kicks-ass.net>
 <20190514081223.GA230665@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190514081223.GA230665@google.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com, dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com, mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org, kbuild test robot <lkp@intel.com>, linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr, Josh Poimboeuf <jpoimboe@redhat.com>, dan.j.williams@intel.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDE6MTI6MjNBTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDA4OjU2OjQzQU0gKzAyMDAsIFBldGVy
IFppamxzdHJhIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTA6NDI6NDJQTSAt
MDcwMCwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ID4gPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dp
bmcgd2FybmluZyBzZWVuIG9uIEdDQyA3LjM6Cj4gPiA+ICAga3VuaXQvdGVzdC10ZXN0Lm86IHdh
cm5pbmc6IG9ianRvb2w6IGt1bml0X3Rlc3RfdW5zdWNjZXNzZnVsX3RyeSgpIGZhbGxzIHRocm91
Z2ggdG8gbmV4dCBmdW5jdGlvbiBrdW5pdF90ZXN0X2NhdGNoKCkKPiA+ID4gCj4gPiAKPiA+IFdo
YXQgaXMgdGhhdCBmaWxlIGFuZCBmdW5jdGlvbjsgbm8ga2VybmVsIHRyZWUgbmVhciBtZSBzZWVt
cyB0byBoYXZlCj4gPiB0aGF0Lgo+IAo+IE9oLCBzb3JyeSBhYm91dCB0aGF0LiBUaGUgZnVuY3Rp
b24gaXMgYWRkZWQgaW4gdGhlIGZvbGxvd2luZyBwYXRjaCwKPiAiW1BBVENIIHYzIDA5LzE4XSBr
dW5pdDogdGVzdDogYWRkIHN1cHBvcnQgZm9yIHRlc3QgYWJvcnQiWzFdLgo+IAo+IE15IGFwb2xv
Z2llcyBpZiB0aGlzIHBhdGNoIGlzIHN1cHBvc2VkIHRvIGNvbWUgYWZ0ZXIgaXQgaW4gc2VxdWVu
Y2UsIGJ1dAo+IEkgYXNzdW1lZCBpdCBzaG91bGQgY29tZSBiZWZvcmUgb3RoZXJ3aXNlIG9ianRv
b2wgd291bGQgY29tcGxhaW4gYWJvdXQKPiB0aGUgc3ltYm9sIHdoZW4gaXQgaXMgaW50cm9kdWNl
ZC4KCk9yIHNlbmQgbWUgYWxsIHBhdGNoZXMgc3VjaCB0aGF0IEkgaGF2ZSBjb250ZXh0LCBvciBo
YXZlIGEgc2FuZQpDaGFuZ2Vsb2cgdGhhdCBnaXZlcyBtZSBjb250ZXh0LiBKdXN0IGRvbid0IGdp
dmUgbWUgb25lIHBhdGNoIHdpdGggYQpjcmFwcHkgY2hhbmdlbG9nLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

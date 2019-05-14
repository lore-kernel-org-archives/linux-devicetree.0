From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 15/18] Documentation: kunit: add documentation for KUnit
Date: Tue, 14 May 2019 12:16:23 -0600
Message-ID: <20190514121623.0314bf07@lwn.net>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-16-brendanhiggins@google.com>
 <20190514073422.4287267c@lwn.net>
 <20190514180810.GA109557@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190514180810.GA109557@google.com>
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com, dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com, mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com, Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com, linux-fsdevel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAxNCBNYXkgMjAxOSAxMTowODoxMCAtMDcwMApCcmVuZGFuIEhpZ2dpbnMgPGJyZW5k
YW5oaWdnaW5zQGdvb2dsZS5jb20+IHdyb3RlOgoKPiA+IE5hdHVyYWxseSwgdGhvdWdoLCBJIGhh
dmUgb25lIHJlcXVlc3Q6IEknZCByYXRoZXIgbm90IHNlZSB0aGlzIGF0IHRoZSB0b3AKPiA+IGxl
dmVsLCB3aGljaCBpcyBtb3JlIHRoYW4gY3Jvd2RlZCBlbm91Z2ggYXMgaXQgaXMuICBDYW4gdGhp
cyBtYXRlcmlhbAo+ID4gcGxlYXNlIGdvIGludG8gdGhlIGRldmVsb3BtZW50IHRvb2xzIGJvb2ss
IGFsb25nc2lkZSB0aGUga3NlbGZ0ZXN0Cj4gPiBkb2N1bWVudGF0aW9uPyAgCj4gCj4gT2ggeWVh
aCwgdGhhdCBzZWVtcyBsaWtlIHRoZSBvYnZpb3VzIGhvbWUgZm9yIHRoaXMgaW4gaGluZHNpZ2h0
LiBTb3JyeQo+IGFib3V0IHRoYXQuIFdpbGwgZml4IGluIG5leHQgcmV2aXNpb24hCgpObyBuZWVk
IHRvIGFwb2xvZ2l6ZSAtIEkgaGF2ZSB0byBzYXkgdGhlIHNhbWUgdGhpbmcgdG8gZXZlcnlib2R5
IDopCgpUaGFua3MsCgpqb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

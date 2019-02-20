From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC v4 10/17] kunit: test: add test managed resource tests
Date: Wed, 20 Feb 2019 14:03:53 -0800
Message-ID: <155070023383.77512.8827935805798619870@swboyd.mtv.corp.google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-11-brendanhiggins@google.com>
 <155026408761.115909.17855438744578437385@swboyd.mtv.corp.google.com>
 <CAFd5g44Dizk-VsFOmGn++E0d40sZmH6V+j05Eu6zUXaBj1xfcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAFd5g44Dizk-VsFOmGn++E0d40sZmH6V+j05Eu6zUXaBj1xfcA@mail.gmail.com>
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
Cc: brakmo@fb.com, amir73il@gmail.com, dri-devel <dri-devel@lists.freedesktop.org>, Sasha Levin <Alexander.Levin@microsoft.com>, linux-kselftest@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-nvdimm <linux-nvdimm@lists.01.org>, Richard Weinberger <richard@nod.at>, Knut Omang <knut.omang@oracle.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com, Joel Stanley <joel@jms.id.au>, Jeff Dike <jdike@addtoit.com>, dan.carpenter@oracle.com, devicetree <devicetree@vger.kernel.org>, shuah@kernel.org, "Bird, Timothy" <Tim.Bird@sony.com>, Kees Cook <keescook@google.com>, linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>, Dan Williams <dan.j.williams@intel.com>, kunit-dev@googlegroups.com, om@freedesktop.org, Petr Mladek <pmladek@suse.c>, Greg KH <gregkh@linuxfoundation.org>, Linux
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDItMTkgMTU6MjA6MTgpCj4gT24gRnJpLCBG
ZWIgMTUsIDIwMTkgYXQgMTI6NTQgUE0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Cj4gPiBRdW90aW5nIEJyZW5kYW4gSGlnZ2lucyAoMjAxOS0wMi0xNCAxMzozNzoy
MikKPiA+ID4gKwo+ID4gPiArc3RhdGljIHN0cnVjdCBrdW5pdF9jYXNlIGt1bml0X3Jlc291cmNl
X3Rlc3RfY2FzZXNbXSA9IHsKPiA+Cj4gPiBDYW4gdGhlc2UgYXJyYXlzIGJlIGNvbnN0Pwo+IAo+
IFRoZXJlIGlzIHNvbWUgcHJpdmF0ZSBtdXRhYmxlIHN0YXRlIGluc2lkZSBvZiBgc3RydWN0IGt1
bml0X2Nhc2VgIHRoYXQKPiB3b3VsZCBiZSBraW5kIG9mIGFubm95aW5nIHRvIHB1bGwgb3V0OyBJ
IGRvbid0IHRoaW5rIGl0IHdvdWxkIG1ha2UgaXQKPiBjbGVhbmVyLgoKRmFpciBlbm91Z2guIFRo
YW5rcyBmb3IgY2hlY2tpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

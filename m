From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
Date: Mon, 12 Aug 2019 15:55:19 -0700
Message-ID: <20190812225520.5A67C206A2@mail.kernel.org>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190812182421.141150-4-brendanhiggins@google.com>
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com, Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MDYpCj4gK3ZvaWQgc3Ry
aW5nX3N0cmVhbV9jbGVhcihzdHJ1Y3Qgc3RyaW5nX3N0cmVhbSAqc3RyZWFtKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc3RyaW5nX3N0cmVhbV9mcmFnbWVudCAqZnJhZ19jb250YWluZXIsICpmcmFn
X2NvbnRhaW5lcl9zYWZlOwo+ICsKPiArICAgICAgIHNwaW5fbG9jaygmc3RyZWFtLT5sb2NrKTsK
PiArICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShmcmFnX2NvbnRhaW5lciwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFnX2NvbnRhaW5lcl9zYWZlLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdHJlYW0tPmZyYWdtZW50cywKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBub2RlKSB7Cj4gKyAgICAgICAgICAgICAgIGxpc3Rf
ZGVsKCZmcmFnX2NvbnRhaW5lci0+bm9kZSk7CgpTaG91bGRuJ3Qgd2UgZnJlZSB0aGUgYWxsb2Nh
dGlvbiBoZXJlPyBPdGhlcndpc2UsIGlmIHNvbWUgdGVzdCBpcyBnb2luZwp0byBhZGQsIGFkZCwg
Y2xlYXIsIGFkZCwgaXQncyBnb2luZyB0byBsZWFrIHVudGlsIHRoZSB0ZXN0IGlzIG92ZXI/Cgo+
ICsgICAgICAgfQo+ICsgICAgICAgc3RyZWFtLT5sZW5ndGggPSAwOwo+ICsgICAgICAgc3Bpbl91
bmxvY2soJnN0cmVhbS0+bG9jayk7Cj4gK30KPiArCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

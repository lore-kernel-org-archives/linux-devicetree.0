From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Fri, 4 Oct 2019 14:42:17 -0700
Message-ID: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
References: <20190923090249.127984-1-brendanhiggins@google.com>
 <20191004213812.GA24644@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191004213812.GA24644@mit.edu>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Petr Mladek <pmladek@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, dri-devel <dri-devel@lists.freedesktop.org>, Sasha Levin <Alexander.Levin@microsoft.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>, Frank Rowand <frowand.list@gmail.com>, knut.omang@oracle.com, kieran.bingham@ideasonboard.com, wfg@linux.intel.com, Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>, jdike@addtoit.com, Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tim.Bird@sony.com
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBPY3QgNCwgMjAxOSBhdCAyOjM5IFBNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+Cj4gVGhpcyBxdWVzdGlvbiBpcyBwcmltYXJpbHkgZGlyZWN0ZWQgYXQg
U2h1YWggYW5kIExpbnVzLi4uLgo+Cj4gV2hhdCdzIHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUg
a3VuaXQgc2VyaWVzIG5vdyB0aGF0IEJyZW5kYW4gaGFzCj4gbW92ZWQgaXQgb3V0IG9mIHRoZSB0
b3AtbGV2ZWwga3VuaXQgZGlyZWN0b3J5IGFzIExpbnVzIGhhcyByZXF1ZXN0ZWQ/CgpXZSBzZWVt
ZWQgdG8gZGVjaWRlIHRvIGp1c3Qgd2FpdCBmb3IgNS41LCBidXQgdGhlcmUgaXMgbm90aGluZyB0
aGF0Cmxvb2tzIHRvIGJsb2NrIHRoYXQuIEFuZCBJIGVuY291cmFnZWQgU2h1YWggdG8gZmluZCBt
b3JlIGt1bml0IGNhc2VzCmZvciB3aGVuIGl0IF9kb2VzXyBnZXQgbWVyZ2VkLgoKU28gaWYgdGhl
IGt1bml0IGJyYW5jaCBpcyBzdGFibGUsIGFuZCBwZW9wbGUgd2FudCB0byBzdGFydCB1c2luZyBp
dApmb3IgdGhlaXIgdW5pdCB0ZXN0cywgdGhlbiBJIHRoaW5rIHRoYXQgd291bGQgYmUgYSBnb29k
IGlkZWEsIGFuZCB0aGVuCmR1cmluZyB0aGUgNS41IG1lcmdlIHdpbmRvdyB3ZSdsbCBub3QganVz
dCBnZXQgdGhlIGluZnJhc3RydWN0dXJlLAp3ZSdsbCBnZXQgYSBmZXcgbW9yZSB1c2VycyB0b28g
YW5kIG5vdCBqdXN0IGV4YW1wbGVzLgoKICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

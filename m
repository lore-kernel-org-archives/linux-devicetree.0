From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Sun, 6 Oct 2019 10:18:11 -0700
Message-ID: <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
References: <CAHk-=whX-JbpM2Sc85epng_GAgGGzxRAJ2SSKkMf9N1Lsqe+OA@mail.gmail.com>
 <56e2e1a7-f8fe-765b-8452-1710b41895bf@kernel.org>
 <20191004222714.GA107737@google.com>
 <ad800337-1ae2-49d2-e715-aa1974e28a10@kernel.org>
 <20191004232955.GC12012@mit.edu>
 <CAFd5g456rBSp177EkYAwsF+KZ0rxJa90mzUpW2M3R7tWbMAh9Q@mail.gmail.com>
 <63e59b0b-b51e-01f4-6359-a134a1f903fd@kernel.org>
 <CAFd5g47wji3T9RFmqBwt+jPY0tb83y46oj_ttOq=rTX_N1Ggyg@mail.gmail.com>
 <544bdfcb-fb35-5008-ec94-8d404a08fd14@kernel.org>
 <CAFd5g467PkfELixpU0JbaepEAAD_ugAA340-uORngC-eXsQQ-g@mail.gmail.com>
 <20191006165436.GA29585@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191006165436.GA29585@mit.edu>
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
Cc: Petr Mladek <pmladek@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, dri-devel <dri-devel@lists.freedesktop.org>, Sasha Levin <Alexander.Levin@microsoft.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-nvdimm <linux-nvdimm@lists.01.org>, shuah <shuah@kernel.org>, Knut Omang <knut.omang@oracle.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com, Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>, Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>, devicetree <devicetree@vger.kernel.org>, Linux
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBPY3QgNiwgMjAxOSBhdCA5OjU1IEFNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1p
dC5lZHU+IHdyb3RlOgo+Cj4gV2VsbCwgb25lIHRoaW5nIHdlICpjYW4qIGRvIGlzIGlmIChhKSBp
ZiB3ZSBjYW4gY3JlYXRlIGEga3NlbGZ0ZXN0Cj4gYnJhbmNoIHdoaWNoIHdlIGtub3cgaXMgc3Rh
YmxlIGFuZCB3b24ndCBjaGFuZ2UsIGFuZCAoYikgd2UgY2FuIGdldAo+IGFzc3VyYW5jZXMgdGhh
dCBMaW51cyAqd2lsbCogYWNjZXB0IHRoYXQgYnJhbmNoIGR1cmluZyB0aGUgbmV4dCBtZXJnZQo+
IHdpbmRvdywgdGhvc2Ugc3Vic3lzdGVtcyB3aGljaCB3YW50IHRvIHVzZSBrc2VsZiB0ZXN0IGNh
biBzaW1wbHkgcHVsbAo+IGl0IGludG8gdGhlaXIgdHJlZS4KClllcy4KCkF0IHRoZSBzYW1lIHRp
bWUsIEkgZG9uJ3QgdGhpbmsgaXQgbmVlZHMgdG8gYmUgZXZlbiB0aGF0IGZhbmN5LiBFdmVuCmlm
IGl0J3Mgbm90IGEgc3RhYmxlIGJyYW5jaCB0aGF0IGdldHMgc2hhcmVkIGJldHdlZW4gZGlmZmVy
ZW50CmRldmVsb3BlcnMsIGl0IHdvdWxkIGJlIGdvb2QgdG8ganVzdCBoYXZlIHBlb3BsZSBkbyBh
ICJsZXQncyB0cnkgdGhpcyIKdGhyb3ctYXdheSBicmFuY2ggdG8gdXNlIHRoZSBrdW5pdCBmdW5j
dGlvbmFsaXR5IGFuZCB2ZXJpZnkgdGhhdAoieWVhaCwgdGhpcyBpcyBmYWlybHkgY29udmVuaWVu
dCBmb3IgZXh0NCIuCgpJdCBkb2Vzbid0IGhhdmUgdG8gYmUgbWVyZ2VkIGluIHRoYXQgZm9ybSwg
YnV0IGp1c3QgY29uZmlybWF0aW9uIHRoYXQKdGhlIGluZnJhc3RydWN0dXJlIGlzIGhlbHBmdWwg
YmVmb3JlIGl0IGdldHMgbWVyZ2VkIHdvdWxkIGJlIGdvb2QuCgogICAgICAgICAgICAgICBMaW51
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Mon, 7 Oct 2019 01:40:53 -0700
Message-ID: <CAFd5g45djTX+FaXwn2abve1+6GbtNrv+8EJgDe_TXn1d+pzukA@mail.gmail.com>
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
 <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAHk-=wjcJxypxUOSF-jc=SQKT1CrOoTMyT7soYzbvK3965JmCA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, Sasha Levin <Alexander.Levin@microsoft.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-nvdimm <linux-nvdimm@lists.01.org>, shuah <shuah@kernel.org>, Knut Omang <knut.omang@oracle.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com, Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>, Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>, devicetree <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Bird,
 Timo
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBPY3QgNiwgMjAxOSBhdCAxMDoxOCBBTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBPY3QgNiwgMjAxOSBhdCA5
OjU1IEFNIFRoZW9kb3JlIFkuIFRzJ28gPHR5dHNvQG1pdC5lZHU+IHdyb3RlOgo+ID4KPiA+IFdl
bGwsIG9uZSB0aGluZyB3ZSAqY2FuKiBkbyBpcyBpZiAoYSkgaWYgd2UgY2FuIGNyZWF0ZSBhIGtz
ZWxmdGVzdAo+ID4gYnJhbmNoIHdoaWNoIHdlIGtub3cgaXMgc3RhYmxlIGFuZCB3b24ndCBjaGFu
Z2UsIGFuZCAoYikgd2UgY2FuIGdldAo+ID4gYXNzdXJhbmNlcyB0aGF0IExpbnVzICp3aWxsKiBh
Y2NlcHQgdGhhdCBicmFuY2ggZHVyaW5nIHRoZSBuZXh0IG1lcmdlCj4gPiB3aW5kb3csIHRob3Nl
IHN1YnN5c3RlbXMgd2hpY2ggd2FudCB0byB1c2Uga3NlbGYgdGVzdCBjYW4gc2ltcGx5IHB1bGwK
PiA+IGl0IGludG8gdGhlaXIgdHJlZS4KPgo+IFllcy4KPgo+IEF0IHRoZSBzYW1lIHRpbWUsIEkg
ZG9uJ3QgdGhpbmsgaXQgbmVlZHMgdG8gYmUgZXZlbiB0aGF0IGZhbmN5LiBFdmVuCj4gaWYgaXQn
cyBub3QgYSBzdGFibGUgYnJhbmNoIHRoYXQgZ2V0cyBzaGFyZWQgYmV0d2VlbiBkaWZmZXJlbnQK
PiBkZXZlbG9wZXJzLCBpdCB3b3VsZCBiZSBnb29kIHRvIGp1c3QgaGF2ZSBwZW9wbGUgZG8gYSAi
bGV0J3MgdHJ5IHRoaXMiCj4gdGhyb3ctYXdheSBicmFuY2ggdG8gdXNlIHRoZSBrdW5pdCBmdW5j
dGlvbmFsaXR5IGFuZCB2ZXJpZnkgdGhhdAo+ICJ5ZWFoLCB0aGlzIGlzIGZhaXJseSBjb252ZW5p
ZW50IGZvciBleHQ0Ii4KPgo+IEl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBtZXJnZWQgaW4gdGhhdCBm
b3JtLCBidXQganVzdCBjb25maXJtYXRpb24gdGhhdAo+IHRoZSBpbmZyYXN0cnVjdHVyZSBpcyBo
ZWxwZnVsIGJlZm9yZSBpdCBnZXRzIG1lcmdlZCB3b3VsZCBiZSBnb29kLgoKSSB0aG91Z2h0IHdl
IGFscmVhZHkgaGFkIGRvbmUgdGhpcyBzYXRpc2ZhY3RvcmlseS4KCldlIGhhdmUgb25lIHByb29m
LW9mLWNvbmNlcHQgdGVzdCBpbiB0aGUgYnJhbmNoIGluIHRoZSBrc2VsZnRlc3QgcmVwbwoocHJv
YyBzeXNjdGwgdGVzdCkgdGhhdCB3ZW50IG91dCBpbiB0aGUgcHVsbCByZXF1ZXN0LCBhbmQgd2Ug
YWxzbyBoYWQKc29tZSBvdGhlciB0ZXN0cyB0aGF0IHdlcmUgbm90IGluIHRoZSBwdWxsIHJlcXVl
c3QgKHRoZXJlIGlzIHRoZSBleHQ0CnRpbWVzdGFtcCBzdHVmZiBtZW50aW9uZWQgYWJvdmUsIGFu
ZCB3ZSBhbHNvIGhhZCBvbmUgYWdhaW5zdCB0aGUgbGlzdApkYXRhIHN0cnVjdHVyZSksIHdoaWNo
IHdlIHdlcmUgcGxhbm5pbmcgb24gc2VuZGluZyBvdXQgZm9yIHJldmlldyBvbmNlClNodWFoJ3Mg
cHVsbCByZXF1ZXN0IHdhcyBhY2NlcHRlZC4gSSBrbm93IHRoZSBhcHBhcm1vciBwZW9wbGUgYWxz
bwp3cm90ZSBzb21lIHRlc3RzIHRoYXQgdGhleSBzYWlkIHdlcmUgdXNlZnVsOyBob3dldmVyLCBJ
IGhhdmUgbm90CmNvb3JkaW5hdGVkIHdpdGggdGhlbSBvbiB1cHN0cmVhbWluZyB0aGVpciB0ZXN0
cy4gSSBrbm93IG9mIHNvbWUgb3RoZXIKcGVvcGxlIHdobyBhcmUgdXNpbmcgaXQsIGJ1dCBJIGRv
bid0IHRoaW5rIHRoZSB0ZXN0cyBhcmUgYXMgZmFyIGFsb25nCmZvciB1cHN0cmVhbWluZy4KClRo
ZSBwb2ludCBpczogSSB0aG91Z2h0IHdlIGhhZCBwbGVudHkgb2Ygc2lnbmFsIHRoYXQgS1VuaXQg
d291bGQgYmUKdXNlZnVsIHRvIGhhdmUgbWVyZ2VkIGludG8gdGhlIG1haW5saW5lIGtlcm5lbC4g
SSB0aG91Z2h0IHRoZSBvbmx5CnJlYXNvbiBpdCB3YXMgcmVqZWN0ZWQgZm9yIDUuNCB3YXMgZHVl
IHRvIHRoZSBkaXJlY3RvcnkgbmFtZSBpc3N1ZQpjb21iaW5lZCB3aXRoIGJhZCB0aW1pbmcuCgpQ
bGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3NlZCBhbnl0aGluZy4KClRoYW5rcyEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

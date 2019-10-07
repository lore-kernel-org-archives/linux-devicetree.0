From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v18 00/19] kunit: introduce KUnit, the Linux kernel unit
 testing framework
Date: Mon, 7 Oct 2019 10:40:48 -0400
Message-ID: <20191007104048.66ae7e59@gandalf.local.home>
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
Cc: Petr Mladek <pmladek@suse.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>, Brendan Higgins <brendanhiggins@google.com>, dri-devel <dri-devel@lists.freedesktop.org>, Sasha Levin <Alexander.Levin@microsoft.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-nvdimm <linux-nvdimm@lists.01.org>, shuah <shuah@kernel.org>, Knut Omang <knut.omang@oracle.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com, Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>, Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>, devicetree <devicetree@vger.kernel.org>, Linux
List-Id: devicetree@vger.kernel.org

T24gU3VuLCA2IE9jdCAyMDE5IDEwOjE4OjExIC0wNzAwCkxpbnVzIFRvcnZhbGRzIDx0b3J2YWxk
c0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cgo+IE9uIFN1biwgT2N0IDYsIDIwMTkgYXQg
OTo1NSBBTSBUaGVvZG9yZSBZLiBUcydvIDx0eXRzb0BtaXQuZWR1PiB3cm90ZToKPiA+Cj4gPiBX
ZWxsLCBvbmUgdGhpbmcgd2UgKmNhbiogZG8gaXMgaWYgKGEpIGlmIHdlIGNhbiBjcmVhdGUgYSBr
c2VsZnRlc3QKPiA+IGJyYW5jaCB3aGljaCB3ZSBrbm93IGlzIHN0YWJsZSBhbmQgd29uJ3QgY2hh
bmdlLCBhbmQgKGIpIHdlIGNhbiBnZXQKPiA+IGFzc3VyYW5jZXMgdGhhdCBMaW51cyAqd2lsbCog
YWNjZXB0IHRoYXQgYnJhbmNoIGR1cmluZyB0aGUgbmV4dCBtZXJnZQo+ID4gd2luZG93LCB0aG9z
ZSBzdWJzeXN0ZW1zIHdoaWNoIHdhbnQgdG8gdXNlIGtzZWxmIHRlc3QgY2FuIHNpbXBseSBwdWxs
Cj4gPiBpdCBpbnRvIHRoZWlyIHRyZWUuICAKPiAKPiBZZXMuCj4gCj4gQXQgdGhlIHNhbWUgdGlt
ZSwgSSBkb24ndCB0aGluayBpdCBuZWVkcyB0byBiZSBldmVuIHRoYXQgZmFuY3kuIEV2ZW4KPiBp
ZiBpdCdzIG5vdCBhIHN0YWJsZSBicmFuY2ggdGhhdCBnZXRzIHNoYXJlZCBiZXR3ZWVuIGRpZmZl
cmVudAo+IGRldmVsb3BlcnMsIGl0IHdvdWxkIGJlIGdvb2QgdG8ganVzdCBoYXZlIHBlb3BsZSBk
byBhICJsZXQncyB0cnkgdGhpcyIKPiB0aHJvdy1hd2F5IGJyYW5jaCB0byB1c2UgdGhlIGt1bml0
IGZ1bmN0aW9uYWxpdHkgYW5kIHZlcmlmeSB0aGF0Cj4gInllYWgsIHRoaXMgaXMgZmFpcmx5IGNv
bnZlbmllbnQgZm9yIGV4dDQiLgo+IAo+IEl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBtZXJnZWQgaW4g
dGhhdCBmb3JtLCBidXQganVzdCBjb25maXJtYXRpb24gdGhhdAo+IHRoZSBpbmZyYXN0cnVjdHVy
ZSBpcyBoZWxwZnVsIGJlZm9yZSBpdCBnZXRzIG1lcmdlZCB3b3VsZCBiZSBnb29kLgoKQ2FuJ3Qg
eW91IGp1c3QgY3JlYXRlIGFuIGV4dDQgYnJhbmNoIHRoYXQgaGFzIHRoZSBrc2VsZnRlc3QtbmV4
dCBicmFuY2gKaW4gaXQsIHRoYXQgeW91IGJ1aWxkIHVwb24uIEFuZCBwdXNoIHRoYXQgYWZ0ZXIg
dGhlIGt1bml0IHRlc3QgaXMKbWVyZ2VkPwoKSW4gdGhlIHBhc3QgSSd2ZSBoYWQgdG8gcmVseSBv
biBvdGhlciBicmFuY2hlcyBpbiBuZXh0LCBhbmQgd291bGQganVzdApob2xkIHR3byBicmFuY2hl
cyBteXNlbGYuIE9uZSB3aXRoIGV2ZXJ5dGhpbmcgbm90IGRlcGVuZGVudCBvbiB0aGUgb3RoZXIK
ZGV2ZWxvcGVyJ3MgYnJhbmNoLCBhbmQgb25lIHdpdGggdGhlIHdvcmsgdGhhdCB3YXMuIEF0IHRo
ZSBtZXJnZQp3aW5kb3csIEkgd291bGQgZWl0aGVyIG1lcmdlIHRoZSB0d28gb3IganVzdCBzZW5k
IHR3byBwdWxsIHJlcXVlc3RzCndpdGggdGhlIHR3byBicmFuY2hlcy4KCi0tIFN0ZXZlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

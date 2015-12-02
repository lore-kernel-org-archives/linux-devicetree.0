From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v3 2/4] drm: Add support for ARM's HDLCD controller.
Date: Wed, 2 Dec 2015 17:21:44 +0000
Message-ID: <CAPj87rNFFGeL8z9GBXxyVri1RyhVpMGS0yz7opgCYamHYV1Yow@mail.gmail.com>
References: <1449058982-18595-1-git-send-email-Liviu.Dudau@arm.com>
 <1449058982-18595-3-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1449058982-18595-3-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Jon Medhurst <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DRI devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTGl2aXUsCgpPbiAyIERlY2VtYmVyIDIwMTUgYXQgMTI6MjMsIExpdml1IER1ZGF1IDxMaXZp
dS5EdWRhdUBhcm0uY29tPiB3cm90ZToKPiArICAgICAgIGlmIChpcnFfc3RhdHVzICYgSERMQ0Rf
SU5URVJSVVBUX1ZTWU5DKSB7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7
Cj4gKwo+ICsgICAgICAgICAgICAgICBkcm1faGFuZGxlX3ZibGFuayhkcm0sIDApOwo+ICsKPiAr
ICAgICAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRybS0+ZXZlbnRfbG9jaywgZmxhZ3Mp
Owo+ICsgICAgICAgICAgICAgICBpZiAoaGRsY2QtPmV2ZW50KSB7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX3NlbmRfdmJsYW5rX2V2ZW50KGRybSwgaGRsY2QtPmV2ZW50LT5waXBlLCBo
ZGxjZC0+ZXZlbnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9jcnRjX3ZibGFua19w
dXQoJmhkbGNkLT5jcnRjKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZGxjZC0+ZXZlbnQg
PSBOVUxMOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmRybS0+ZXZlbnRfbG9jaywgZmxhZ3MpOwo+ICsgICAgICAgfQoKQXMgd2l0
aCBWQzQgYW5kIFJvY2tjaGlwLCB5b3UncmUgbWlzc2luZyBhIC0+cHJlY2xvc2UgaGFuZGxlciBp
biB5b3VyCmRybV9kcnYsIHRvIG1ha2Ugc3VyZSB0aGF0IHlvdSBkb24ndCB0cnkgdG8gc2VuZCBl
dmVudHMgdG8gYSBkZWFkCmNsaWVudCAod2hpY2ggY2F1c2VzIGFuIE9PUFMpOgpodHRwczovL2dp
dC5jb2xsYWJvcmEuY29tL2NnaXQvdXNlci9kYW5pZWxzL2xpbnV4LmdpdC9jb21taXQvP2g9d2lw
LzQuNC54L3JvY2tjaGlwLWRybS1maXhlcyZpZD1kMTRmMjFiY2Q3CihhbmQgaXRzIHBhcmVudCkK
CkFsc28sIGlzIHRoZXJlIGFueXRoaW5nIHByZXZlbnRpbmcgY2xpZW50cyBmcm9tIHN1Ym1pdHRp
bmcgbXVsdGlwbGUKcGFnZWZsaXBzIGJlZm9yZSB0aGUgZXZlbnQgaXMgc2VudD8gSSBjb3VsZG4n
dCBzZWUgYW55dGhpbmcgZnJvbSBhCnF1aWNrIGxvb2ssIHNvIHlvdSBjb3VsZCBoYXZlIHRoZSBz
aXR1YXRpb24gb2Y6CiAgLSBjbGllbnQgc3VibWl0cyBwYWdlZmxpcCwgZXZlbnQgMSBzdG9yZWQg
dG8gaGRsY2QtPmV2ZW50CiAgLSBjbGllbnQgc3VibWl0cyBwYWdlZmxpcCwgZXZlbnQgMiBzdG9y
ZWQgdG8gaGRsY2QtPmV2ZW50CiAgLSB2YmxhbmsgYXJyaXZlcywgZXZlbnQgMiBpcyBzZW50CiAg
LSBldmVudCAxIGhhcyBkaXNhcHBlYXJlZCBhbmQgYmVlbiBsZWFrZWQKCkNoZWVycywKRGFuaWVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v5 5/9] ARM: versatile: Map local timers using Device
 Tree when possible
Date: Mon, 12 Dec 2011 11:29:20 +0000
Message-ID: <1323689360.2391.15.camel@hornet.cambridge.arm.com>
References: <1323457432-4800-1-git-send-email-pawel.moll@arm.com>
 <1323457432-4800-6-git-send-email-pawel.moll@arm.com>
 <4EE37A4D.8060204@ru.mvista.com>
 <1323687811.2391.3.camel@hornet.cambridge.arm.com>
 <4EE5E302.8070301@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4EE5E302.8070301@ru.mvista.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDExLTEyLTEyIGF0IDExOjE4ICswMDAwLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6
Cj4gICAgIEkgdGhpbmsgaWYgb2ZfaW9tYXAoKSBmYWlscywgaXQncyBiZWNhdXNlIHRoZSBzeXN0
ZW0gaXMgb3V0IG9mIG1lbW9yeSwgc28gCj4gLUVOT01FTSBzZWVtcyBtb3JlIHByb3BlciBlcnJv
ciBpbiB0aGlzIGNhc2UuIEFsdGhvdWdoLi4uIGl0J3Mgbm90IHRoZSBvbmx5IAo+IGNhc2Ugd2hl
biBvZl9pb21hcCgpIGZhaWxzLgoKSSBhY3R1YWxseSB0aGluayB0aGF0IGluIHRoaXMgdXNlIGNh
c2UgaXQncyBtdWNoIG1vcmUgbGlrZWx5IHRoYXQKb2ZfaW9tYXAoKSByZXR1cm5zIE5VTEwgYmVj
YXVzZSBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKCkgZmFpbHM6Cgp2b2lkIF9faW9tZW0gKm9mX2lv
bWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCkKeyAgICAgICAKICAgICAgICBz
dHJ1Y3QgcmVzb3VyY2UgcmVzOwogICAgICAgIAogICAgICAgIGlmIChvZl9hZGRyZXNzX3RvX3Jl
c291cmNlKG5wLCBpbmRleCwgJnJlcykpCiAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKCmFu
ZCB0aGlzIHdpbGwgLSBhZ2FpbiBtb3N0IGxpa2VseSAtIGhhcHBlbiB3aGVuIG5wID09IE5VTEwg
KHNvCm9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKCkgcmV0dXJucyBub3RoaW5nKS4gVGhhdCdzIHdo
YXQgbWFrZXMgRU5YSU8gbG9vawpnb29kIHRvIG1lIHRoZXJlLi4uCgpDaGVlcnMhCgpQYXdlxYIK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=

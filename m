From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [RFC PATCH 1/3] amba-clcd: Add Device Tree support to amba-clcd
 driver
Date: Fri, 21 Sep 2012 11:44:06 +0100
Message-ID: <1348224246.11116.178.camel@hornet>
References: <1348070666-9153-1-git-send-email-ryan.harkin@linaro.org>
 <1348070666-9153-2-git-send-email-ryan.harkin@linaro.org>
 <20120920102453.GG32603@e102652-lin.cambridge.arm.com>
 <CAD0U-h+Z1zQYTiEm+aKwNJa48SdHfs6-qUu4vNRwFr=mqxyXCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD0U-h+Z1zQYTiEm+aKwNJa48SdHfs6-qUu4vNRwFr=mqxyXCg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryan Harkin <ryan.harkin@linaro.org>
Cc: "stigge@antcom.de" <stigge@antcom.de>, "tixy@linaro.org" <tixy@linaro.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "spear-devel@list.st.com" <spear-devel@list.st.com>, "shiraz.hashim@st.com" <shiraz.hashim@st.com>, "viresh.linux@gmail.com" <viresh.linux@gmail.com>, "arnd.bergmann@linaro.org" <arnd.bergmann@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDEyLTA5LTIxIGF0IDExOjM1ICswMTAwLCBSeWFuIEhhcmtpbiB3cm90ZToKPiBH
b29kIHBvaW50LiAgU29ycnkgZm9yIG15IGlnbm9yYW5jZSwgYnV0IGlzIHRoZXJlIGEgcGxhY2Ug
SSBzaG91bGQgcHV0Cj4gc3VjaCBkb2N1bWVudGF0aW9uPwoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ZiL2FtYmEtY2xjZC50eHQgOi0pCgo+IFdoZW4gdGhlIEE5IENvcmVUaWxl
IHVzZXMgdGhlIG9uLXRpbGUgQ0xDRCBjb250cm9sbGVyLCBpdCBjYW4gdXNlIERNQQo+IHRvIGhh
bmRsZSB0aGUgZnJhbWVidWZmZXIuICBETUEgaXMgbm90IGF2YWlsYWJsZSB0byB0aGUgbW90aGVy
Ym9hcmQKPiBDTENEIGNvbnRyb2xsZXIuCgpVaCwgeW91IHByb2JhYmx5IG1lYW4gdGhhdCB0aGUg
bW90aGVyYm9hcmQgQ0xDRCBtdXN0IHVzZSB0aGUgc3BlY2lhbGlzZWQKdmlkZW8gbWVtb3J5LCB3
aGlsZSB0aGUgb25lIGluIHRoZSB0ZXN0IGNoaXAgd291bGQgbm9ybWFsbHkgdXNlIGEgYnVmZmVy
CmFsbG9jYXRlZCB2aWEgdGhlIERNQSBBUEkuLi4KCj4gSSB3YXMgdHJ5aW5nIHRvIGtlZXAgdGhl
IHByb3BlcnRpZXMgc2ltcGxlLCBidXQgdGhleSBhcmUgbW9yZSBjb21wbGV4Cj4gdGhhbiBqdXN0
IHRoZSB0d28gc2V0dGluZ3M6IHVzZV9kbWEgYW5kIGZyYW1lYnVmZmVyLiAgSWYgdXNlX2RtYSBp
cwo+IHNwZWNpZmllZCwgdGhlIGZyYW1lYnVmZmVyIHByb3BlcnR5IGlzIG5vdCB1c2VkOyBpbiB0
aGlzIGNhc2UsIHRoZQo+IGZyYW1lYnVmZmVyIGlzIGFsbG9jYXRlZCBieSB0aGUgRE1BIGZyYW1l
d29yayBhbmQgdGhlIGZyYW1lYnVmZmVyCj4gcHJvcGVydHkgaXMgaWdub3JlZC4gIElmIHVzZV9k
bWEgaXMgbm90IHByZXNlbnQgb3IgaXMgc2V0IHRvIDwwPiwgdGhlCj4gY29kZSB1c2VzIHRoZSBm
cmFtZWJ1ZmZlciBwcm9wZXJ0eSB0byBzcGVjaWZ5IHRoZSBhZGRyZXNzLgoKSSdtIG5vdCBzdXJl
IGlmIHRoZSAiZnJhbWVidWZmZXIiIHByb3BlcnR5IGlzIHJlYWxseSBuZWVkZWQsIGF0IGxlYXN0
IGluCnRoZSBmb3JtIHlvdSBoYXZlIGl0IHRoZXJlIG5vdy4gSSB0aGluayBJIGtub3cgeW91IHdo
ZXJlIHlvdSBnZXQgaXQgZnJvbQotIEhETENEIGRyaXZlciwgcmlnaHQ/IEl0IHdhcyBzb3J0LW9m
LW5lZWRlZCB0aGVyZSwgYmVjYXVzZSB3ZSBoYWQgdG8KcmVzZXJ2ZSBtZW1vcnkgZm9yIHRoZSBm
cmFtZWJ1ZmZlciwgYmVjYXVzZSB5b3UgY291bGRuJ3QgYWxsb2NhdGUgYmlnCmVub3VnaCAoOE1C
IGlmIEkgcmVtZW1iZXIgY29ycmVjdGx5KSBhcmVhIHVzaW5nIHRoZSBETUEgYWxsb2MgZnVuY3Rp
b24uCkJ1dCBub3csIHdpdGggdGhlIENNQSBpbiBwbGFjZSBpdCBzaG91bGQgYmUgcG9zc2libGUs
IHNvIEkgYmVsaWV2ZSBpdCdzCm5vdCBldmVuIG5lY2Vzc2FyeSBpbiB0aGF0IGNhc2UuIFNpbXBs
eSBzcGVha2luZyAtIGlmIHRoZSBkcml2ZXIgaXMgbm90CnRvbGQgd2hhdCBhZGRyZXNzIHRvIHVz
ZSwgaXQgc2hvdWxkIGdldCB0aGUgbWVtb3J5IG9uIGl0cyBvd24uCgpOb3csIGFzIHRvIHRoZSBt
b3RoZXJib2FyZCBDTENELi4uIFRoYXQncyB3aGVyZSB5b3UgYWN0dWFsbHkgY291bGQgdXNlCnRo
aXMgcHJvcGVydHkgaW4gdGhlIHdheSB5b3UgaGF2ZSB0aGVyZSwgdG8gZW5mb3JjZSB0aGUgYWRk
cmVzcyBvZiB0aGUKdmlkZW8gUkFNIGFzIHRoZSBmcmFtZWJ1ZmZlci4gQnV0IG1heWJlIGl0IHdv
dWxkIGJlIGJldHRlciB0byBoYXZlIGEKcGhhbmRsZSB0byB0aGUgdmlkZW8gUkFNIG5vZGU/CgpD
aGVlcnMhCgpQYXdlxYIKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=

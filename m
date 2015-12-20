From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC 1/1] powerpc: legacy serial port use device tree cell-index
 property
Date: Sun, 20 Dec 2015 09:02:25 -0600
Message-ID: <20151220150225.GA27380@gate.crashing.org>
References: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Curt Brune <curt@cumulusnetworks.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, paulus@samba.org, galak@codeaurora.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBOb3YgMjUsIDIwMTUgYXQgMTA6NDY6NDlBTSAtMDgwMCwgQ3VydCBCcnVuZSB3cm90
ZToKPiArCS8qIENoZWNrIGlmIHRoZSBwb3J0cyBoYXZlIGFuIG9yZGVyaW5nLCBkZWZpbmVkIGJ5
ICdjZWxsLWluZGV4JyAqLwo+ICsJaWYgKCgoaW5kZXhwID0gKHUzMiopb2ZfZ2V0X3Byb3BlcnR5
KG5wLCAiY2VsbC1pbmRleCIsICZsZW4pKSAhPSBOVUxMKSAmJgo+ICsJICAgIChsZW4gPT0gc2l6
ZW9mKHUzMikpKQo+ICsJCWluZGV4ID0gKmluZGV4cDsKPiArCj4gIAkvKiBBZGQgcG9ydCwgaXJx
IHdpbGwgYmUgZGVhbHQgd2l0aCBsYXRlci4gV2UgcGFzc2VkIGEgdHJhbnNsYXRlZAo+ICAJICog
SU8gcG9ydCB2YWx1ZS4gSXQgd2lsbCBiZSBmaXhlZCB1cCBsYXRlciBhbG9uZyB3aXRoIHRoZSBp
cnEKPiAgCSAqLwo+ICAJaWYgKHRzaSAmJiAhc3RyY21wKHRzaS0+dHlwZSwgInRzaS1icmlkZ2Ui
KSkKPiAtCQlyZXR1cm4gYWRkX2xlZ2FjeV9wb3J0KG5wLCAtMSwgVVBJT19UU0ksIGFkZHIsIGFk
ZHIsCj4gKwkJcmV0dXJuIGFkZF9sZWdhY3lfcG9ydChucCwgaW5kZXgsIFVQSU9fVFNJLCBhZGRy
LCBhZGRyLAo+ICAJCQkJICAgICAgIE5PX0lSUSwgbGVnYWN5X3BvcnRfZmxhZ3MsIDApOwo+ICAJ
ZWxzZQo+IC0JCXJldHVybiBhZGRfbGVnYWN5X3BvcnQobnAsIC0xLCBVUElPX01FTSwgYWRkciwg
YWRkciwKPiArCQlyZXR1cm4gYWRkX2xlZ2FjeV9wb3J0KG5wLCBpbmRleCwgVVBJT19NRU0sIGFk
ZHIsIGFkZHIsCj4gIAkJCQkgICAgICAgTk9fSVJRLCBsZWdhY3lfcG9ydF9mbGFncywgMCk7CgpX
aGF0IGRvZXMgdGhpcyBkbyBpZiB0aGUgdmFsdWUgaW4gY2VsbC1pbmRleCBpcyBhIGR1cGxpY2F0
ZS4gb3IgdGhlIHBvcnQKd2l0aCB0aGF0IG51bWJlciBpcyBhbHJlYWR5IGNyZWF0ZWQgc29tZSBv
dGhlciB3YXk/ICBBcmUgdGhlIG51bWJlcnMgaW4KY2VsbC1pbmRleCBnbG9iYWwgYW55d2F5LCBv
ciByZWxhdGl2ZSB0byBzb21lIHBhcmVudCBkZXZpY2UgKEkgY291bGRuJ3QKZmluZCB0aGUgZG9j
dW1lbnRhdGlvbiBmb3IgdGhpcykuCgoKU2VnaGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4cHBjLWRldiBtYWlsaW5nIGxpc3QKTGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2xp
bnV4cHBjLWRldg==

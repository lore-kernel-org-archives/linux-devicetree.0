From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 74/75] ARM: l2c: always enable low power modes
Date: Fri, 4 Apr 2014 09:53:29 -0700
Message-ID: <b3b6dd79-5646-4c9f-8e62-ed9c4a5596e3@VA3EHSMHS040.ehs.local>
References: <20140328151249.GJ7528@n2100.arm.linux.org.uk>
 <E1WTYaK-0007I0-Sm@rmk-PC.arm.linux.org.uk>
 <CAL_Jsq+vja-BeNfiVnOicFAa+E6jigDfnb5KWWpxZCZ3eGkJiA@mail.gmail.com>
 <20140328155127.GL7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140328155127.GL7528@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE0LTAzLTI4IGF0IDAzOjUxUE0gKzAwMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBM
aW51eCB3cm90ZToKPiBPbiBGcmksIE1hciAyOCwgMjAxNCBhdCAxMDo0Mjo1NEFNIC0wNTAwLCBS
b2IgSGVycmluZyB3cm90ZToKPiA+IE9uIEZyaSwgTWFyIDI4LCAyMDE0IGF0IDEwOjIwIEFNLCBS
dXNzZWxsIEtpbmcKPiA+IDxybWsra2VybmVsQGFybS5saW51eC5vcmcudWs+IHdyb3RlOgo+ID4g
PiBBbHdheXMgZW5hYmxlIHRoZSBMMkMgbG93IHBvd2VyIG1vZGVzIG9uIEwyQy0zMTAgUjNQMCBh
bmQgbmV3ZXIgcGFydHMuCj4gPiAKPiA+IEkgYXNzdW1lIHlvdSB3YW50IHRvIHNxdWFzaCB0aGlz
IHdpdGggcGF0Y2ggNjgvNzU/IE9yIHlvdSBhcmUgc3RpbGwKPiA+IGRlYmF0aW5nIHdoZXRoZXIg
d2Ugd2FudCB0byBkbyB0aGlzIG9yIG5vdD8gR2l2ZW4gdGhhdCBpdCBpcyByM3B4Cj4gPiBvbmx5
LCB0aGF0IHNob3VsZCBncmVhdGx5IHJlZHVjZSBhbnkgY2hhbmNlIG9mIGJyZWFrYWdlIHRvIG5l
d2VyCj4gPiBwbGF0Zm9ybXMuCj4gCj4gSSB3aWxsIGV2ZW50dWFsbHkgLSBJJ3ZlIGtlcHQgaXQg
c2VwYXJhdGUgZm9yIHRoZSB0aW1lIGJlaW5nIHRvIGdpdmUKPiBtb3JlIG9wdGlvbnMuICBMZXQn
cyBzZWUgaG93IHBlb3BsZSBnZXQgb24gd2l0aCBpdCAtIGl0J2xsIGJlIHJ1bm5pbmcKPiB0aHJv
dWdoIE9sb2YncyBidWlsZGVyIGxhdGVyIHRvZGF5LCBhbmQgdGhlcmUncyBzb21lIG90aGVyIHBl
b3BsZQo+IHdhbnRpbmcgdG8gdGFrZSBpdCBmb3IgYSBzcGluLgoKQSB3aGlsZSBiYWNrIEkgc3Vn
Z2VzdGVkIGFsdGVyaW5nIHRob3NlIGJpdHMsIGJ1dCB0aGF0IHdhcyB0dXJuZWQgZG93bjoKaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMTMvMy8xLzM1MAoKQXJlIHRoZXJlIGFueSBudW1iZXJzIGF2
YWlsYWJsZSBvbiBob3cgZW5hYmxpbmcgdGhlc2UgZmVhdHVyZXMgaW1wYWN0cwp0aGUgc3lzdGVt
PyBJJ20gYSBsaXR0bGUgYml0IGNvbmNlcm5lZCBvZiBhbHdheXMgZW5hYmxpbmcgdGhlbQp1bmNv
bmRpdGlvbmFsbHksIGluIGNhc2UgaXQgaW5jcmVhc2VzIGxhdGVuY3kgZm9yIHNvbWUgdXNlIGNh
c2VzLiBJCnRoaW5rIEknZCBwcmVmZXIgdGhlIERUIGFwcHJvYWNoLCB1bmxlc3MgdGhlIGltcGFj
dCBpcyByZXBvcnRlZCB0byBiZQpuZWdsaWdpYmxlIC0gd2hpY2ggaXQgbGlrZWx5IGlzLCBJIGd1
ZXNzLgoKCVRoYW5rcywKCVPDtnJlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

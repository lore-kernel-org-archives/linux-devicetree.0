From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 74/75] ARM: l2c: always enable low power modes
Date: Fri, 4 Apr 2014 13:47:57 -0700
Message-ID: <5fa8a528-2f01-4c55-8a27-b23c83b1adfa@CH1EHSMHS002.ehs.local>
References: <20140328151249.GJ7528@n2100.arm.linux.org.uk>
 <E1WTYaK-0007I0-Sm@rmk-PC.arm.linux.org.uk>
 <CAL_Jsq+vja-BeNfiVnOicFAa+E6jigDfnb5KWWpxZCZ3eGkJiA@mail.gmail.com>
 <20140328155127.GL7528@n2100.arm.linux.org.uk>
 <b3b6dd79-5646-4c9f-8e62-ed9c4a5596e3@VA3EHSMHS040.ehs.local>
 <20140404191732.GF7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140404191732.GF7528@n2100.arm.linux.org.uk>
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

T24gRnJpLCAyMDE0LTA0LTA0IGF0IDA4OjE3UE0gKzAxMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBM
aW51eCB3cm90ZToKPiBPbiBGcmksIEFwciAwNCwgMjAxNCBhdCAwOTo1MzoyOUFNIC0wNzAwLCBT
w7ZyZW4gQnJpbmttYW5uIHdyb3RlOgo+ID4gT24gRnJpLCAyMDE0LTAzLTI4IGF0IDAzOjUxUE0g
KzAwMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eCB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXIg
MjgsIDIwMTQgYXQgMTA6NDI6NTRBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4g
T24gRnJpLCBNYXIgMjgsIDIwMTQgYXQgMTA6MjAgQU0sIFJ1c3NlbGwgS2luZwo+ID4gPiA+IDxy
bWsra2VybmVsQGFybS5saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPiA+ID4gQWx3YXlzIGVuYWJs
ZSB0aGUgTDJDIGxvdyBwb3dlciBtb2RlcyBvbiBMMkMtMzEwIFIzUDAgYW5kIG5ld2VyIHBhcnRz
Lgo+ID4gPiA+IAo+ID4gPiA+IEkgYXNzdW1lIHlvdSB3YW50IHRvIHNxdWFzaCB0aGlzIHdpdGgg
cGF0Y2ggNjgvNzU/IE9yIHlvdSBhcmUgc3RpbGwKPiA+ID4gPiBkZWJhdGluZyB3aGV0aGVyIHdl
IHdhbnQgdG8gZG8gdGhpcyBvciBub3Q/IEdpdmVuIHRoYXQgaXQgaXMgcjNweAo+ID4gPiA+IG9u
bHksIHRoYXQgc2hvdWxkIGdyZWF0bHkgcmVkdWNlIGFueSBjaGFuY2Ugb2YgYnJlYWthZ2UgdG8g
bmV3ZXIKPiA+ID4gPiBwbGF0Zm9ybXMuCj4gPiA+IAo+ID4gPiBJIHdpbGwgZXZlbnR1YWxseSAt
IEkndmUga2VwdCBpdCBzZXBhcmF0ZSBmb3IgdGhlIHRpbWUgYmVpbmcgdG8gZ2l2ZQo+ID4gPiBt
b3JlIG9wdGlvbnMuICBMZXQncyBzZWUgaG93IHBlb3BsZSBnZXQgb24gd2l0aCBpdCAtIGl0J2xs
IGJlIHJ1bm5pbmcKPiA+ID4gdGhyb3VnaCBPbG9mJ3MgYnVpbGRlciBsYXRlciB0b2RheSwgYW5k
IHRoZXJlJ3Mgc29tZSBvdGhlciBwZW9wbGUKPiA+ID4gd2FudGluZyB0byB0YWtlIGl0IGZvciBh
IHNwaW4uCj4gPiAKPiA+IEEgd2hpbGUgYmFjayBJIHN1Z2dlc3RlZCBhbHRlcmluZyB0aG9zZSBi
aXRzLCBidXQgdGhhdCB3YXMgdHVybmVkIGRvd246Cj4gPiBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAxMy8zLzEvMzUwCj4gCj4gQXMgSSBzYWlkIHllc3RlcmRheSwgcGxlYXNlIHVzZSBhIGRpZmZl
cmVudCBhcmNoaXZlIHdlYnNpdGUsIHByZWZlcmFibHkKPiBvbmUgd2hpY2ggd29ya3MuICBsa21s
Lm9yZyBoYXMgYmVlbiBicm9rZW4gaW4gdmFyaW91cyB3YXlzIGZvciBhIGNvdXBsZQo+IG9mIGRh
eXMgbm93LCBhbmQgcXVvdGluZyB1bnJlYWNoYWJsZSBVUkxzIGlzbid0IHVzZWZ1bCBmb3IgZGlz
Y3Vzc2lvbgo+IHB1cnBvc2VzLgoKSXQgd29ya2VkIHdoZW4gSSBwdWxsZWQgdGhlIGxpbmsuIEFu
eXdheSwgdGhlIHRocmVhZCBhdCBnbWFuZToKaHR0cDovL3RocmVhZC5nbWFuZS5vcmcvZ21hbmUu
bGludXgua2VybmVsLzE0NDk1NDQvZm9jdXM9MTQ1MDQ3NQoKCVPDtnJlbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

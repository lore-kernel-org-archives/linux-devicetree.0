From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/4] arm: am33xx: DT quirks for am33xx based beaglebone
 variants
Date: Thu, 19 Feb 2015 10:36:00 -0800
Message-ID: <20150219183600.GG32521@atomide.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20150219181656.GF32521@atomide.com>
 <9C7BFC7C-0751-4233-927F-D01AF078704B@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <9C7BFC7C-0751-4233-927F-D01AF078704B@antoniou-consulting.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, Koen Kooi <koen@dominion.thruhere.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, Matt Porter <matt.porter@linaro.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

KiBQYW50ZWxpcyBBbnRvbmlvdSA8cGFudG9AYW50b25pb3UtY29uc3VsdGluZy5jb20+IFsxNTAy
MTkgMTA6MzJdOgo+ID4gT24gRmViIDE5LCAyMDE1LCBhdCAyMDoxNiAsIFRvbnkgTGluZGdyZW4g
PHRvbnlAYXRvbWlkZS5jb20+IHdyb3RlOgo+ID4gCj4gPiBVaGggSSBkb24ndCBsaWtlIHRoZSBp
ZGVhIG9mIGR1cGxpY2F0aW5nIHRoZSBpMmMtb21hcC5jIGRyaXZlciB1bmRlcgo+ID4gYXJjaC9h
cm0uLiBBbmQgaW4gZ2VuZXJhbCB3ZSBzaG91bGQgaW5pdGlhbGl6ZSB0aGluZ3MgbGF0ZXIgcmF0
aGVyCj4gPiB0aGFuIGVhcmxpZXIuCj4gPiAKPiA+IFdoYXQncyBzdG9wcGluZyBkb2luZyB0aGVz
ZSBxdWlyayBjaGVja3MgbGF0ZXIgb24gdGltZSB3aXRoIGp1c3QKPiA+IGEgcmVndWxhciBkZXZp
Y2UgZHJpdmVyLCBzb21ldGhpbmcgbGlrZSBkcml2ZXJzL21pc2MvYmJvbmUtcXVpcmtzLmM/Cj4g
PiAKPiAKPiBXZSBoYXZlIG5vIGNob2ljZTsgd2UgYXJlIHdheSBlYXJseSBpbiB0aGUgYm9vdCBw
cm9jZXNzLCByaWdodCBhZnRlcgo+IHRoZSBkZXZpY2UgdHJlZSB1bmZsYXR0ZW5pbmcgc3RlcC4K
ClRvIG1lIGl0IHNlZW1zIHRoZSBkdCBwYXRjaGluZyBwYXJ0IHNob3VsZCBiZSBkb25lIHdpdGgg
bWluaW1hbApjb2RlIGJlZm9yZSBhbnkgZHJpdmVyIGxpa2UgZmVhdHVyZXMuLgogCj4gSeKAmXZl
IHRveWVkIHdpdGggdGhlIGlkZWEgb2YgdXNpbmcgZWFybHkgcGxhdGZvcm0gZGV2aWNlcyBidXQg
dGhlIG9tYXAtaTJjIGRyaXZlcgo+IHdvdWxkIG5lZWQgc29tZSB0ZW5kZXIgbG92ZSBhbmQgY2Fy
ZSB0byBtYWtlIGl0IHdvcmssIGFuZCBJIGRpZG7igJl0IHdhbnQgdG8gZ2V0Cj4gYm9nZ2VkIGRv
d24gd2l0aCBpMmMgZHJpdmVyIGRldGFpbHMgYXQgdGhpcyBwb2ludC4KCi4uc28gaG93IGFib3V0
IGp1c3QgcGFyc2UgYSBrZXJuZWwgY21kbGluZSBmb3IgdGhlIHF1aXJrcyB0byBhcHBseQpiYXNl
ZCBvbiBhIHZlcnNpb24gc3RyaW5nIG9yIHNpbWlsYXI/IFRoYXQgY2FuIGJlIGVhc2lseSBwb3B1
bGF0ZWQKYnkgdS1ib290IG9yIHNldCBtYW51YWxseSB3aXRoIHNldGVudi4KClRoYXQgbGVhdmVz
IG91dCB0aGUgbmVlZCBmb3IgdGlua2VyaW5nIHdpdGggaTJjIHN1cGVyIGVhcmx5IGluCnRoZSBr
ZXJuZWwgZm9yIHJldmlzaW9uIGRldGVjdGlvbi4KClJlZ2FyZHMsCgpUb255CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

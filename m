From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH] ARM64: dts: bcm: Use a symlink to R-Pi dtsi files from
 arch=arm
Date: Wed, 03 Aug 2016 14:45:59 +0100
Message-ID: <1470231959.4745.11.camel@hellion.org.uk>
References: <1470213635-6934-1-git-send-email-ijc@hellion.org.uk>
 <CAL_JsqKs+9UxKa=_PZWM-AO8b+MqbxypO_3h6ZGQtYjHcB1Drg@mail.gmail.com>
 <20160803133041.GA12499@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160803133041.GA12499@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <catalin.marinas@arm.com>, Lee Jones <lee@kernel.org>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, "arm@kernel.org" <arm@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Frank Rowand <frowand.list@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTA4LTAzIGF0IDE0OjMwICswMTAwLCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4g
T24gV2VkLCBBdWcgMDMsIDIwMTYgYXQgMDg6MTM6NTFBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gPiAKPiA+ID4gPiBPbiBXZWQsIEF1ZyAzLCAyMDE2IGF0IDM6NDAgQU0sIElhbiBDYW1w
YmVsbCA8aWpjQGhlbGxpb24ub3JnLnVrPiB3cm90ZToKPiA+ID4gCj4gPiA+IFRoZXNlIGluY2x1
ZGVzIGluIHR1cm4gcmVxdWlyZSBhIHNrZWxldG9uLmR0c2kgdG8gYmUgcHJlc2VudCwgc28gYWRk
IG9uZSBhcwo+ID4gPiBhIHJlYWwgZmlsZSAod2l0aCB0aGUgc2FtZSBjb250ZW50cyBhcyBhcmNo
L2FybSkgcmF0aGVyIHRoYW4gYSBzeW1saW5rLgo+ID4gCj4gPiBJIGRvbid0IGZvbGxvdyB3aHkg
c2tlbGV0b24uZHRzaSBpcyBuZWVkZWQuIFRoZSAzMi1iaXQgUlBpIGR0cyBmaWxlcwo+ID4gYXJl
IGluY2x1ZGluZyBpdD8KCkV4YWN0bHkuCgo+ID4gIElmIHNvLCBjYW4gd2UganVzdCByZW1vdmUg
aXQuIFdlIGRlY2lkZWQKPiA+IHNrZWxldG9uLmR0c2kgd2FzIGEgYmFkIGlkZWEuCj4gCj4gWXVw
LiBJIGRvbid0IHdhbnQgdG8gc2VlIHNrZWxldG9uLmR0c2kgcmVhcHBlYXIsIGFuZCB0aGUgbmVj
ZXNzYXJ5Cj4gZml4dXBzIHRvIHNvdXJjZSBmaWxlcyBhcmUgcmVsYXRpdmVseSBzaW1wbGUuCj4g
Cj4gSWFuLCBzZWUgY29tbWl0IDNlYmVlNWEyZTE0MTQ5NmIgKCJhcm02NDogZHRzOiBraWxsIHNr
ZWxldG9uLmR0c2kiKSBmb3IKPiB0aGUgcmF0aW9uYWxlLCBhbmQgaGludHMgYXMgdG8gd2hhdCBu
ZWVkcyB0byBiZSBmaXhlZCB1cCAoZS5nLiBpZiBlbXB0eQo+ID4gbWVtb3J5IG5vZGVzIGFyZSBy
ZXF1aXJlZCwgdGhlcmUgc2hvdWxkIGJlIGEgY29tbWVudCBhcyB0byB3aHkpLgoKVW5kZXJzdG9v
ZC4KCkkgY2FuIG1ha2UgdGhlIG1lY2hhbmljYWwgZml4IHRvwqBhcmNoL2FybS9ib290L2R0cy9i
Y20yODN4LmR0c2kgKHdoaWNoCmlzIGxpbmtlZCBoZXJlIGFzwqBhcmNoL2FybTY0L2Jvb3QvZHRz
L2Jyb2FkY29tL2JjbTI4M3guZHRzaSB3aGljaApjYXVzZXMgdGhlIG5lZWQgZm9yIHNrZWxldG9u
LmR0c2kpIGJ1dCBJIGRvbid0IGhhdmUgYW55IFItUGkgaGFyZHdhcmUKd2l0aCB3aGljaCB0byB2
ZXJpZnkgdGhlIG5lZWQgKG9yIG5vdCkgZm9yIGVtcHR5IG1lbW9yeSBub2RlcyBldGMuCgo+IFBl
cmhhcHMgdGhpcyBpcyBhIGdvb2QgdGltZSB0byBhdHRhY2sgdGhlIHJlbWFpbmluZyAzMi1iaXQg
c2tlbGV0b24uZHRzaQo+ID4gdXNlcnMuIEknbGwgdGFrZSBhbm90aGVyIGxvb2sgY29tZSAtcmMx
LgoKbGludXguZ2l0JCBnaXQgZ3JlcCBza2VsZXRvbi5kdHNpIC0tIGFyY2gvYXJtwqDCoHwgd2Mg
LWwKMTQ4CmxpbnV4LmdpdCQKCkdvb2QgbHVjayA7LSkKCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

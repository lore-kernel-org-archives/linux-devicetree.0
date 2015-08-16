From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/4] drm: Add support for ARM's HDLCD controller.
Date: Sun, 16 Aug 2015 09:56:33 +0100
Message-ID: <CACvgo537C6SRfhMTNoE4cSLJukcXuKLvt1TRykynX--ybEhmaQ@mail.gmail.com>
References: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
 <1438784892-27888-3-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1438784892-27888-3-git-send-email-Liviu.Dudau@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgTGl2aXUsCgpPbiA1IEF1Z3VzdCAyMDE1IGF0IDE1OjI4LCBMaXZpdSBEdWRhdSA8TGl2aXUu
RHVkYXVAYXJtLmNvbT4gd3JvdGU6Cj4gVGhlIEhETENEIGNvbnRyb2xsZXIgaXMgYSBkaXNwbGF5
IGNvbnRyb2xsZXIgdGhhdCBzdXBwb3J0cyByZXNvbHV0aW9ucwo+IHVwIHRvIDQwOTZ4NDA5NiBw
aXhlbHMuIEl0IGlzIHByZXNlbnQgb24gdmFyaW91cyBkZXZlbG9wbWVudCBib2FyZHMKPiBwcm9k
dWNlZCBieSBBUk0gTHRkIGFuZCBlbXVsYXRlZCBieSB0aGUgbGF0ZXN0IEZhc3QgTW9kZWxzIGZy
b20gdGhlCj4gY29tcGFueS4KPgpJIGJlbGlldmUgdGhlcmUgaXMgYSB1bm9mZmljaWFsIHJlcXVp
cmVtZW50KD8pIGZvciBuZXcgZHJtIGRyaXZlcnMgdG8KdXNlIGF0b21pYyBtb2Rlc2V0dGluZy4g
Tm90IDEwMCUgc3VyZSBvbiB0aGlzIG9uZSB0aG91Z2guIFRoZQpmb2xsb3dpbmcgZHJpdmVyczog
dGVncmEsIG1zbSwgcmNhci1kdSwgaTkxNSwgYW5kIERhbmllbCdzIGJsb2cgWzFdClsyXSBjYXQg
cHJvdmlkZSBzb21lIGluZm9ybWF0aW9uIG9uIHRoZSB0b3BpYy4KClRoZSBkcml2ZXIgc2VlbXMg
dG8gaGFzIGhhcyBhIGJpdCBvZiBkZWFkIGNvZGUgZ3VhcmRlZCBieQpIRExDRF8qX1VOREVSUlVO
LiBQZXJoYXBzIHRoZXNlIG1hY3JvcyBzaG91bGQgYmVjb21lIGJ1aWxkIG9yIHJ1bnRpbWUKc3dp
dGNoKGVzKSA/CgpNb3N0IERSTSBkcml2ZXJzIGRvIG5vdCB0aHJlYXQgZG1hLCBidXNfZXJyb3Is
IHZzeW5jIGFuZC9vciB1bmRlcnJ1bgppbnRlcnJ1cHRzIGFzIGRlYnVnIGZ1bmN0aW9uYWxpdHku
IFRoZXkgYXJlIG9mIGxpbWl0ZWQgdXNlIGluIHRoaXMKZHJpdmVyLCBwcmVzZW50bHksIHlldCB0
aGUgQ09ORklHX0RFQlVHX0ZTIGd1YXJkIHNlZW1zIGEgYml0IHN0cmFuZ2UKaW1oby4KCkNoZWVy
cywKRW1pbAoKWzFdIGh0dHA6Ly9ibG9nLmZmd2xsLmNoLzIwMTQvMTEvYXRvbWljLW1vZGVzZXQt
c3VwcG9ydC1mb3Ita21zLWRyaXZlcnMuaHRtbApbMl0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gvMjAx
NS8wMS91cGRhdGUtZm9yLWF0b21pYy1kaXNwbGF5LXVwZGF0ZXMuaHRtbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

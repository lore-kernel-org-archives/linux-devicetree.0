From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v4 0/4] drm: Add support for the ARM HDLCD display
 controller
Date: Thu, 3 Dec 2015 16:56:07 +0000
Message-ID: <20151203165606.GS8644@n2100.arm.linux.org.uk>
References: <1449139249-9171-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1449139249-9171-1-git-send-email-Liviu.Dudau@arm.com>
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
Cc: Jon Medhurst <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DRI devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Andrew Morton <akpm@linux-foundation.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgMDMsIDIwMTUgYXQgMTA6NDA6NDVBTSArMDAwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiBTdWRlZXAgSG9sbGEncyBTQ1BJIGRyaXZlciAo
bm93IGluIG1haW5saW5lKSBhbmQgb24KPiB0aGUgdGRhOTk4eCBwYXRjaGVzIHRoYXQgaGF2ZSBi
ZWVuIHF1ZXVlZCBvbiBSdXNzZWxsJ3MgcGF0Y2ggc3lzdGVtIGhlcmUgWzFdLgoKTm93IG1lcmdl
ZCBpbnRvIG15IHRyZWUuCgpDYW4gSSBhc2sgYSBmYWlybHkgb2J2aW91cyBxdWVzdGlvbi4uLgoK
PiAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKwo+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDI5ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMg
ICAgICAgICAgICAgICAgICAgfCAzMjcgKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9h
cm0vaGRsY2RfZHJ2LmMgICAgICAgICAgICAgICAgICAgIHwgNTU1ICsrKysrKysrKysrKysrKysr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5oICAgICAgICAgICAgICAgICAg
ICB8ICA0MiArKwo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX3JlZ3MuaCAgICAgICAgICAg
ICAgICAgICB8ICA4NyArKysrCgpXaHkgaXMgdGhlIHN1YmRpcmVjdG9yeSBjYWxsZWQgImFybSIg
YW5kIG5vdCAiaGRsY2QiID8KCkFSTSBMdGQgaGF2ZSBtb3JlIHRoYW4gb25lIGRpc3BsYXkgY29u
dHJvbGxlciAodGhleSBoYXZlIHRoZSBBTUJBIFBMMTEwCmFuZCBQTDExMSBpbiBhZGRpdGlvbiB0
byB0aGlzKSwgYW5kIChhZmFpY3MpIHRoaXMgZG9lc24ndCBkcml2ZSB0aGVzZS4KSERMQ0QgcHJv
YmFibHkgd29uJ3QgYmUgdGhlIGxhc3QgZGlzcGxheSBoYXJkd2FyZSB3aGljaCBBUk0gTHRkIGNv
bWVzCm91dCB3aXRoIGVpdGhlci4KClNvLCBJIHRoaW5rIG5hbWluZyB0aGUgc3ViZGlyZWN0b3J5
IGFmdGVyIHRoZSB2ZW5kb3IgaXMgcHJvYmFibHkgYQptaXN0YWtlLgoKLS0gCkZUVEMgYnJvYWRi
YW5kIGZvciAwLjhtaWxlIGxpbmU6IGN1cnJlbnRseSBhdCA5LjZNYnBzIGRvd24gNDAwa2JwcyB1
cAphY2NvcmRpbmcgdG8gc3BlZWR0ZXN0Lm5ldC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK

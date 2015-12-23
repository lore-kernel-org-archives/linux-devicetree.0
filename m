From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 2/4] drm: Add support for ARM's HDLCD controller.
Date: Wed, 23 Dec 2015 10:06:21 +0000
Message-ID: <20151223100621.GX960@e106497-lin.cambridge.arm.com>
References: <1450806109-470-1-git-send-email-Liviu.Dudau@arm.com>
 <1450806109-470-3-git-send-email-Liviu.Dudau@arm.com>
 <CAPj87rPK4gaFw79poT+Gwfg3R39svdvBTP=GD-E4Lvbm4ysSAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAPj87rPK4gaFw79poT+Gwfg3R39svdvBTP=GD-E4Lvbm4ysSAg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Jon Medhurst <tixy@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DRI devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBEZWMgMjMsIDIwMTUgYXQgMTA6MDM6MDBBTSArMDAwMCwgRGFuaWVsIFN0b25lIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIyIERlY2VtYmVyIDIwMTUgYXQgMTc6NDEsIExpdml1IER1ZGF1
IDxMaXZpdS5EdWRhdUBhcm0uY29tPiB3cm90ZToKPiA+IFRoZSBIRExDRCBjb250cm9sbGVyIGlz
IGEgZGlzcGxheSBjb250cm9sbGVyIHRoYXQgc3VwcG9ydHMgcmVzb2x1dGlvbnMKPiA+IHVwIHRv
IDQwOTZ4NDA5NiBwaXhlbHMuIEl0IGlzIHByZXNlbnQgb24gdmFyaW91cyBkZXZlbG9wbWVudCBi
b2FyZHMKPiA+IHByb2R1Y2VkIGJ5IEFSTSBMdGQgYW5kIGVtdWxhdGVkIGJ5IHRoZSBsYXRlc3Qg
RmFzdCBNb2RlbHMgZnJvbSB0aGUKPiA+IGNvbXBhbnkuCj4gCj4gSSBkaWRuJ3QgZ2V0IHRvIHRh
a2UgYXMgY2xvc2UgYSBsb29rIGFzIGxhc3QgdGltZSwgYnV0IEkgb25seSBoYWQKPiBmYWlybHkg
bWlub3IgcXVpYmJsZXMgdGhlbiwgYW5kIG5vdGhpbmcganVtcGVkIG91dCBhdCBtZSB0aGlzIHRp
bWUKPiBlaXRoZXIuCj4gCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xs
YWJvcmEuY29tPgoKQ2hlZXJzIGFuZCBNZXJyeSBIb2xpZGF5cyEKTGl2aXUKCj4gCj4gQ2hlZXJz
LAo+IERhbmllbAo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRv
IHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRo
ZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClf
L8KvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 2/3] drm/arm: Add support for Mali Display Processors
Date: Wed, 15 Jun 2016 22:30:36 +0200
Message-ID: <CAKMK7uFwXzRmLp_werouyvFrb-qEZi+xg32bO48r51rHmvT3Vw@mail.gmail.com>
References: <1466002295-24813-1-git-send-email-Liviu.Dudau@arm.com>
 <1466002295-24813-3-git-send-email-Liviu.Dudau@arm.com>
 <20160615152309.GI1338@phenom.ffwll.local>
 <20160615161758.GF9711@e106497-lin.cambridge.arm.com>
 <CAKMK7uENW3cU8LccHcqffX3cbzax2-5mzY0101yLfR7vtD4CoA@mail.gmail.com>
 <20160615172104.GI9711@e106497-lin.cambridge.arm.com>
 <CAKMK7uGFTmQERWcDeQ=V-ntbgQv6K1avGx1LKCGLcAWacmHKnA@mail.gmail.com>
 <20160615200539.GH1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160615200539.GH1041@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: devicetree <devicetree@vger.kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, DRI devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdW4gMTUsIDIwMTYgYXQgMTA6MDUgUE0sIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eAo8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBXZWQsIEp1biAxNSwgMjAxNiBh
dCAwOToyOTozOFBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBPbiBXZWQsIEp1biAx
NSwgMjAxNiBhdCA3OjIxIFBNLCBMaXZpdSBEdWRhdSA8TGl2aXUuRHVkYXVAYXJtLmNvbT4gd3Jv
dGU6Cj4+ID4gQ291bGQgYmUgdGhlIHRkYTk5OHhfZHJ2IGZhdWx0LCBidXQgSSdtIGdldHRpbmcg
dGhpcyBzcGxhdDoKPj4KPj4gWWVhaCwgdGRhOTk5OHggbmVlZHMgdG8gYmUgZml4ZWQgdG8gX25v
dF8gcmVnaXN0ZXIgaXQncyBjb25uZWN0b3IKPj4gYmVmb3JlIHRoZSBvdmVyYWxsIChjb21wb25l
bnRpemVkKSBkcml2ZXIgaXMgcmVhZHkuIFdlIG5lZWQgdG8gbWFrZQo+PiBzdXJlIGZpcnN0IG9m
YyB0aGF0IGFsbCB1c2VycyBvZiB0aGF0IGRyaXZlciBkbyByZWdpc3RlciBjb25uZWN0b3JzLAo+
PiBidXQgQ2hyaXMnIHBhdGNoIHNlcmllcyB3aWxsIHRha2UgY2FyZSBvZiB0aGF0LiBCdXQgdGRh
OTk5OHggbmVlZHMgdG8KPj4gYmUgZml4ZWQgZWl0aGVyIHdheS4KPgo+IENvbXBvbmVudGlzZWQg
ZHJpdmVycyBvbmx5IGdldCBvbmUgYmluZCBjYWxsYmFjaywgdGhleSBkb24ndCBnZXQgYQo+IHR3
by1zdGFnZSBpbml0aWFsaXNhdGlvbiBhdCBiaW5kIHRpbWUuCgpXZSBkb24ndCBuZWVkIHR3by1z
dGFnZSBpbml0IGluIHRoZSBjb21wb25lbnQgZnJhbWV3b3JrLiBUaGVyZSdzCnBhdGNoZXMgaW4t
ZmxpZ2h0IHRvIHNpbXBsaWZ5IHRoaXMgYSBsb3QgKGFuZCBwcm92aWRlIGNhbGxiYWNrcyB0bwpy
ZWdpc3RlciBhZGRpdGlvbmFsIGNvbm5lY3RvciBpbnRlcmZhY2VzIGxpa2UgYmFja2xpZ2h0KS4g
QnV0IGluCmdlbmVyYWwgY29tcG9uZW50cyBzaG91bGQgbm90IGNhbGwgZHJtX2Nvbm5lY3Rvcl9y
ZWdpc3RlciwgaW5zdGVhZCB0aGUKbWFzdGVyIHNob3VsZCBjYWxsIGRybV9jb25uZWN0b3JfcmVn
aXN0ZXJfYWxsIGF0IHRoZSB2ZXJ5IGVuZC4gWWVzCnRoaXMgaXMgYSBjaGFuZ2UgZnJvbSBob3cg
YWxsIHRoZSBvcmlnaW5hbCBrbXMgZHJpdmVycyBoYXZlIGRvbmUgaXQsCmJ1dCB0aGF0IHdheSB3
YXMgYWxzbyByYWN5IChzaW5jZSBpdCBleHBvc2VkIGludGVyZmFjZXMgdG8gdXNlcnNwYWNlCmJl
Zm9yZSB0aGV5J3JlIGZ1bGx5IHNldCB1cCkuIFdlJ3JlIGdyYWR1YWxseSBzd2l0Y2hpbmcgZWFj
aCBkcml2ZXIKb3ZlciwgYnV0IGZvciBzaGFyZWQgYml0cyBsaWtlIHRkYTk5OTh4IGl0J3MgYSBi
aXQgbW9yZSBjb21wbGljYXRlZCAtCmFsbCB0aGUgZHJpdmVycyB1c2luZyBpdCBuZWVkIHRvIHN3
aXRjaCBhdCB0aGUgc2FtZSB0aW1lLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

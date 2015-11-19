From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 11/12] drm/panel: simple: Add boe,tv080wum-nl0 simple
 panel device tree binding
Date: Thu, 19 Nov 2015 11:19:52 -0600
Message-ID: <20151119171952.GA7721@rob-hp-laptop>
References: <1447904131-29328-1-git-send-email-zyw@rock-chips.com>
 <1447904131-29328-12-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1447904131-29328-12-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBOb3YgMTksIDIwMTUgYXQgMTE6MzU6MjlBTSArMDgwMCwgQ2hyaXMgWmhvbmcgd3Jv
dGU6Cj4gVGhpcyBiaW5kaW5nIHNwZWNpZmllcyBhIHNldCBvZiBjb21tb24gcHJvcGVydGllcyBm
b3IgZGlzcGxheSBwYW5lbHMuIEl0Cj4gY2FuIGJlIHVzZWQgYXMgYSBiYXNpcyBieSBiaW5kaW5n
cyBmb3Igc3BlY2lmaWMgcGFuZWxzLgo+IEJpbmRpbmdzIGZvciB0aHJlZSBzcGVjaWZpYyBwYW5l
bHMgYXJlIHByb3ZpZGVkIHRvIHNob3cgaG93IHRoZQo+IHNpbXBsZSBwYW5lbCBiaW5kaW5nIGNh
biBiZSB1c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFpob25nIDx6eXdAcm9jay1jaGlw
cy5jb20+CgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCj4gCj4gLS0t
Cj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiBtb3ZlIGJvZSx0djA4MHd1bS1ubDAudHh0IHRvIGJpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiBBcyBUaGllcnJ5LlJlZGlu
ZyBjb21tZW50LCBhZGQgYSBkb2N1bWVudGF0aW9uIGZvciB0aGlzIHBhbmVsLgo+IAo+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2JvZSx0djA4MHd1bS1ubDAudHh0ICAg
ICAgICAgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvYm9lLHR2MDgwd3VtLW5sMC50eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MDgwd3VtLW5sMC50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2Us
dHYwODB3dW0tbmwwLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4u
NTBiZTVlMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYwODB3dW0tbmwwLnR4dAo+IEBAIC0wLDAgKzEs
NyBAQAo+ICtCb2UgQ29ycG9yYXRpb24gOC4wIiBXVVhHQSBURlQgTENEIHBhbmVsCj4gKwo+ICtS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYm9lLHR2MDgw
d3VtLW5sMCIKPiArCj4gK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBs
ZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKPiAraW4gc2ltcGxlLXBhbmVsLnR4
dCBpbiB0aGlzIGRpcmVjdG9yeS4KPiAtLSAKPiAyLjYuMwo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

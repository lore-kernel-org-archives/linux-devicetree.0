From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 2/6] dt-bindings: display: msm: gmu: add
 optional ocmem property
Date: Wed, 19 Jun 2019 12:06:36 -0600
Message-ID: <20190619180636.GB17590@jcrouse1-lnx.qualcomm.com>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-3-masneyb@onstation.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Brian Masney <masneyb@onstation.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, agross@kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, sean@poorly.run
List-Id: devicetree@vger.kernel.org

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMDk6Mjk6MjZBTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+IFNvbWUgQTN4eCBhbmQgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGlu
c2lkZSB0aGUgR1BVIGNvcmUgYW5kCj4gbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01F
TSkgaW4gb3JkZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQo+IG9wdGlvbmFsIG9jbWVtIHBy
b3BlcnR5IHRvIHRoZSBBZHJlbm8gR3JhcGhpY3MgTWFuYWdlbWVudCBVbml0IGJpbmRpbmdzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+
IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211
LnR4dCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9n
bXUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dt
dS50eHQKPiBpbmRleCA5MGFmNWIwYTU2YTkuLmM3NDZiOTVlOTVkNCAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0
Cj4gQEAgLTMxLDYgKzMxLDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gaW9tbXVzOiBw
aGFuZGxlIHRvIHRoZSBhZHJlbm8gaW9tbXUKPiAgLSBvcGVyYXRpbmctcG9pbnRzLXYyOiBwaGFu
ZGxlIHRvIHRoZSBPUFAgb3BlcmF0aW5nIHBvaW50cwo+ICAKPiArT3B0aW9uYWwgcHJvcGVydGll
czoKPiArLSBvY21lbTogcGhhbmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0
J3MgcHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24KPiArICAgICAgICAgU29Dcy4gU2VlIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwuCj4g
Kwo+ICBFeGFtcGxlOgoKWW91IHNob3VsZCBhZGQgYSBmdWxsLWZsZWRnZWQgYTR4eCBleGFtcGxl
IGhlcmUgaW5jbHVkaW5nIGEgb2NtZW0gcGhhbmRsZS4KCkpvcmRhbgoKPiAgLyB7CgotLSAKVGhl
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVy
b3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

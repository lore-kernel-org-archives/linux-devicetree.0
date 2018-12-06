From: Sean Paul <sean@poorly.run>
Subject: Re: [DPU =?iso-8859-1?Q?PATCH=A0?= =?iso-8859-1?Q?=5D?= drm/msm/dpu:
 Fix clock issue after bind failure
Date: Thu, 6 Dec 2018 11:11:09 -0500
Message-ID: <20181206161109.GZ154160@art_vandelay>
References: <1544026907-24267-1-git-send-email-jshekhar@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1544026907-24267-1-git-send-email-jshekhar@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jayant Shekhar <jshekhar@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, abhinavk@codeaurora.org, hoegsberg@chromium.org, freedreno@lists.freedesktop.org, chandanu@codeaurora.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBEZWMgMDUsIDIwMTggYXQgMDk6NTE6NDdQTSArMDUzMCwgSmF5YW50IFNoZWtoYXIg
d3JvdGU6Cj4gSW4gY2FzZSBvZiBtc20gZHJtIGJpbmQgZmFpbHVyZSwgcG0gcnVudGltZSBwdXQg
c3luYwo+IGlzIGNhbGxlZCBmcm9tIGRzaSBkcml2ZXIgd2hpY2ggaXNzdWVzIGFuIGFzeW5jaHJv
bm91cwo+IHB1dCBvbiBtZHNzIGRldmljZS4gU3Vic2VxdWVudGx5IHdoZW4gZHB1X21kc3NfZGVz
dHJveQo+IGlzIHRyaWdnZXJlZCB0aGUgY2hhbmdlIHdpbGwgbWFrZSBzdXJlIHRvIHB1dCB0aGUg
bWRzcwo+IGRldmljZSBpbiBzdXNwZW5kIGFuZCBjbGVhcmluZyBwZW5kaW5nIHdvcmsgaWYgbm90
Cj4gc2NoZWR1bGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpheWFudCBTaGVraGFyIDxqc2hla2hh
ckBjb2RlYXVyb3JhLm9yZz4KClRoYW5rcyBmb3Igc2VuZGluZyB0aGlzLCBwdXNoZWQgdG8gZHB1
LXN0YWdpbmcvZm9yLW5leHQKClNlYW4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9tZHNzLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9tZHNz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCj4gaW5kZXggMmQ2
NjAyNS4uMDMwMjI5YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfbWRzcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X21k
c3MuYwo+IEBAIC0xOTEsNiArMTkxLDcgQEAgc3RhdGljIHZvaWQgZHB1X21kc3NfZGVzdHJveShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJc3RydWN0IGRzc19tb2R1bGVfcG93ZXIgKm1wID0g
JmRwdV9tZHNzLT5tcDsKPiAgCWludCBpOwo+ICAKPiArCXBtX3J1bnRpbWVfc3VzcGVuZChkZXYt
PmRldik7Cj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoZGV2LT5kZXYpOwo+ICAJX2RwdV9tZHNzX2ly
cV9kb21haW5fZmluaShkcHVfbWRzcyk7Cj4gIAlmcmVlX2lycShwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApLCBkcHVfbWRzcyk7Cj4gLS0gCj4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVy
LCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKPiBhIExpbnV4IEZv
dW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2Fy
ZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==

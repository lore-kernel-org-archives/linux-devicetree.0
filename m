From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 26/32] drm/mediatek: add connection from RDMA0 to
 COLOR0
Date: Fri, 30 Aug 2019 14:23:26 +0800
Message-ID: <1567146206.5942.17.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-27-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1567090254-15566-27-git-send-email-yongqiang.niu@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: yongqiang.niu@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9t
IFJETUEwIHRvIENPTE9SMAoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8
IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggNDJhMTMwYS4uMDNhNDZlYyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTE3MSw2ICsxNzEs
OCBAQCBzdHJ1Y3QgbXRrX2RkcCB7Cj4gIAo+ICBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhIHsK
PiAgCXUzMiBvdmwwX21vdXRfZW47Cj4gKwl1MzIgcmRtYTBfc291dF9zZWxfaW47Cj4gKwl1MzIg
cmRtYTBfc291dF9jb2xvcjA7Cj4gIAl1MzIgcmRtYTFfc291dF9zZWxfaW47Cj4gIAl1MzIgcmRt
YTFfc291dF9kcGkwOwo+ICAJdTMyIGRwaTBfc2VsX2luOwo+IEBAIC00MjgsNiArNDMwLDkgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX3NvdXRfc2VsKGNvbnN0IHN0cnVjdCBtdGtfbW1z
eXNfcmVnX2RhdGEgKmRhdGEsCj4gIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JE
TUEyICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0kzKSB7Cj4gIAkJKmFkZHIgPSBESVNQX1JF
R19DT05GSUdfRElTUF9SRE1BMl9TT1VUOwo+ICAJCXZhbHVlID0gUkRNQTJfU09VVF9EU0kzOwo+
ICsJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAmJiBuZXh0ID09IEREUF9D
T01QT05FTlRfQ09MT1IwKSB7Cj4gKwkJKmFkZHIgPSBkYXRhLT5yZG1hMF9zb3V0X3NlbF9pbjsK
PiArCQl2YWx1ZSA9IGRhdGEtPnJkbWEwX3NvdXRfY29sb3IwOwo+ICAJfSBlbHNlIHsKPiAgCQl2
YWx1ZSA9IDA7Cj4gIAl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

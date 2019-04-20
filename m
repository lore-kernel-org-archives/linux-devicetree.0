From: Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH v2 6/6] drm/lima: handle shared irq case for
 lima_pp_bcast_irq_handler
Date: Sat, 20 Apr 2019 16:40:30 +0800
Message-ID: <CAKGbVbtkE5K0CgyMjdOBoLRCzqQ-EDbbH67N9SbeWr1wTB_OHg@mail.gmail.com>
References: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
 <1555662781-22570-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1555662781-22570-7-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, xuwei5@hisilicon.com, sboyd@kernel.org, robh+dt@kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

UHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgpUaGFua3MsClFpYW5nCgpPbiBGcmksIEFwciAxOSwg
MjAxOSBhdCA0OjM1IFBNIFBldGVyIEdyaWZmaW4gPHBldGVyLmdyaWZmaW5AbGluYXJvLm9yZz4g
d3JvdGU6Cj4KPiBPbiBIaWtleSBib2FyZCBhbGwgbGltYSBpcCBibG9ja3MgYXJlIHNoYXJlZCB3
aXRoIG9uZSBpcnEuCj4gVGhpcyBwYXRjaCBhdm9pZHMgYSBOVUxMIHB0ciBkZXJlZiBjcmFzaCBv
biB0aGlzIHBsYXRmb3JtCj4gb24gc3RhcnR1cC4gVGVzdGVkIHdpdGggV2VzdG9uIGFuZCBrbXNj
dWJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5h
cm8ub3JnPgo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3BwLmMgfCA4ICsrKysrKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3BwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bGltYS9saW1hX3BwLmMKPiBpbmRleCBkMjk3MjFlLi44ZmVmMjI0IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfcHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfcHAuYwo+IEBAIC02NCw3ICs2NCwxMyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbGltYV9w
cF9iY2FzdF9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICAgICAgICAgc3RydWN0
IGxpbWFfaXAgKnBwX2JjYXN0ID0gZGF0YTsKPiAgICAgICAgIHN0cnVjdCBsaW1hX2RldmljZSAq
ZGV2ID0gcHBfYmNhc3QtPmRldjsKPiAgICAgICAgIHN0cnVjdCBsaW1hX3NjaGVkX3BpcGUgKnBp
cGUgPSBkZXYtPnBpcGUgKyBsaW1hX3BpcGVfcHA7Cj4gLSAgICAgICBzdHJ1Y3QgZHJtX2xpbWFf
bTQ1MF9wcF9mcmFtZSAqZnJhbWUgPSBwaXBlLT5jdXJyZW50X3Rhc2stPmZyYW1lOwo+ICsgICAg
ICAgc3RydWN0IGRybV9saW1hX200NTBfcHBfZnJhbWUgKmZyYW1lOwo+ICsKPiArICAgICAgIC8q
IGZvciBzaGFyZWQgaXJxIGNhc2UgKi8KPiArICAgICAgIGlmICghcGlwZS0+Y3VycmVudF90YXNr
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gSVJRX05PTkU7Cj4gKwo+ICsgICAgICAgZnJhbWUg
PSBwaXBlLT5jdXJyZW50X3Rhc2stPmZyYW1lOwo+Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
ZnJhbWUtPm51bV9wcDsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBsaW1hX2lwICpp
cCA9IHBpcGUtPnByb2Nlc3NvcltpXTsKPiAtLQo+IDIuNy40Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

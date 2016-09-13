From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] drm/msm/hdmi: Clean up HDMI gpio DT bindings
Date: Tue, 13 Sep 2016 14:31:07 -0500
Message-ID: <CAL_JsqK_36EpJhV1COrNdb_h7dgWxLMbecKsJR4YCaVEm0XWuQ@mail.gmail.com>
References: <1472737015-29382-1-git-send-email-architt@codeaurora.org>
 <1473780097-11388-1-git-send-email-architt@codeaurora.org>
 <1473780097-11388-3-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473780097-11388-3-git-send-email-architt@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBTZXAgMTMsIDIwMTYgYXQgMTA6MjEgQU0sIEFyY2hpdCBUYW5lamEgPGFyY2hpdHRA
Y29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+IE1ha2UgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIGluIHRo
ZSBIRE1JIGdwaW8gYmluZGluZ3M6Cj4KPiAtIFVzZSAiLWdwaW9zIiBhcyB0aGUgc3VmZml4IGZv
ciBhbGwgdGhlIGdwaW8gbmFtZXMKPiAtIE1vdmUgYWxsIHRoZSBncGlvcyB0byBvcHRpb25hbCwg
c2luY2UgdGhlcmUgYXJlIHBsYXRmb3JtcyB0aGF0IHVzZSBub25lCj4gICBvZiB0aGVtLgo+IC0g
VGhlIEhQRCBncGlvIGlzIGEgc3RhbmRhcmQgb25lLCByZW1vdmUgdGhlICJxY29tLGhkbWktdHgt
IiBwcmVmaXggZnJvbQo+ICAgaXQuCj4gLSBSZW1vdmUgdGhlIEhETUkgRERDIGNsay9kYXRhIGdw
aW9zLiBUaGV5IGFyZSBqdXN0IGxlZnRvdmVycyBvZiBhbiBvbGQKPiAgIHdheSB0byBjb25maWd1
cmUgcGluY3RybCBwcm9wZXJ0aWVzLgo+IC0gQWRkIGEgbWlzc2luZyBscG0gZ3BpbyB1c2VkIG9u
IHNvbWUgcGxhdGZvcm1zLgo+Cj4gTWFrZSB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMgaW4gdGhlIGRy
aXZlciB0byBpbmNvcnBvcmF0ZSB0aGVzZSBjaGFuZ2VzLgo+Cj4gVGhlcmUgaGFzbid0IGJlZW4g
YW55IHVwc3RyZWFtIERUIHRoYXQgdXNlcyB0aGUgSERNSSBiaW5kaW5ncywgc28gaXQncwo+IG9r
YXkgdG8gY2hhbmdlIGFuZCBtb3ZlIGFyb3VuZCB0aGVzZSBwcm9wZXJ0aWVzLgo+Cj4gQ2M6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnCj4gU2lnbmVkLW9mZi1ieTogQXJjaGl0IFRhbmVqYSA8YXJjaGl0dEBjb2RlYXVyb3JhLm9y
Zz4KPiAtLS0KPiB2MzoKPiAtIFJlbW92ZWQgSERNSSBEREMgY2xrL2RhdGEgZ3Bpb3MuCj4KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vaGRtaS50eHQgICAgICAgIHwgIDkg
KysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pLmMgICAgICAgICAgICAg
ICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

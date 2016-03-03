From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: [PATCH v6 01/11] drm/hisilicon: Add device tree binding for
 hi6220 display subsystem
Date: Thu, 3 Mar 2016 09:28:31 +0800
Message-ID: <CAGd==0609p0x2k3F5LEDfxs_fDFGLrvtRKmNKbp0PAQg06Sy2g@mail.gmail.com>
References: <1456476028-36880-1-git-send-email-xinliang.liu@linaro.org>
 <1456476028-36880-2-git-send-email-xinliang.liu@linaro.org>
 <20160302182952.GA1184@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160302182952.GA1184@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linuxarm <linuxarm@huawei.com>, dri-devel <dri-devel@lists.freedesktop.org>, Xu Wei <xuwei5@hisilicon.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, zourongrong@huawei.com, Yiping Xu <xuyiping@hisilicon.com>, Jon Corbet <corbet@lwn.net>, Wang Fei <w.f@huawei.com>, devicetree@vger.kernel.org, Bintian Wang <bintian.wang@huawei.com>, Feng Chen <puck.chen@hisilicon.com>, LAKML <linux-arm-kernel@lists.infradead.org>, Andy Green <andy.green@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Emil Velikov <emil.l.velikov@gmail.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiAzIE1hcmNoIDIwMTYgYXQgMDI6MjksIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+IE9uIEZyaSwgRmViIDI2LCAyMDE2IGF0IDA0OjQwOjE4UE0gKzA4MDAsIFhp
bmxpYW5nIExpdSB3cm90ZToKPj4gQWRkIEFERSBkaXNwbGF5IGNvbnRyb2xsZXIgYmluZGluZyBk
b2MuCj4+IEFkZCBEZXNpZ25XYXJlIERTSSBIb3N0IENvbnRyb2xsZXIgdjEuMjBhIGJpbmRpbmcg
ZG9jLgo+Pgo+PiB2NjoKPj4gLSBDbGVhbnVwIHZhbHVlcyBwYXJ0IG9mIHJlZyBhbmQgY2xvY2tz
IHByb3BlcnRpZXMuCj4+IC0gQ2hhbmdlICJwY2xrX2RzaSIgY2xvY2sgbmFtZSB0byAicGNsayIu
Cj4+IHY1Ogo+PiAtIFJlbW92ZSBlbmRwb2ludCB1bml0IGFkZHJlc3Mgb2YgZHNpIG91dHB1dCBw
b3J0Lgo+PiAtIEFkZCAiaGlzaWxpY29uLG5vYy1zeXNjb24iIHByb3BlcnR5IGZvciBBREUgTk9D
IFFvUyBzeXNjb24uCj4+IC0gQWRkICJyZXNldHMiIHByb3BlcnR5IGZvciBBREUgcmVzZXQuCj4+
IHY0Ogo+PiAtIERlc2NyaWJlIG1vcmUgc3BlY2lmaWMgb2YgY2xvY2tzIGFuZCBwb3J0cy4KPj4g
LSBGaXggaW5kZW50YXRpb24uCj4+IHYzOgo+PiAtIE1ha2UgYWRlIGFzIHRoZSBkcm0gbWFzdGVy
IG5vZGUuCj4+IC0gVXNlIGFzc2lnbmVkLWNsb2NrcyB0byBzZXQgY2xvY2sgcmF0ZS4KPj4gLSBV
c2UgcG9ydHMgdG8gY29ubmVjdCBkaXNwbGF5IHJlbGF2YW50IG5vZGVzLgo+PiB2MjoKPj4gLSBN
b3ZlIGR0IGJpbmRpbmcgZG9jcyB0byBiaW5kaW5ncy9kaXNwbGF5L2hpc2lsaWNvbiBkaXJlY3Rv
cnkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpbmxpYW5nIExpdSA8eGlubGlhbmcubGl1QGxpbmFy
by5vcmc+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvaGlzaWxpY29uL2R3LWRzaS50
eHQgICAgICAgICAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrCj4+ICAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9oaXNpbGljb24vaGlzaS1hZGUudHh0ICAgICAgICB8IDY0ICsrKysrKysrKysrKysr
KysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9oaXNp
bGljb24vZHctZHNpLnR4dAo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2hpc2lsaWNvbi9oaXNpLWFkZS50eHQKPgo+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKVGhhbmtzIDotKQoteGlubGlhbmcK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

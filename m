From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC 1/2] Dcumentation: bridge: Add documentation for ps8640 DT
 properties
Date: Fri, 16 Oct 2015 15:08:39 +0200
Message-ID: <1445000919.3541.11.camel@pengutronix.de>
References: <1444997709-57293-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1444997709-57293-1-git-send-email-ck.hu@mediatek.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

SGkgQ0ssCgp0aGVyZSBpcyBhIHR5cG8gaW4gdGhlIHN1YmplY3Q6IHMvRGN1bWVudGF0aW9uL0Rv
Y3VtZW50YXRpb24vLgoKQW0gRnJlaXRhZywgZGVuIDE2LjEwLjIwMTUsIDIwOjE1ICswODAwIHNj
aHJpZWIgQ0sgSHU6Cj4gRnJvbTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+
IAo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBEVCBwcm9wZXJ0aWVzIHN1cHBvcnRlZCBieSBwczg2
NDAKPiBEU0ktZURQIGNvbnZlcnRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGpp
dGFvLnNoaUBtZWRpYXRlay5jb20+ClsuLi5dCj4gKwktIHBzODY0MC0xdjItc3VwcGx5OiBPRiBk
ZXZpY2UtdHJlZSByZWd1bGF0b3Igc3BlY2lmaWNhdGlvbiBmb3IgMXYyLgo+ICsJLSBwczg2NDAt
M3YzLXN1cHBseTogT0YgZGV2aWNlLXRyZWUgcmVndWxhdG9yIHNwZWNpZmljYXRpb24gZm9yIDN2
My4KClRoZSBwczg2NDAtIHBhcnQgb2YgdGhlIHJlZ3VsYXRvciBzdXBwbHkgcHJvcGVydHkgbmFt
ZXMgaXMgcmVkdW5kYW50LgpUaGUgUFM4NjIyIGRyaXZlciB1c2VzIHZkZDEyLXN1cHBseSBhcyBp
dHMgcmVndWxhdG9yLiBTaG91bGQgd2Ugc3RyaXZlCmZvciBjb25zaXN0ZW5jeSBoZXJlPyBPciBp
ZiB5b3UgaGF2ZSBhY2Nlc3MgdG8gdGhlIGRhdGFzaGVldCwgaG93IGFyZQp0aGVzZSBpbnB1dHMg
Y2FsbGVkIHRoZXJlPwoKPiArCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKwktIHZpZGVvIGlu
dGVyZmFjZXM6IERldmljZSBub2RlIGNhbiBjb250YWluIHZpZGVvIGludGVyZmFjZSBwb3J0Cj4g
KwkJCSAgICBub2RlcyBmb3IgcGFuZWwgYWNjb3JkaW5nIHRvIFsxXS4KPiArCj4gK1sxXTogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0
CgpJdCBzaG91bGQgYmUgZG9jdW1lbnRlZCBoZXJlIHRoYXQgcG9ydEAwIGlzIHRoZSBpbnB1dCBw
b3J0IGFuZCBwb3J0QDEgaXMKdGhlIG91dHB1dCBwb3J0LgoKYmVzdCByZWdhcmRzClBoaWxpcHAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

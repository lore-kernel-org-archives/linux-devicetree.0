From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v10 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
Date: Fri, 19 Feb 2016 10:13:30 +0100
Message-ID: <1455873210.13163.0.camel@pengutronix.de>
References: <1455870678-13959-1-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1455870678-13959-1-git-send-email-jitao.shi@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, stonea168@163.com, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDE5LjAyLjIwMTYsIDE2OjMxICswODAwIHNjaHJpZWIgSml0YW8gU2hp
Ogo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBEVCBwcm9wZXJ0aWVzIHN1cHBvcnRlZCBieQo+IHBz
ODY0MCBEU0ktZURQIGNvbnZlcnRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGpp
dGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2OToKPiAgLSBObyBjaGFuZ2UKPiAtLS0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dCAgfCAgIDQzICsr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvcHM4NjQwLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0Cj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi5hM2UwOTcxCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9w
czg2NDAudHh0Cj4gQEAgLTAsMCArMSw0MyBAQAo+ICtwczg2NDAtYnJpZGdlIGJpbmRpbmdzCj4g
Kwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsJLSBjb21wYXRpYmxlOiAicGFyYWRlLHBzODY0
MCIKPiArCS0gcmVnOiBmaXJzdCBwYWdlIGFkZHJlc3Mgb2YgdGhlIGJyaWRnZS4KPiArCS0gc2xl
ZXAtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3BlY2lmaWNhdGlvbiBmb3IgUERfIHBpbi4K
PiArCS0gcmVzZXQtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3BlY2lmaWNhdGlvbiBmb3Ig
cmVzZXQgcGluLgo+ICsJLSBtb2RlLXNlbC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVj
aWZpY2F0aW9uIGZvciBtb2RlLXNlbCBwaW4uCj4gKwktIHZkZDEyLXN1cHBseTogT0YgZGV2aWNl
LXRyZWUgcmVndWxhdG9yIHNwZWNpZmljYXRpb24gZm9yIDEuMlYgcG93ZXIuCj4gKwktIHZkZDMz
LXN1cHBseTogT0YgZGV2aWNlLXRyZWUgcmVndWxhdG9yIHNwZWNpZmljYXRpb24gZm9yIDMuM1Yg
cG93ZXIuCj4gKwktIHBvcnRzOiBUaGUgZGV2aWNlIG5vZGUgY2FuIGNvbnRhaW4gdmlkZW8gaW50
ZXJmYWNlIHBvcnQgbm9kZXMgcGVyCj4gKwkJIHRoZSB2aWRlby1pbnRlcmZhY2VzIGJpbmRbMV0u
IEZvciBwb3J0QDAsc2V0IHRoZSByZWcgPSA8MD4gYXMKPiArCQkgcHM4NjQwIGRzaSBpbiBhbmQg
cG9ydEAxLHNldCB0aGUgcmVnID0gPDE+IGFzIHBzODY0MCBlRFAgb3V0Lgo+ICsKPiArWzFdOiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50
eHQKPiArCj4gK0V4YW1wbGU6Cj4gKwllZHAtYnJpZGdlQDE4IHsKPiArCQljb21wYXRpYmxlID0g
InBhcmFkZSxwczg2NDAiOwo+ICsJCXJlZyA9IDwweDE4PjsKPiArCQlzbGVlcC1ncGlvcyA9IDwm
cGlvIDExNiBHUElPX0FDVElWRV9ISUdIPjsKPiArCQlyZXNldC1ncGlvcyA9IDwmcGlvIDExNSBH
UElPX0FDVElWRV9ISUdIPjsKCkFyZSB0aGVzZSB0d28gcmVhbGx5IGFjdGl2ZSBoaWdoPyBTZWUg
bXkgY29tbWVudHMgb24gdGhlIGRyaXZlciBwYXRjaC4KCnJlZ2FyZHMKUGhpbGlwcAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

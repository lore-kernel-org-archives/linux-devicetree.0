From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 4/8] drm/mediatek: add support for Mediatek SoC MT2701
Date: Wed, 27 Jul 2016 12:03:36 +0200
Message-ID: <1469613816.2470.50.camel@pengutronix.de>
References: <1468577274-6178-1-git-send-email-yt.shen@mediatek.com>
 <1468577274-6178-5-git-send-email-yt.shen@mediatek.com>
 <1468997599.11841.49.camel@mtksdaap41>
 <1469529774.4678.34.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1469529774.4678.34.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, yingjoe.chen@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIGRlbiAyNi4wNy4yMDE2LCAxODo0MiArMDgwMCBzY2hyaWViIFlUIFNoZW46
Cj4gSGkgQ0ssCj4gCj4gT24gV2VkLCAyMDE2LTA3LTIwIGF0IDE0OjUzICswODAwLCBDSyBIdSB3
cm90ZToKPiA+IEhpLCBZVDoKPiA+IAo+ID4gU29tZSBjb21tZW50cyBpbmxpbmUuCj4gPiAKPiA+
IE9uIEZyaSwgMjAxNi0wNy0xNSBhdCAxODowNyArMDgwMCwgWVQgU2hlbiB3cm90ZToKPiA+ID4g
VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhdGVrIE1UMjcwMSBESVNQIHN1YnN5
c3RlbS4KPiA+ID4gVGhlcmUgaXMgb25seSBvbmUgT1ZMIGVuZ2luZSBpbiBNVDI3MDEuCj4gPiA+
IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAg
IHwgICAgNiArKysrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRt
YS5jICAgIHwgICAgNiArKysrCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYyAgICAgIHwgICA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAgICA3ICsrKysrCj4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgICAgMSAr
Cj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgIHwgICAz
MSArKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRp
b25zKCspCj4gPiA+IAo+ID4gCj4gPiBbc25pcC4uLl0KPiA+IAo+ID4gPiAgCj4gPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7Cj4g
PiA+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1vdmwiLCAgIC5kYXRh
ID0gKHZvaWQgKilNVEtfRElTUF9PVkwgfSwKPiA+ID4gIAl7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE3My1kaXNwLW92bCIsICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9LAo+
ID4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtcmRtYSIsICAuZGF0
YSA9ICh2b2lkICopTVRLX0RJU1BfUkRNQSB9LAo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTczLWRpc3AtcmRtYSIsICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfUkRNQSB9
LAo+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3Atd2RtYSIsICAu
ZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfV0RNQSB9LAo+ID4gCj4gPiBJcyBXRE1BIGRpZmZlcmVu
dCBmcm9tIE1UODE3MyB0byBNVDI3MDEuIElmIHRoZXkgYXJlIHRoZSBzYW1lLCB5b3UgbmVlZAo+
ID4gbm90IHRvIGFkZCBjb21wYXRpYmxlIG9mICdtZWRpYXRlayxtdDI3MDEtZGlzcC13ZG1hJyBi
ZWNhdXNlIHVzZQo+ID4gJ21lZGlhdGVrLG10ODE3My1kaXNwLXdkbWEnIGlzIGVub3VnaC4KPiBZ
ZXMsIHRoZSBoYXJkd2FyZSBoYXMgZGlmZmVyZW5jZXMsIHNvIHdlIG5lZWQgYWRkIG5ldyBjb21w
YXRpYmxlCj4gJ210MjcwMS1kaXNwLXdkbWEnCgpJdCB3b3VsZCBiZSBuaWNlIGlmIHlvdSBjb3Vs
ZCBhZGQgYSBzaG9ydCBwYXJhZ3JhcGggdG8gdGhlIHBhdGNoCmRlc2NyaXB0aW9uIGFib3V0IHdo
YXQgdGhlIGhhcmR3YXJlIGRpZmZlcmVuY2VzIGFyZSAocHJvYmFibHkganVzdApjaGFuZ2VkIHJl
Z2lzdGVyIGxheW91dCBpbiBtb3N0IGNhc2VzKS4KCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

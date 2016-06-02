From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/5] Documentation/devicetree/bindings: Add b850v3_lvds_dp
Date: Thu, 02 Jun 2016 14:49:01 +0200
Message-ID: <1464871741.3307.16.camel@pengutronix.de>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
 <1464626385-19253-4-git-send-email-peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1464626385-19253-4-git-send-email-peter.senna@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Senna Tschudin <peter.senna@collabora.com>
Cc: mark.rutland@arm.com, dri-devel@lists.freedesktop.org, tiwai@suse.com, jslaby@suse.cz, mchehab@osg.samsung.com, linux@armlinux.org.uk, treding@nvidia.com, linux@roeck-us.net, martin.donnelly@ge.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, galak@codeaurora.org, enric.balletbo@collabora.com, akpm@linux-foundation.org, shawnguo@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

SGkgUGV0ZXIsCgpBbSBNb250YWcsIGRlbiAzMC4wNS4yMDE2LCAxODozOSArMDIwMCBzY2hyaWVi
IFBldGVyIFNlbm5hIFRzY2h1ZGluOgo+IERldmljZXRyZWUgYmluZGluZ3MgZG9jdW1lbnRhdGlv
biBmb3IgdGhlIEdFIEI4NTB2MyBMVkRTL0RQKysKPiBkaXNwbGF5IGJyaWRnZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIuc2VubmFAY29sbGFib3JhLmNv
bT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZ2UvYjg1MHYzX2x2ZHNfZHAudHh0
ICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ2UvYjg1MHYzX2x2ZHNfZHAudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9nZS9iODUwdjNfbHZkc19kcC50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ2UvYjg1MHYzX2x2ZHNfZHAudHh0Cj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi4zMmUxMjNhCj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9nZS9iODUwdjNfbHZk
c19kcC50eHQKPiBAQCAtMCwwICsxLDM4IEBACj4gK0RyaXZlciBmb3IgR0UgQjg1MHYzIExWRFMv
RFArKyBkaXNwbGF5IGJyaWRnZQo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArICAtIGNv
bXBhdGlibGUgOiBzaG91bGQgYmUgImdlLGI4NTB2M19sdmRzX2RwIi4KCkluIHRoZSBjb3ZlciBt
YWlsIHlvdSB3cml0ZSB0aGF0IHRoaXMgaXMgYSBjb21iaW5hdGlvbiBvZiB0aGUgU1REUDQwMjgK
RFAgdHJhbnNtaXR0ZXIgYW5kIFNURFAyNjkwIERQL0RQKysgY29udmVydGVyLiBTbyBzaG91bGRu
J3QgdGhpcyBiaW5kaW5nCmNvbXByaXNlIHR3byBkZXZpY2UgdHJlZSBub2Rlcywgb25lIHdpdGgg
Y29tcGF0aWJsZSAic3Qsc3RkcDQwMjgiLCBvbmUKd2l0aCAic3Qsc3RkcDI2OTAiLCB0aGVuPwpJ
cyB0aGUgc3RkcDI2OTAgY29ubmVjdGVkIHRvIHRoZSBzdGRwNDAyOCdzIGkyYyBtYXN0ZXI/Cgpy
ZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

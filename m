From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/3] of: base: add support to get machine compatible string
Date: Tue, 22 Nov 2016 11:58:22 +0100
Message-ID: <CAMpxmJUTBK4+Uq9ugU_fDr82KWPxDaeCJTUo0RNSqP0x4yGZgg@mail.gmail.com>
References: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
 <1479811311-3080-2-git-send-email-bgolaszewski@baylibre.com>
 <5ce9fb9f-459a-562b-2e9f-85d35f9ec035@arm.com>
 <CAMpxmJU=wR4mdQr5tpNSv8POirtWXR=_s7D_Q_H=Cuy=W=-Jtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMpxmJU=wR4mdQr5tpNSv8POirtWXR=_s7D_Q_H=Cuy=W=-Jtw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Robin Murphy <robin.murphy@arm.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

MjAxNi0xMS0yMiAxMTo1NyBHTVQrMDE6MDAgQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3
c2tpQGJheWxpYnJlLmNvbT46Cj4gMjAxNi0xMS0yMiAxMTo1MyBHTVQrMDE6MDAgU3VkZWVwIEhv
bGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT46Cj4+Cj4+Cj4+IE9uIDIyLzExLzE2IDEwOjQxLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4KPj4+IEFkZCBhIGZ1bmN0aW9uIGFsbG93aW5n
IHRvIHJldHJpZXZlIHRoZSBjb21wYXRpYmxlIHN0cmluZyBvZiB0aGUgcm9vdAo+Pj4gbm9kZSBv
ZiB0aGUgZGV2aWNlIHRyZWUuCj4+Pgo+Pgo+PiBSb2IgaGFzIHF1ZXVlZCBbMV0gYW5kIGl0J3Mg
aW4gLW5leHQgdG9kYXkuIFlvdSBjYW4gcmV1c2UgdGhhdCBpZiB5b3UKPj4gYXJlIHBsYW5uaW5n
IHRvIHRhcmdldCB0aGlzIGZvciB2NC4xMSBvciBqdXN0IHVzZSBvcGVuIGNvZGluZyBpbiB5b3Vy
Cj4+IGRyaXZlciBmb3IgdjQuMTAgYW5kIHRhcmdldCB0aGlzIG1vdmUgZm9yIHY0LjExIHRvIGF2
b2lkIGNyb3NzIHRyZWUKPj4gZGVwZW5kZW5jaWVzIGFzIEkgYWxyZWFkeSBtZW50aW9uZWQgaW4g
eW91ciBwcmV2aW91cyB0aHJlYWQuCj4+Cj4+IC0tCj4+IFJlZ2FyZHMsCj4+IFN1ZGVlcAo+Pgo+
PiBbMV0gaHR0cDovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcvbXNnMTI3NDU0OS5odG1sCj4KPiBSb2IncyBwYXRjaCBjaGVja3MgdGhlIG1vZGVsIGZp
cnN0IC0gSSdtIG5vdCBzdXJlIHRoaXMgaXMgdGhlIGJlaGF2aW9yCj4gd2Ugd2FudCBoZXJlIGFz
IFNla2hhciBzdWdnZXN0ZWQgd2UgcHJpbnQgdGhlIG1hY2hpbmUgY29tcGF0aWJsZS4KPgoKSSBt
ZWFudCB5b3VyIHBhdGNoIG9mIGNvdXJzZS4KClRoYW5rcywKQmFydG9zegpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

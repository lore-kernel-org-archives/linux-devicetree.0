From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v8 0/4] drm/atmel-hlcdc: bus-width override support
Date: Fri, 24 Aug 2018 09:51:31 +0200
Message-ID: <20180824095131.5d9cb33f@bbrezillon>
References: <20180810130359.9882-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180810130359.9882-1-peda@axentia.se>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sakari Ailus <sakari.ailus@iki.fi>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Jyri Sarha <jsarha@ti.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgUGV0ZXIsCgpPbiBGcmksIDEwIEF1ZyAyMDE4IDE1OjAzOjU1ICswMjAwClBldGVyIFJvc2lu
IDxwZWRhQGF4ZW50aWEuc2U+IHdyb3RlOgoKPiBIaSEKPiAKPiBUaGUgYmFja2dyb3VuZCBmb3Ig
dGhlc2UgcGF0Y2hlcyBpcyB0aGF0IG91ciBQQ0IgaW50ZXJmYWNlIGJldHdlZW4KPiB0aGUgU0FN
QTVEMyBhbmQgdGhlIGRzOTBjMTg1IGx2ZHMgZW5jb2RlciBpcyBvbmx5IHVzaW5nIDE2IGJpdHMs
IGFuZAo+IHRoaXMgaGFzIHRvIGJlIGRlc2NyaWJlZCBzb21ld2hlcmUsIG9yIHRoZSBhdG1lbC1o
bGNkYyBkcml2ZXIgaGF2ZSBubwo+IGNoYW5jZSBvZiBzZWxlY3RpbmcgdGhlIGNvcnJlY3Qgb3V0
cHV0IG1vZGUuIFNpbmNlIHdlIGhhdmUgc2ltaWxhcgo+IHByb2JsZW1zIHdpdGggYSB0ZGExOTk4
OCBIRE1JIGVuY29kZXIgSSBhZGRlZCBwYXRjaGVzIHRvIG92ZXJyaWRlCj4gdGhlIGF0bWVsLWhs
Y2RjIG91dHB1dCBmb3JtYXQgdmlhIERUIHByb3BlcnRpZXMgY29tcGF0aWJsZSB3aXRoIHRoZQo+
IG1lZGlhIHZpZGVvLWludGVyZmFjZSBiaW5kaW5nIGFuZCB0aGluZ3Mgc3RhcnQgdG8gcGxheSB0
b2dldGhlci4KPiAKPiBDaGVlcnMsCj4gUGV0ZXIKPiAKPiBDaGFuZ2VzIHNpbmNlIHY3ICBodHRw
czovL2xrbWwub3JnL2xrbWwvMjAxOC84LzQvMjg4Cj4gLSBUaGUgZXAgZGV2aWNlX25vZGUgd2Fz
IGxlYWtlZCBpbiB2NyBwYXRjaCAzLzMsIHNvIGFkZCBwYXRjaCAzLzQKPiAgIHdoaWNoIHNpbXBs
aWZpZXMgZml4aW5nIHRoaXMgaW4gcGF0Y2ggNC80IChhbmQgYWRkcyBmbGV4aWJpbGl0eSkKPiAg
IGFuZCBhZGp1c3QgcGF0Y2ggNC80IHRvIHRoZSBjaGFuZ2VzIGRvbmUgaW4gdGhlIG5ldyAzLzQu
Cj4gLSByZXR1cm4gLUVOT01FTSBvbiBhbGxvY2F0aW9uIGZhaWx1cmUgaW4gcGF0Y2ggNC80CgpJ
IHN0b3BwZWQgZm9sbG93aW5nIHRoZSBkaXNjdXNzaW9uIGF0IHNvbWUgcG9pbnQuIEFyZSB0aGVy
ZSBhbnkgb3Blbgppc3N1ZXMgb3IgQWNrIHlvdSdyZSB3YWl0aW5nIGZvcj8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/3] ARM: memory: da8xx-ddrctl: new driver
Date: Mon, 17 Oct 2016 09:54:15 -0700
Message-ID: <7h8ttmdih4.fsf@baylibre.com>
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
 <1476721850-454-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1476721850-454-2-git-send-email-bgolaszewski@baylibre.com>
 (Bartosz Golaszewski's message of "Mon, 17 Oct 2016 18:30:48 +0200")
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4gd3JpdGVzOgoK
PiBDcmVhdGUgYSBuZXcgZHJpdmVyIGZvciB0aGUgZGE4eHggRERSMi9tRERSIGNvbnRyb2xsZXIg
YW5kIGltcGxlbWVudAo+IHN1cHBvcnQgZm9yIHdyaXRpbmcgdG8gdGhlIFBlcmlwaGVyYWwgQnVz
IEJ1cnN0IFByaW9yaXR5IFJlZ2lzdGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClsuLi5dCgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lbW9yeS9kYTh4eC1kZHJjdGwuYyBiL2RyaXZlcnMvbWVtb3J5L2RhOHh4LWRk
cmN0bC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi5kY2QwYTYxCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L2RhOHh4LWRkcmN0bC5jCj4gQEAg
LTAsMCArMSw3NyBAQAo+ICsvKgo+ICsgKiBUSSBkYTh4eCBERFIyL21ERFIgY29udHJvbGxlciBk
cml2ZXIKPiArICoKPiArICogQ29weXJpZ2h0IChDKSAyMDE2IEJheUxpYnJlIFNBUwo+ICsgKgo+
ICsgKiBBdXRob3I6Cj4gKyAqICAgQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJh
eWxpYnJlLmNvbT4KPiArICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiArICogaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMKPiArICog
cHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCj4gKyAqLwo+ICsKPiAr
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4K
PiArCj4gKyNkZWZpbmUgREE4WFhfRERSX0NUTF9CQVNFCTB4QjAwMDAwMDAKClRoaXMgYmFzZSBh
ZGRyIHNob3VsZCBiZSB0aGUgcmVnIHByb3BlcnR5IG9mIHRoZSBub2RlLgoKPiArI2RlZmluZSBE
QThYWF9QQkJQUl9PRkZTRVQJMHgwMDAwMDAyMAo+ICsjZGVmaW5lIERBOFhYX1BCQlBSX1JFRyhw
KQkoKHApICsgREE4WFhfUEJCUFJfT0ZGU0VUKQoKS2V2aW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

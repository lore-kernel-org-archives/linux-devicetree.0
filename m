From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v9 14/14] drm/mediatek: Add interface to allocate
 Mediatek GEM buffer.
Date: Wed, 13 Jan 2016 12:42:36 +0100
Message-ID: <1452685356.3524.5.camel@pengutronix.de>
References: <1452611750-16283-1-git-send-email-p.zabel@pengutronix.de>
 <1452611750-16283-15-git-send-email-p.zabel@pengutronix.de>
 <CAL_JsqJ4pEDSeEopDuMUGbi5sdv=Cva42Bj=QSpnMjMw_LmzaA@mail.gmail.com>
 <CAKMK7uGHWT0TTc2Y5fmCALn2fzQPrTMGymJK4etYjXMcPGE61Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uGHWT0TTc2Y5fmCALn2fzQPrTMGymJK4etYjXMcPGE61Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Nicolas Boichat <drinkcat@chromium.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIGRlbiAxMi4wMS4yMDE2LCAyMzo0MCArMDEwMCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gT24gVHVlLCBKYW4gMTIsIDIwMTYgYXQgMTE6MDIgUE0sIFJvYiBIZXJyaW5nIDxy
b2JoK2R0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gVHVlLCBKYW4gMTIsIDIwMTYgYXQgOTox
NSBBTSwgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPj4g
RnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+Pgo+ID4+IEFkZCBhbiBpbnRlcmZh
Y2UgdG8gYWxsb2NhdGUgTWVkaWF0ZWsgR0VNIGJ1ZmZlcnMsIGFsbG93IHRoZSBJT0NUTHMKPiA+
PiB0byBiZSB1c2VkIGJ5IHJlbmRlciBub2Rlcy4KPiA+PiBUaGlzIHBhdGNoIGFsc28gc2V0cyB0
aGUgUkVOREVSIGRyaXZlciBmZWF0dXJlLgo+ID4KPiA+IEJ1dCBpdCBzaG91bGQgbm90IGEgYmUg
cmVuZGVyIG5vZGUgdW5sZXNzIGl0IGhhcyBhIEdQVSBBRkFJSy4gVGhlbgo+ID4gYWdhaW4sIEkg
c3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbWFkbmVzcyBvZiBldmVyeSBkcml2ZXIgZGVmaW5p
bmcKPiA+IHRoZWlyIG93biBidWZmZXIgaW9jdGxzIGVpdGhlci4gVGhlIG9ubHkgbGluZSByZW1v
dGVseSBoL3cgc3BlY2lmaWMKPiA+IGhlcmUgaXMgbXRrX2RybV9nZW1fY3JlYXRlIGNhbGwuCj4g
Cj4gU3VwcG9ydCBnZW1fY3JlYXRlL21tYXBfb2ZmZXQgYWxvbmUgaXMgaW5kZWVkIHBvaW50bGVz
cyB3aXRob3V0IHNvbWUKPiByZWFsIHN1cHBvcnQgZm9yIGdwdSB3b3JrbG9hZHMuIEZvciBwbGFp
biBkaXNwbGF5IGRyaXZlcnMgdGhlIGR1bWIKPiBidWZmZXIgYXBpLCBwbHVzIHByaW1lL2RtYS1i
dWYgaW1wb3J0IHNob3VsZCBiZSBwbGVudHkgZW5vdWdoLgo+IAo+IFRoZSB1c3VhbCByZWFzb24g
Zm9yIGRvaW5nIHRoaXMgaXMgc29tZSBibG9iIGRyaXZlciBmb3Igb3BlbmdsIHRoYXQKPiBjYW4n
dCBiZSBvcGVuLXNvdXJjZSwgd2hpY2ggaXMgYSBiaWcgbm8tZ28gZm9yIHVwc3RyZWFtLgo+IAo+
IEltbyBiZXN0IHRvIGp1c3QgcmlwIHRoaXMgb3V0LCBjb25zaWRlciBpdCBuYWNrZWQgd2l0aG91
dCBmdWxsLWJsb3duCj4gdXNlcnNwYWNlIGFuZCB3aGF0ZXZlciBlbHNlIGlzIG5lZWRpbmcgdGhl
c2UgYnVmZmVycy4KPiAtRGFuaWVsCgpZZXMsIEknbGwgZHJvcCB0aGlzIG9uZS4KCnRoYW5rcwpQ
aGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

From: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Date: Thu, 4 Jul 2019 11:03:21 +0300
Message-ID: <36194ec6-2ea7-6c0d-6142-a6bb24a65ccb@ti.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Olivier Moysan <olivier.moysan@st.com>, a.hajda@samsung.com, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

T24gMDIvMDcvMjAxOSAxODo0NywgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gQWRkIGRldm1fY2xr
X2dldCBjYWxsIHRvIHJldHJpZXZlIHJlZmVyZW5jZSB0byBtYXN0ZXIgY2xvY2suCj4gCj4gRml4
ZXM6IGZmNTc4MTYzNGM0MSAoImRybS9icmlkZ2U6IHNpaTkwMng6IEltcGxlbWVudCBIRE1JIGF1
ZGlvIHN1cHBvcnQiKQo+IAo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVy
Lm1veXNhbkBzdC5jb20+CgpSZXZpZXdlZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4K
Ckkgd29uZGVyIGhvdyB0aGF0IGxpbmUgd2FzIGRyb3BwZWQgYW5kIGhvdyB0aGUgY29kZSBwYXN0
IG15IGZpbmFsIHRlc3QuCkFueSB3YXksIHRoaXMgZml4IGlzIGRlZmluaXRlbHkgbmVlZGVkLgoK
VGhhbmtzLApKeXJpCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpaTkwMnguYwo+IGluZGV4IGRkN2FhNDY2YjI4MC4uMzZhY2MyNTZlNjdlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNzUwLDYgKzc1MCw3IEBAIHN0YXRpYyBpbnQgc2lp
OTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAo+ICAJCXNpaTkw
MngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldIHw9IGF1ZGlvX2ZpZm9faWRbaV0gfAo+ICAJ
CQlpMnNfbGFuZV9pZFtsYW5lc1tpXV0gfAlTSUk5MDJYX1RQSV9JMlNfRklGT19FTkFCTEU7Cj4g
IAo+ICsJc2lpOTAyeC0+YXVkaW8ubWNsayA9IGRldm1fY2xrX2dldChkZXYsICJtY2xrIik7Cj4g
IAlpZiAoSVNfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKSB7Cj4gIAkJZGV2X2VycihkZXYsICIl
czogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZvdW5kOiAlbGRcbiIsCj4gIAkJCV9fZnVuY19fLCBQ
VFJfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKTsKPiAKCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMg
RmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1
c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm: support gpu aliases defined in DT data
Date: Thu, 17 Jan 2019 15:04:33 +0200
Message-ID: <a96c03af-4a01-4c85-f8ab-9e4d52822cf1@ti.com>
References: <20190117111918.31759-1-tomi.valkeinen@ti.com>
 <20190117123320.GD3271@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190117123320.GD3271@phenom.ffwll.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Paul <sean@poorly.run>
List-Id: devicetree@vger.kernel.org

T24gMTcvMDEvMTkgMTQ6MzMsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMTcs
IDIwMTkgYXQgMDE6MTk6MThQTSArMDIwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+IFRoZSBE
Uk0gZGV2aWNlIG1pbm9yIG51bWJlcnMgYXJlIGFsbG9jYXRlZCBhY2NvcmRpbmcgdG8gdGhlIHJl
Z2lzdHJhdGlvbgo+PiBvcmRlci4gVGhpcyBjYXVzZXMgY29uZnVzaW9uIGluIGNhc2VzIHdoZXJl
IHRoZSByZWdpc3RyYXRpb24gb3JkZXIgY2FuCj4+IGNoYW5nZSwgb3Igd2hlbiwgc2F5LCBhIG1v
ZGVzZXR0aW5nIGNhcGFibGUgZGV2aWNlIGlzIHByZWZlcnJlZCB0byBiZQo+PiBjYXJkMCwgYW5k
IGEgcmVuZGVyaW5nIGRldmljZSBpcyBwcmVmZXJyZWQgdG8gYmUgY2FyZDEuCj4+Cj4+IFRoaXMg
cGF0Y2ggYWRkcyBzaW1pbGFyIGZ1bmN0aW9uYWxpdHkgdGhhdCBpcyB1c2VkIGluIHNvbWUgb3Ro
ZXIKPj4gc3Vic3lzdGVtcywgd2hlcmUgZGV2aWNlIG1pbm9yIG51bWJlcnMgY2FuIGJlIGRlZmlu
ZWQgaW4gRFQgYmluZGluZ3MnCj4+IGFsaWFzZXMgbm9kZS4KPiAKPiBXaGF0IG90aGVyIHN1YnN5
c3RlbT8gSSB0aG91Z2h0IHRoYXQgbWlub3IgbnVtYmVycyBzaG91bGRuJ3QgYmUgbWFkZSB1YXBp
LAo+IGFuZCB0aGF0IHVkZXYgb3Igc2ltaWxhciBpcyBzdXBwb3NlZCB0byBnaXZlIHlvdSBzdGFi
bGUgbmFtZXMgLi4uIElzIHRoYXQKPiBub3QgdGhlIGNhc2Ugb24gU29DPwoKSSB0aGluayBhdCBs
ZWFzdCBpMmMsIHNwaSBhbmQgdWFydCB1c2UgRFQgYWxpYXNlcy4KCkkgYWxzbyBoYXZlIG15IGRv
dWJ0cyBhYm91dCB0aGlzLCBidXQgdGhvdWdodCB0byBwb3N0IHRoaXMgdG8gZ2V0IHNvbWUKY29t
bWVudHMsIGFzIGl0IGRvZXMgbWFrZSBsaWZlIHF1aXRlIGEgYml0IGVhc2llciA9KS4KCiBUb21p
CgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAx
ODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2Ev
RG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=

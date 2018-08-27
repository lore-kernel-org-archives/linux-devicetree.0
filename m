From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v5 6/7] drm/bridge/synopsys: dsi: add dual-dsi support
Date: Mon, 27 Aug 2018 12:55:42 +0200
Message-ID: <20180827105544eucas1p22a461df001f204aef484febfb682f256~OuHcQVVKA2871528715eucas1p2g@eucas1p2.samsung.com>
References: <20180821140515.22246-1-heiko@sntech.de>
 <CGME20180821140535epcas3p3a55ad807b9ebbc1aa65f5c4f1d774fb9@epcas3p3.samsung.com>
 <20180821140515.22246-7-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180821140515.22246-7-heiko@sntech.de>
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
To: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, briannorris@chromium.org, hoegsberg@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com, linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com, robh+dt@kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, seanpaul@chromium.org, mka@chromium.org
List-Id: devicetree@vger.kernel.org

T24gMjEuMDguMjAxOCAxNjowNSwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gRnJvbTogTmlja2V5
IFlhbmcgPG5pY2tleS55YW5nQHJvY2stY2hpcHMuY29tPgo+Cj4gQWxsb3cgdG8gYWxzbyBkcml2
ZSBhIHNsYXZlIGR3LW1pcGktZHNpIGNvbnRyb2xsZXIgaW4gYSBkdWFsLWRzaQo+IHNldHVwLiBU
aGlzIHdpbGwgcmVxdWlyZSBhZGRpdGlvbmFsIGltcGxlbWVudGF0aW9uLXNwZWNpZmljCj4gY29k
ZSB0byBsb29rIHVwIHRoZSBzbGF2ZSBpbnN0YW5jZSBhbmQgZG8gc3BlY2lmaWMgc2V0dXAuCj4g
QWxzbyB3aWxsIHByb2JhYmx5IG5lZWQgY29kZSBpbiB0aGUgc3BlY2lmaWMgY3J0Y3MgYXMgZHVh
bC1kc2kKPiBkb2VzIG5vdCBlcXVhbCB0d28gc2VwYXJhdGUgZHNpIG91dHB1dHMuCj4KPiBUbyBh
Y3RpdmF0ZSwgdGhlIGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgc2hvdWxkIHNldCB0aGUg
c2xhdmUKPiB1c2luZyBkd19taXBpX2RzaV9zZXRfc2xhdmUoKSBiZWZvcmUgY2FsbGluZyBfX2R3
X21pcGlfZHNpX2JpbmQoKS4KPgo+IHYyOgo+IC0gZXhwZWN0IHJlYWwgaW50ZXJmYWNlIG51bWJl
ciBvZiBsYW5lcwo+IC0ga2VlcCBsaW5rcyB0byBib3RoIG1hc3RlciBhbmQgc2xhdmUKPiB2MzoK
PiAtIHJlbW92ZSB1bm5lZWRlZCBzZXBhcmF0ZSB2YXJpYWJsZXMKPiAtIHJlbW92ZSB1bm5lZWRl
ZCBzZWNvbmQgc2xhdmUgc2V0dGluZ3MKPiAtIGRpc2FibGUgc2xhdmUgYmVmb3JlIG1hc3Rlcgo+
IC0gbGFuZS1zdW0gY2FsY3VsYXRpb24gY29tbWVudHMKPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2tl
eSBZYW5nIDxuaWNrZXkueWFuZ0Byb2NrLWNoaXBzLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIZWlr
byBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IFRlc3RlZC1ieTogUGhpbGlwcGUgQ29ybnUg
PHBoaWxpcHBlLmNvcm51QHN0LmNvbT4KClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhh
amRhQHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

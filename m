From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 8/8] drm/rockchip: dw_hdmi: add dw-hdmi support for the
 rk3328
Date: Tue, 20 Feb 2018 08:32:55 -0600
Message-ID: <CAL_JsqJpThp3Bd2QEvDqY432JTzhsA9V1nEnfz65NYAyTpnY1A@mail.gmail.com>
References: <20180216204158.29839-1-heiko@sntech.de>
 <20180216204158.29839-9-heiko@sntech.de>
 <20180219202853.eovn6onxtk7p7f4p@rob-hp-laptop> <6129590.ZtzF0TqO4l@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <6129590.ZtzF0TqO4l@phil>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <Jose.Abreu@synopsys.com>, algea.cao@rock-chips.com, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Kishon Vijay Abraham I <kishon@ti.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Zheng Yang <zhengyang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBGZWIgMTksIDIwMTggYXQgMjo0NiBQTSwgSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4gSGkgUm9iLAo+Cj4gQW0gTW9udGFnLCAxOS4gRmVicnVhciAyMDE4
LCAyMToyODo1MyBDRVQgc2NocmllYiBSb2IgSGVycmluZzoKPj4gT24gRnJpLCBGZWIgMTYsIDIw
MTggYXQgMDk6NDE6NThQTSArMDEwMCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4+ID4gVGhlIHJr
MzMyOCB1c2VzIGFuIGV4dGVybmFsIGhkbWkgcGh5IGZyb20gSW5ub3NpbGljb24gd2hpY2ggdXNl
cwo+PiA+IHRoZSBnZW5lcmljIHBoeSBmcmFtZXdvcmsgZm9yIGFjY2Vzcy4gQWRkIHRoZSBuZWNl
c3NhcnkgZGF0YQo+PiA+IGFuZCB0aGUgY29tcGF0aWJsZSBmb3IgaXQuCj4+ID4KPj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+PiA+IC0tLQo+PiA+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLnR4dCB8ICAg
MSArCj4+ID4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgICAg
ICAgIHwgMTA2ICsrKysrKysrKysrKysrKysrKysrKwo+PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEw
NyBpbnNlcnRpb25zKCspCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19oZG1p
LXJvY2tjaGlwLnR4dAo+PiA+IGluZGV4IDkzN2JmYjQ3MmUxZC4uMzkxNDM0MjRhNDc0IDEwMDY0
NAo+PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jv
Y2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0Cj4+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQKPj4g
PiBAQCAtMTMsNiArMTMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiA+Cj4+ID4gIC0gY29t
cGF0aWJsZTogc2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nOgo+PiA+ICAgICAgICAgICAg
ICJyb2NrY2hpcCxyazMyODgtZHctaGRtaSIKPj4gPiArICAgICAgICAgICAicm9ja2NoaXAscmsz
MzI4LWR3LWhkbWkiCj4+Cj4+IElzIERlc2lnbndhcmUgKFN5bm9wc3lzKSBub3cgSW5ub3NpbGlj
b24/Cj4KPiBOb3BlIDotKSAuCj4KPiBUaGUgcmszMzI4IGp1c3QgY29tYmluZXMgdGhlIERlc2ln
bndhcmUgZHctaGRtaSB3aXRoIGFuIChleHRlcm5hbCkKPiBoZG1pLXBoeSBmcm9tIElubm9zaWxp
Y29uLCB3aGVyZSB0aGUgaGRtaS1waHkgb3RoZXJ3aXNlIHdhcyB3YXMKPiBpbnRlZ3JhdGVkIGlu
dG8gdGhlIGhkbWkgaXAtYmxvY2suCgpPa2F5LCB0aGUgY29tbWl0IG1zZyBpcyBtaXNsZWFkaW5n
IGJlY2F1c2UgaXQgdGFsa3MgYWJvdXQgdGhlIHBoeSBhbmQKYWRkaW5nIHRoZSAiY29tcGF0aWJs
ZSBmb3IgaXQiLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

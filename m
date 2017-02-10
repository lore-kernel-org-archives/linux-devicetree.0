From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH 0/4] Move DP phy switch to PHY driver
Date: Fri, 10 Feb 2017 15:44:10 +0800
Message-ID: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, kishon@ti.com, robh@kernel.org, linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, groeck@chromium.org, zyw@rock-chips.com, Brian Norris <briannorris@chromium.org>, Jianqun Xu <jay.xu@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, William wu <wulf@rock-chips.com>, linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Wu <david.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

ClRoZXJlIGFyZSAyIFR5cGUtYyBQSFlzIGluIFJLMzM5OSwgYnV0IG9ubHkgb25lIERQIGNvbnRy
b2xsZXIuIEhlbmNlCm9ubHkgb25lIFBIWSBjYW4gY29ubmVjdCB0byBEUCBjb250cm9sbGVyIGF0
IG9uZSB0aW1lLCB0aGUgb3RoZXIgc2hvdWxkCmJlIGRpc2Nvbm5lY3RlZC4gVGhlIEdSRl9TT0Nf
Q09OMjYgcmVnaXN0ZXIgaGFzIGEgc3dpdGNoIGJpdCB0byBkbyBpdCwKc2V0IHRoaXMgYml0IG1l
YW5zIGVuYWJsZSBQSFkgMSwgY2xlYXIgdGhpcyBiaXQgbWVhbnMgZW5hYmxlIFBIWSAwLgoKSWYg
dGhlIGJvYXJkIGhhcyAyIFR5cGUtQyBwb3J0cywgdGhlIERQIGRyaXZlciBnZXQgdGhlIHBoeSBp
ZCBmcm9tCmRldm1fb2ZfcGh5X2dldF9ieV9pbmRleCwgYW5kIHRoZW4gY29udHJvbCB0aGlzIHN3
aXRjaCBhY2NvcmRpbmcgdG8KdGhpcyBpZC4gQnV0IHNvbWUgb3RoZXJzIGJvYXJkIG9ubHkgaGFz
IG9uZSBUeXBlLUMgcG9ydCwgaXQgbWF5IGJlIFBIWSAwCm9yIFBIWSAxLiBUaGUgZHRzIG5vZGUg
aWQgY2FuIG5vdCB0ZWxsIHVzIHRoZSBjb3JyZWN0IFBIWSBpZC4gSGVuY2UgbW92ZQp0aGlzIHN3
aXRjaCB0byBQSFkgZHJpdmVyLCB0aGUgUEhZIGRyaXZlciBjYW4gZGlzdGluZ3Vpc2ggYmV0d2Vl
biBQSFkgMAphbmQgUEhZIDEsIGFuZCB0aGVuIHdyaXRlIHRoZSBjb3JyZWN0IHJlZ2lzdGVyIGJp
dC4KCgoKQ2hyaXMgWmhvbmcgKDQpOgogIERvY3VtZW50YXRpb246IGJpbmRpbmdzOiBhZGQgdXBo
eS1kcC1zZWwgZm9yIFJvY2tjaGlwIFVTQiBUeXBlLUMgUEhZCiAgYXJtNjQ6IGR0czogcm9ja2No
aXA6IGFkZCByb2NrY2hpcCx1cGh5LWRwLXNlbCBmb3IgVHlwZS1DIHBoeQogIHBoeTogcm9ja2No
aXAtdHlwZWM6IHN1cHBvcnQgRFAgcGh5IHN3aXRjaAogIGRybS9yb2NrY2hpcDogY2RuLWRwOiBy
ZW1vdmUgdGhlIERQIHBoeSBzd2l0Y2gKCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGh5L3BoeS1yb2NrY2hpcC10eXBlYy50eHQgfCA1ICsrKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JvY2tjaGlwL3JrMzM5OS5kdHNpICAgICAgICAgICAgICAgICAgICAgfCAyICsrCiBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgICAg
fCA3IC0tLS0tLS0KIGRyaXZlcnMvcGh5L3BoeS1yb2NrY2hpcC10eXBlYy5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi42LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

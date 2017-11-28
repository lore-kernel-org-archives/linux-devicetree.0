From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 0/4] Move DP phy switch to PHY driver
Date: Tue, 28 Nov 2017 15:32:52 -0800
Message-ID: <CAD=FV=VdUhfL+_MShYynoXKQW1-KpAOsW=x+hAxGZO78rJEyeQ@mail.gmail.com>
References: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486712654-15431-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Jianqun Xu <jay.xu@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, William wu <wulf@rock-chips.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Mark yao <mark.yao@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, David Wu <david.wu@rock-chips.com>, Enric Balletbo i Serra <enric.ballet>
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBUaHUsIEZlYiA5LCAyMDE3IGF0IDExOjQ0IFBNLCBDaHJpcyBaaG9uZyA8enl3QHJv
Y2stY2hpcHMuY29tPiB3cm90ZToKPgo+IFRoZXJlIGFyZSAyIFR5cGUtYyBQSFlzIGluIFJLMzM5
OSwgYnV0IG9ubHkgb25lIERQIGNvbnRyb2xsZXIuIEhlbmNlCj4gb25seSBvbmUgUEhZIGNhbiBj
b25uZWN0IHRvIERQIGNvbnRyb2xsZXIgYXQgb25lIHRpbWUsIHRoZSBvdGhlciBzaG91bGQKPiBi
ZSBkaXNjb25uZWN0ZWQuIFRoZSBHUkZfU09DX0NPTjI2IHJlZ2lzdGVyIGhhcyBhIHN3aXRjaCBi
aXQgdG8gZG8gaXQsCj4gc2V0IHRoaXMgYml0IG1lYW5zIGVuYWJsZSBQSFkgMSwgY2xlYXIgdGhp
cyBiaXQgbWVhbnMgZW5hYmxlIFBIWSAwLgo+Cj4gSWYgdGhlIGJvYXJkIGhhcyAyIFR5cGUtQyBw
b3J0cywgdGhlIERQIGRyaXZlciBnZXQgdGhlIHBoeSBpZCBmcm9tCj4gZGV2bV9vZl9waHlfZ2V0
X2J5X2luZGV4LCBhbmQgdGhlbiBjb250cm9sIHRoaXMgc3dpdGNoIGFjY29yZGluZyB0bwo+IHRo
aXMgaWQuIEJ1dCBzb21lIG90aGVycyBib2FyZCBvbmx5IGhhcyBvbmUgVHlwZS1DIHBvcnQsIGl0
IG1heSBiZSBQSFkgMAo+IG9yIFBIWSAxLiBUaGUgZHRzIG5vZGUgaWQgY2FuIG5vdCB0ZWxsIHVz
IHRoZSBjb3JyZWN0IFBIWSBpZC4gSGVuY2UgbW92ZQo+IHRoaXMgc3dpdGNoIHRvIFBIWSBkcml2
ZXIsIHRoZSBQSFkgZHJpdmVyIGNhbiBkaXN0aW5ndWlzaCBiZXR3ZWVuIFBIWSAwCj4gYW5kIFBI
WSAxLCBhbmQgdGhlbiB3cml0ZSB0aGUgY29ycmVjdCByZWdpc3RlciBiaXQuCj4KPgo+Cj4gQ2hy
aXMgWmhvbmcgKDQpOgo+ICAgRG9jdW1lbnRhdGlvbjogYmluZGluZ3M6IGFkZCB1cGh5LWRwLXNl
bCBmb3IgUm9ja2NoaXAgVVNCIFR5cGUtQyBQSFkKPiAgIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBh
ZGQgcm9ja2NoaXAsdXBoeS1kcC1zZWwgZm9yIFR5cGUtQyBwaHkKPiAgIHBoeTogcm9ja2NoaXAt
dHlwZWM6IHN1cHBvcnQgRFAgcGh5IHN3aXRjaAo+ICAgZHJtL3JvY2tjaGlwOiBjZG4tZHA6IHJl
bW92ZSB0aGUgRFAgcGh5IHN3aXRjaAo+Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvcGh5LXJvY2tjaGlwLXR5cGVjLnR4dCB8IDUgKysrKysKPiAgYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazMzOTkuZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgMiArKwo+
ICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCA3IC0tLS0tLS0KPiAgZHJpdmVycy9waHkvcGh5LXJvY2tjaGlwLXR5cGVjLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgOSArKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKV2hhdCBldmVyIGhhcHBlbmVkIHRv
IHRoaXMgc2VyaWVzPyAgSXQgc2VlbWVkIGxpa2UgaXQganVzdCBkcm9wcGVkIG9uCnRoZSBmbG9v
ci4uLgoKVGhlcmUgd2FzIGEgYml0IG9mIGNvbnRlbnRpb24gb24gcGF0Y2ggIzMKPGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTU2NjA5NS8+IGFib3V0IHRoZSBmYWN0IHRoYXQg
d2UKd2VyZSBzcGVjaWZ5aW5nIGFkZHJlc3NlcyBpbiB0aGUgZGV2aWNlIHRyZWUgdnMuIGhhcmRj
b2RpbmcgdGhlbSBpbgp0aGUgZHJpdmVyLiAgQW55IHdheSB3ZSBjYW4ganVzdCBtYWtlIGEgZGVj
aXNpb24gYW5kIGdvIHdpdGggaXQ/CgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v10 05/11] drm: bridge/dw_hdmi:split some phy configuration
 to platform driver
Date: Fri, 14 Nov 2014 18:53:00 +0800
Message-ID: <5465DF0C.50301@rock-chips.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com>
 <5465D73C.9030507@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5465D73C.9030507@imgtec.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgWnViYWlyTEs6CiAgICBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgpPbiAyMDE05bm0MTHmnIgx
NOaXpSAxODoxOSwgWnViYWlyIEx1dGZ1bGxhaCBLYWtha2hlbCB3cm90ZToKPiBIaSBBbmR5LAo+
Cj4gTmljZSB3b3JrIG9uIHRoaXMgcGF0Y2ggc2VyaWVzLiBJdHMgZ2V0dGluZyBiZXR0ZXIgYW5k
IGJldHRlciA6KS4KPgo+IE9uIDE0LzExLzE0IDAzOjI3LCBBbmR5IFlhbiB3cm90ZToKPj4gaGRt
aSBwaHkgY2xvY2sgc3ltYm9sIGFuZCB0cmFuc21pc3Npb24gdGVybWluYXRpb24gdmFsdWUKPj4g
Y2FuIGFkanVzdCBwbGF0Zm9ybSBzcGVjaWZpYyB0byBnZXQgdGhlIGJlc3QgU0kKPiAJCQkJCQle
SXMgdGhpcyBzaWduYWwgaW50ZWdyaXR5PwogICAgeWVzICwgU0kgIGlzIHNpZ25hbCBpbnRlZ3Jp
dHksIHN1Y2ggYXMgZXllIGRpYWdyYW0gbWVhc3VyZW1lbnQKPgo+IEFyZSB0aGVzZSB0d28gZGlz
am9pbnQgZmVhdHVyZXMgaW4gc2VwYXJhdGUgcGF0Y2hlcz8KPgo+PiBhbHNvIGFkZCBtb2RlX3Zh
bGlkIGludGVyZmFjZSBmb3Igc29tZSBwbGF0Zm9ybSBtYXkgbm90IHN1cHBvcnQKPj4gYWxsIHRo
ZSBkaXNwbGF5IG1vZGUKPiBTb3VuZHMgbGlrZSBhbm90aGVyIHNlcGFyYXRlIHBhdGNoIHRvIG1l
LiA6KQogICAgdGhleSBjYW4gc2VwZXJhdGUKPgo+IEFsc28sIFRoaXMgc2VyaWVzIGlzIGJlY29t
aW5nIHF1aXRlIGxhcmdlLiBXaXRoIG1ham9yIGNoYW5nZXMgYW5kIGZpeGVzIG1peGVkIHRvZ2V0
aGVyLgo+Cj4gUGF0Y2ggMyBzcGxpdHMgaW14LWRybS4KPiBQYXRjaCA0IG1vdmVzIGR3LWRybSBv
dXQgb2YgaW14LWRybSBmb2xkZXIuCj4gUGF0Y2ggNyBhZGRzIGJpbmRpbmcKPiBQYXRjaCA5IGNv
bnZlcnRzIHRvIGRybSBicmlkZ2UuCj4KPiBDYW4gdGhlc2UgYmUgcGxhY2VkIHRvZ2V0aGVyIGVh
c2lseT8KPiBBbmQgaW4gdGhlIHN0YXJ0LiBpLmUuIHBhdGNoIDEsIDIsIDMsIDQsCj4KPiBUaGVu
IGFsbCBmaXhlcyBldGMgY2FuIGNvbWUgYWZ0ZXJ3YXJkcz8KPgo+IEl0IGhlbHBzIHdoZW4gY2hl
Y2tpbmcgaGlzdG9yaWVzIGxhdGVyIGFzIHRvIGhvdyBhIGRyaXZlciB3YXMgbWFkZSBhbmQgaG93
IGZpeGVzIGhhcHBlbmVkLgo+Cj4gRXNwZWNpYWxseSB3aGVuIGZpbGUgbW92ZXMgaGFwcGVuLi4K
ICAgRG8geW91IG1lYW4gd2UgY2FuIHJlYXJyYW5nZSB0aGUgcGF0Y2ggc2VyaWVzPwogICBwdXQg
cGF0Y2ggMywgNCAsNywgOSB0b2dldGhlciAgb25lIGJ5ZSBvbmUKICAgdGhhbiBmb2xsb3dlZCBi
eSB0aGUgZml4ZXMgcGF0Y2hlcyAgNSAsNiwgOCwgMTEgPwo+Cj4gQ2hlZXJzLAo+IFp1YmFpckxL
Cj4KPj4gU2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+
Pgo+PiAtLS0KPj4KPj4gQ2hhbmdlcyBpbiB2MTA6Cj4+IC0gc3BsaXQgZ2VuZXJpYyBkd19oZG1p
LmMgaW1wcm92ZW1lbnRzIGZyb20gcGF0Y2gjMTEgKGFkZCByazMyODggc3VwcG9ydCkKPj4KPj4g
Q2hhbmdlcyBpbiB2OTogTm9uZQo+PiBDaGFuZ2VzIGluIHY4OiBOb25lCj4+IENoYW5nZXMgaW4g
djc6IE5vbmUKPj4gQ2hhbmdlcyBpbiB2NjogTm9uZQo+PiBDaGFuZ2VzIGluIHY1OiBOb25lCj4+
IENoYW5nZXMgaW4gdjQ6IE5vbmUKPj4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+PiBDaGFuZ2VzIGlu
IHYyOiBOb25lCj4+Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kd19oZG1pLmMgICAgICB8
IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+ICAgZHJpdmVycy9zdGFnaW5nL2lt
eC1kcm0vZHdfaGRtaS1pbXguYyB8IDEwICsrKysrKysrKy0KPj4gICBpbmNsdWRlL2RybS9icmlk
Z2UvZHdfaGRtaS5oICAgICAgICAgIHwgIDcgKysrKysrKwo+PiAgIDMgZmlsZXMgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlz
dAo+IExpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCj4KPgo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBs
aXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRy
aXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==

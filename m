From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 6/7] drm: bridge/dw-hdmi: convert dw-hdmi to drm_bridge
 mode
Date: Tue, 11 Nov 2014 22:50:46 +0800
Message-ID: <54622246.9080302@rock-chips.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
 <1415710469-12213-1-git-send-email-andy.yan@rock-chips.com>
 <54621EF7.4000300@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <54621EF7.4000300@imgtec.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, djkurtz@google.com, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

SGkgWnViYWlyTEs6Ck9uIDIwMTTlubQxMeaciDEx5pelIDIyOjM2LCBadWJhaXIgTHV0ZnVsbGFo
IEtha2FraGVsIHdyb3RlOgo+IEhpIEFuZHksCj4KPiBPbiAxMS8xMS8xNCAxMjo1NCwgQW5keSBZ
YW4gd3JvdGU6Cj4+IEZyb206IFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KPj4KPj4g
a2VlcCB0aGUgY29ubmVjdG9yICYgYmlyZGdlIGluIGR3X2hkbWkuYywgaGFuZGxlIGVuY29kZXIg
aW4gZHdfaGRtaS1pbXguYwo+IElzIHRoZXJlIGEgcmVhc29uIGZvciB0aGlzIHNlcGFyYXRpb24/
IEtlZXBpbmcgZW5jb2RlciBpbiBwbGF0Zm9ybSBmaWxlcz8KPiBJZiB5ZXMsIHRoZW4gdGhlIGNv
bW1pdCBtZXNzYWdlIHNob3VsZCBleHBsYWluIHRoYXQuCiAgICBpbiB0aGUgZW5jb2RlciwgbW9z
dCBvcGVyYXRpb24gYXJlIHBsYXRmb3JtIHNwZWNpZmljLCBzdWNoIGFzCiAgIG11eCB0byBzZWxl
Y3Qgd2hpY2ggY3J0YyBpcyB1c2VkLCAgc2V0IHBhbmVsIGZvcm1hdCBldGMsIHRoZXNlIG9wZXJh
dGlvbgogICBjb21wbGV0ZSBieSBwbGF0Zm9ybSBzcGVjaWZpYyBpbnRlcmZhY2UKPj4gU2lnbmVk
LW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFu
Z2VzIGluIHY3OiBOb25lCj4+IENoYW5nZXMgaW4gdjY6Cj4+IC0gbW92ZSBzb21lIG1vZGlmaWNh
dGlvbiBmcm9tIHBhdGNoIzUKPj4KPj4gQ2hhbmdlcyBpbiB2NTogTm9uZQo+PiBDaGFuZ2VzIGlu
IHY0OiBOb25lCj4+IENoYW5nZXMgaW4gdjM6IE5vbmUKPj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+
Pgo+PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHdfaGRtaS5jICAgICAgfCAyMjggKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvc3RhZ2luZy9pbXgtZHJt
L2R3X2hkbWktaW14LmMgfCAxNDUgKysrKysrKysrKysrKystLS0tLS0tCj4+ICAgaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICB8ICAxMyArLQo+PiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMTk5IGluc2VydGlvbnMoKyksIDE4NyBkZWxldGlvbnMoLSkKPgo+IFJlZ2FyZHMKPiBadWJh
aXJMSwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPiBMaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yb2NrY2hpcAo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qu
b3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaXZlcmRldi1kZXZlbAo=

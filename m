From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v10 05/11] drm: bridge/dw_hdmi:split some phy configuration
 to platform driver
Date: Fri, 14 Nov 2014 10:55:46 +0000
Message-ID: <5465DFB2.8060601@imgtec.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com>
 <5465D73C.9030507@imgtec.com> <5465DF0C.50301@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5465DF0C.50301@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>, airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

CgpPbiAxNC8xMS8xNCAxMDo1MywgQW5keSBZYW4gd3JvdGU6Cj4gSGkgWnViYWlyTEs6Cj4gICAg
VGhhbmtzIGZvciB5b3VyIHJldmlldy4KPiBPbiAyMDE05bm0MTHmnIgxNOaXpSAxODoxOSwgWnVi
YWlyIEx1dGZ1bGxhaCBLYWtha2hlbCB3cm90ZToKPj4gSGkgQW5keSwKPj4KPj4gTmljZSB3b3Jr
IG9uIHRoaXMgcGF0Y2ggc2VyaWVzLiBJdHMgZ2V0dGluZyBiZXR0ZXIgYW5kIGJldHRlciA6KS4K
Pj4KPj4gT24gMTQvMTEvMTQgMDM6MjcsIEFuZHkgWWFuIHdyb3RlOgo+Pj4gaGRtaSBwaHkgY2xv
Y2sgc3ltYm9sIGFuZCB0cmFuc21pc3Npb24gdGVybWluYXRpb24gdmFsdWUKPj4+IGNhbiBhZGp1
c3QgcGxhdGZvcm0gc3BlY2lmaWMgdG8gZ2V0IHRoZSBiZXN0IFNJCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIF5JcyB0aGlzIHNpZ25hbCBpbnRlZ3JpdHk/Cj4gICAgeWVzICwgU0kgIGlzIHNp
Z25hbCBpbnRlZ3JpdHksIHN1Y2ggYXMgZXllIGRpYWdyYW0gbWVhc3VyZW1lbnQKPj4KPj4gQXJl
IHRoZXNlIHR3byBkaXNqb2ludCBmZWF0dXJlcyBpbiBzZXBhcmF0ZSBwYXRjaGVzPwo+Pgo+Pj4g
YWxzbyBhZGQgbW9kZV92YWxpZCBpbnRlcmZhY2UgZm9yIHNvbWUgcGxhdGZvcm0gbWF5IG5vdCBz
dXBwb3J0Cj4+PiBhbGwgdGhlIGRpc3BsYXkgbW9kZQo+PiBTb3VuZHMgbGlrZSBhbm90aGVyIHNl
cGFyYXRlIHBhdGNoIHRvIG1lLiA6KQo+ICAgIHRoZXkgY2FuIHNlcGVyYXRlCj4+Cj4+IEFsc28s
IFRoaXMgc2VyaWVzIGlzIGJlY29taW5nIHF1aXRlIGxhcmdlLiBXaXRoIG1ham9yIGNoYW5nZXMg
YW5kIGZpeGVzIG1peGVkIHRvZ2V0aGVyLgo+Pgo+PiBQYXRjaCAzIHNwbGl0cyBpbXgtZHJtLgo+
PiBQYXRjaCA0IG1vdmVzIGR3LWRybSBvdXQgb2YgaW14LWRybSBmb2xkZXIuCj4+IFBhdGNoIDcg
YWRkcyBiaW5kaW5nCj4+IFBhdGNoIDkgY29udmVydHMgdG8gZHJtIGJyaWRnZS4KPj4KPj4gQ2Fu
IHRoZXNlIGJlIHBsYWNlZCB0b2dldGhlciBlYXNpbHk/Cj4+IEFuZCBpbiB0aGUgc3RhcnQuIGku
ZS4gcGF0Y2ggMSwgMiwgMywgNCwKPj4KPj4gVGhlbiBhbGwgZml4ZXMgZXRjIGNhbiBjb21lIGFm
dGVyd2FyZHM/Cj4+Cj4+IEl0IGhlbHBzIHdoZW4gY2hlY2tpbmcgaGlzdG9yaWVzIGxhdGVyIGFz
IHRvIGhvdyBhIGRyaXZlciB3YXMgbWFkZSBhbmQgaG93IGZpeGVzIGhhcHBlbmVkLgo+Pgo+PiBF
c3BlY2lhbGx5IHdoZW4gZmlsZSBtb3ZlcyBoYXBwZW4uLgo+ICAgRG8geW91IG1lYW4gd2UgY2Fu
IHJlYXJyYW5nZSB0aGUgcGF0Y2ggc2VyaWVzPwo+ICAgcHV0IHBhdGNoIDMsIDQgLDcsIDkgdG9n
ZXRoZXIgIG9uZSBieWUgb25lCj4gICB0aGFuIGZvbGxvd2VkIGJ5IHRoZSBmaXhlcyBwYXRjaGVz
ICA1ICw2LCA4LCAxMSA/CgpZZXMuIFJlYXJyYW5nZSBzbyB0aGF0IHRoZSBzcGxpdCBpbXgtZHJt
L2lteC1oZG1pIGFuZCBjb252ZXJzaW9uIHRvIGRybS1icmlkZ2UgaXMgYXQgdGhlIHN0YXJ0IG9m
IHRoZSBzZXJpZXMuClRoZW4gdGhlIHJlc3QgYXJlIGJ1ZyBmaXhlcyBhbmQgZmVhdHVyZSBhZGRp
dGlvbnMuCgpDaGVlcnMsClp1YmFpckxLCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2pl
Y3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=

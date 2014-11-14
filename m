From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v10 05/11] drm: bridge/dw_hdmi:split some phy configuration
 to platform driver
Date: Fri, 14 Nov 2014 11:13:35 +0000
Message-ID: <5465E3DF.6050307@imgtec.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415935631-16826-1-git-send-email-andy.yan@rock-chips.com>
 <5465D73C.9030507@imgtec.com> <5465DF0C.50301@rock-chips.com>
 <5465DFB2.8060601@imgtec.com> <5465E2BB.1070507@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5465E2BB.1070507@rock-chips.com>
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

CgpPbiAxNC8xMS8xNCAxMTowOCwgQW5keSBZYW4gd3JvdGU6Cj4gCj4gT24gMjAxNOW5tDEx5pyI
MTTml6UgMTg6NTUsIFp1YmFpciBMdXRmdWxsYWggS2FrYWtoZWwgd3JvdGU6Cj4+Cj4+IE9uIDE0
LzExLzE0IDEwOjUzLCBBbmR5IFlhbiB3cm90ZToKPj4+IEhpIFp1YmFpckxLOgo+Pj4gICAgIFRo
YW5rcyBmb3IgeW91ciByZXZpZXcuCj4+PiBPbiAyMDE05bm0MTHmnIgxNOaXpSAxODoxOSwgWnVi
YWlyIEx1dGZ1bGxhaCBLYWtha2hlbCB3cm90ZToKPj4+PiBIaSBBbmR5LAo+Pj4+Cj4+Pj4gTmlj
ZSB3b3JrIG9uIHRoaXMgcGF0Y2ggc2VyaWVzLiBJdHMgZ2V0dGluZyBiZXR0ZXIgYW5kIGJldHRl
ciA6KS4KPj4+Pgo+Pj4+IE9uIDE0LzExLzE0IDAzOjI3LCBBbmR5IFlhbiB3cm90ZToKPj4+Pj4g
aGRtaSBwaHkgY2xvY2sgc3ltYm9sIGFuZCB0cmFuc21pc3Npb24gdGVybWluYXRpb24gdmFsdWUK
Pj4+Pj4gY2FuIGFkanVzdCBwbGF0Zm9ybSBzcGVjaWZpYyB0byBnZXQgdGhlIGJlc3QgU0kKPj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgXklzIHRoaXMgc2lnbmFsIGludGVncml0eT8KPj4+
ICAgICB5ZXMgLCBTSSAgaXMgc2lnbmFsIGludGVncml0eSwgc3VjaCBhcyBleWUgZGlhZ3JhbSBt
ZWFzdXJlbWVudAo+Pj4+IEFyZSB0aGVzZSB0d28gZGlzam9pbnQgZmVhdHVyZXMgaW4gc2VwYXJh
dGUgcGF0Y2hlcz8KPj4+Pgo+Pj4+PiBhbHNvIGFkZCBtb2RlX3ZhbGlkIGludGVyZmFjZSBmb3Ig
c29tZSBwbGF0Zm9ybSBtYXkgbm90IHN1cHBvcnQKPj4+Pj4gYWxsIHRoZSBkaXNwbGF5IG1vZGUK
Pj4+PiBTb3VuZHMgbGlrZSBhbm90aGVyIHNlcGFyYXRlIHBhdGNoIHRvIG1lLiA6KQo+Pj4gICAg
IHRoZXkgY2FuIHNlcGVyYXRlCj4+Pj4gQWxzbywgVGhpcyBzZXJpZXMgaXMgYmVjb21pbmcgcXVp
dGUgbGFyZ2UuIFdpdGggbWFqb3IgY2hhbmdlcyBhbmQgZml4ZXMgbWl4ZWQgdG9nZXRoZXIuCj4+
Pj4KPj4+PiBQYXRjaCAzIHNwbGl0cyBpbXgtZHJtLgo+Pj4+IFBhdGNoIDQgbW92ZXMgZHctZHJt
IG91dCBvZiBpbXgtZHJtIGZvbGRlci4KPj4+PiBQYXRjaCA3IGFkZHMgYmluZGluZwo+Pj4+IFBh
dGNoIDkgY29udmVydHMgdG8gZHJtIGJyaWRnZS4KPj4+Pgo+Pj4+IENhbiB0aGVzZSBiZSBwbGFj
ZWQgdG9nZXRoZXIgZWFzaWx5Pwo+Pj4+IEFuZCBpbiB0aGUgc3RhcnQuIGkuZS4gcGF0Y2ggMSwg
MiwgMywgNCwKPj4+Pgo+Pj4+IFRoZW4gYWxsIGZpeGVzIGV0YyBjYW4gY29tZSBhZnRlcndhcmRz
Pwo+Pj4+Cj4+Pj4gSXQgaGVscHMgd2hlbiBjaGVja2luZyBoaXN0b3JpZXMgbGF0ZXIgYXMgdG8g
aG93IGEgZHJpdmVyIHdhcyBtYWRlIGFuZCBob3cgZml4ZXMgaGFwcGVuZWQuCj4+Pj4KPj4+PiBF
c3BlY2lhbGx5IHdoZW4gZmlsZSBtb3ZlcyBoYXBwZW4uLgo+Pj4gICAgRG8geW91IG1lYW4gd2Ug
Y2FuIHJlYXJyYW5nZSB0aGUgcGF0Y2ggc2VyaWVzPwo+Pj4gICAgcHV0IHBhdGNoIDMsIDQgLDcs
IDkgdG9nZXRoZXIgIG9uZSBieWUgb25lCj4+PiAgICB0aGFuIGZvbGxvd2VkIGJ5IHRoZSBmaXhl
cyBwYXRjaGVzICA1ICw2LCA4LCAxMSA/Cj4+IFllcy4gUmVhcnJhbmdlIHNvIHRoYXQgdGhlIHNw
bGl0IGlteC1kcm0vaW14LWhkbWkgYW5kIGNvbnZlcnNpb24gdG8gZHJtLWJyaWRnZSBpcyBhdCB0
aGUgc3RhcnQgb2YgdGhlIHNlcmllcy4KPj4gVGhlbiB0aGUgcmVzdCBhcmUgYnVnIGZpeGVzIGFu
ZCBmZWF0dXJlIGFkZGl0aW9ucy4KPiAgIENhbiBJIHB1dCBwYXRjaCMxKG1ha2UgY2hlY2twYXRj
aCBoYXBweSkgYW5kIHBhdGNoIzIgKGRlZmVyIHByb2JlKSBhcyB0aGUgZmlyc3QgdHdvIHBhdGNo
Lgo+ICAgRGFuaWVsIGZyb20gR29vZ2xlIGNocm9taXVtIHRoaW5rIGl0J3MgYmV0dGVyIHRvIHB1
dCB0aGUgdHdvIHNsaWdodGx5IGNoYW5nZXMgaW4gdGhlIGZyb250IGZvciBlYXN5IHJldmlldy4K
ClN1cmUuCgpJIGFtIG5vdCB0aGUgbWFpbnRhaW5lci4gVGhleSBoYXZlIHRvIG1ha2UgdGhlIGZp
bmFsIGRlY2lzaW9uLgoKWnViYWlyTEsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVj
dC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpdmVyZGV2LWRldmVsCg==

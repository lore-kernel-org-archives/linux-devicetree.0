From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v15 06/12] dt-bindings: add document for dw_hdmi
Date: Wed, 03 Dec 2014 17:43:23 +0800
Message-ID: <547EDB3B.9010907@rock-chips.com>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>
 <1417544629.3411.15.camel@pengutronix.de> <547E5F51.2090800@rock-chips.com>
 <1417598398.5124.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417598398.5124.2.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcDoKT24gMjAxNOW5tDEy5pyIMDPml6UgMTc6MTksIFBoaWxpcHAgWmFiZWwgd3Jv
dGU6Cj4gSGkgQW5keSwKPgo+IEFtIE1pdHR3b2NoLCBkZW4gMDMuMTIuMjAxNCwgMDg6NTQgKzA4
MDAgc2NocmllYiBBbmR5IFlhbjoKPj4+PiArUmVxdWlyZWQgcHJvcGVyaXRpZXM6Cj4+Pj4gKy0g
Y29tcGF0aWJsZTogcGxhdGZvcm0gc3BlY2lmaWMgc3VjaCBhczoKPj4+PiArICAgKiAiZnNsLGlt
eDZxLWhkbWkiCj4+Pj4gKyAgICogImZzbCxpbXg2ZGwtaGRtaSIKPj4+PiArICAgKiAicm9ja2No
aXAscmszMjg4LWR3LWhkbWkiCj4+PiBJIHRoaW5rIHdlIHNob3VsZCBhZGQgYSBjb21tb24gY29t
cGF0aWJsZSB2YWx1ZSAic25wcyxkdy1oZG1pLXR4IiBoZXJlOgo+Pj4KPj4+IAljb21wYXRpYmxl
ID0gImZzbCxpbXg2cS1oZG1pIiwgInNucHMsZHctaGRtaS10eCI7Cj4+Pgo+PiAgICAgICAgSG93
IGFib3V0ICJzbnBzLGR3LWhkbWkiLCBiZWNhdXNlIHRoZSBkcml2ZXIgaXMgbm90IG9ubHkgYWJv
dXQKPj4gICAgIGhkbWkgdHgsIGJ1dCBhbHNvIGluY2x1ZGUgaGRtaSBwaHkuCj4gU3lub3BzeXMg
Y2FsbCB0aGUgd2hvbGUgbW9kdWxlCj4gIkRlc2lnbldhcmUgSERNSSBUcmFuc21pdHRlciAoVFgp
IElQIFNvbHV0aW9uIjoKPgo+IGh0dHBzOi8vd3d3LnN5bm9wc3lzLmNvbS9kdy9pcGRpci5waHA/
ZHM9ZHdjX2hkbWlfMTRfY3Nkc190eAo+IGh0dHBzOi8vd3d3LnN5bm9wc3lzLmNvbS9kdy9pcGRp
ci5waHA/ZHM9ZHdjX2hkbWlfMjBfY3Nkc190eAo+Cj4gVGhhdCBpbmNsdWRlcyB0aGUgUEhZLiBJ
J2QgcHJlZmVyIGtlZXBpbmcgdGhlIC10eCBpbiB0aGVyZSB0bwo+IGRpZmZlcmVudGlhdGUgZnJv
bSBhIHBvc3NpYmxlIGZ1dHVyZSAic25wcyxkdy1oZG1pLXJ4IjoKPgo+IGh0dHBzOi8vd3d3LnN5
bm9wc3lzLmNvbS9kdy9pcGRpci5waHA/ZHM9ZHdjX2hkbWlfMTRfY3Nkc19yeAo+IGh0dHBzOi8v
d3d3LnN5bm9wc3lzLmNvbS9kdy9pcGRpci5waHA/ZHM9ZHdjX2hkbWlfMjBfY3Nkc19yeAoKICAg
T2ssIEkgd2lsbCBhZGQgdGhlIGNvbXBhdGlibGUgInNucHMsIGR3LWhkbWktdHgiLAogICAgU28g
ZG8gSSBuZWVkIHRvIGFkZCB0aGlzIHZhbHVlIHRvIGlteDZkbC5kdHNpPwo+PiAgICAgICAgIElm
IHdlIGFkZCBzdWNoIGNvbXBhdGlibGUgdmFsdWUsIGRvIHdlIGhhdmUgdG8gaW1wbGVtZW50IGFu
b3RoZXIKPj4gICAgICBwbGF0Zm9ybSBkcml2ZXIgbGlrZSBkd19oZG1pLXBsdGZtLmMgd2l0aCB0
aGUKPj4gY29tcGF0aWJsZT0ic25wcyxkdy1oZG1pIiAsCj4+ICAgICAgb3IganVzdCBpbmNsdWRl
IHRoZSBjb21wYXRpYmxlIHZhbHVlIGluIGR3X2hkbWktaW14LmMgYW5kCj4+IGR3X2hkbWktcm9j
a2NoaXAuYz8KPiBUaGF0IGNvbW1vbiBjb21wYXRpYmxlIGRvZXNuJ3QgaGF2ZSB0byBiZSB1c2Vk
IGJ5IGFueSBkcml2ZXIuIEl0J3MganVzdAo+IHRoZXJlIHRvIHNob3cgdGhlc2UgYXJlIHRoZSBz
YW1lL3NpbWlsYXIgSVAgY29yZS4KPiBJZiBhIGNvbW1vbiBkcml2ZXIgd2l0aG91dCBhbnkgU29D
IHNwZWNpZmljIGtub3dsZWRnZSBjb3VsZCBiZSB3cml0dGVuLAo+IHRoYXQgb25lIHdvdWxkIG1h
dGNoIGFnYWluc3QgdGhlIGNvbW1vbiBjb21wYXRpYmxlLgo+Cj4gcmVnYXJkcwo+IFBoaWxpcHAK
Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBM
aW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPiBMaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yb2NrY2hpcAo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3Jn
Cmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaXZlcmRldi1kZXZlbAo=

From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v18 0/12] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Sat, 06 Dec 2014 00:31:46 +0800
Message-ID: <5481DDF2.6010700@rock-chips.com>
References: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
 <1417787724.3227.10.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417787724.3227.10.camel@pengutronix.de>
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

SGkgUGhpbGlwcDoKT24gMjAxNOW5tDEy5pyIMDXml6UgMjE6NTUsIFBoaWxpcHAgWmFiZWwgd3Jv
dGU6Cj4gSGkgQW5keSwKPgo+IEFtIEZyZWl0YWcsIGRlbiAwNS4xMi4yMDE0LCAxNDoyMiArMDgw
MCBzY2hyaWViIEFuZHkgWWFuOgo+PiBXZSBmb3VuZCBGcmVlc2NhbGUgaW14NiBhbmQgUm9ja2No
aXAgcmszMjg4IGFuZCBJbmdlbmljIEpaNDc4MCAoWGJ1cnN0L01JUFMpCj4+IHVzZSB0aGUgaW50
ZXJmYWNlIGNvbXBhdGlibGUgRGVzaWdud2FyZSBIRE1JIElQLCBidXQgdGhleSBhbHNvIGhhdmUg
c29tZQo+PiBsaWdodGx5IGRpZmZlcmVuY2VzLCBzdWNoIGFzIHBoeSBwbGwgY29uZmlndXJhdGlv
biwgcmVnaXN0ZXIgd2lkdGgoaW14IGhkbWkKPj4gcmVnaXN0ZXIgaXMgb25lIGJ5dGUsIGJ1dCBy
azMyODggaXMgNCBieXRlcyB3aWR0aCBhbmQgY2FuIG9ubHkgYmUgYWNjZXNzZWQKPj4gYnkgd29y
ZCksIDRLIHN1cHBvcnQoaW14NiBkb2Vzbid0IHN1cHBvcnQgNGssIGJ1dCByazMyODggZG9lcyks
IGFuZCBIRE1JMi4wCj4+IHN1cHBvcnQuCj4+Cj4+IFRvIHJldXNlIHRoZSBpbXgtaGRtaSBkcml2
ZXIsIHdlIG1ha2UgdGhpcyBwYXRjaCBzZXQ6Cj4+ICgxKTogZml4IHNvbWUgQ29kaW5nU3R5bGUg
d2FybmluZyB0byBtYWtlIGNoZWNrcGF0Y2ggaGFwcHkKPj4gKDIpOiBjb252ZXJ0IGlteC1oZG1p
IHRvIGRybV9icmlkZ2UKPj4gKDMpOiBzcGxpdCBwbGF0Zm9ybSBzcGVjaWZpYyBjb2RlCj4+ICg0
KTogbW92ZSBpbXgtaGRtaSB0byBicmlkZ2UvZHdfaGRtaQo+PiAoNSk6IGV4dGVuZCBkd19oZG1p
LmMgdG8gc3VwcG9ydCByazMyODggaGRtaQo+PiAoNik6IGFkZCByb2NrY2hpcCByazMyODggcGxh
dGZvcm0gc3BlY2lmaWMgY29kZSBkd19oZG1pLXJvY2tjaGlwLmMKPj4KPj4gQ2hhbmdlcyBpbiB2
MTg6Cj4+IC0gcmVtb3ZlIGEgbXVsdGlwbGUgYmxhbmsgbGluZXMgaW4gaW14LWhkbWkuYwo+PiAt
IGZpeCBhIGNoZWNrcGF0Y2ggd2FybmluZyBpbiBpbXgtaGRtaV9wbHRmbS5jCj4+IC0gYWRkIHBv
cnQgYmluZGluZ3MKPj4gLSBjb3JyZWN0IHNvbWUgc3BlbGxpbmcgbWlzdGFrZXMgaW4gZHdfaGRt
aSBiaW5kaW5ncyBkb2MKPj4gLSBjb3JyZWN0IHNvbWUgc3BlbGxpbmcgbWlzdGFrZXMgaW4gZHdf
aGRtaS1yb2NrY2hpcCBiaW5kaW5ncyBkb2MKPiBbLi4uXQo+Cj4gSSBhbSBoYXBweSB3aXRoIHRo
ZSBzZXJpZXMgc28gZmFyLiBQZW5kaW5nIEFja3MgZnJvbSB0aGUgZGV2aWNlIHRyZWUKPiBtYWlu
dGFpbmVycyBmb3IgdGhlIG5ldyBiaW5kaW5nIGRvY3VtZW50cywgSSdkIGxpa2UgdG8gYXBwbHkg
ZWl0aGVyIHRoZQo+IHdob2xlIG9mIGl0IG9uIHRvcCBvZgo+ICAgICAgZ2l0Oi8vZ2l0LnBlbmd1
dHJvbml4LmRlL2dpdC9wemEvbGludXguZ2l0IGlteC1kcm0vbmV4dAo+IG9yIHRha2UgYXQgbGVh
c3QgdGhlIGkuTVggc3BlY2lmaWMgcGF0Y2hlcyAoMS01KSBiZWNhdXNlIG9mIHRoZQo+IGRlcGVu
ZGVuY3kgb24gdGhlIGlteC1kcm0gT0YgaGVscGVyIGNvbnZlcnNpb24uCj4KPiByZWdhcmRzCj4g
UGhpbGlwcAo+Cj4KPgo+CiAgSSBhbSB2ZXJ5IGdsYWQgdG8gc2VlIHlvdSBhcmUgaGFwcHkgd2l0
aCB0aGUgcGF0Y2ggc2V0LCBpdCdzIHdvdWxkIGJlIAp2ZXJ5CiAgbmljZSBpZiB5b3UgY2FuIGFw
cGx5IGFsbCBvZiBpdC4KICBUaGFua3MgdmVyeSBtdWNoIGZvciB5b3UgcmV2aWV3LgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcg
bGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhk
cml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=

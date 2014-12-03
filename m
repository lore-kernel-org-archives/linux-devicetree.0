From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v15 06/12] dt-bindings: add document for dw_hdmi
Date: Wed, 03 Dec 2014 19:58:30 +0800
Message-ID: <547EFAE6.9050404@rock-chips.com>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>	
 <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>	
 <1417544629.3411.15.camel@pengutronix.de> <547EDBEE.70700@rock-chips.com>
 <1417607520.5124.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417607520.5124.8.camel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, rmk+kernel@arm.linux.org.uk, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.comLucas Stach <l>
List-Id: devicetree@vger.kernel.org

Ck9uIDIwMTTlubQxMuaciDAz5pelIDE5OjUyLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+IEFtIE1p
dHR3b2NoLCBkZW4gMDMuMTIuMjAxNCwgMTc6NDYgKzA4MDAgc2NocmllYiBBbmR5IFlhbjoKPj4g
T24gMjAxNOW5tDEy5pyIMDPml6UgMDI6MjMsIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4+PiBIaSBB
bmR5LAo+Pj4KPj4+IEFtIERpZW5zdGFnLCBkZW4gMDIuMTIuMjAxNCwgMTU6NDIgKzA4MDAgc2No
cmllYiBBbmR5IFlhbjoKPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2RybS9icmlkZ2UvZHdfaGRtaS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZHJtL2JyaWRnZS9kd19oZG1pLnR4dAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMC4uMTA3YzFjYQo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZHJtL2JyaWRnZS9kd19oZG1p
LnR4dAo+Pj4+IEBAIC0wLDAgKzEsNDAgQEAKPj4+PiArRGVzaWduV2FyZSBIRE1JIGJyaWRnZSBi
aW5kaW5ncwo+Pj4+ICsKPj4+PiArUmVxdWlyZWQgcHJvcGVyaXRpZXM6Cj4+Pj4gKy0gY29tcGF0
aWJsZTogcGxhdGZvcm0gc3BlY2lmaWMgc3VjaCBhczoKPj4+PiArICAgKiAiZnNsLGlteDZxLWhk
bWkiCj4+Pj4gKyAgICogImZzbCxpbXg2ZGwtaGRtaSIKPj4+PiArICAgKiAicm9ja2NoaXAscmsz
Mjg4LWR3LWhkbWkiCj4+PiBJIHRoaW5rIHdlIHNob3VsZCBhZGQgYSBjb21tb24gY29tcGF0aWJs
ZSB2YWx1ZSAic25wcyxkdy1oZG1pLXR4IiBoZXJlOgo+Pj4KPj4+IAljb21wYXRpYmxlID0gImZz
bCxpbXg2cS1oZG1pIiwgInNucHMsZHctaGRtaS10eCI7Cj4+Pgo+Pj4+ICstIHJlZzogUGh5c2lj
YWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGNvbnRyb2xsZXIncyByZWdpc3RlcnMu
Cj4+Pj4gKy0gZGRjLWkyYy1idXM6IHBoYW5kbGUgb2YgYW4gSTJDIGNvbnRyb2xsZXIgdXNlZCBm
b3IgRERDIEVESUQgcHJvYmluZwo+Pj4gQmV0dGVyIG1ha2UgZGRjLWkyYy1idXMgb3B0aW9uYWws
IHNlZSB0aGUgb3RoZXIgdGhyZWFkIGFib3V0IHRoZSBkZGMgaTJjCj4+PiBtYXN0ZXIuCj4+ICAg
ICAgIEkgaGF2ZSB0aGUgc2FtZSBpZGVhIHRvbywgYnV0IHRoZSBwYXRjaCBhYm91dCBkZGMgaTJj
IG1hc3RlciBoYXMgbm90Cj4+ICAgIGxhbmRlZCB5ZXQsICBjYW4gd2UgY2hhbmdlIHRoZSBkZGMt
aTJjLWJ1cyB0byBvcHRpb25hbCAgYWZ0ZXIgdGhlIGRkYwo+PiBpMmMgbWFzdGVyCj4+ICAgIHBh
dGNoIGxhbmQ/Cj4gQ2hlY2sgb3V0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
cm0vaW14L2hkbWkudHh0LCBpdCB3YXMKPiBhbHJlYWR5IG1hcmtlZCBhcyBvcHRpb25hbC4gV2Ug
Y2FuJ3QgbWFrZSBpdCByZXF1aXJlZCBub3cuCj4KPiByZWdhcmRzCj4gUGhpbGlwcAo+Cj4KPgog
ICBPSywgZ290IGl0LCB0aGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qu
b3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaXZlcmRldi1kZXZlbAo=

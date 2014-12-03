From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v15 12/12] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Wed, 03 Dec 2014 21:20:06 +0800
Message-ID: <547F0E06.5040106@rock-chips.com>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>			
 <1417506327-18908-1-git-send-email-andy.yan@rock-chips.com>		
 <1417515882.3411.8.camel@pengutronix.de> <547DB1ED.7000409@rock-chips.com>	
 <1417525257.3411.12.camel@pengutronix.de> <547F02CF.9010804@rock-chips.com>
 <1417612197.5124.12.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417612197.5124.12.camel@pengutronix.de>
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

SGkgUGhpbGlwcDoKT24gMjAxNOW5tDEy5pyIMDPml6UgMjE6MDksIFBoaWxpcHAgWmFiZWwgd3Jv
dGU6Cj4gSGkgQW5keSwKPgo+IEFtIE1pdHR3b2NoLCBkZW4gMDMuMTIuMjAxNCwgMjA6MzIgKzA4
MDAgc2NocmllYiBBbmR5IFlhbjoKPj4+IE15IHF1ZXN0aW9uIGlzIG5vdCBhYm91dCB0aGUgYXZh
aWxhYmxlIGdhdGVzIGF0IHRoZSBTb0MgbGV2ZWwsIGJ1dCBhYm91dAo+Pj4gdGhlIGFjdHVhbCBj
bG9jayBpbnB1dHMgZnJvbSBwb2ludCBvZiB2aWV3IG9mIHRoZSBIRE1JIFRYIElQLgo+Pj4KPj4+
IEl0IGNvdWxkIGJlIHRoYXQgdGhlIGhkbWlfY3RybF9jbGsgZ2F0ZXMgYWxsIGlucHV0cyB0byB0
aGUgbW9kdWxlIGFuZAo+Pj4gYnVzIGNsb2NrcyB0b2dldGhlci4gSWYgc28sIHlvdSBjb3VsZCBq
dXN0IHJldXNlICJpc2ZyIiBhbmQgImlhaGIiIGFuZAo+Pj4gc2V0IGl0IHRvIHRoZSBzYW1lIGNs
b2NrLiBJZiBub3QsIHdlJ2QgbmVlZCB0byB0aGluayBvZiBzb21ldGhpbmcgZWxzZS4KPj4+IFVu
Zm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIGFueSBTeW5vcHN5cyBkb2N1bWVudGF0aW9uIG9mIHRo
ZSBIRE1JIFRYIGF0Cj4+PiB0aGF0IGxldmVsLgo+PiAgICAgIEFmdGVyIGNvbmZpcm1pbmcgd2l0
aCB0aGUgSUMgZGVzaWduZXIsIHdlIGZpbmFsbHkgbWFrZSBjbGVhciB0aGF0Cj4+ICAgICAgUm9j
a2NoaXAgUkszMjg4IGFsbW9zdCB1c2UgdGhlIHNhbWUgY2xvY2sgZGVzaWduIHdpdGggaW14Ogo+
PiAgICAgIGNsay0tLS0taWFoYmNsaywgdXNlZCBmb3IgaGRtaSBtb2R1bGUgYW5kIGJ1cwo+PiAg
ICAgIGhkY3BfY2xrLS0tLS1pc2ZyY2xrLCB1c2VkIGZvciBoZGNwIGFuZCBpMmNtCj4+ICAgICAg
Y2VjY2xrIC0tLS0tY2VjY2xrLCBidXQgdGhpcyBjbGsgY2FuIGJlIGdhdGVkIG9uIHJvY2tjaGlw
LCB0aGlzIGlzCj4+IGRpZmZlcmVudCB3aXRoIGlteCwKPj4gICAgICBidXQgd2UgZG9uJ3QgaGFu
ZGxlIHRoZSBjZWMgc3R1ZmYgbm93LiBTbyBpIHdpbGwgdHJ5IHRvIHJldXNlIHRoZQo+PiBpbXgg
Y2xrIGJpbmRzLiBkbyB5b3UKPj4gICAgIHRoaW5rIHRoYXQgaXMgb2s/Cj4gVGhhbmsgeW91IGZv
ciB0YWtpbmcgdGhlIHRpbWUgdG8gdmVyaWZ5IHRoaXMuIFNvIHdlIHNob3VsZCBtb3ZlIHRoZQo+
IGNsb2NrIGhhbmRsaW5nIG91dCBvZiB0aGUgc29jIHNwZWNpZmljIHBhcnRzIGludG8gdGhlIGNv
bW1vbiBkcml2ZXIgYW5kCj4gcmV1c2UgdGhlIGV4aXN0aW5nIGNsb2NrIGJpbmRpbmdzICgiaWFo
YiIsICJpc2ZyIikuCj4gSSdkIHN1Z2dlc3QgdG8gYWRkIHRoZSAiY2VjIiBjbG9jayBub3cgdG8g
dGhlIGJpbmRpbmcgZG9jdW1lbnQgYXMgYW4KPiBvcHRpb25hbCBjbG9jaywgdGhlbiB5b3UgY2Fu
IGFscmVhZHkgc3BlY2lmeSBpdCBpbiB0aGUgcm9ja2NoaXAgZHRzaS4KICAgb2sKPgo+IHJlZ2Fy
ZHMKPiBQaGlsaXBwCj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9y
ZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcml2ZXJkZXYtZGV2ZWwK

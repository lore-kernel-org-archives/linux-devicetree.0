From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v15 06/12] dt-bindings: add document for dw_hdmi
Date: Wed, 03 Dec 2014 12:52:00 +0100
Message-ID: <1417607520.5124.8.camel@pengutronix.de>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>
 <1417544629.3411.15.camel@pengutronix.de> <547EDBEE.70700@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <547EDBEE.70700@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, rmk+kernel@arm.linux.org.uk, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.comLucas Stach <l>
List-Id: devicetree@vger.kernel.org

QW0gTWl0dHdvY2gsIGRlbiAwMy4xMi4yMDE0LCAxNzo0NiArMDgwMCBzY2hyaWViIEFuZHkgWWFu
Ogo+IE9uIDIwMTTlubQxMuaciDAz5pelIDAyOjIzLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+ID4g
SGkgQW5keSwKPiA+Cj4gPiBBbSBEaWVuc3RhZywgZGVuIDAyLjEyLjIwMTQsIDE1OjQyICswODAw
IHNjaHJpZWIgQW5keSBZYW46Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kcm0vYnJpZGdlL2R3X2hkbWkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2RybS9icmlkZ2UvZHdfaGRtaS50eHQKPiA+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4+IGluZGV4IDAwMDAwMDAuLjEwN2MxY2EKPiA+PiAtLS0gL2Rldi9udWxsCj4g
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RybS9icmlkZ2UvZHdf
aGRtaS50eHQKPiA+PiBAQCAtMCwwICsxLDQwIEBACj4gPj4gK0Rlc2lnbldhcmUgSERNSSBicmlk
Z2UgYmluZGluZ3MKPiA+PiArCj4gPj4gK1JlcXVpcmVkIHByb3Blcml0aWVzOgo+ID4+ICstIGNv
bXBhdGlibGU6IHBsYXRmb3JtIHNwZWNpZmljIHN1Y2ggYXM6Cj4gPj4gKyAgICogImZzbCxpbXg2
cS1oZG1pIgo+ID4+ICsgICAqICJmc2wsaW14NmRsLWhkbWkiCj4gPj4gKyAgICogInJvY2tjaGlw
LHJrMzI4OC1kdy1oZG1pIgo+ID4gSSB0aGluayB3ZSBzaG91bGQgYWRkIGEgY29tbW9uIGNvbXBh
dGlibGUgdmFsdWUgInNucHMsZHctaGRtaS10eCIgaGVyZToKPiA+Cj4gPiAJY29tcGF0aWJsZSA9
ICJmc2wsaW14NnEtaGRtaSIsICJzbnBzLGR3LWhkbWktdHgiOwo+ID4KPiA+PiArLSByZWc6IFBo
eXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0
ZXJzLgo+ID4+ICstIGRkYy1pMmMtYnVzOiBwaGFuZGxlIG9mIGFuIEkyQyBjb250cm9sbGVyIHVz
ZWQgZm9yIEREQyBFRElEIHByb2JpbmcKPiA+IEJldHRlciBtYWtlIGRkYy1pMmMtYnVzIG9wdGlv
bmFsLCBzZWUgdGhlIG90aGVyIHRocmVhZCBhYm91dCB0aGUgZGRjIGkyYwo+ID4gbWFzdGVyLgo+
ICAgICAgSSBoYXZlIHRoZSBzYW1lIGlkZWEgdG9vLCBidXQgdGhlIHBhdGNoIGFib3V0IGRkYyBp
MmMgbWFzdGVyIGhhcyBub3QKPiAgIGxhbmRlZCB5ZXQsICBjYW4gd2UgY2hhbmdlIHRoZSBkZGMt
aTJjLWJ1cyB0byBvcHRpb25hbCAgYWZ0ZXIgdGhlIGRkYyAKPiBpMmMgbWFzdGVyCj4gICBwYXRj
aCBsYW5kPwoKQ2hlY2sgb3V0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kcm0v
aW14L2hkbWkudHh0LCBpdCB3YXMKYWxyZWFkeSBtYXJrZWQgYXMgb3B0aW9uYWwuIFdlIGNhbid0
IG1ha2UgaXQgcmVxdWlyZWQgbm93LgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxA
bGludXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK

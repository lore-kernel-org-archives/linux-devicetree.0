From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v12 0/11] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Mon, 24 Nov 2014 22:35:44 +0800
Message-ID: <54734240.8070402@rock-chips.com>
References: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>
 <1416221635-12797-1-git-send-email-andy.yan@rock-chips.com>
 <54733DF3.7020609@rock-chips.com> <54733F34.5080405@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <54733F34.5080405@imgtec.com>
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

SGkgWnViYWlyTEs6Ck9uIDIwMTTlubQxMeaciDI05pelIDIyOjIyLCBadWJhaXIgTHV0ZnVsbGFo
IEtha2FraGVsIHdyb3RlOgo+IEhpIEFuZHksCj4KPiBPbiAyNC8xMS8xNCAxNDoxNywgQW5keSBZ
YW4gd3JvdGU6Cj4+IEhpIFp1YmFpckxLLCBSdXNzZWwgS2luZywgR3JlZyBLcm9haC1IYXJ0bWFu
ICwgUGhpbGlwcCBaYWJlbCBhbmQgRGFuaWVsOgo+PiAgICAgRG8geW91IGhhdmUgYW55IGZ1cnRo
ZXIgb3BpbmlvbnMgb3Igc3VnZ2VzdGlvbnMgYWJvdXQgdGhlCj4+IHRoZSBjdXJyZW50IHBhdGNo
IHNldD8KPiBJIGhhdmUgcmV2aWV3ZWQgdGhlIHBhdGNoZXMgYXMgbXVjaCBhcyBJIGNvdWxkLgo+
Cj4gVGhleSBsb29rIGdvb2QgdG8gbWUuCj4KPiBCdXQgSSBkb24ndCBrbm93IHRoZSBpbm5lciBk
ZXRhaWxzIG9mIERSTSB0byBiZSBhYmxlIHRvIGNvbW1lbnQgZnVydGhlci4KPgo+IFBsZWFzZSBk
byBjYyBtZSBpbiBmdXJ0aGVyIHBhdGNoZXMuCgogIFRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdXIg
Y2FyZWZ1bGx5IHJldmlldyB3b3JrLgogIEFuZCBpZiB5b3UgaGF2ZSBmdXJ0aGVyIGlkZWFzICwg
cGxlYXNlIGxldCBtZSBrbm93Lgo+Cj4gQWxzbywgbXkgbWFpbCBjbGllbnQgbWFrZXMgdGhlc2Ug
cGF0Y2hlcyBsb29rIGxpa2UgdGhlIG5ldyBzZXJpZXMgZ2V0cyBjYXNjYWRlZCBpbiB0aGUgb2xk
ZXIgcGF0Y2ggOCBzZXJpZXMuCj4KPiBJdCBjb3VsZCBiZSBqdXN0IG15IHRodW5kZXJiaXJkLiBC
dXQgcGxlYXNlIHN0YXJ0IGEgbmV3IHRocmVhZCB3aGVuIHlvdSBzZW5kIGEgbmV3IHNlcmllcy4K
CiAgICBJIGRvIHRoZXNlIGJ5IHRha2luZyBSdXNzZWxsIEtpbmcncyBhZHZpY2UgaW4gUEFUQ0gj
MTAodXNlIHRoZSBzYW1lIApyZWZlcmVuY2UgbWVzc2FnZSBpZCkuCgo+Cj4gVGhhbmsteW91Cj4g
WnViYWlyTEsKPgo+PiBPbiAyMDE05bm0MTHmnIgxN+aXpSAxODo1MywgQW5keSBZYW4gd3JvdGU6
Cj4+PiBXZSBmb3VuZCBGcmVlc2NhbGUgaW14NiBhbmQgUm9ja2NoaXAgcmszMjg4IGFuZCBJbmdl
bmljIEpaNDc4MCAoWGJ1cnN0L01JUFMpCj4+PiB1c2UgdGhlIGludGVyZmFjZSBjb21wYXRpYmxl
IERlc2lnbndhcmUgSERNSSBJUCwgYnV0IHRoZXkgYWxzbyBoYXZlIHNvbWUKPj4+IGxpZ2h0bHkg
ZGlmZmVyZW5jZXMsIHN1Y2ggYXMgcGh5IHBsbCBjb25maWd1cmF0aW9uLCByZWdpc3RlciB3aWR0
aChpbXggaGRtaQo+Pj4gcmVnaXN0ZXIgaXMgb25lIGJ5dGUsIGJ1dCByazMyODggaXMgNCBieXRl
cyB3aWR0aCBhbmQgY2FuIG9ubHkgYmUgYWNjZXNzZWQKPj4+IGJ5IHdvcmQpLCA0SyBzdXBwb3J0
KGlteDYgZG9lc24ndCBzdXBwb3J0IDRrLCBidXQgcmszMjg4IGRvZXMpLCBhbmQgSERNSTIuMAo+
Pj4gc3VwcG9ydC4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+IExpbnV4LXJvY2tjaGlwQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJvY2tjaGlwCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5v
cmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpdmVyZGV2LWRldmVsCg==

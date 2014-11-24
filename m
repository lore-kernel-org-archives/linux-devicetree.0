From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v12 0/11] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Mon, 24 Nov 2014 14:22:44 +0000
Message-ID: <54733F34.5080405@imgtec.com>
References: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>
 <1416221635-12797-1-git-send-email-andy.yan@rock-chips.com>
 <54733DF3.7020609@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <54733DF3.7020609@rock-chips.com>
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

SGkgQW5keSwKCk9uIDI0LzExLzE0IDE0OjE3LCBBbmR5IFlhbiB3cm90ZToKPiBIaSBadWJhaXJM
SywgUnVzc2VsIEtpbmcsIEdyZWcgS3JvYWgtSGFydG1hbiAsIFBoaWxpcHAgWmFiZWwgYW5kIERh
bmllbDoKPiAgICBEbyB5b3UgaGF2ZSBhbnkgZnVydGhlciBvcGluaW9ucyBvciBzdWdnZXN0aW9u
cyBhYm91dCB0aGUKPiB0aGUgY3VycmVudCBwYXRjaCBzZXQ/CgpJIGhhdmUgcmV2aWV3ZWQgdGhl
IHBhdGNoZXMgYXMgbXVjaCBhcyBJIGNvdWxkLgoKVGhleSBsb29rIGdvb2QgdG8gbWUuCgpCdXQg
SSBkb24ndCBrbm93IHRoZSBpbm5lciBkZXRhaWxzIG9mIERSTSB0byBiZSBhYmxlIHRvIGNvbW1l
bnQgZnVydGhlci4KClBsZWFzZSBkbyBjYyBtZSBpbiBmdXJ0aGVyIHBhdGNoZXMuCgpBbHNvLCBt
eSBtYWlsIGNsaWVudCBtYWtlcyB0aGVzZSBwYXRjaGVzIGxvb2sgbGlrZSB0aGUgbmV3IHNlcmll
cyBnZXRzIGNhc2NhZGVkIGluIHRoZSBvbGRlciBwYXRjaCA4IHNlcmllcy4KCkl0IGNvdWxkIGJl
IGp1c3QgbXkgdGh1bmRlcmJpcmQuIEJ1dCBwbGVhc2Ugc3RhcnQgYSBuZXcgdGhyZWFkIHdoZW4g
eW91IHNlbmQgYSBuZXcgc2VyaWVzLgoKVGhhbmsteW91Clp1YmFpckxLCgo+IE9uIDIwMTTlubQx
MeaciDE35pelIDE4OjUzLCBBbmR5IFlhbiB3cm90ZToKPj4gV2UgZm91bmQgRnJlZXNjYWxlIGlt
eDYgYW5kIFJvY2tjaGlwIHJrMzI4OCBhbmQgSW5nZW5pYyBKWjQ3ODAgKFhidXJzdC9NSVBTKQo+
PiB1c2UgdGhlIGludGVyZmFjZSBjb21wYXRpYmxlIERlc2lnbndhcmUgSERNSSBJUCwgYnV0IHRo
ZXkgYWxzbyBoYXZlIHNvbWUKPj4gbGlnaHRseSBkaWZmZXJlbmNlcywgc3VjaCBhcyBwaHkgcGxs
IGNvbmZpZ3VyYXRpb24sIHJlZ2lzdGVyIHdpZHRoKGlteCBoZG1pCj4+IHJlZ2lzdGVyIGlzIG9u
ZSBieXRlLCBidXQgcmszMjg4IGlzIDQgYnl0ZXMgd2lkdGggYW5kIGNhbiBvbmx5IGJlIGFjY2Vz
c2VkCj4+IGJ5IHdvcmQpLCA0SyBzdXBwb3J0KGlteDYgZG9lc24ndCBzdXBwb3J0IDRrLCBidXQg
cmszMjg4IGRvZXMpLCBhbmQgSERNSTIuMAo+PiBzdXBwb3J0LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGlu
dXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK

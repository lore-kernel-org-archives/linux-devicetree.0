From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Wed, 3 Dec 2014 16:33:18 +0000
Message-ID: <20141203163318.GH11285@n2100.arm.linux.org.uk>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <20141203161122.GF11285@n2100.arm.linux.org.uk>
 <547F3A9F.30701@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <547F3A9F.30701@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgMDQsIDIwMTQgYXQgMTI6MzA6MjNBTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6
Cj4gCj4gT24gMjAxNOW5tDEy5pyIMDTml6UgMDA6MTEsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eCB3cm90ZToKPiA+SSBtZWFudCB0aGF0IGlteF9oZG1pX2JpbmQgc2hvdWxkIGJlIHBhc3NlZCB0
aGVzZSwgc28gdGhhdCBpdCBuZWVkcyB0bwo+ID5rbm93IG5vdGhpbmcgYWJvdXQgdGhlIHN0cnVj
dCBkZXZpY2UgYmV5b25kIHRoZSBnZW5lcmljIGRldmljZSBzdHJ1Y3R1cmUuCj4gPkluIG90aGVy
IHdvcmRzLCB0aGUgZHctaGRtaSBjb3JlIHNob3VsZCBub3QgYXNzdW1lIHRoYXQgdGhlIHN0cnVj
dCBkZXZpY2UKPiA+aXMgcGFydCBvZiBhIHBsYXRmb3JtIGRldmljZS4KPiA+Cj4gICAgaWYgc28s
IGhvdyBhYm91dCB0aGUgZGV2aWNlIHRyZWUgcHJvcGVydGllcyAgZGRjLWkyYy1idXMsIHJlZy1p
by13aWR0aCwKPiBpYWhiLCBpc2ZyLAo+ICAgdGhleSBhcmUgYWxsIGZvdW5kIGJ5IGRldmljZT8K
CklmIHRoZSBkZXZpY2UgaGFzIGEgZGV2aWNlIHRyZWUgbm9kZSBhc3NvY2lhdGVkIHdpdGggaXQs
IGl0IHdpbGwgaGF2ZSBhCm5vbi1OVUxMIGRldi0+b2Zfbm9kZSAtIHdoaWNoIGlzIHBhcnQgb2Yg
dGhlIGdlbmVyaWMgZGV2aWNlIHN0cnVjdHVyZS4KCi0tIApGVFRDIGJyb2FkYmFuZCBmb3IgMC44
bWlsZSBsaW5lOiBjdXJyZW50bHkgYXQgOS41TWJwcyBkb3duIDQwMGticHMgdXAKYWNjb3JkaW5n
IHRvIHNwZWVkdGVzdC5uZXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3Jn
Cmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaXZlcmRldi1kZXZlbAo=

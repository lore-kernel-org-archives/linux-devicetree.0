From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Thu, 04 Dec 2014 00:56:24 +0800
Message-ID: <547F40B8.6060706@rock-chips.com>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
 <20141203153847.GC11285@n2100.arm.linux.org.uk>
 <547F3495.9070206@rock-chips.com>
 <20141203161122.GF11285@n2100.arm.linux.org.uk>
 <547F3A9F.30701@rock-chips.com>
 <20141203163318.GH11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141203163318.GH11285@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

SGkgUnVzc2VsbDoKT24gMjAxNOW5tDEy5pyIMDTml6UgMDA6MzMsIFJ1c3NlbGwgS2luZyAtIEFS
TSBMaW51eCB3cm90ZToKPiBPbiBUaHUsIERlYyAwNCwgMjAxNCBhdCAxMjozMDoyM0FNICswODAw
LCBBbmR5IFlhbiB3cm90ZToKPj4gT24gMjAxNOW5tDEy5pyIMDTml6UgMDA6MTEsIFJ1c3NlbGwg
S2luZyAtIEFSTSBMaW51eCB3cm90ZToKPj4+IEkgbWVhbnQgdGhhdCBpbXhfaGRtaV9iaW5kIHNo
b3VsZCBiZSBwYXNzZWQgdGhlc2UsIHNvIHRoYXQgaXQgbmVlZHMgdG8KPj4+IGtub3cgbm90aGlu
ZyBhYm91dCB0aGUgc3RydWN0IGRldmljZSBiZXlvbmQgdGhlIGdlbmVyaWMgZGV2aWNlIHN0cnVj
dHVyZS4KPj4+IEluIG90aGVyIHdvcmRzLCB0aGUgZHctaGRtaSBjb3JlIHNob3VsZCBub3QgYXNz
dW1lIHRoYXQgdGhlIHN0cnVjdCBkZXZpY2UKPj4+IGlzIHBhcnQgb2YgYSBwbGF0Zm9ybSBkZXZp
Y2UuCj4+Pgo+PiAgICAgaWYgc28sIGhvdyBhYm91dCB0aGUgZGV2aWNlIHRyZWUgcHJvcGVydGll
cyAgZGRjLWkyYy1idXMsIHJlZy1pby13aWR0aCwKPj4gaWFoYiwgaXNmciwKPj4gICAgdGhleSBh
cmUgYWxsIGZvdW5kIGJ5IGRldmljZT8KPiBJZiB0aGUgZGV2aWNlIGhhcyBhIGRldmljZSB0cmVl
IG5vZGUgYXNzb2NpYXRlZCB3aXRoIGl0LCBpdCB3aWxsIGhhdmUgYQo+IG5vbi1OVUxMIGRldi0+
b2Zfbm9kZSAtIHdoaWNoIGlzIHBhcnQgb2YgdGhlIGdlbmVyaWMgZGV2aWNlIHN0cnVjdHVyZS4K
PgogICBzbyAsIEkganVzdCBuZWVkIGdldCB0aGUgcmVzb3VyY2UgYW5kIGlycSBudW1iZXIgaW4g
dGhlIApkd19oZG1pLWlteC9yb2NrY2hpcCAsdGhhbgogICBwYXNzIHRoZW0gdG8gaW14X2hkbWlf
YmluZCwgYXMgdGhlIHByb3BlcnRpZXMgZGRjLWkyYy1idXMsIApyZWctaW8td2lkdGgsIGlhaGIs
aXNmciwgdGhleQogICBhcmUgc3RpbGwgY2FuIGJlIGhhbmRsZWQgaW4gaW14X2hkbWlfYmluZCA/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZlbCBt
YWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2
LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK

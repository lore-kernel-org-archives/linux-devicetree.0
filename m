From: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v16 05/12] drm: imx: imx-hdmi: move imx-hdmi to
 bridge/dw_hdmi
Date: Thu, 04 Dec 2014 00:01:25 +0800
Message-ID: <547F33D5.2000905@rock-chips.com>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620732-30593-1-git-send-email-andy.yan@rock-chips.com>
 <20141203154503.GD11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141203154503.GD11285@n2100.arm.linux.org.uk>
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

SGkgUnVzc2VsbDoKCk9uIDIwMTTlubQxMuaciDAz5pelIDIzOjQ1LCBSdXNzZWxsIEtpbmcgLSBB
Uk0gTGludXggd3JvdGU6Cj4gT24gV2VkLCBEZWMgMDMsIDIwMTQgYXQgMTE6MzI6MTJQTSArMDgw
MCwgQW5keSBZYW4gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPj4gaW5kZXggODg0OTIz
Zi4uMjYxNjJlZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmln
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+PiBAQCAtMywzICszLDgg
QEAgY29uZmlnIERSTV9QVE4zNDYwCj4+ICAgCWRlcGVuZHMgb24gRFJNCj4+ICAgCXNlbGVjdCBE
Uk1fS01TX0hFTFBFUgo+PiAgIAktLS1oZWxwLS0tCj4+ICsKPj4gK2NvbmZpZyBEUk1fRFdfSERN
SQo+PiArCWJvb2wgIlN5bm9wc3lzIERlc2lnbldhcmUgSGlnaC1EZWZpbml0aW9uIE11bHRpbWVk
aWEgSW50ZXJmYWNlIgo+PiArCWRlcGVuZHMgb24gRFJNCj4+ICsJc2VsZWN0IERSTV9LTVNfSEVM
UEVSCj4gLi4uCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L0tjb25maWcKPj4gaW5kZXggODJmYjc1OC4uNzA3MDA3NyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pbXgvS2NvbmZpZwo+PiBAQCAtNDgsNiArNDgsNyBAQCBjb25maWcgRFJNX0lNWF9J
UFVWMwo+PiAgIAo+PiAgIGNvbmZpZyBEUk1fSU1YX0hETUkKPj4gICAJdHJpc3RhdGUgIkZyZWVz
Y2FsZSBpLk1YIERSTSBIRE1JIgo+PiArCXNlbGVjdCBEUk1fRFdfSERNSQo+PiAgIAlkZXBlbmRz
IG9uIERSTV9JTVgKPj4gICAJaGVscAo+PiAgIAkgIENob29zZSB0aGlzIGlmIHlvdSB3YW50IHRv
IHVzZSBIRE1JIG9uIGkuTVg2Lgo+IEknZCByZWNvbW1lbmQgdGhhdCBpZiB5b3Ugd2FudCB0byBz
ZWxlY3QgRFJNX0RXX0hETUksIHRoZW4gZG9uJ3QgZ2l2ZQo+IERSTV9EV19IRE1JIGEgcHJvbXB0
IG1lc3NhZ2UuICBJIGFzc3VtZSB5b3UncmUgZ29pbmcgdG8gZG8gc29tZXRoaW5nCj4gc2ltaWxh
ciB3aXRoIHlvdXIgUm9ja2NoaXAgZHJpdmVyIHRvbyAtIGluIHdoaWNoIGNhc2UgRFJNX0RXX0hE
TUkgaXMKPiByZWFsbHkgYWJvdXQgYnVpbGRpbmcgYSBsaWJyYXJ5IG1vZHVsZS4KICAgRG8geW91
IG1lYW4gSSBqdXN0IG5lZXQgdG8gZG8gbGlrZSBiZWxsb3c/CgorCitjb25maWcgRFJNX0RXX0hE
TUkKKwlib29sCisJZGVwZW5kcyBvbiBEUk0KKwlzZWxlY3QgRFJNX0tNU19IRUxQRVIKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51
eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==

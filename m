From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH v7 5/7] drm: bridge/dw-hdmi: add support for multi byte
 register width access
Date: Tue, 11 Nov 2014 14:48:02 +0000
Message-ID: <546221A2.30706@imgtec.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
 <1415710432-12167-1-git-send-email-andy.yan@rock-chips.com>
 <54621B23.1020602@imgtec.com> <5462214F.4010504@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5462214F.4010504@rock-chips.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, ykk@rock-chips.com, Grant Likely <grant.likely@linaro.org>, djkurtz@google.com, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

CgpPbiAxMS8xMS8xNCAxNDo0NiwgQW5keSBZYW4gd3JvdGU6Cj4gCj4gT24gMjAxNOW5tDEx5pyI
MTHml6UgMjI6MjAsIFp1YmFpciBMdXRmdWxsYWggS2FrYWtoZWwgd3JvdGU6Cj4+IEhpIEFuZHks
Cj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgcmVnLWlvLXdpZHRoIGJpbmRpbmcuCj4+Cj4+IEhl
bmNlIHRoZSBiaW5kaW5nIHBhdGNoIHNob3VsZCBjb21lIGJlZm9yZSBpdC4KPj4KPiAgICBkbyB5
b3UgbWVhbiB0aGF0IEkgc2hvdWxkIHB1dCBkdHMgYmluZGluZyBwYXRjaAo+ICAgIGJlZm9yZSB0
aGlzIHBhdGNoPwoKWWVzLiBUaGUgcGF0Y2ggYWRkaW5nIHRoZSBiaW5kaW5nIHRvIHRoZSBEb2N1
bWVudGF0aW9uIGZvbGRlciBjb21lcwpiZWZvcmUgdGhlIGRyaXZlciBpbXBsZW1lbnRpbmcgdGhl
IGJpbmRpbmcuCgpadWJhaXJMSwoKPj4gT24gMTEvMTEvMTQgMTI6NTMsIEFuZHkgWWFuIHdyb3Rl
Ogo+Pj4gT24gcm9ja2NoaXAgcmszMjg4LCBvbmx5IHdvcmQoMzItYml0KSBhY2Nlc3NlcyBhcmUK
Pj4+IHBlcm1pdHRlZCBmb3IgaGRtaSByZWdpc3RlcnMuICBCeXRlIHdpZHRoIGFjY2Vzc2VzICh3
cml0ZWIsCj4+PiByZWFkYikgZ2VuZXJhdGUgYW4gaW1wcmVjaXNlIGV4dGVybmFsIGFib3J0Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWls
aW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2Lmxp
bnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK

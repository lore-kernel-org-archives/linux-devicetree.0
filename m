From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v7 5/6] drm: sun4i: Add support for enabling
 DDC I2C bus to sun8i_dw_hdmi glue
Date: Thu, 20 Jun 2019 17:47:29 +0200
Message-ID: <3014360.88acaTKTIR@jernej-laptop>
References: <20190620134748.17866-1-megous@megous.com>
 <20190620134748.17866-6-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190620134748.17866-6-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi@googlegroups.com, megous@megous.com
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
List-Id: devicetree@vger.kernel.org

RG5lIMSNZXRydGVrLCAyMC4ganVuaWogMjAxOSBvYiAxNTo0Nzo0NyBDRVNUIGplIG1lZ291cyB2
aWEgbGludXgtc3VueGkgCm5hcGlzYWwoYSk6Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3Vz
QG1lZ291cy5jb20+Cj4gCj4gT3JhbmdlIFBpIDMgYm9hcmQgcmVxdWlyZXMgZW5hYmxpbmcgYSB2
b2x0YWdlIHNoaWZ0aW5nIGNpcmN1aXQgdmlhIEdQSU8KPiBmb3IgdGhlIEREQyBidXMgdG8gYmUg
dXNhYmxlLgo+IAo+IEFkZCBzdXBwb3J0IGZvciBoZG1pLWNvbm5lY3RvciBub2RlJ3Mgb3B0aW9u
YWwgZGRjLWVuLWdwaW9zIHByb3BlcnR5IHRvCj4gc3VwcG9ydCB0aGlzIHVzZSBjYXNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgoKUmV2aWV3
ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KCkJlc3QgcmVn
YXJkcywKSmVybmVqCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK

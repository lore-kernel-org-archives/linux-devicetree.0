From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/3] drm: convert DT component matching to
 component_match_add_release()
Date: Fri, 03 Jun 2016 17:10:32 +0200
Message-ID: <1464966632.32235.4.camel@pengutronix.de>
References: <20160603141548.GC1041@n2100.armlinux.org.uk>
 <E1b8pyX-0005OP-2s@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <E1b8pyX-0005OP-2s@rmk-PC.armlinux.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDAzLjA2LjIwMTYsIDE1OjIxICswMTAwIHNjaHJpZWIgUnVzc2VsbCBL
aW5nOgo+IENvbnZlcnQgRFQgY29tcG9uZW50IG1hdGNoaW5nIHRvIHVzZSBjb21wb25lbnRfbWF0
Y2hfYWRkX3JlbGVhc2UoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPHJtaytr
ZXJuZWxAYXJtbGludXgub3JnLnVrPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNk
X2Rydi5jICAgICAgICAgICAgIHwgIDkgKysrLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm1h
ZGEvYXJtYWRhX2Rydi5jICAgICAgICAgfCAgOCArKy0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX29mLmMgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgICAgICAgfCAxMSArKy0tLS0tLS0tLQoKRm9yIHRoZSBl
dG5hdml2IHBhcnQ6CgpBY2tlZC1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXgu
ZGU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

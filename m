From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] drm/panel: lhr050h41_init[] can be static
Date: Wed, 21 Feb 2018 23:05:29 +0800
Message-ID: <20180221150529.GA934@lkp-wsm-ep2>
References: <33efcb267bc513bb19551f1ffdcf578ebfb90369.1519204731.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <33efcb267bc513bb19551f1ffdcf578ebfb90369.1519204731.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, kbuild-all@01.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CkZpeGVzOiBkY2ZhYzNiNjhkZmIgKCJkcm0vcGFuZWw6IEFkZCBIdWFydWkgTEhSMDUwSDQxIHBh
bmVsIGRyaXZlciIpClNpZ25lZC1vZmYtYnk6IEZlbmdndWFuZyBXdSA8ZmVuZ2d1YW5nLnd1QGlu
dGVsLmNvbT4KLS0tCiBwYW5lbC1odWFydWktbGhyMDUwaDQxLmMgfCAgICAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaHVhcnVpLWxocjA1MGg0MS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWh1YXJ1aS1saHIwNTBoNDEuYwppbmRleCBmNzNkNDg0Li5mNzEwMzBl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaHVhcnVpLWxocjA1MGg0
MS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1odWFydWktbGhyMDUwaDQxLmMK
QEAgLTY2LDcgKzY2LDcgQEAgc3RydWN0IGxocjA1MGg0MV9pbnN0ciB7CiAJCX0sCQkJCQlcCiAJ
fQogCi1zdHJ1Y3QgbGhyMDUwaDQxX2luc3RyIGxocjA1MGg0MV9pbml0W10gPSB7CitzdGF0aWMg
c3RydWN0IGxocjA1MGg0MV9pbnN0ciBsaHIwNTBoNDFfaW5pdFtdID0gewogCUxIUjA1MEg0MV9T
V0lUQ0hfUEFHRV9JTlNUUigzKSwKIAlMSFIwNTBINDFfQ09NTUFORF9JTlNUUigweDAxLCAweDAw
KSwKIAlMSFIwNTBINDFfQ09NTUFORF9JTlNUUigweDAyLCAweDAwKSwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

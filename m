From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v10 03/13] drm/mediatek: Add DSI sub driver
Date: Thu, 4 Feb 2016 13:09:56 +0000
Message-ID: <CACvgo528oR23PFbZwfm7RPwTZ6Z2Bv8uc0WHNyyG0SPQypMzDg@mail.gmail.com>
References: <1454527562-28154-1-git-send-email-p.zabel@pengutronix.de>
 <1454527562-28154-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1454527562-28154-4-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Jie Qiu <jie.qiu@mediatek.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Cawa Cheng <cawa.cheng@mediatek.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Kumar Gala <galak@codeaurora.org>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcCwKCk9uIDMgRmVicnVhcnkgMjAxNiBhdCAxOToyNSwgUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
Cj4gaW5kZXggOGRhZDg5Mi4uYjdlMDQwNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
Cj4gQEAgLTMsNiArMyw5IEBAIGNvbmZpZyBEUk1fTUVESUFURUsKPiAgICAgICAgIGRlcGVuZHMg
b24gRFJNCj4gICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgfHwgKEFSTSAmJiBDT01Q
SUxFX1RFU1QpCj4gICAgICAgICBzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiArICAgICAgIHNlbGVj
dCBEUk1fTUlQSV9EU0kKPiArICAgICAgIHNlbGVjdCBEUk1fUEFORUwKCj4gKyAgICAgICBzZWxl
Y3QgRFJNX1BBTkVMX1NJTVBMRQpQbGVhc2UgZG9uJ3QgZm9yY2UgYSBwYXJ0aWN1bGFyIHBhbmVs
IGxpa2UgdGhhdC4gTm8gb3RoZXIgZHJpdmVyIGRvZXMKaXQsIHNvIG1pZ2h0IGFzIHdlbGwgbm90
IHN0YXJ0IG5vdyA/CgpDaGVlcnMsCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK

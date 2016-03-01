From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v12 10/14] clk: mediatek: make dpi0_sel propagate rate
 changes
Date: Tue, 1 Mar 2016 11:15:35 -0800
Message-ID: <20160301191535.GC24999@codeaurora.org>
References: <1456845630-2786-1-git-send-email-p.zabel@pengutronix.de>
 <1456845630-2786-11-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1456845630-2786-11-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, kernel@pengutronix.de, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Emil Velikov <emil.l.velikov@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

T24gMDMvMDEsIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4gVGhpcyBtdXggaXMgc3VwcG9zZWQgdG8g
c2VsZWN0IGEgZml0dGluZyBkaXZpZGVyIGFmdGVyIHRoZSBQTEwKPiBpcyBhbHJlYWR5IHNldCB0
byB0aGUgY29ycmVjdCByYXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQWNrZWQtYnk6IEphbWVzIExpYW8gPGphbWVzamoubGlh
b0BtZWRpYXRlay5jb20+Cj4gLS0tCgpBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBjb2Rl
YXVyb3JhLm9yZz4KCi0tIApRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1l
bWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRp
dmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

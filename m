From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/6] dt-bindings: display: add data-enable polarity
 property
Date: Wed, 05 Sep 2018 10:07:24 +0300
Message-ID: <139651706.L0sBFfZMDQ@avalon>
References: <20180905052113.21262-1-stefan@agner.ch>
 <20180905052113.21262-3-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180905052113.21262-3-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, max.krummenacher@toradex.com, kernel@pengutronix.de, marcel.ziswiler@toradex.com, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com, fabio.estevam@nxp.com, sean@poorly.run, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgU3RlZmFuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWRuZXNkYXksIDUgU2Vw
dGVtYmVyIDIwMTggMDg6MjE6MTAgRUVTVCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4gQWxsb3cgdG8g
c3BlY2lmeSB0aGUgZGF0YS1lbmFibGUgcG9sYXJpdHkgcmVxdWlyZWQgYnkgYSBkdW1iIFZHQQo+
IERBQyBjb252ZXJ0aW5nIHBhcmFsbGVsIFJHQiB0byBWR0EuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFuIEFnbmVyIDxzdGVmYW5AYWduZXIuY2g+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R1bWItdmdhLWRhYy50eHQgICAgICAgICAgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdAo+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R1bWItdmdhLWRhYy50
eHQKPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9k
dW1iLXZnYS1kYWMudHh0IGluZGV4Cj4gMTY0Y2JiMTVmMDRjLi5hZGJkMmNhMGFmMmYgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L2R1bWItdmdhLWRhYy50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvZHVtYi12Z2EtZGFjLnR4dAo+IEBAIC0xOCw2ICsxOCw3IEBAIGdy
YXBoIGJpbmRpbmdzIHNwZWNpZmllZCBpbgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncmFwaC50eHQuCj4gCj4gIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gIC0gdmRkLXN1cHBs
eTogUG93ZXIgc3VwcGx5IGZvciBEQUMKPiArLSBkZS1hY3RpdmU6IGRhdGEtZW5hYmxlIHB1bHNl
IGlzIGFjdGl2ZSBsb3cvaGlnaC9pZ25vcmVkCgpXaGljaCB2YWx1ZSBjb3JyZXNwb25kcyB0byBs
b3csIGhpZ2ggYW5kIGlnbm9yZWQgPwoKPiAgRXhhbXBsZQo+ICAtLS0tLS0tCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==

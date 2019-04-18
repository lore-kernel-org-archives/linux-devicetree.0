From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V2 0/4] Add RZ/G2M DU support
Date: Thu, 18 Apr 2019 08:51:38 +0300
Message-ID: <20190418055138.GA4806@pendragon.ideasonboard.com>
References: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoZXMuCgpPbiBGcmksIEFwciAxMiwgMjAx
OSBhdCAwMTozODowMVBNICswMTAwLCBCaWp1IERhcyB3cm90ZToKPiBUaGlzIHBhdGNoIHNlcmll
cyBhaW1zIHRvIGFkZCBiaW5kaW5nL2RyaXZlciBzdXBwb3J0IGZvcgo+IFI4QTc3NEExKGEuay5h
IFJaL0cyTSkgRFUgKHdoaWNoIGlzIHZlcnkgc2ltaWxhciB0byB0aGUgUjhBNzc5NiBEVSk7Cj4g
aXQgaGFzIG9uZSBSR0Igb3V0cHV0LCBvbmUgTFZEUyBvdXRwdXQgYW5kIG9uZSBIRE1JIG91dHB1
dC4KPiAKPiBUaGlzIHBhdGNoc2V0IGlzIGJhc2VkIG9uIGxpbnV4X25leHQgbmV4dC0yMDE5MDQx
MSBicmFuY2guCj4gCj4gVjEtLT5WMgo+ICAgKiBJbmNvcnBvcmF0ZWQgS2llcmFuJ3MgcmV2aWV3
IGNvbW1lbnQuCj4gICAgIChodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODk2
MTY1LykKPiAKPiBCaWp1IERhcyAoNCk6Cj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNh
czogZHU6IERvY3VtZW50IHRoZSByOGE3NzRhMSBiaW5kaW5ncwo+ICAgZHQtYmluZGluZ3M6IGRp
c3BsYXk6IHJlbmVzYXM6IGx2ZHM6IERvY3VtZW50IHI4YTc3NGExIGJpbmRpbmdzCj4gICBkcm06
IHJjYXItZHU6IEFkZCBSOEE3NzRBMSBzdXBwb3J0Cj4gICBkcm06IHJjYXItZHU6IGx2ZHM6IEFk
ZCByOGE3NzRhMSBzdXBwb3J0CgpGb3IgdGhlIHdob2xlIHNlcmllcywKClJldmlld2VkLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpJJ3Zl
IHRha2VuIGl0IHRvIG15IHRyZWUgYW5kIHdpbGwgc3VibWl0IGEgcHVsbCByZXF1ZXN0LgoKPiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgICAgICAgfCAgMSAr
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgICAgIHwg
IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyAgICAgICAgICAg
ICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jICAgICAgICAgICAgICAgIHwgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDM0
IGluc2VydGlvbnMoKykKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 14/22] dt-bindings: display: dw-hdmi: Clean up DT bindings
 documentation
Date: Wed, 07 Dec 2016 11:53:50 +0200
Message-ID: <3719786.y6Dc2uNlMe@avalon>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480635817-1258-15-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161206211550.oprrw3m76locagfo@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161206211550.oprrw3m76locagfo@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ulrich Hecht <ulrich.hecht@gmail.com>, devicetree@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Andy Yan <andy.yan@rock-chips.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

SGkgUm9iLAoKT24gVHVlc2RheSAwNiBEZWMgMjAxNiAxNToxNTo1MCBSb2IgSGVycmluZyB3cm90
ZToKPiBPbiBGcmksIERlYyAwMiwgMjAxNiBhdCAwMTo0MzoyOUFNICswMjAwLCBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+ID4gTWFrZSBpdCBjbGVhciB0aGF0IHRoZSBjb3JlIGJyaWRnZS9kd19o
ZG1pLnR4dCBkb2N1bWVudCBpc24ndCBhIGRldmljZQo+ID4gdHJlZSBiaW5kaW5nIGJ5IGl0c2Vs
ZiBidXQgaXMgbWVhbnQgdG8gYmUgcmVmZXJlbmNlZCBieSBwbGF0Zm9ybSBkZXZpY2UKPiA+IHRy
ZWUgYmluZGluZ3MsIGFuZCB1cGRhdGUgdGhlIFJvY2tjaGlwIGFuZCBGcmVlc2NhbGUgRFdDIEhE
TUkgVFgKPiA+IGJpbmRpbmdzIHRvIHJlZmVyZW5jZSBpdC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTGF1cmVudCBQaW5jaGFydAo+ID4gPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29u
Ym9hcmQuY29tPgo+ID4gLS0tCj4gPiAKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9kd19oZG1pLnR4dCB8IDg1ICsrKysrKystLS0tLS0tLS0tCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvaGRtaS50eHQgICAgICAgfCA1MSArKysrKysr
LS0tLS0tCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hp
cC50eHQgfCA0MyArKysrKysrLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9u
cygrKSwgODggZGVsZXRpb25zKC0pCj4gCj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gCj4gUmVhbGx5LCB0aGUgZGRjLWkyYy1idXMgcHJvcCBuZWVkcyB0byBtb3Zl
IHRvIGEgY29ubmVjdG9yIG5vZGUsIGJ1dAo+IHRoYXQncyBhIHNlcGFyYXRlIHByb2JsZW0uCgpJ
IGZ1bGx5IGFncmVlLiBPbmUgc3RlcCBhdCBhIHRpbWUgdGhvdWdoIDotKQoKPiBXZSBtaWdodCBh
bHNvIHdhbnQgdG8gZHJvcCB0aGUgJ2RkYy0nIHBhcnQgYW5kIGhhdmUgYSBnZW5lcmljIHdheSB0
byByZWZlcgo+IHRvIGFuIGkyYyBidXMuIFRoZXJlJ3MgYSBjb3VwbGUgb2Ygb3RoZXIgY2FzZXMu
CgpSaWdodCwgYnV0IGEgRFQgbm9kZSBtaWdodCBuZWVkIHRvIHJlZmVyIHRvIG11bHRpcGxlIEky
QyBidXNlcyAocHJvYmFibHkgbm90IApmb3IgY29ubmVjdG9ycyB0aG91Z2gpLiBUaGUgZGRjLSBw
cmVmaXggc2VydmVzIGEgc2ltaWxhciBwdXJwb3NlIHRoYW4gdGhlIApwb3dlciBzdXBwbHkgb3Ig
R1BJTyBuYW1lIGluIHRoZSAqLXN1cHBseSBvciAqLWdwaW9zIHByb3BlcnRpZXMuCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=

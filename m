From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC v4 01/11] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Fri, 23 Oct 2015 07:38:07 -0500
Message-ID: <CAL_Jsq+qcEsc-cCXzFOB_Kb_3XJObwAoK4-aTJab+=U04cBLVw@mail.gmail.com>
References: <1445026333-17013-1-git-send-email-p.zabel@pengutronix.de>
 <1445026333-17013-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1445026333-17013-2-git-send-email-p.zabel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBPY3QgMTYsIDIwMTUgYXQgMzoxMiBQTSwgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4K
Pgo+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBkaXNwbGF5
IHN1YnN5c3RlbSBpbgo+IE1lZGlhdGVrIE1UODE3MyBTb0NzLiBUaGUgZGlzcGxheSBmdW5jdGlv
biBibG9jayBub2RlcyBhcmUgZ3JvdXBlZAo+IHVuZGVyIGEgZGlzcGxheS1zdWJzeXN0ZW0gbm9k
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBD
aGFuZ2VzIHNpbmNlIHYzOgo+ICAtIE1vdmVkIERJU1AgZnVuY3Rpb24gYmxvY2tzIGJhY2sgb3V0
IG9mIHRoZSBncm91cCBub2RlLCB1cGRhdGVkIGV4YW1wbGUKPiAgICBmcm9tIHRoZSBkZXZpY2Ug
dHJlZSwgaW5jbHVkaW5nIHdkbWEgYmxvY2tzLgo+ICAtIFJlbW92ZWQgdGhlIGRpdmlkZXIgYW5k
IG11eCBjbG9ja3MgZnJvbSB0aGUgRFBJIGJpbmRpbmdzLCB0aG9zZSBhcmUKPiAgICBub3QgZGly
ZWN0IGlucHV0cyBhbmQgY2FuIGJlIHNldCBieSB0aGUgY2xvY2sgZnJhbWV3b3JrLgo+IC0tLQo+
ICAuLi4vYmluZGluZ3MvZHJtL21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0ICAgICAgICB8IDE4
MiArKysrKysrKysrKysrKysrKysrKysKPiAgLi4uL2JpbmRpbmdzL2RybS9tZWRpYXRlay9tZWRp
YXRlayxkcGkudHh0ICAgICAgICAgfCAgMzUgKysrKwo+ICAuLi4vYmluZGluZ3MvZHJtL21lZGlh
dGVrL21lZGlhdGVrLGRzaS50eHQgICAgICAgICB8ICA1MyArKysrKysKClRoaXMgYWxsIGxvb2tz
IGdvb2QgdG8gbWUsIGJ1dCBwbGVhc2UgbW92ZSB0byBiaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
LwoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

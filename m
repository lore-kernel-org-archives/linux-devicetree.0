From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 01/13] clk: rockchip: add id for mipidsi sclk on rk3288
Date: Mon, 23 Nov 2015 18:29:40 +0100
Message-ID: <2553166.BXJRVnMEyt@diego>
References: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
 <1448007339-10966-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448007339-10966-2-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kever Yang <kever.yang@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, ajaykumar.rs@samsung.com, Jeff Chen <cym@rock-chips.com>, linux-rockchip@lists.infradead.org, rmk+kernel@arm.linux.org.uk, treding@nvidia.com, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Sonny Rao <sonnyrao@chromium.org>, Huang Lin <hl@rock-chips.com>, emil.l.velikov@gmail.com, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgQ2hyaXMsCgpBbSBGcmVpdGFnLCAyMC4gTm92ZW1iZXIgMjAxNSwgMTY6MTU6Mjcgc2Nocmll
YiBDaHJpcyBaaG9uZzoKPiBBZGRzIGEgbmV3IGlkIGZvciB0aGUgc2NsayBzdXBwbHlpbmcgdGhl
IG1pcGlkc2kgb24gcmszMjg4IHNvY3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcg
PHp5d0Byb2NrLWNoaXBzLmNvbT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHY0OiBOb25lCj4g
Q2hhbmdlcyBpbiB2MzogTm9uZQo+IENoYW5nZXMgaW4gdjI6Cj4gYWRkIHRoZSBtaXBpIGNsayBp
ZCBpbiBhIHNpbmdsZSBwYXRjaAo+IAo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JrMzI4
OC1jcnUuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yazMyODgtY3J1LmgKPiBiL2luY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svcmszMjg4LWNydS5oIGluZGV4IGM3MTlhYWMuLmIwN2NkZDMg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yazMyODgtY3J1LmgKPiAr
KysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JrMzI4OC1jcnUuaAo+IEBAIC04Niw2ICs4
Niw3IEBACj4gICNkZWZpbmUgU0NMS19VU0JQSFk0ODBNX1NSQwkxMjIKPiAgI2RlZmluZSBTQ0xL
X1BWVE1fQ09SRQkJMTIzCj4gICNkZWZpbmUgU0NMS19QVlRNX0dQVQkJMTI0Cj4gKyNkZWZpbmUg
U0NMS19NSVBJXzI0TQkJMTI1CgppbiB0aGUgVFJNIChhbmQgdGhlcmVmb3JlIGluIHRoZSBjbG9j
ay1jb250cm9sbGVyKSB0aGlzIGlzIGxhYmVsZWQgYXMKc2Nsa19taXBpZHNpXzI0bSwgc28gSSdk
IHRoaW5rIHRoZSBjbG9jay1pZCBzaG91bHMgYWxzbyBjb250YWluIHRoZQpEU0kgcGFydCBhcyB3
ZWxsLCBtYWtpbmcgaXQgU0NMS19NSVBJRFNJXzI0TQoKCkhlaWtvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

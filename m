From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 05/12] drm/bridge/synopsys: dw-hdmi: don't clobber
 drvdata
Date: Fri, 16 Feb 2018 08:03:59 +0100
Message-ID: <5806685.TbOkgmbs60@phil>
References: <20180214200906.31509-1-jernej.skrabec@siol.net>
 <20180214200906.31509-6-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180214200906.31509-6-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, linux-sunxi@googlegroups.com, airlied@linux.ie, mturquette@baylibre.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, maxime.ripard@free-electrons.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gTWl0dHdvY2gsIDE0LiBGZWJydWFyIDIwMTgsIDIxOjA4OjU5IENFVCBzY2hyaWViIEplcm5l
aiBTa3JhYmVjOgo+IGR3X2hkbWkgc2hvdWxkbid0IHNldCBkcnZkYXRhIHNpbmNlIHNvbWUgZHJp
dmVycyBtaWdodCBuZWVkIHRvIHN0b3JlCj4gaXQncyBvd24gZGF0YSB0aGVyZS4gUmV3b3JrIGR3
X2hkbWkgaW4gYSB3YXkgdG8gcmV0dXJuIHN0cnVjdCBkd19oZG1pCj4gaW5zdGVhZCB0byBzdG9y
ZSBpdCBpbiBkcnZkYXRhLiBUaGlzIHdheSBkcml2ZXJzIGFyZSByZXNwb25zaWJsZSB0bwo+IHN0
b3JlIGFuZCBwYXNzIHN0cnVjdHVyZSB3aGVuIG5lZWRlZC4KPiAKPiBJZGVhIHdhcyB0YWtlbiBm
cm9tIHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+IDgyNDJlY2JkNTk3ZCAoImRybS9icmlkZ2Uvc3lu
b3BzeXM6IHN0b3AgY2xvYmJlcmluZyBkcnZkYXRhIikKPiAKPiBDYzogcC56YWJlbEBwZW5ndXRy
b25peC5kZQo+IENjOiBuYXJtc3Ryb25nQGJheWxpYnJlLmNvbQo+IENjOiBMYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20KPiBDYzogaGpjQHJvY2stY2hpcHMuY29tCj4gQ2M6IGhlaWtv
QHNudGVjaC5kZQo+IEFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNp
b2wubmV0PgoKRm9yIHRoZSBSb2NrY2hpcC1wYXJ0ClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIg
PGhlaWtvQHNudGVjaC5kZT4KQWNrZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2gu
ZGU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

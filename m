From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 05/12] drm/bridge/synopsys: dw-hdmi: don't clobber
 drvdata
Date: Mon, 19 Feb 2018 14:49:28 +0100
Message-ID: <1519048168.3408.13.camel@pengutronix.de>
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
To: Jernej Skrabec <jernej.skrabec@siol.net>, maxime.ripard@free-electrons.com, wens@csie.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, narmstrong@baylibre.com, Jose.Abreu@synopsys.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE4LTAyLTE0IGF0IDIxOjA4ICswMTAwLCBKZXJuZWogU2tyYWJlYyB3cm90ZToK
PiBkd19oZG1pIHNob3VsZG4ndCBzZXQgZHJ2ZGF0YSBzaW5jZSBzb21lIGRyaXZlcnMgbWlnaHQg
bmVlZCB0byBzdG9yZQo+IGl0J3Mgb3duIGRhdGEgdGhlcmUuIFJld29yayBkd19oZG1pIGluIGEg
d2F5IHRvIHJldHVybiBzdHJ1Y3QgZHdfaGRtaQo+IGluc3RlYWQgdG8gc3RvcmUgaXQgaW4gZHJ2
ZGF0YS4gVGhpcyB3YXkgZHJpdmVycyBhcmUgcmVzcG9uc2libGUgdG8KPiBzdG9yZSBhbmQgcGFz
cyBzdHJ1Y3R1cmUgd2hlbiBuZWVkZWQuCj4gCj4gSWRlYSB3YXMgdGFrZW4gZnJvbSB0aGUgZm9s
bG93aW5nIGNvbW1pdDoKPiA4MjQyZWNiZDU5N2QgKCJkcm0vYnJpZGdlL3N5bm9wc3lzOiBzdG9w
IGNsb2JiZXJpbmcgZHJ2ZGF0YSIpCj4gCj4gQ2M6IHAuemFiZWxAcGVuZ3V0cm9uaXguZGUKPiBD
YzogbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20KPiBDYzogTGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tCj4gQ2M6IGhqY0Byb2NrLWNoaXBzLmNvbQo+IENjOiBoZWlrb0BzbnRlY2guZGUK
PiBBY2tlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KCkZv
ciBpLk1YOgpUZXN0ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
CkFja2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJk
cwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 02/12] driver: clocksource: add gpt timer for imx6sll
Date: Mon, 9 Jan 2017 11:30:04 +0100
Message-ID: <20170109103004.GA30688@mai>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-3-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1482832070-22668-3-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bai Ping <ping.bai@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, jacky.baip@gmail.com, fabio.estevam@nxp.com, tglx@linutronix.de, shawnguo@kernel.org, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBEZWMgMjcsIDIwMTYgYXQgMDU6NDc6NDBQTSArMDgwMCwgQmFpIFBpbmcgd3JvdGU6
Cj4gQWRkIGdwdCB0aW1lciBzdXBwb3J0IGZvciBpLk1YNlNMTC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBCYWkgUGluZyA8cGluZy5iYWlAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1pbXgtZ3B0LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItaW14LWdwdC5jIGIv
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1pbXgtZ3B0LmMKPiBpbmRleCBmNTk1NDYwLi5mNzE4
MjJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItaW14LWdwdC5jCj4g
KysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1pbXgtZ3B0LmMKPiBAQCAtNTU2LDQgKzU1
Niw1IEBAIHN0YXRpYyBpbnQgX19pbml0IGlteDZkbF90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnApCj4gIENMT0NLU09VUkNFX09GX0RFQ0xBUkUoaW14NnFfdGltZXIsICJmc2ws
aW14NnEtZ3B0IiwgaW14MzFfdGltZXJfaW5pdF9kdCk7Cj4gIENMT0NLU09VUkNFX09GX0RFQ0xB
UkUoaW14NmRsX3RpbWVyLCAiZnNsLGlteDZkbC1ncHQiLCBpbXg2ZGxfdGltZXJfaW5pdF9kdCk7
Cj4gIENMT0NLU09VUkNFX09GX0RFQ0xBUkUoaW14NnNsX3RpbWVyLCAiZnNsLGlteDZzbC1ncHQi
LCBpbXg2ZGxfdGltZXJfaW5pdF9kdCk7Cj4gK0NMT0NLU09VUkNFX09GX0RFQ0xBUkUoaW14NnNs
bF90aW1lciwgImZzbCxpbXg2c2xsLWdwdCIsIGlteDZkbF90aW1lcl9pbml0X2R0KTsKPiAgQ0xP
Q0tTT1VSQ0VfT0ZfREVDTEFSRShpbXg2c3hfdGltZXIsICJmc2wsaW14NnN4LWdwdCIsIGlteDZk
bF90aW1lcl9pbml0X2R0KTsKCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNh
bm9AbGluYXJvLm9yZz4KCi0tIAoKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8
aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8v
dHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

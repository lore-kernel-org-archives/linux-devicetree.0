From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] ARM: dts: i.MX25: define SSI FIFO depth
Date: Thu, 8 Mar 2018 16:11:35 +0100
Message-ID: <20180308161135.1f3d3d18@karo-electronics.de>
References: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiBUdWUsICA2IE1hciAyMDE4IDIyOjU4OjE5ICswMTAwIE1hcnRpbiBLYWlzZXIgd3Jv
dGU6Cj4gQWNjb3JkaW5nIHRvIHRoZSBpLk1YMjUgcmVmZXJlbmNlIG1hbnVhbHMsIGVhY2ggU1NJ
IGhhcyBmb3VyIEZJRk9zLiBBbGwKPiBvZiB0aG9zZSBGSUZPcyBjYW4gc3RvcmUgdXAgdG8gMTUg
ZW50cmllcy4KPiAKPiBUaGUgZnNsX3NzaSBkcml2ZXIncyBpbnRlcm5hbCBkZWZhdWx0IGZvciB0
aGUgRklGTyBkZXB0aCBpbiA4LiBTZXQgb3VyCj4gbm9uLWRlZmF1bHQgRklGTyBkZXB0aCBleHBs
aWNpdGx5IGluIHRoZSBEZXZpY2UgVHJlZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gS2Fp
c2VyIDxtYXJ0aW5Aa2Fpc2VyLmN4Pgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9pbXgyNS5k
dHNpIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9p
bXgyNS5kdHNpCj4gaW5kZXggOTcyNTcwNS4uY2Y3MGRmMiAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9pbXgyNS5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14MjUuZHRz
aQo+IEBAIC0yNjksNiArMjY5LDcgQEAKPiAgCQkJCWRtYXMgPSA8JnNkbWEgMjQgMSAwPiwKPiAg
CQkJCSAgICAgICA8JnNkbWEgMjUgMSAwPjsKPiAgCQkJCWRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7
Cj4gKwkJCQlmc2wsZmlmby1kZXB0aCA9IDwxNT47Cj4gIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
Owo+ICAJCQl9Owo+ICAKPiBAQCAtMzI5LDYgKzMzMCw3IEBACj4gIAkJCQlkbWFzID0gPCZzZG1h
IDI4IDEgMD4sCj4gIAkJCQkgICAgICAgPCZzZG1hIDI5IDEgMD47Cj4gIAkJCQlkbWEtbmFtZXMg
PSAicngiLCAidHgiOwo+ICsJCQkJZnNsLGZpZm8tZGVwdGggPSA8MTU+Owo+ICAJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKPiAgCQkJfTsKPiAgCllvdSBhcmUgY2hhbmdpbmcgdGhlIGdsb2JhbCAu
ZHRzaSBmaWxlLiBEaWQgeW91IHRlc3QgdGhpcyBjaGFuZ2Ugd2l0aAphbGwgZGV2aWNlcyB0aGF0
IGFyZSBhZmZlY3RlZCBieSBpdD8KCgpMb3RoYXIgV2HDn21hbm4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/5] mfd: axp20x: Add self-working mode support for
 AXP806
Date: Fri, 13 Jul 2018 08:53:06 +0100
Message-ID: <20180713075306.GY4641@dell>
References: <20180712160452.5516-1-wens@csie.org>
 <20180712160452.5516-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180712160452.5516-3-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAxMyBKdWwgMjAxOCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgoKPiBUaGUgQVhQODA2IGNh
biBvcGVyYXRlIGluIGEgc3RhbmRhbG9uZSAic2VsZi13b3JraW5nIiBtb2RlLCBpbiB3aGljaCBp
dAo+IGlzIGFsc28gcmVzcG9uc2libGUgZm9yIHBvd2VyIGNvbnRyb2wgb2YgdGhlIG92ZXJhbGwg
c3lzdGVtLiBUaGlzIG1vZGUKPiBpcyBzaW1pbGFyIHRvIHRoZSBtYXN0ZXIgbW9kZSwgYnV0IHRo
ZSBFTi9QV1JPTiBwaW4gZnVuY3Rpb25zIGFzIGEgcG93ZXIKPiBidXR0b24sIGluc3RlYWQgb2Yg
YSBsZXZlbC10cmlnZ2VyZWQgZW5hYmxlIHN3aXRjaC4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgY29k
ZSBjaGVja2luZyBmb3IgdGhlIG5ldyAieC1wb3dlcnMsc2VsZi13b3JraW5nLW1vZGUiCj4gcHJv
cGVydHksIGFuZCBhIHNlcGFyYXRlIG1mZF9jZWxsIGxpc3QgdGhhdCBpbmNsdWRlcyB0aGUgcG93
ZXIgYnV0dG9uCj4gKFBFSykgc3ViLWRldmljZS4KPiAKPiBSZXZpZXdlZC1ieTogSWNlbm93eSBa
aGVuZyA8aWNlbm93eUBhb3NjLmlvPgo+IFRlc3RlZC1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93
eUBhb3NjLmlvPgo+IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+Cj4gQWNrZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL21mZC9heHAyMHguYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpBcHBs
aWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBU
ZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

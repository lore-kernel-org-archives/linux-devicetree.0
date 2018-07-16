From: Jian Hu <jian.hu@amlogic.com>
Subject: [RESEND PATCH v2 0/2] clk: meson-g12a: Add EE clock controller driver
Date: Mon, 16 Jul 2018 16:11:45 +0800
Message-ID: <1531728707-192230-1-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: "Qianggui, song" <qianggui.song@amlogic.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, "Bo.yang" <bo.yang@amlogic.com>, Stephen Boyd <sboyd@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, "Sunny.luo" <sunny.luo@amlogic.com>, linux-clk@vger.kernel.org, "Xingyu.chen" <xingyu.chen@amlogic.com>
List-Id: devicetree@vger.kernel.org

QWRkIGEgQ2xvY2sgZHJpdmVyIGZvciB0aGUgRXZlcnl0aGluZy1FbHNlIHBhcnQgb2YKdGhlIEFt
bG9naWMgTWVzb24tRzEyQSBTb0MuCgpDaGFuZ2VzIHNpbmNlIHYxIGF0WzFdCi1maXggdHlwbyBv
ZiAnRXZlcnl0aGluZycuCi1jaGFuZ2UgdGhlIHdvcmQg4oCYQW1Mb2dpY+KAmSB0byAnQW1sb2dp
YycKLXNxdWFzaCBwYXRjaCAxIGFuZCAyLgotZGVsZXRlIHVzbGVzcyBtZXNzYWdlIG9mICJUcnlp
bmcgb2Jzb2xldGUgcmVncyIuCi1kZWxldGUgdGhlIGVtcHR5IGxpbmUgaW4gaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9nMTJhLWNsa2MuaC4KLXJlYmFzZSBvbiB0b3Agb2YgdGhlICJuZXh0L2Ry
aXZlcnMiIGJyYW5jaCwgYW5kIGFkZCBnMTJhIGNsb2NrIHBhdGNoLgotYWRkIENMS19NVVhfUk9V
TkRfQ0xPU0VTVCBmb3IgZzEyYV9zZF9lbW1jX2JfY2xrMF9zZWwgYW5kCiBnMTJhX3NkX2VtbWNf
Y19jbGswX3NlbC4KCkkgaGF2ZSBmb3JnZXR0ZW4gYWRkaW5nIHRoZSBQQVRDSCB2ZXJzaW9uIHRh
Zywgc28gcmVzZW5kIGl0IAoKWzFdaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8xNTMxMTMzNTQ5
LTI1ODA2LTItZ2l0LXNlbmQtZW1haWwtamlhbi5odUBhbWxvZ2ljLmNvbQoKSmlhbiBIdSAoMik6
CiAgZHQtYmluZGluZ3M6IGNsazogbWVzb24tZzEyYTogQWRkIEcxMkEgRUUgQ2xvY2sgQmluZGlu
Z3MKICBjbGs6IG1lc29uLWcxMmE6IEFkZCBFRSBDbG9jayBjb250cm9sbGVyIGRyaXZlcgoKIC4u
Li9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGd4YmItY2xrYy50eHQgICAgICAgICAgIHwgICAxICsK
IGRyaXZlcnMvY2xrL21lc29uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEw
ICsKIGRyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvY2xrL21lc29uL2cxMmEuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgOTk0ICsrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9jbGsvbWVzb24vZzEyYS5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjIgKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL2cxMmEtY2xrYy5oICAgICAgICAgICAgICB8ICA5MiArKwogNiBmaWxlcyBjaGFuZ2VkLCAx
MjIwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9n
MTJhLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2cxMmEtY2xrYy5oCgotLSAK
MS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==

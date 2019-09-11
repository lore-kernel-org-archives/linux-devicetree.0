From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Remove incorrect fallback
 compatible for ocotp
Date: Wed, 11 Sep 2019 11:01:22 +0200
Message-ID: <749f8dc6-dbf9-127c-9924-33432b8af00a@linaro.org>
References: <1568211887-19318-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568211887-19318-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

T24gMTEvMDkvMjAxOSAxNjoyNCwgQW5zb24gSHVhbmcgd3JvdGU6Cj4gQ29tcGFyZWQgdG8gaS5N
WDdELCBpLk1YOE1NIGhhcyBkaWZmZXJlbnQgb2NvdHAgbGF5b3V0LCBzbyBpdCBzaG91bGQKPiBO
T1QgdXNlICJmc2wsaW14N2Qtb2NvdHAiIGFzIG9jb3RwJ3MgZmFsbGJhY2sgY29tcGF0aWJsZSwg
cmVtb3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0Bu
eHAuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0uZHRz
aSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS5k
dHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLmR0c2kKPiBpbmRleCA1
ZjlkMGRhLi43YzRkY2NlIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtbS5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OG1tLmR0c2kKPiBAQCAtNDI2LDcgKzQyNiw3IEBACj4gIAkJCX07Cj4gIAo+ICAJCQlvY290cDog
b2NvdHAtY3RybEAzMDM1MDAwMCB7Cj4gLQkJCQljb21wYXRpYmxlID0gImZzbCxpbXg4bW0tb2Nv
dHAiLCAiZnNsLGlteDdkLW9jb3RwIiwgInN5c2NvbiI7Cj4gKwkJCQljb21wYXRpYmxlID0gImZz
bCxpbXg4bW0tb2NvdHAiLCAic3lzY29uIjsKPiAgCQkJCXJlZyA9IDwweDMwMzUwMDAwIDB4MTAw
MDA+Owo+ICAJCQkJY2xvY2tzID0gPCZjbGsgSU1YOE1NX0NMS19PQ09UUF9ST09UPjsKPiAgCQkJ
CS8qIEZvciBudm1lbSBzdWJub2RlcyAqLwoKV2h5IG5vdCBmb2xkIHRoZSB0d28gcGF0Y2hlcz8K
CgotLSAKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNl
Ym9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEv
bGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+
IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==

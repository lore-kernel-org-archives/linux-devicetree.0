From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 1/2] ARM: dts: nitrogen6x: use simple-panel instead of
 display-timings for LVDS0
Date: Mon, 18 May 2015 07:58:44 +0200
Message-ID: <20150518075844.7e1b5916@ipc1.ka-ro>
References: <1431804202-11067-1-git-send-email-eric.nelson@boundarydevices.com>
 <1431804202-11067-2-git-send-email-eric.nelson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431804202-11067-2-git-send-email-eric.nelson@boundarydevices.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Nelson <eric.nelson@boundarydevices.com>
Cc: fabio.estevam@freescale.com, devicetree@vger.kernel.org, p.zabel@pengutronix.de, gary.bisson@boundarydevices.com, kernel@pengutronix.de, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgo+IEFsc28gYWRkIGFsaWFzIGZvciBiYWNrbGlnaHRfbHZkcyBhbmQgY29ubmVjdCBpdCB0
byB0aGUgZGlzcGxheS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFcmljIE5lbHNvbiA8ZXJpYy5uZWxz
b25AYm91bmRhcnlkZXZpY2VzLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFk
bC1uaXRyb2dlbjZ4LmR0c2kgfCAzMCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLW5pdHJvZ2VuNnguZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtbml0cm9nZW42eC5kdHNpCj4gaW5kZXggZmQwOTZkYy4u
NzEyYzVlYyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLW5pdHJvZ2Vu
NnguZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtbml0cm9nZW42eC5kdHNp
Cj4gQEAgLTEyMiw3ICsxMjIsNyBAQAo+ICAJCXN0YXR1cyA9ICJva2F5IjsKPiAgCX07Cj4gIAo+
IC0JYmFja2xpZ2h0X2x2ZHMgewo+ICsJYmFja2xpZ2h0X2x2ZHM6IGJhY2tsaWdodF9sdmRzIHsK
PgpUaGUgcGF0Y2ggZG9lcyBub3QgYWRkIGFuICdhbGlhcycsIGJ1dCBhICdsYWJlbCcuCgoKTG90
aGFyIFdhw59tYW5uCi0tIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwoKS2EtUm8gZWxlY3Ryb25pY3MgR21iSCB8IFBhc2NhbHN0cmHD
n2UgMjIgfCBEIC0gNTIwNzYgQWFjaGVuClBob25lOiArNDkgMjQwOCAxNDAyLTAgfCBGYXg6ICs0
OSAyNDA4IDE0MDItMTAKR2VzY2jDpGZ0c2bDvGhyZXI6IE1hdHRoaWFzIEthdXNzZW4KSGFuZGVs
c3JlZ2lzdGVyZWludHJhZzogQW10c2dlcmljaHQgQWFjaGVuLCBIUkIgNDk5NgoKd3d3Lmthcm8t
ZWxlY3Ryb25pY3MuZGUgfCBpbmZvQGthcm8tZWxlY3Ryb25pY3MuZGUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

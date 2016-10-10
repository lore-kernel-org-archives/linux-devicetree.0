From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Date: Mon, 10 Oct 2016 08:14:40 +0100
Message-ID: <20161010071439.GC13133@dell>
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
 <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linshunquan 00354166 <linshunquan1@hisilicon.com>
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, jalen.hsu@hisilicon.com, howell.yang@hisilicon.com, linux-kernel@vger.kernel.org, suwenping@hisilicon.com, raojun@hisilicon.com, jteki@openedev.com, kevin.lixu@hisilicon.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar, lvkuanliang@hisilicon.com, xuejiancheng@hisilicon.com, cyrille.pitchen@atmel.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAzMCBTZXAgMjAxNiwgbGluc2h1bnF1YW4gMDAzNTQxNjYgd3JvdGU6Cgo+IEZyb206
IFNodW5xdWFuIExpbiA8bGluc2h1bnF1YW4xQGhpc2lsaWNvbi5jb20+Cj4gCj4gVGhpcyBwYXRj
aCBhZGRzIGRyaXZlciBzdXBwb3J0IGZvciBIaVNpbGljb24gRmxhc2ggTWVtb3J5Cj4gQ29udHJv
bGxlcihGTUMpLiBIaVNpbGljb24gRk1DIGlzIGEgbXVsdGktZnVuY3Rpb25zIGRldmljZSB3aGlj
aAo+IHN1cHBvcnRzIFNQSSBOb3IgZmxhc2ggY29udHJvbGxlciwgU1BJIG5hbmQgRmxhc2ggY29u
dHJvbGxlciBhbmQKPiBwYXJhbGxlbCBuYW5kIGZsYXNoIGNvbnRyb2xsZXIuCgpUaGlzIGlzIG5v
dCBhbiBNRkQuICBNRkRzIHNwYW4gbXVsdGlwbGUgc3Vic3lzdGVtcywgd2hlcmUgYXMgdGhlc2Ug
YXJlCmFsbCBNZW1vcnkgVGVjaG5vbG9neSBEZXZpY2VzIChNVERzKS4gIFBsZWFzZSBmaW5kIGEg
d2F5IHRvIHN1cHBvcnQKdGhpcyBpbiB0aGUgTVREIHN1YnN5c3RlbS4KCj4gU2lnbmVkLW9mZi1i
eTogU2h1bnF1YW4gTGluIDxsaW5zaHVucXVhbjFAaGlzaWxpY29uLmNvbT4KPiAtLS0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2hpc2lsaWNvbixoaXNpLWZtYy50eHQgfCAgNjIgKysr
KysrKysrKysrCj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEwICsrCj4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9tZmQvaGlzaV9mbWMuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUv
bGludXgvbWZkL2hpc2lfZm1jLmggICAgICAgICAgICAgICAgICAgICAgIHwgIDkyICsrKysrKysr
KysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjc0IGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaGlzaWxp
Y29uLGhpc2ktZm1jLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvaGlzaV9m
bWMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvaGlzaV9mbWMuaAoK
Wy4uLl0KCi0tIApMZWUgSm9uZXMKTGluYXJvIFNUTWljcm9lbGVjdHJvbmljcyBMYW5kaW5nIFRl
YW0gTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K

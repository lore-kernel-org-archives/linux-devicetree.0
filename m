From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Tue, 17 Jan 2017 10:48:39 +0100
Message-ID: <aa0fc197-c320-6d1c-a892-6e272e16366a@atmel.com>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, kernel@pengutronix.de, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpMZSAxNi8wMS8yMDE3IMOgIDIyOjAwLCBVd2UgS2xlaW5lLUvDtm5pZyBhIMOpY3JpdCA6
Cj4gVGhlIE1SMjUgZmFtaWx5IGRvZXNuJ3Qgc3VwcG9ydCBKRURFQywgc28gdGhleSBuZWVkIGV4
cGxpY2l0IG1lbnRpb25pbmcKPiBpbiB0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgc3BpIElEcy4gVGhp
cyBtYWtlcyBpdCBwb3NzaWJsZSB0byBhZGQgdGhlc2UKPiB1c2luZyBmb3IgZXhhbXBsZToKPiAK
PiAJY29tcGF0aWJsZSA9ICJldmVyc3BpbixtcjI1aDQwIjsKPiAKPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+
IENoYW5nZXMgc2luY2UgKGltcGxpY2l0KSB2MToKPiAgLSB1c2UgS2liIGluc3RlYWQgb2Yga2li
Cj4gCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgwLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2
aWNlcy9tMjVwODAuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgwLmMKPiBpbmRleCA5Y2Y3
ZmNkMjgwMzQuLmFhNTBiZDk2ZGUzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2Vz
L20yNXA4MC5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tMjVwODAuYwo+IEBAIC0zMDUs
NiArMzA1LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2RldmljZV9pZCBtMjVwX2lkc1td
ID0gewo+ICAJeyJtMjVwNDAtbm9uamVkZWMifSwJeyJtMjVwODAtbm9uamVkZWMifSwJeyJtMjVw
MTYtbm9uamVkZWMifSwKPiAgCXsibTI1cDMyLW5vbmplZGVjIn0sCXsibTI1cDY0LW5vbmplZGVj
In0sCXsibTI1cDEyOC1ub25qZWRlYyJ9LAo+ICAKPiArCS8qIEV2ZXJzcGluIE1SQU1zICovCj4g
Kwl7ICJtcjI1aDI1NiIgfSwgLyogMjU2IEtpYiwgNDAgTUh6ICovCgpUaGVyZSBpcyBhbHJlYWR5
IGEgIm1yMjVoMjU2IiBlbnRyeSBpbiB0aGUgbTI1cF9pZHNbXSBhcnJheS4KSXQncyBhIGdvb2Qg
aWRlYSB0byByZWdyb3VwIGV2ZXJzcGluIG1lbW9yaWVzIGJ1dCBpdCBtaWdodCBiZSBiZXR0ZXIg
dG8KcmV1c2UgdGhlIGV4aXN0aW5nIGVudHJ5LgoKVGhlIHByZXZpb3VzIGVudHJ5IGlzIGJldHdl
ZW4gImF0MjVkZjMyMWEiLCAuLi4gYW5kICJteDI1bDQwMDVhIiBzbyBpdApkb2Vzbid0IGFwcGVh
ciBpbiB5b3VyIHBhdGNoLgoKPiArCXsgIm1yMjVoMTAiIH0sICAvKiAgIDEgTWliLCA0MCBNSHog
Ki8KPiArCXsgIm1yMjVoNDAiIH0sICAvKiAgIDQgTWliLCA0MCBNSHogKi8KPiArCj4gIAl7IH0s
Cj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUoc3BpLCBtMjVwX2lkcyk7Cj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

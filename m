From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Tue, 17 Jan 2017 11:32:11 +0100
Message-ID: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
 <aa0fc197-c320-6d1c-a892-6e272e16366a@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <aa0fc197-c320-6d1c-a892-6e272e16366a@atmel.com>
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

TGUgMTcvMDEvMjAxNyDDoCAxMDo0OCwgQ3lyaWxsZSBQaXRjaGVuIGEgw6ljcml0IDoKPiBIaSwK
PiAKPiBMZSAxNi8wMS8yMDE3IMOgIDIyOjAwLCBVd2UgS2xlaW5lLUvDtm5pZyBhIMOpY3JpdCA6
Cj4+IFRoZSBNUjI1IGZhbWlseSBkb2Vzbid0IHN1cHBvcnQgSkVERUMsIHNvIHRoZXkgbmVlZCBl
eHBsaWNpdCBtZW50aW9uaW5nCj4+IGluIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBzcGkgSURzLiBU
aGlzIG1ha2VzIGl0IHBvc3NpYmxlIHRvIGFkZCB0aGVzZQo+PiB1c2luZyBmb3IgZXhhbXBsZToK
Pj4KPj4gCWNvbXBhdGlibGUgPSAiZXZlcnNwaW4sbXIyNWg0MCI7Cj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4+
IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIChpbXBsaWNpdCkgdjE6Cj4+ICAtIHVzZSBLaWIgaW5zdGVh
ZCBvZiBraWIKPj4KPj4gIGRyaXZlcnMvbXRkL2RldmljZXMvbTI1cDgwLmMgfCA1ICsrKysrCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9kZXZpY2VzL20yNXA4MC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tMjVwODAuYwo+
PiBpbmRleCA5Y2Y3ZmNkMjgwMzQuLmFhNTBiZDk2ZGUzYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tdGQvZGV2aWNlcy9tMjVwODAuYwo+PiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL20yNXA4
MC5jCj4+IEBAIC0zMDUsNiArMzA1LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2Rldmlj
ZV9pZCBtMjVwX2lkc1tdID0gewo+PiAgCXsibTI1cDQwLW5vbmplZGVjIn0sCXsibTI1cDgwLW5v
bmplZGVjIn0sCXsibTI1cDE2LW5vbmplZGVjIn0sCj4+ICAJeyJtMjVwMzItbm9uamVkZWMifSwJ
eyJtMjVwNjQtbm9uamVkZWMifSwJeyJtMjVwMTI4LW5vbmplZGVjIn0sCj4+ICAKPj4gKwkvKiBF
dmVyc3BpbiBNUkFNcyAqLwo+PiArCXsgIm1yMjVoMjU2IiB9LCAvKiAyNTYgS2liLCA0MCBNSHog
Ki8KPiAKPiBUaGVyZSBpcyBhbHJlYWR5IGEgIm1yMjVoMjU2IiBlbnRyeSBpbiB0aGUgbTI1cF9p
ZHNbXSBhcnJheS4KPiBJdCdzIGEgZ29vZCBpZGVhIHRvIHJlZ3JvdXAgZXZlcnNwaW4gbWVtb3Jp
ZXMgYnV0IGl0IG1pZ2h0IGJlIGJldHRlciB0bwo+IHJldXNlIHRoZSBleGlzdGluZyBlbnRyeS4K
PiAKPiBUaGUgcHJldmlvdXMgZW50cnkgaXMgYmV0d2VlbiAiYXQyNWRmMzIxYSIsIC4uLiBhbmQg
Im14MjVsNDAwNWEiIHNvIGl0Cj4gZG9lc24ndCBhcHBlYXIgaW4geW91ciBwYXRjaC4KPiAKPj4g
Kwl7ICJtcjI1aDEwIiB9LCAgLyogICAxIE1pYiwgNDAgTUh6ICovCj4+ICsJeyAibXIyNWg0MCIg
fSwgIC8qICAgNCBNaWIsIDQwIE1IeiAqLwo+PiArCgpBbHNvIGlmIHlvdSBhZGQgbmV3IGVudHJp
ZXMsIEkgdGhpbmsgeW91IHNob3VsZCB1cGRhdGUgdGhlICJTdXBwb3J0ZWQgY2hpcApuYW1lcyIg
c2VjdGlvbiBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNw
aS1ub3IudHh0OgoKIm1yMjVoMjU2IiBpcyBhbHJlYWR5IHRoZXJlLgoKQmVzdCByZWdhcmRzLAoK
Q3lyaWxsZQoKCj4+ICAJeyB9LAo+PiAgfTsKPj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUoc3BpLCBt
MjVwX2lkcyk7Cj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

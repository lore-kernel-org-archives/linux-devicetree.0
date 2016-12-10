From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v3 3/5] mtd: aspeed: used a label property
Date: Sat, 10 Dec 2016 18:16:53 +0100
Message-ID: <66f5cede-e907-caf3-7d87-53246efa8908@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-4-git-send-email-clg@kaod.org>
 <6bc350c3-b162-dc10-4cd3-c32f9a3d4eaf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <6bc350c3-b162-dc10-4cd3-c32f9a3d4eaf@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMTIvMTAvMjAxNiAwNTowMyBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTIvMDkvMjAx
NiAwNTo0OSBQTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoaXMgY2FuIGJlIHVzZWQg
dG8gZWFzaWx5IGlkZW50aWZ5IGEgY2hpcCBvbiBhIHN5c3RlbSB3aXRoIG11bHRpcGxlCj4+IGNo
aXBzLgo+IAo+IEkgZG9uJ3QgdGhpbmsgSSB1bmRlcnN0YW5kIHdoYXQgdGhpcyBwYXRjaCBkb2Vz
Lgo+IEl0IHNlZW1zIHRvIG1lIGxpa2UgdGhpcyBvbmUgc2hvdWxkIGJlIHdyYXBwZWQgaW50byAx
LzUuCgpZZXMsIGJ1dCB0aGlzIGlzIHRvIG9wZW4gdGhlIGRpc2N1c3Npb24gb24gdGhlIGNoYW5n
ZSByZXF1aXJlZCBpbiB0aGUgCmplZGVjLHNwaS1ub3IgYmluZGluZy4KCkMuCgoKCj4+IFNpZ25l
ZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4+IC0tLQo+PiAgZHJp
dmVycy9tdGQvc3BpLW5vci9hc3BlZWQtc21jLmMgfCAyICsrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2Fz
cGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXNwZWVkLXNtYy5jCj4+IGluZGV4IDk5
MzAyYjBkNzc4Ni4uOTExOWMwY2E4NmI2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2FzcGVlZC1zbWMuYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2FzcGVlZC1zbWMu
Ywo+PiBAQCAtNjc2LDYgKzY3Niw4IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NtY19zZXR1cF9mbGFz
aChzdHJ1Y3QgYXNwZWVkX3NtY19jb250cm9sbGVyICpjb250cm9sbGVyLAo+PiAgCQlub3ItPnBy
ZXBhcmUgPSBhc3BlZWRfc21jX3ByZXA7Cj4+ICAJCW5vci0+dW5wcmVwYXJlID0gYXNwZWVkX3Nt
Y191bnByZXA7Cj4+ICAKPj4gKwkJbXRkLT5uYW1lID0gb2ZfZ2V0X3Byb3BlcnR5KGNoaWxkLCAi
bGFiZWwiLCBOVUxMKTsKPj4gKwo+PiAgCQlyZXQgPSBhc3BlZWRfc21jX2NoaXBfc2V0dXBfaW5p
dChjaGlwLCByKTsKPj4gIAkJaWYgKHJldCkKPj4gIAkJCWJyZWFrOwo+Pgo+IAo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

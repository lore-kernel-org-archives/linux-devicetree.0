From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: add DT clock binding support
Date: Tue, 10 Apr 2012 01:27:28 -0300
Message-ID: <CAOMZO5AKmnQRo4_3GVDSMUc0fMZ5orwvZSxjXfn6m-5Boew04A@mail.gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
 <1334003101-17274-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334003101-17274-4-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBBcHIgOSwgMjAxMiBhdCA1OjI1IFBNLCBSb2IgSGVycmluZyA8cm9iaGVycmluZzJA
Z21haWwuY29tPiB3cm90ZToKPiBGcm9tOiBHcmFudCBMaWtlbHkgPGdyYW50Lmxpa2VseUBzZWNy
ZXRsYWIuY2E+Cj4KPiBCYXNlZCBvbiB3b3JrIDFzdCBieSBCZW4gSGVycmVuc2NobWlkdCBhbmQg
SmVyZW15IEtlcnIsIHRoZW4gYnkgR3JhbnQKPiBMaWtlbHksIHRoaXMgcGF0Y2ggYWRkcyBzdXBw
b3J0IHRvIGNsa19nZXQgdG8gYWxsb3cgZHJpdmVycyB0byByZXRyaWV2ZQo+IGNsb2NrIGRhdGEg
ZnJvbSB0aGUgZGV2aWNlIHRyZWUuCj4KPiBQbGF0Zm9ybXMgc2NhbiBmb3IgY2xvY2tzIGluIERU
IHdpdGggb2ZfY2xrX2luaXQgYW5kIGEgbWF0Y2ggdGFibGUsIGFuZAo+IHRoZSByZWdpc3RlciBh
IHByb3ZpZGVyIHRocm91Z2ggb2ZfY2xrX2FkZF9wcm92aWRlci4gVGhlIHByb3ZpZGVyJ3MKPiBj
bGtfc3JjX2dldCBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCB3aGVuIGEgZGV2aWNlIHJlZmVyZW5j
ZXMgdGhlCj4gcHJvdmlkZXIncyBPRiBub2RlIGZvciBhIGNsb2NrIHJlZmVyZW5jZS4KPgo+IHY1
IChSb2IgSGVycmluZyk6Cj4gwqAgwqAtIE1vdmUgZnJvbSBkcml2ZXJzL29mIGludG8gY29tbW9u
IGNsb2NrIHN1YnN5c3RlbQo+IMKgIMKgLSBTcXVhc2hlZCAiZHQvY2xvY2s6IGFkZCBhIHNpbXBs
ZSBwcm92aWRlciBnZXQgZnVuY3Rpb24iIGFuZAo+IMKgIMKgIMKgImR0L2Nsb2NrOiBhZGQgZnVu
Y3Rpb24gdG8gZ2V0IHBhcmVudCBjbG9jayBuYW1lIgo+IMKgIMKgLSBSZWJhc2UgdG8gMy40LXJj
MQo+IMKgIMKgLSBEcm9wIENPTkZJR19PRl9DTE9DSyBhbmQganVzdCB1c2UgQ09ORklHX09GCj4g
wqAgwqAtIEFkZCBtaXNzaW5nIEVYUE9SVF9TWU1CT0wgdG8gdmFyaW91cyBmdW5jdGlvbnMKPiDC
oCDCoC0gcy9jbG9jay1vdXRwdXQtbmFtZS9jbG9jay1vdXRwdXQtbmFtZXMvCj4gwqAgwqAtIERl
ZmluZSB0aGF0IGZpeGVkLWNsb2NrIGJpbmRpbmcgaXMgYSBzaW5nbGUgb3V0cHV0CgpUaGUgcGF0
Y2ggaGlzdG9yeSBzaG91bGQgZ28gYmVsb3cgdGhlIC0tLSBsaW5lLApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGlu
ZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMu
b3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK

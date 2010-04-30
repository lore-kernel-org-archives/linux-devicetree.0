From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 5/5] fsl-diu-fb: Support setting display mode using EDID
Date: Fri, 30 Apr 2010 09:43:43 +0200
Message-ID: <20100430094343.2a504b2a@wker>
References: <1272584978-19063-1-git-send-email-agust@denx.de>
	<1272584978-19063-6-git-send-email-agust@denx.de>
	<n2oed82fe3e1004291844habbdfe76lc369d66cf9a9d9fd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <n2oed82fe3e1004291844habbdfe76lc369d66cf9a9d9fd@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Timur Tabi <timur.tabi@gmail.com>
Cc: linux-fbdev@vger.kernel.org, wd@denx.de, dzu@denx.de, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@ozlabs.org, yorksun@freescale.com
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyOSBBcHIgMjAxMCAyMDo0NDoxMiAtMDUwMApUaW11ciBUYWJpIDx0aW11ci50YWJp
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIFRodSwgQXByIDI5LCAyMDEwIGF0IDY6NDkgUE0sIEFu
YXRvbGlqIEd1c3RzY2hpbiA8YWd1c3RAZGVueC5kZT4gd3JvdGU6Cj4gCj4gPiArT3B0aW9uYWwg
cHJvcGVydGllczoKPiA+ICstIEVESUQgOiB2ZXJiYXRpbSBFRElEIGRhdGEgYmxvY2sgZGVzY3Jp
YmluZyBhdHRhY2hlZCBkaXNwbGF5Lgo+ID4gKyDCoERhdGEgZnJvbSB0aGUgZGV0YWlsZWQgdGlt
aW5nIGRlc2NyaXB0b3Igd2lsbCBiZSB1c2VkIHRvCj4gPiArIMKgcHJvZ3JhbSB0aGUgZGlzcGxh
eSBjb250cm9sbGVyLgo+IAo+IFRoZSBwcm9wZXJ0eSBuYW1lIHNob3VsZCBiZSBsb3dlci1jYXNl
LgoKV2lsbCBjaGFuZ2UgdG8gbG93ZXItY2FzZS4KCj4gPiDCoC8qCj4gPiDCoCogVGhlc2UgcGFy
YW1ldGVycyBnaXZlIGRlZmF1bHQgcGFyYW1ldGVycwo+ID4gQEAgLTIxNyw2ICsyMTgsNyBAQCBz
dHJ1Y3QgbWZiX2luZm8gewo+ID4gwqAgwqAgwqAgwqBpbnQgeF9hb2lfZDsgwqAgwqAgwqAgwqAg
wqAgwqAvKiBhb2kgZGlzcGxheSB4IG9mZnNldCB0byBwaHlzaWNhbCBzY3JlZW4gKi8KPiA+IMKg
IMKgIMKgIMKgaW50IHlfYW9pX2Q7IMKgIMKgIMKgIMKgIMKgIMKgLyogYW9pIGRpc3BsYXkgeSBv
ZmZzZXQgdG8gcGh5c2ljYWwgc2NyZWVuICovCj4gPiDCoCDCoCDCoCDCoHN0cnVjdCBmc2xfZGl1
X2RhdGEgKnBhcmVudDsKPiA+ICsgwqAgwqAgwqAgY2hhciAqZWRpZF9kYXRhOwo+IAo+IGVkaWRf
ZGF0YSBzaG91bGQgYmUgInU4ICoiLiAgImNoYXIgKiIgaXMgc2hvdWxkIGJlIHVzZWQgb25seSBm
b3IKPiBzdHJpbmdzIG9yIGFycmF5cyBvZiBjaGFyYWN0ZXJzLgoKV2lsbCBmaXggaXQsIHRvby4K
Cj4gPiArIMKgIMKgIMKgIC8qIFN0aWxsIG5vdCBmb3VuZCwgdXNlIHByZWZlcnJlZCBtb2RlIGZy
b20gZGF0YWJhc2UgaWYgYW55ICovCj4gPiArIMKgIMKgIMKgIGlmICghaGFzX2RlZmF1bHRfbW9k
ZSAmJiBpbmZvLT5tb25zcGVjcy5tb2RlZGIgIT0gTlVMTCkgewo+IAo+IE5vIG5lZWQgZm9yIHRo
ZSAiIT0gTlVMTCIKCk9rLCBJIHdpbGwgc2ltcGxpZnkgdGhpcy4KClRoYW5rcywKQW5hdG9saWoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXhwcGMt
ZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xp
c3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2

From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver
 for hisilicon hip04 Soc
Date: Wed, 02 Jul 2014 10:12:21 +0800
Message-ID: <53B36A85.2010104@gmail.com>
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com>
 <1404115409-20200-3-git-send-email-wangzhou.bry@gmail.com>
 <6920327.DpBe6vKVPa@wuerfel>
 <C3050A4DBA34F345975765E43127F10F2C15561F@SZXEMA512-MBX.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F2C15561F@SZXEMA512-MBX.china.huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Caizhiyong <caizhiyong@hisilicon.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jussi Kivilinna <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Quyaxin <quyaxin@hisilicon.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>, Pekon Gupta <pekon@ti.com>, "Wanli (welly)" <welly.wan@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMjAxNOW5tDA25pyIMzDml6UgMTc6NTksIENhaXpoaXlvbmcgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEFybmQgQmVyZ21hbm4gW21haWx0bzphcm5kQGFy
bmRiLmRlXQo+PiBTZW50OiBNb25kYXksIEp1bmUgMzAsIDIwMTQgNTowMSBQTQo+PiBUbzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBaaG91IFdhbmc7IFJvYiBI
ZXJyaW5nOyBQYXdlbCBNb2xsOyBNYXJrIFJ1dGxhbmQ7IElhbiBDYW1wYmVsbDsgS3VtYXIKPj4g
R2FsYTsgUnVzc2VsbCBLaW5nOyBEYXZpZCBXb29kaG91c2U7IEJyaWFuIE5vcnJpczsgR3JhbnQg
TGlrZWx5OyBFemVxdWllbAo+PiBHYXJjaWE7IFBla29uIEd1cHRhOyBBcnRlbSBCaXR5dXRza2l5
OyBBbGV4YW5kZXIgU2hpeWFuOyBJdmFuIEtob3JvbnpodWs7Cj4+IEp1c3NpIEtpdmlsaW5uYTsg
Sm9lcm4gRW5nZWw7IFJhbmR5IER1bmxhcDsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7Cj4+
IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3Jn
Owo+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBDYWl6aGl5b25nOyBXYW5nemhvdSAo
QikKPj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIG10ZDogaGlzaWxpY29uOiBhZGQgYSBuZXcg
bmFuZCBjb250cm9sbGVyIGRyaXZlciBmb3IKPj4gaGlzaWxpY29uIGhpcDA0IFNvYwo+Pgo+Pgo+
Pj4gKwlzdHJ1Y3QgZGV2aWNlCQkqZGV2Owo+Pj4gKwl2b2lkIF9faW9tZW0JCSppb2Jhc2U7Cj4+
PiArCXN0cnVjdCBjb21wbGV0aW9uICAgICAgIGNtZF9jb21wbGV0ZTsKPj4+ICsJdW5zaWduZWQg
aW50CQlvZmZzZXQ7Cj4+PiArCXVuc2lnbmVkIGludAkJY29tbWFuZDsKPj4+ICsJaW50CQkJY2hp
cHNlbGVjdDsKPj4+ICsJdW5zaWduZWQgaW50CQlhZGRyX2N5Y2xlOwo+Pj4gKwl1bnNpZ25lZCBp
bnQJCWFkZHJfdmFsdWVbMl07Cj4+PiArCXVuc2lnbmVkIGludAkJY2FjaGVfYWRkcl92YWx1ZVsy
XTsKPj4+ICsJY2hhcgkJCSpidWZmZXI7Cj4+PiArCWRtYV9hZGRyX3QJCWRtYV9idWZmZXI7Cj4+
PiArCWRtYV9hZGRyX3QJCWRtYV9vb2I7Cj4+PiArCWludAkJCXZlcnNpb247Cj4+PiArCXVuc2ln
bmVkIGludCAgICAgICAgICAgIGVjY19iaXRzOwo+Pj4gKwl1bnNpZ25lZCBpbnQgICAgICAgICAg
ICBpcnFfc3RhdHVzOyAvKiBpbnRlcnJ1cHQgc3RhdHVzICovCj4+PiArCj4+PiArCWludCAoKnNl
bmRfY21kX3BhZ2Vwcm9nKShzdHJ1Y3QgaGluZmNfaG9zdCAqaG9zdCk7Cj4+PiArCWludCAoKnNl
bmRfY21kX3N0YXR1cykoc3RydWN0IGhpbmZjX2hvc3QgKmhvc3QpOwo+Pj4gKwlpbnQgKCpzZW5k
X2NtZF9yZWFkc3RhcnQpKHN0cnVjdCBoaW5mY19ob3N0ICpob3N0KTsKPj4+ICsJaW50ICgqc2Vu
ZF9jbWRfZXJhc2UpKHN0cnVjdCBoaW5mY19ob3N0ICpob3N0KTsKPj4+ICsJaW50ICgqc2VuZF9j
bWRfcmVhZGlkKShzdHJ1Y3QgaGluZmNfaG9zdCAqaG9zdCk7Cj4+PiArCWludCAoKnNlbmRfY21k
X3Jlc2V0KShzdHJ1Y3QgaGluZmNfaG9zdCAqaG9zdCwgaW50IGNoaXBzZWxlY3QpOwo+Pj4gK307
Cj4+Cj4+IFdoeSBkbyB5b3UgbmVlZCBmdW5jdGlvbiBwb2ludGVycyBoZXJlPyBUaGUgY3VycmVu
dCB2ZXJzaW9uIG9mIHRoZQo+PiBkcml2ZXIgeW91IHBvc3RlZCBhbHdheXMgYXNzaWducyB0aGVz
ZSB0byB0aGUgc2FtZSBmdW5jdGlvbnMsIHNvCj4+IGl0IHdvdWxkIGJlIG1vcmUgZWZmaWNpZW50
IHRvIGp1c3QgY2FsbCB0aG9zZSBkaXJlY3RseS4KPj4KPgo+IEkgYWdyZWUgd2l0aCB5b3UuCj4g
VGhpcyBmZWF0dXJlIHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkIHRvIHN1cHBvcnQgYSB2YXJpZXR5
IHZlcnNpb24gb2YgTkFORCBjb250cm9sbGVycy4KPiBCdXQgaW4gZmFjdCwgdGhpcyBmZWF0dXJl
IGlzIG5vdCB1c2VkIG5vdy4KPgpJIHdpbGwgbW92ZSB0aGVtIG91dCB0aGUgaG9zdCwgdGhhbmtz
IGZvciB5b3VyIG9waW5pb24hCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

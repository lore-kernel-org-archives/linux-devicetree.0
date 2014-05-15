From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 1/6] clocksource: Add support for the Mediatek SoCs
Date: Thu, 15 May 2014 09:40:42 +0100
Message-ID: <CABuKBeLio4A=sRrjv3r0E-8gGe3aMZq66A3wy71Mr7SVeGQ8Gw@mail.gmail.com>
References: <1400087579-4250-1-git-send-email-matthias.bgg@gmail.com>
 <1400087579-4250-2-git-send-email-matthias.bgg@gmail.com>
 <2fe960fd-b145-42a8-ace2-e2cd3aaf0cdc@BN1AFFO11FD010.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2fe960fd-b145-42a8-ace2-e2cd3aaf0cdc@BN1AFFO11FD010.protection.gbl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@inf>
List-Id: devicetree@vger.kernel.org

SGkgYWxsLAoKSSBkaWQgbm90IHJlYWxpemUgdGhhdCBBbmRyb2lkIGdtYWlsIGFwcCBzZW5kcyBI
VE1MIG1haWxzLgpTbyBJIHNlbmQgdGhlIGNvbW1lbnRzIGJlbG93IGFjY2lkZW50YWxseSBhcyBI
VE1MIG1haWwgeWVzdGVyZGF5LgpTb3JyeSBmb3IgdGhhdC4KCjIwMTQtMDUtMTQgMTg6MjkgR01U
KzAxOjAwIFPDtnJlbiBCcmlua21hbm4gPHNvcmVuLmJyaW5rbWFubkB4aWxpbnguY29tPjoKPiBI
aSBNYXR0aGlhcywKPgo+IGp1c3QgYSBmZXcgc3VnZ2VzdGlvbnMgYmVsb3cuIE5vdGhpbmcgc2Vy
aW91cy4KPgo+IE9uIFdlZCwgMjAxNC0wNS0xNCBhdCAwNzoxMlBNICswMjAwLCBNYXR0aGlhcyBC
cnVnZ2VyIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGFkZHMgYSBjbG9jayBzb3VyY2UgYW5kIGNsb2Nr
IGV2ZW50IGZvciB0aGUgdGltZXIgZm91bmQKPj4gb24gdGhlIE1lZGlhdGVrIFNvQ3MuCj4+Cj4+
IFRoZSBNZWRpYXRlayBHZW5lcmFsIFBvcnBvc2UgVGltZXIgYmxvY2sgcHJvdmlkZXMgZml2ZSAz
MiBiaXQgdGltZXJzIGFuZAo+PiBvbmUgNjQgYml0IHRpbWVyLgo+Pgo+PiBUd28gMzIgYml0IHRp
bWVycyBhcmUgdXNlZDoKPj4gVElNRVIxOiBjbG9jayBldmVudHMgc3VwcG9ydGluZyBwZXJpb2Rp
YyBhbmQgb25lc2hvdCBldmVudHMKPj4gVElNRVIyOiBjbG9jayBzb3VyY2UgY29uZmlndXJlZCBh
cyBhIGZyZWUgcnVubmluZyBjb3VudGVyCj4KPiBJdCBpcyBwcmV0dHkgY29tbW9uLCBJIHRoaW5r
LCB0byB1c2UgdGhlIGZyZWUgcnVubmluZyBjb3VudGVyIGFsc28gYXMKPiBzY2hlZF9jbG9jay4g
WW91IHByb2JhYmx5IHdhbnQgdG8gbG9vayBpbnRvIHRoaXMsIGJ1dCB0aGF0J3MganVzdCBhCj4g
cG9zc2libGUgZW5oYW5jZW1lbnQuCgpUaGUgdGltZXIgYmxvY2sgaGFzIGFsc28gYSA2NCBiaXQg
dGltZXIuIEkgcGxhbiB0byBoYXZlIGEgbG9vayBvbiB0aGlzCm9uZSB0byB1c2UgaXQgYXMgc2No
ZWRfY2xvY2suCgpCdXQgZm9yIG5vdyBteSBwcmlvcml0eSBpcyB0byBnZXQgdGhlIHNlcmlhbCBj
b25zb2xlIGRyaXZlciBkb25lLgoKPgo+IFsuLi5dCj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgbXRr
X3RpbWVyX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+PiArewo+PiArICAgICBzdHJ1
Y3QgbXRrX2Nsb2NrX2V2ZW50X2RldmljZSAqZXZ0Owo+PiArICAgICBzdHJ1Y3QgcmVzb3VyY2Ug
cmVzOwo+PiArICAgICB1bnNpZ25lZCBsb25nIHJhdGUgPSAwOwo+PiArICAgICBzdHJ1Y3QgY2xr
ICpjbGs7Cj4+ICsgICAgIGludCByZXQ7Cj4+ICsgICAgIHUzMiB2YWw7Cj4+ICsKPj4gKyAgICAg
ZXZ0ID0ga3phbGxvYyhzaXplb2YoKmV2dCksIEdGUF9LRVJORUwpOwo+PiArICAgICBpZiAoIWV2
dCkKPj4gKyAgICAgICAgICAgICBwYW5pYygiQ2FuJ3QgYWxsb2NhdGUgbXRrIGNsb2NrIGV2ZW50
IGRyaXZlciBzdHJ1Y3QiKTsKPgo+IEknbSBub3QgdGhhdCBzdXJlIGFib3V0IHRoZSBBN3MsIGJ1
dCBvbiBDb3J0ZXgtQTkgdGhlcmUgaXMgYWxzbyBhIGdsb2JhbAo+IHRpbWVyIHdoaWNoIGNhbiBi
ZSB1c2VkIGZvciB0aW1pbmcuIEFuZCB0aGVyZSBtaWdodCBiZSBvdGhlciB0aW1pbmcKPiBvcHRp
b25zIGZvciB0aGlzIFNPQyB0b28uIERvIHlvdSByZWFsbHkgd2FudCB0byBwYW5pYz8KClllcywg
QTcgaGFzIGEgYXJtIGxvY2FsIHRpbWVyLCBidXQgdGhlIHByb2JsZW0gaXMsIHRoYXQgaXQgaXMg
bm90Cndvcmtpbmcgd2l0aCB0aGUgU29DLiBJdCBzZWVtcyBsaWtlIGEgY2hpcCBkZXNpZ24gZXJy
b3IgYXMgSSB0cmllZCBmb3IKcXVpdGUgYSB0aW1lIHRvIGdldCBpdCB3b3JraW5nLgoKVGhhbmtz
IGZvciB5b3VyIGNvbW1lbnRzIGFueXdheS4KCj4KPiAgICAgICAgIFPDtnJlbgoKCgotLSAKbW90
emJsb2cud29yZHByZXNzLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

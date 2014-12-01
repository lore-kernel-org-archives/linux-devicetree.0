From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v13 07/12] drm: bridge/dw_hdmi: add support for
 multi-byte register width access
Date: Mon, 01 Dec 2014 13:04:16 +0100
Message-ID: <1417435456.4624.12.camel@pengutronix.de>
References: <1417008157-31861-1-git-send-email-andy.yan@rock-chips.com>
 <1417008759-32257-1-git-send-email-andy.yan@rock-chips.com>
 <1417019657.3177.10.camel@pengutronix.de> <547843B9.6000806@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <547843B9.6000806@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDI4LjExLjIwMTQsIDE3OjQzICswODAwIHNjaHJpZWIgQW5keSBZYW46
Cj4gSGkgWmFiZWw6Cj4gT24gMjAxNOW5tDEx5pyIMjfml6UgMDA6MzQsIFBoaWxpcHAgWmFiZWwg
d3JvdGU6Cj4gPiBBbSBNaXR0d29jaCwgZGVuIDI2LjExLjIwMTQsIDIxOjMyICswODAwIHNjaHJp
ZWIgQW5keSBZYW46Cj4gPj4gT24gcm9ja2NoaXAgcmszMjg4LCBvbmx5IHdvcmQoMzItYml0KSBh
Y2Nlc3NlcyBhcmUKPiA+PiBwZXJtaXR0ZWQgZm9yIGhkbWkgcmVnaXN0ZXJzLiAgQnl0ZSB3aWR0
aCBhY2Nlc3NlcyAod3JpdGViLAo+ID4+IHJlYWRiKSBnZW5lcmF0ZSBhbiBpbXByZWNpc2UgZXh0
ZXJuYWwgYWJvcnQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlhbiA8YW5keS55YW5A
cm9jay1jaGlwcy5jb20+Cj4gPj4KPiA+PiAtLS0KPiA+Pgo+ID4+IENoYW5nZXMgaW4gdjEzOiBO
b25lCj4gPj4gQ2hhbmdlcyBpbiB2MTI6IE5vbmUKPiA+PiBDaGFuZ2VzIGluIHYxMTogTm9uZQo+
ID4+IENoYW5nZXMgaW4gdjEwOiBOb25lCj4gPj4gQ2hhbmdlcyBpbiB2OTogTm9uZQo+ID4+IENo
YW5nZXMgaW4gdjg6IE5vbmUKPiA+PiBDaGFuZ2VzIGluIHY3OiBOb25lCj4gPj4gQ2hhbmdlcyBp
biB2NjoKPiA+PiAtIHJlZmFjdG9yIHJlZ2lzdGVyIGFjY2VzcyB3aXRob3V0IHJlZ19zaGlmdAo+
ID4+Cj4gPj4gQ2hhbmdlcyBpbiB2NToKPiA+PiAtIHJlZmFjdG9yIHJlZy1pby13aWR0aAo+ID4+
Cj4gPj4gQ2hhbmdlcyBpbiB2NDogTm9uZQo+ID4+IENoYW5nZXMgaW4gdjM6Cj4gPj4gLSBzcGxp
dCBtdWx0aS1yZWdpc3RlciBhY2Nlc3MgdG8gb25lIGluZGVwZW50IHBhdGNoCj4gPj4KPiA+PiAg
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHdfaGRtaS5jIHwgNTcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9kd19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R3X2hkbWkuYwo+
ID4+IGluZGV4IGE1M2JmNjMuLjVlODhjOGQgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9kd19oZG1pLmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R3
X2hkbWkuYwo+ID4+IEBAIC0xMDAsNiArMTAwLDExIEBAIHN0cnVjdCBoZG1pX2RhdGFfaW5mbyB7
Cj4gPj4gICAJc3RydWN0IGhkbWlfdm1vZGUgdmlkZW9fbW9kZTsKPiA+PiAgIH07Cj4gPj4gICAK
PiA+PiArdW5pb24gZHdfcmVnX3B0ciB7Cj4gPj4gKwl1MzIgX19pb21lbSAqcDMyOwo+ID4+ICsJ
dTggX19pb21lbSAqcDg7Cj4gPj4gK307Cj4gPiBJIHNlZSBubyBuZWVkIHRvIGludHJvZHVjZSB0
aGlzLiBKdXN0IGV4cGxpY2l0bHkgbXVsdGlwbHkgdGhlIG9mZnNldCBpbgo+ID4gZHdfaGRtaV93
cml0ZWwuCj4gPgo+ICAgICAgSXMgdGhlcmUgYW55IGRpc2FkdmFudGFnZSB0byBkbyBsaWtlIHRo
aXM/Cj4gICAgICBUaGUgY29tcGlsZXIgY2FuIGhlbHAgdXMgZG8gdGhlIGV4cGxpY2l0bHkgbXVs
dGlwbHkgYnkgdGhpcyB3YXkuCgpGb3VyIGFkZGl0aW9uYWwgbGluZXMsIGEgbmV3IGRlZmluZWQg
dHlwZSwgYSBmZXcgbW9yZSBjaGFuZ2VzIHRvIHN0cnVjdApkd19oZG1pIGFuZCBkd19oZG1pX2Jp
bmQgbmVjZXNzYXJ5LgoKVGVjaG5pY2FsbHkgSSBzZWUgbm8gcHJvYmxlbSB0byBsZXQgdGhlIGNv
bXBpbGVyIGRvIHRoZSBtdWx0aXBsaWNhdGlvbiwKbXkgaXNzdWUgaXMgdGhhdCBpdCBldmVyIHNv
IHNsaWdodGx5IG9iZnVzY2F0ZXMgdGhlIGNvZGUuIEluc3RlYWQgb2YKanVzdCB3cml0aW5nICIq
IDQiIGluIHR3byBmdW5jdGlvbnMsIHdlIGdldCBhIG5ldyB1bmlvbiB0aGF0IHlvdSBuZWVkIHRv
Cmtub3cgYWJvdXQgd2hlbiBsb29raW5nIGF0IHN0cnVjdCBkd19oZG1pIGFuZCBkd19oZG1pX2Jp
bmQsIHJlZ3MucDggaXMKdXNlZCBidXQgbmV2ZXIgYXNzaWduZWQgZGlyZWN0bHksIGl0J3MganVz
dCBhIHRpbnkgYml0IG9mIGFkZGl0aW9uYWwKZWZmb3J0IG5lZWRlZCB0byB1bmRlcnN0YW5kIHRo
ZSBjb2RlLiBCdXQgd2hlbiB0aGUgY29zdCB0byBhdm9pZCB0aGF0IGlzCnNvIHNtYWxsLi4uCgpy
ZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

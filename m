From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v3 0/5] Versatile Express DT support
Date: Tue, 29 Nov 2011 17:16:59 +0000
Message-ID: <1322587019.3164.111.camel@hornet.cambridge.arm.com>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <20111129170013.GD2829@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111129170013.GD2829@localhost.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <dave.martin@linaro.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDExLTExLTI5IGF0IDE3OjAwICswMDAwLCBEYXZlIE1hcnRpbiB3cm90ZToKPiBJ
J20gdHJ5aW5nIHRvIGJ1aWxkLi4uIHdoYXQgdHJlZSBhcmUgeW91IGJhc2luZyBvbj8KCnYzLjIt
cmMzOgoKJCBnaXQgbG9nIC0tb25lbGluZSBIRUFELi4udjMuMi1yYzN+CjNiOWRmMWUgQVJNOiB2
ZXhwcmVzczogRFQtYmFzZWQgc3VwcG9ydCBmb3IgQ29yZVRpbGVzIEV4cHJlc3MgQTV4MiBhbmQg
QTl4NAo1YTFjNTY1IEFSTTogdmV4cHJlc3M6IEluaXRpYWwgUlMxIG1lbW9yeSBtYXAgc3VwcG9y
dAo5MzU1ZThhIEFSTTogdmV4cHJlc3M6IEFkZCBEVCBzdXBwb3J0IGluIHYybQowNTI5YmQ2IEFS
TTogdmV4cHJlc3M6IEdldCByaWQgb2YgTU1JT19QMlYKNjgxMThjYyBBUk06IHZlcnNhdGlsZTog
QWRkIG1pc3NpbmcgRU5EUFJPQyB0byBoZWFkc21wLlMKY2FjYTZhMCBMaW51eCAzLjItcmMzCgo+
IFdpdGggdjMuMi1yYzMgb3IgbmV4dCwgSSBnZXQgT0YgaGVhZGVyIGZhaWx1cmVzIGxpa2UgdGhl
IGZvbGxvd2luZzoKPiAKPiBhcmNoL2FybS9rZXJuZWwvZGV2dHJlZS5jOiBJbiBmdW5jdGlvbiDi
gJhhcm1fZHRfbWVtYmxvY2tfcmVzZXJ2ZeKAmToKPiBhcmNoL2FybS9rZXJuZWwvZGV2dHJlZS5j
OjQxOjc6IGVycm9yOiDigJhpbml0aWFsX2Jvb3RfcGFyYW1z4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+IGFyY2gvYXJtL2tlcm5lbC9kZXZ0cmVlLmM6NDE6Nzog
bm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZv
ciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KWy4uLl0KCkNhbiB5b3Ugc2VuZCBtZSB5b3Vy
IGNvbmZpZywgcGxlYXNlPwoKQWxzbywgSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IHlvdSBuZWVk
IFJvYidzICJvZi9pcnE6IG9mX2lycV9pbml0OiBhZGQKY2hlY2sgZm9yIHBhcmVudCBlcXVhbCB0
byBjaGlsZApub2RlIiAoaHR0cDovL2FydGljbGUuZ21hbmUub3JnL2dtYW5lLmxpbnV4Lmtlcm5l
bC8xMjIxMDUxKSB0byBnZXQgdGhpcwp3b3JraW5nLgoKQ2hlZXJzIQoKUGF3ZcWCCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

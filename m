From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC 2/3] nvmem: add driver for Raspberry Pi OTP
Date: Tue, 18 Sep 2018 16:40:07 +0200
Message-ID: <af2c4e75-816c-b9a0-00f1-5e60a0e19036@i2se.com>
References: <1520602328-28972-1-git-send-email-stefan.wahren@i2se.com>
 <1520602328-28972-3-git-send-email-stefan.wahren@i2se.com>
 <7c1f6ee8-9572-463f-ccc8-3d12ffccb8f5@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7c1f6ee8-9572-463f-ccc8-3d12ffccb8f5@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Eric Anholt <eric@anholt.net>, Phil Elwell <phil@raspberrypi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGkgU3Jpbml2YXMsCgoKQW0gMTEuMDcuMjAxOCB1bSAxMTo0NSBzY2hyaWViIFNyaW5pdmFzIEth
bmRhZ2F0bGE6Cj4gSGkgU3RlZmFuLAo+Cj4gT24gMDkvMDMvMTggMTM6MzIsIFN0ZWZhbiBXYWhy
ZW4gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggYnJpbmdzIHJlYWQtb25seSBzdXBwb3J0IGZvciB0aGUg
UmFzcGJlcnJ5IFBpIEN1c3RvbWVyIE9UUC4KPj4gVGhlIGRyaXZlciBhY2Nlc3NlcyB0aGUgT1RQ
IHZpYSB0aGUgbWFpbGJveCBwcm9wZXJ0eSBpbnRlcmZhY2UKPj4gcHJvdmlkZWQgYnkgdGhlIFZQ
VSBmaXJtd2FyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIFdhaHJlbiA8c3RlZmFuLndh
aHJlbkBpMnNlLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvbnZtZW0vS2NvbmZpZ8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxMCArKysKPj4gwqAgZHJpdmVycy9udm1lbS9NYWtlZmlsZcKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPj4gwqAgZHJpdmVycy9udm1lbS9yYXNwYmVycnlwaS1v
dHAuYyB8IDEzOAo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTUwIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbnZtZW0vcmFzcGJlcnJ5cGktb3RwLmMKPgo+IExvb2tzIHRoZXJlIGFy
ZSBzb21lIHBlbmRpbmcgdHJpdmlhbCBjb21tZW50cywgYXJlIHlvdSBwbGFubmluZyB0bwo+IHJl
c2VuZCB0aGlzPwoKeWVzLCBidXQgdGhpcyBzZXJpZXMgY3VycmVudGx5IGhhdmUgbG93IHByaW8u
CgpSZWdhcmRzClN0ZWZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=

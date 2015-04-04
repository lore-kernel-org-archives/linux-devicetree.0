From: Roman Volkov <v1ron@v1ros.org>
Subject: Re: [PATCH v3 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Sat, 4 Apr 2015 15:27:20 +0300
Message-ID: <20150404152720.1059e741@v1ron-s7>
References: <1423130878-3894-1-git-send-email-v1ron@v1ros.org>
 <1425226007-2757-1-git-send-email-rvolkov@v1ros.org>
 <2119510.55A8Br1LeL@wuerfel> <20150301233911.2352ce48@v1ron-s7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150301233911.2352ce48@v1ron-s7>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Roman Volkov <rvolkov@v1ros.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>, Rob Herring <robh+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

0JIgU3VuLCAxIE1hciAyMDE1IDIzOjM5OjExICswMzAwClJvbWFuIFZvbGtvdiA8cnZvbGtvdkB2
MXJvcy5vcmc+INC/0LjRiNC10YI6Cgo+INCSIFN1biwgMDEgTWFyIDIwMTUgMjA6NTI6NTUgKzAx
MDAKPiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiDQv9C40YjQtdGCOgo+IAo+ID4gT24g
U3VuZGF5IDAxIE1hcmNoIDIwMTUgMTk6MDY6NDUgUm9tYW4gVm9sa292IHdyb3RlOgo+ID4gPiBU
aGlzIHBhdGNoIHNldCBlbmFibGVzIFNEIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgV004NjUwIGFu
ZAo+ID4gPiBmaXhlcyBtaW5vciBlcnJvcnMgaW4gV004NTA1IERldmljZSBUcmVlIGZpbGUuCj4g
PiA+IAo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAxLiBBZGQgbWlub3IgZml4ZXMgZm9yIFdN
ODUwNSBTREhDIG5vZGUKPiA+ID4gCj4gPiA+IFRlc3RlZCBvbiBib3RoIFdNODUwNSBhbmQgV004
NjUwLgo+ID4gPiAKPiA+ID4gUm9tYW4gVm9sa292ICgyKToKPiA+ID4gICBkdHM6IHZ0ODUwMDog
QWRkIFNESEMgbm9kZSB0byBEVFMgZmlsZSBmb3IgV004NjUwCj4gPiA+ICAgZHRzOiB2dDg1MDA6
IEZpeCBlcnJvcnMgaW4gU0RIQyBub2RlIGZvciBXTTg1MDUKPiA+ID4gCj4gPiA+ICBhcmNoL2Fy
bS9ib290L2R0cy93bTg1MDUuZHRzaSB8IDQgKystLQo+ID4gPiAgYXJjaC9hcm0vYm9vdC9kdHMv
d204NjUwLmR0c2kgfCA5ICsrKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gLS0gCj4gPiA+IEhpIG1haW50
YWluZXJzLCBJIHNlZSBteSBwcmV2aW91cyB2ZXJzaW9ucyB3ZXJlIG5vdCBhcHBsaWVkLiBDb3Vs
ZAo+ID4gPiB0aGlzIGxpdHRsZSBwYXRjaCBzZXQgYmUgYXBwbGllZCBmb3IgdGhlIGxpbnV4LW5l
eHQ/IEkgZG9uJ3QgdGhpbmsKPiA+ID4gdGhpcyBpcyBuZXcgZnVuY3Rpb25hbGl0eSwgdGhpcyBt
dXN0IGJlIGNvbnNpZGVyZWQgYXMgYnVnZml4IGZvcgo+ID4gPiBleGlzdGluZyBEZXZpY2UgVHJl
ZS4KPiA+ID4gCj4gPiA+IEFueSBvdGhlciBzdWdnZXN0aW9ucz8KPiA+IAo+ID4gQWNjb3JkaW5n
IHRvIHRoZSBNQUlOVEFJTkVSUyBmaWxlLCBUb255IFByaXNrIHNob3VsZCBiZSB0aGUgcGVyc29u
Cj4gPiB0byBwaWNrIHRoZW0gdXAsIGJ1dCBoZSB3YXMgbm90IHRoZSByZWNpcGllbnQgb2YgdGhl
IG1haWwuCj4gPiAKPiA+IAlBcm5kCj4gCj4gVGhhbmtzIGZvciB0aGUgdGlwLiBUb255IHByb2Jh
Ymx5IG5lZWQgdG8gYWRkIHRoZXNlIGZpbGVzIHRvIGhpcyBsaXN0Cj4gb2YgbWFpbnRhaW5lZCBm
aWxlcy4gZ2V0X21haW50YWluZXIucGwgZG9lc24ndCBtZW50aW9uIGhpbS4KPiAKPiBSb21hbgoK
QXJuZCwKCk5vIHJlc3BvbnNlIHlldCBmcm9tIFRvbnkgZm9yIG92ZXIgYSBtb250aC4KClJvbWFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==

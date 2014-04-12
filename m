From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: [PATCH 3/4] ALSA: sound/atmel/ac97c.c: Add device tree support
Date: Sat, 12 Apr 2014 12:42:18 +0200
Message-ID: <5369289.Xz059aMMT6@kongar>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de>
 <1397293707-26890-4-git-send-email-alexanders83@web.de>
 <1397298688.295112408@f331.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397298688.295112408@f331.i.mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Pawel Moll <pawel.moll@arm.com>, linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gU2F0dXJkYXkgMTIgQXByaWwgMjAxNCwgMTQ6MzE6Mjggd3JvdGUgQWxleGFuZGVyIFNoaXlh
bjoKPiBTYXQsIDEyIEFwciAyMDE0IDExOjA4OjI2ICswMjAwINC+0YIgQWxleGFuZGVyIFN0ZWlu
IDxhbGV4YW5kZXJzODNAd2ViLmRlPjoKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVp
biA8YWxleGFuZGVyczgzQHdlYi5kZT4KPiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvdW5kL2F0bWVsX2FjOTdjLnR4dCAgICAgIHwgMjAgKysrKysrKysrCj4gPiAgc291bmQv
YXRtZWwvYWM5N2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1MiArKysrKysr
KysrKysrKysrKysrKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvYXRtZWxfYWM5N2MudHh0Cj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvYXRtZWxfYWM5N2MudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2F0bWVsX2FjOTdjLnR4
dAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAuLjk4Mzk0MDMKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb3VuZC9hdG1lbF9hYzk3Yy50eHQKPiA+IEBAIC0wLDAgKzEsMjAgQEAKPiA+ICsqIEF0bWVs
IEFDOTcgY29udHJvbGxlcgo+ID4gKwo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiArICAt
IGNvbXBhdGlibGU6ICJhdG1lbCxhdG1lbF9hYzk3YyIKPiA+ICsgIC0gcmVnOiBBZGRyZXNzIGFu
ZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVyIHNldCBmb3IgdGhlIGRldmljZQo+ID4gKyAgLSBpbnRl
cnJ1cHRzOiBTaG91bGQgY29udGFpbiBBQzk3IGludGVycnVwdAo+ID4gKyAgLSBhdG1lbCxyZXNl
dC1waW46IEdQSU8gZm9yIHJlc2V0dGluZyB0aGUgY29kZWMKPiAKPiBXaHkgc3RhbmRhcmQgImdw
aW9zIiBwcm9wZXJ0eSBjYW5ub3QgYmUgdXNlZCBoZXJlPwoKSSBndWVzcyB0aGV5IGNhbi4gSSBo
YXZlIG5vIGV4cGVyaWVuY2UgZGVmaW5pbmcgYSBkZXZpY2V0cmVlIGJpbmRpbmcsIHNvIEkganVz
dCBzdHVjayB0byB0aGUgcGxhdGZvcm1kYXRhIG1lbWJlciBuYW1lLgpJZiB0aGlzIGlzIHRoZSBy
ZWNvbW1lbmRlZCB3YXksIEknbGwgZ2xhZGx5IGNoYW5nZSB0aGF0LgoKQWxleGFuZGVyCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=

From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 0/2] USB: DTS: allow suggesting
 busnumber for platform USB bus via DTS alias
Date: Tue, 11 Dec 2018 16:42:42 -0600
Message-ID: <20181211224242.GA21950@bogus>
References: <20181127165705.GA13460@lagavulin.indurad.x>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <systemd-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20181127165705.GA13460@lagavulin.indurad.x>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/systemd-devel>,
 <mailto:systemd-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/systemd-devel>
List-Post: <mailto:systemd-devel@lists.freedesktop.org>
List-Help: <mailto:systemd-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/systemd-devel>,
 <mailto:systemd-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: systemd-devel-bounces@lists.freedesktop.org
Sender: "systemd-devel" <systemd-devel-bounces@lists.freedesktop.org>
To: "David R. Piegdon" <lkml@p23q.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-usb@vger.kernel.org, Kay Sievers <kay@vrfy.org>, Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, systemd-devel@lists.freedesktop.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDQ6NTc6MDVQTSArMDAwMCwgRGF2aWQgUi4gUGllZ2Rv
biB3cm90ZToKPiBIaSwKPiAKPiBvbiBvdXIgZW1iZWRkZWQgc3lzdGVtcyB3ZSByZWx5IG9uIHN5
c3RlbWQncyBwZXJzaXN0ZW50IG5ldGRldiBuYW1lcy4KPiBUaG9zZSBjdXJyZW50bHkgZG8gbm90
IHdvcmsgZm9yIFVTQiBuZXRkZXZzIHRoYXQgYXJlIGNvbm5lY3RlZCB0byBhCj4gcGxhdGZvcm0g
VVNCIGJ1cy4KPiAKPiBJbiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL3B1bGwv
NzI3MyBhIHN5c3RlbWQgcGF0Y2ggd2FzCj4gc3VnZ2VzdGVkIHRoYXQgd291bGQgYWxsb3cgZXhh
Y3RseSB0aGlzLCBidXQgaXQgd2FzIChyaWdodGZ1bGx5KSBzYWlkCj4gdGhhdCBudW1iZXJpbmcg
b2YgdGhlc2VzIGJ1c3NlcyBpcyBub3QgZ3VhcmFudGVlZC4gSW50ZXJuYWxseSB3ZSB1c2VkCj4g
dGhlIHBhdGNoIGZvciBhIHdoaWxlIG5vdywgYnV0IGV4YWN0bHkgdGhhdCBoYXMgaGFwcGVuZWQg
d2l0aCBvbmUgb2Ygb3VyCj4gcGxhdGZvcm1zIGFjcm9zcyBkaWZmZXJlbnQga2VybmVsIHJldmlz
aW9ucy4KPiAKPiBUaGUgZm9sbG93aW5nIGtlcm5lbCBwYXRjaGVzIGFsbG93IHN1Z2dlc3Rpbmcg
YSBVU0IgYnVzbnVtYmVyIGZvciBlYWNoCj4gVVNCIHBsYXRmb3JtIGJ1cyB2aWEgYSBEVFMgYWxp
YXMsIGFzIGNhbiBiZSBkb25lIHNpbWlsYXJseSBmb3IgbWFueQo+IG90aGVyIGRldmljZXMuCj4g
SW4gY29tYmluYXRpb24gd2l0aCBhYm92ZSBzeXN0ZW1kIHBhdGNoLCB0aGVzZSBjaGFuZ2VzIGFs
bG93IHVzZSBvZgo+IHBlcnNpc3RlbnQgbmV0ZGV2IG5hbWVzIGFsc28gb24gcGxhdGZvcm0gVVNC
IGJ1c3Nlcy4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBkb2luZyB3aGF0IHdhcyBzdWdnZXN0ZWQg
aW4gdGhlIGxpbmsgYWJvdmUuIFRob3VnaCAKSSdtIG5vdCBmYW1pbGlhciB3aXRoIHdoYXQgQUNQ
SSBwcm92aWRlcy4gVXNlcnNwYWNlIHdvdWxkIHN0aWxsIGJlIApyZWx5aW5nIG9uIHRoZSBMaW51
eCBlbnVtZXJhdGlvbiBudW1iZXJpbmcuIEhvdyB3b3VsZCB1c2Vyc3BhY2UgdGVsbCBpZiAKdGhh
dCBudW1iZXJpbmcgaXMgcGVyc2lzdGVudCBvciBub3Qgb3RoZXIgdGhhbiBsb29raW5nIGF0IHRo
ZSBEVCBpdHNlbGYgCih3aGljaCBpc24ndCBhIGdvb2Qgc29sdXRpb24gZWl0aGVyKT8KCkkgZG9u
J3QgdW5kZXJzdGFuZCB0aG91Z2ggd2h5IHVzZXJzcGFjZSBuZWVkcyBhbnl0aGluZyBtb3JlIHRo
YXQgdGhlIG1hYyAKYWRkcmVzcyBvZiBhIG5ldCBkZXZpY2UgdG8gcHJvdmlkZSBhIHBlcnNpc3Rl
bnQgbmFtZS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpzeXN0ZW1kLWRldmVsIG1haWxpbmcgbGlzdApzeXN0ZW1kLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3N5c3RlbWQtZGV2ZWwK

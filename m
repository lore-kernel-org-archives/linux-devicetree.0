From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: enable SDIO Wi-Fi on Orange Pi Zero
Date: Wed, 30 Nov 2016 09:25:01 +0000
Message-ID: <da84928a-25a2-1615-1d8e-e6570b1a6323@arm.com>
References: <20161129131922.JFbeipav@smtp2o.mail.yandex.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161129131922.JFbeipav@smtp2o.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksCgpPbiAyOS8xMS8xNiAxMDoxOSwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiAKPiAyMDE25bm0
MTHmnIgyOeaXpSAxNToxNuS6jiBBbGV4ZXkgS2FyZGFzaGV2c2tpeSA8YWlrQG96bGFicy5ydT7l
hpnpgZPvvJoKPj4KPj4KPj4KPj4gT24gV2VkLCBOb3YgMjMsIDIwMTYgYXQgNjo1OSBQTSwgTWF4
aW1lIFJpcGFyZAo+IDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ryb25zLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4gSGksCj4+Pgo+Pj4gT24gVHVlLCBOb3YgMjIsIDIwMTYgYXQgMTI6MjQ6MjFBTSArMDgw
MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+ID4gVGhlcmUncyBhIEFsbHdpbm5lcidzIFhSODE5
IFNESU8gV2ktRmkgbW9kdWxlIHNvbGRlcmVkIG9uIHRoZSBib2FyZCBvZgo+Pj4gPiBPcmFuZ2Ug
UGkgWmVybywgd2hpY2ggdXNlZCBhIGRlZGljYXRlZCByZWd1bGF0b3IgdG8gcG93ZXIuCj4+PiA+
Cj4+PiA+IEFkZCB0aGUgZGV2aWNlIHRyZWUgbm9kZSBvZiB0aGUgcmVndWxhdG9yLCB0aGUgZW5h
YmxlIGdwaW8gKHdpdGgKPj4+ID4gbW1jLXB3cnNlcSkgYW5kIHRoZSBzZGlvIGNvbnRyb2xsZXIu
Cj4+PiA+Cj4+PiA+IFRoZXJlJ3MgYSBvdXQtb2YtdHJlZSBkcml2ZXIgdGVzdGVkIHRvIHdvcmsg
d2l0aCB0aGlzIGRldmljZSB0cmVlLgo+Pgo+Pgo+PiBidHcgY291bGQgeW91IHBsZWFzZSBnaXZl
IGEgcG9pbnRlciB3aGVyZSB0byBmaW5kIGEgWFI4MTkgZHJpdmVyIGZvcgo+IHJlbGF0aXZlbHkg
cmVjZW50IGtlcm5lbCAoNC44IG1heSBiZSwganVzdCBub3QgMy40KT8gVGhhbmtzLgo+IAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9JY2Vub3d5L3hyYWRpbwoKSSB3YXMganVzdCBjdXJpb3VzLCBzbyBw
dWxsZWQgeW91ciB0cmVlIGFuZCB0cmllZCB0byBqdXN0IGNvbXBpbGUgaXQuIEl0CnN0aWxsIHRo
cmV3IHdhcm5pbmdzIGF0IG1lIGZvciBBUk0sIGFuZCBldmVuIG1vcmUgc28gZm9yIGFybTY0LgpJ
IGZpeGVkIGFsbCBvZiB0aGVtIGFuZCBwdXQgdGhhdCBvbiBteSBnaXRodWJbMV0uIEZlZWwgZnJl
ZSB0byBqdXN0IHBpY2sKdGhlbSBmcm9tIHRoZXJlIG9yIHdhaXQgdGlsbCBJIG1hbmFnZSB0byBj
bGVhbiB0aGVtIHVwIGFuZCBzZW5kIHlvdSBhCnB1bGwgcmVxdWVzdC4KQW5kIGFsc28ganVzdCBh
IGEgdGVzdCwgSSBxdWlja2x5IHB1dCBpdCBpbiBkcml2ZXJzL25ldC93aXJlbGVzcy94cmFkaW8s
CndoZXJlIGl0IGNvbXBpbGVkIGZpbmUgYWZ0ZXIgcmVnaXN0ZXJpbmcgaXQgd2l0aCB0aGUgdXBw
ZXIgbGV2ZWwgS2NvbmZpZwphbmQgTWFrZWZpbGUuCgpBbmQgd2hpbGUgbG9va2luZyBhdCBpdDog
VGhpcyBsb29rcyBsaWtlIHR5cGljYWwgQVcgY29kZSwgbm90IGV2ZW4KcmVtb3RlbHkgdXBzdHJl
YW1lYWJsZSBhbmQgcHJvYmFibHkgZmFyIHRvbyBjb21wbGljYXRlZC4gRW5hYmxpbmcgc29tZQpL
Y29uZmlnIG9wdGlvbnMgbWFkZSBpdCBjb21wbGFpbiBhYm91dCBtaXNzaW5nIGZ1bmN0aW9ucy4K
SGFzIGFueW9uZSBjaGVja2VkIGlmIHRoaXMgaXMgY2xvc2UgdG8gYW4gZXhpc3RpbmcgV2lGaSBj
aGlwPyBUaGF0CndvdWxkbid0IGJlIGEgZmlyc3QgOy0pCgpDaGVlcnMsCkFuZHJlLgoKWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9hcHJpdHplbC94cmFkaW8vY29tbWl0cy9xdWlja2ZpeGVzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2Vy
bmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVs
Cg==

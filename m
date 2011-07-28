From: Mike Frysinger <vapier.adi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
Date: Wed, 27 Jul 2011 17:06:08 -0700
Message-ID: <CAMjpGUcftT47FTVv15LDvswiXJdnorDiotEWkNDPkw5ABiQDQg@mail.gmail.com>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
	<20110727144501.7e0420cd@schlenkerla.am.freescale.net>
	<20110727195512.GC3001@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110727195512.GC3001@gallagher>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBKdWwgMjcsIDIwMTEgYXQgMTI6NTUsIEphbWllIElsZXMgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMjcsIDIwMTEgYXQgMDI6NDU6MDFQTSAtMDUwMCwgU2NvdHQgV29vZCB3cm90ZToKPj4g
T24gV2VkLCAyNyBKdWwgMjAxMSAxNTowMzozMCArMDEwMAo+PiBKYW1pZSBJbGVzIDxqYW1pZUBq
YW1pZWlsZXMuY29tPiB3cm90ZToKPj4KPj4gPiAtLS0gL2Rldi9udWxsCj4+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9ncGlvLW5hbmQudHh0Cj4+ID4gQEAg
LTAsMCArMSw0MyBAQAo+PiA+ICtHUElPIGFzc2lzdGVkIE5BTkQgZmxhc2gKPj4gPiArCj4+ID4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+ID4gKy0gY29tcGF0aWJsZSA6ICJncGlvLW5hbmQiCj4+
ID4gKy0gcmVnIDogc2hvdWxkIHNwZWNpZnkgbG9jYWxidXMgY2hpcCBzZWxlY3QgYW5kIHNpemUg
dXNlZCBmb3IgdGhlIGNoaXAuIMKgRm9yCj4+ID4gKyDCoEFSTSBwbGF0Zm9ybXMgd2hlcmUgYSBk
dW1teSByZWFkIGlzIG5lZWRlZCB0byBwcm92aWRlIHN5bmNocm9uaXNhdGlvbiB3aXRoCj4+ID4g
KyDCoHJlZ2FyZHMgdG8gYnVzIHJlb3JkZXJpbmcsIGFuIG9wdGlvbmFsIHNlY29uZCByZXNvdXJj
ZSBkZXNjcmliZXMgdGhlCj4+ID4gKyDCoGxvY2F0aW9uIHRvIHJlYWQgZnJvbS4KPj4KPj4gSSBk
b24ndCBzZWUgaG93IGEgcHVyZSAiZ3BpbyBuYW5kIiBkZXZpY2Ugd291bGQgaGF2ZSBhbnkgbWVt
b3J5IG1hcHBlZAo+PiBJL08uIMKgSSB0aGluayB5b3UgbmVlZCBhIG1vcmUgc3BlY2lmaWMgY29t
cGF0aWJsZSBmb3IgdGhpcy4KPgo+IE9LLCBmYWlyIHBvaW50LiDCoEknbSBub3Qgc3VyZSB3aGF0
IGEgYmV0dGVyIG5hbWUgd291bGQgYmUgdGhvdWdoLCBtYXliZQo+IGdwaW8tYXNzaXN0ZWQtbmFu
ZD8KCmZ3aXcsIGkgbmFtZWQgdGhlIHBhcmFsbGVsIGZsYXNoIG1hcHBpbmcgZHJpdmVyICJncGlv
LWFkZHItZmxhc2giCih3aGVyZSBzb21lIG9mIHRoZSBhZGRyZXNzIGxpbmVzIGFyZSBkb25lIHdp
dGggR1BJT3MpCi1taWtlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNz
QGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2Rldmlj
ZXRyZWUtZGlzY3Vzcwo=

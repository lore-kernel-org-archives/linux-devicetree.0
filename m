From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
Date: Thu, 03 Jan 2013 15:39:08 +0400
Message-ID: <50E56DDC.8060804@mvista.com>
References: <1343632944-25971-1-git-send-email-hs@denx.de>
 <50E48DFD.2030908@mvista.com> <50E52D26.9010004@denx.de>
 <50E56AED.1000509@mvista.com>
 <1357212752.16197.127.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357212752.16197.127.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, hs-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGVsbG8uCgpPbiAwMy0wMS0yMDEzIDE1OjMyLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cgo+Pj4+
PiArI2lmIGRlZmluZWQoQ09ORklHX09GKQo+Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgZGF2aW5jaV9uYW5kX29mX21hdGNoW10gPSB7Cj4+Pj4+ICsgICAgey5jb21wYXRp
YmxlID0gInRpLGRhdmluY2ktbmFuZCIsIH0sCj4+Pj4+ICsgICAge30sCj4+Pj4+ICt9Cj4+Pj4+
ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkYXZpbmNpX25hbmRfb2ZfbWF0Y2gpOwoKPj4+IEht
bS4uIG1heWJlIHRoaXMgY3JlcHQgaW4gbGF0ZXIgYWZ0ZXIgSSBzZW50IHRoZSBwYXRjaGVzPyBU
aGV5IHdlcmUKPj4+IHBlbmRpbmcgZm9yIGEgd2hpbGUgLi4uIEkgY29tcGlsZWQgaXQganVzdCB5
ZXQgYWdhaW4gKGJhc2VkIG9uIG15Cj4+PiB0cmVlIHdoZW4gSSBwb3N0ZWQgdGhpcyBwYXRjaCBi
YXNlZCBvbiBjb21taXQ6Cgo+PiAgICAgIEkndmUganVzdCBjaGVja2VkIHRoZSBhcmNoaXZlczog
ZXZlcnkgcGF0Y2ggdmVyc2lvbiB5b3UgcG9zdGVkIGhhZCAnOycKPj4gYWZ0ZXIgJ30nIG1pc3Np
bmcuCgo+IElmIGl0IHdhcyBidWlsdC1pbiwgcmF0aGVyIHRoYW4gYXMgYSBtb2R1bGUsIHRoZW4g
TU9EVUxFX0RFVklDRV9UQUJMRSjigKYpCj4gZXhwYW5kcyB0byBub3RoaW5nLCBhbmQgdGhlIHN0
cnVjdHVyZSBnZXRzIHRvIHVzZSB0aGUgc2VtaWNvbG9uIGZyb20gdGhlCj4gZW5kIG9mIHRoYXQg
bGluZS4KCiAgICBBaCwgdGhhdCBleHBsYWlucyBpdDogJ2RhdmluY2lfYWxsX2RlZmNvbmZpZycg
aGFzIApDT05GSUdfTVREX05BTkRfREFWSU5DST1tLCBzbyB0aGF0J3MgaG93IHRoZSBlcnJvciBn
b3QgdHJpZ2dlcmVkIGF0IGxhc3QuIApQcm9iYWJseSB3b3J0aCBhZGRpbmcgdGhpcyBleHBsYW5h
dGlvbiB0byB0aGUgY2hhbmdlbG9nLCBob3cgZG8geW91IHRoaW5rPwoKV0JSLCBTZXJnZWkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUt
ZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcK
aHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=

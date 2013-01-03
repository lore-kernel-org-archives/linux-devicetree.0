From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
Date: Thu, 03 Jan 2013 20:56:47 +0300
Message-ID: <50E5C65F.3050804@mvista.com>
References: <1343632944-25971-1-git-send-email-hs@denx.de>
 <50E48DFD.2030908@mvista.com> <50E52D26.9010004@denx.de>
 <50E56AED.1000509@mvista.com>
 <1357212752.16197.127.camel@shinybook.infradead.org>
 <50E56DDC.8060804@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50E56DDC.8060804-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
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

SGVsbG8uCgpPbiAwMS8wMy8yMDEzIDAyOjM5IFBNLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6Cgo+
Pj4+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19PRikKPj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBkYXZpbmNpX25hbmRfb2ZfbWF0Y2hbXSA9IHsKPj4+Pj4+ICsgICAgey5j
b21wYXRpYmxlID0gInRpLGRhdmluY2ktbmFuZCIsIH0sCj4+Pj4+PiArICAgIHt9LAo+Pj4+Pj4g
K30KPj4+Pj4+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkYXZpbmNpX25hbmRfb2ZfbWF0Y2gp
OwoKPj4+PiBIbW0uLiBtYXliZSB0aGlzIGNyZXB0IGluIGxhdGVyIGFmdGVyIEkgc2VudCB0aGUg
cGF0Y2hlcz8gVGhleSB3ZXJlCj4+Pj4gcGVuZGluZyBmb3IgYSB3aGlsZSAuLi4gSSBjb21waWxl
ZCBpdCBqdXN0IHlldCBhZ2FpbiAoYmFzZWQgb24gbXkKPj4+PiB0cmVlIHdoZW4gSSBwb3N0ZWQg
dGhpcyBwYXRjaCBiYXNlZCBvbiBjb21taXQ6Cgo+Pj4gICAgICBJJ3ZlIGp1c3QgY2hlY2tlZCB0
aGUgYXJjaGl2ZXM6IGV2ZXJ5IHBhdGNoIHZlcnNpb24geW91IHBvc3RlZCBoYWQgJzsnCj4+PiBh
ZnRlciAnfScgbWlzc2luZy4KCj4+IElmIGl0IHdhcyBidWlsdC1pbiwgcmF0aGVyIHRoYW4gYXMg
YSBtb2R1bGUsIHRoZW4gTU9EVUxFX0RFVklDRV9UQUJMRSjigKYpCj4+IGV4cGFuZHMgdG8gbm90
aGluZywgYW5kIHRoZSBzdHJ1Y3R1cmUgZ2V0cyB0byB1c2UgdGhlIHNlbWljb2xvbiBmcm9tIHRo
ZQo+PiBlbmQgb2YgdGhhdCBsaW5lLgoKPiAgICBBaCwgdGhhdCBleHBsYWlucyBpdDogJ2Rhdmlu
Y2lfYWxsX2RlZmNvbmZpZycgaGFzIENPTkZJR19NVERfTkFORF9EQVZJTkNJPW0sCj4gc28gdGhh
dCdzIGhvdyB0aGUgZXJyb3IgZ290IHRyaWdnZXJlZCBhdCBsYXN0LiBQcm9iYWJseSB3b3J0aCBh
ZGRpbmcgdGhpcwo+IGV4cGxhbmF0aW9uIHRvIHRoZSBjaGFuZ2Vsb2csIGhvdyBkbyB5b3UgdGhp
bms/CgogICBPSywgSSB0YWtlIHlvdXIgc2lsZW5jZSBhcyBhIHNpZ24gb2YgY29uc2VudC4gQ2hh
bmdlbG9nIGluZGVlZCBuZWVkcyB0byBiZQpyZXdyaXR0ZW4gYSBiaXQgbm93LgoKV0JSLCBTZXJn
ZWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmlj
ZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFi
cy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vz
cwo=

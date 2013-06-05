From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 21/21] clk: ux500: Supply provider look-up functionality
 to support Device Tree
Date: Wed, 5 Jun 2013 09:05:22 +0100
Message-ID: <20130605080522.GP3370@gmail.com>
References: <1370266965-7901-1-git-send-email-lee.jones@linaro.org>
 <1370266965-7901-22-git-send-email-lee.jones@linaro.org>
 <CACRpkdaNMR=6JT+pi+9aqOJXW3gK9Yb4hztx3rOiY3c+f3UTRA@mail.gmail.com>
 <201306042252.03340.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201306042252.03340.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus WALLEIJ <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Srinidhi KASAGAR <srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAwNCBKdW4gMjAxMywgQXJuZCBCZXJnbWFubiB3cm90ZToKCj4gT24gVHVlc2RheSAw
NCBKdW5lIDIwMTMsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBUaGUgd2hvbGUgdGhpbmcgaXMg
dmVyeSBkaWZmZXJlbnQgZnJvbSBvdGhlciBEVCBjbG9jayB0aGluZ3MKPiA+IEkndmUgc2Vlbiwg
dXN1YWxseSB5b3UgYWRkIGEgY29tcGF0aWJsZSBub2RlIGZvciBlYWNoCj4gPiBjbG9jayB0eXBl
LCBhbmQgYSBub2RlIGZvciBlYWNoIHBoeXNpY2FsIGdhdGUuIEJ1dCB0aGVyZQo+ID4gbWF5IGJl
IHNldmVyYWwgd2F5cyB0byBza2luIHRoaXMgY2F0Li4uCj4gPiAKPiAKPiBCYXNlZCBvbiB0aGUg
SVJDIGRpc2N1c3Npb24gd2UgaGFkLCBJIHdvdWxkIHRoaW5rIHRoYXQgdGhlICJwcmNjIiBjbG9j
a3MKPiB3b3VsZCBiZXN0IGJlIHJlcHJlc2VudGVkIHVzaW5nIG11bHRpcGxlIGNsb2NrLWNlbGxz
IHNpbmNlIHlvdSBjYW4gZGVzY3JpYmUKPiB0aGVtIGVhc2lseSBhIHR1cGxlIG9mIHJlZ2lzdGVy
IGluZGV4LCBiaXQgbnVtYmVyIHNvbWUgd2F5IHRvIGRpc3Rpbmd1aXNoCj4gdGhlIHR3byB0eXBl
cy4KPiAKPiBUaGUgInByY211IiBjbG9ja3MgYXJlIGhhcmRlciwgYW5kIHdlIHByb2JhYmx5IG5l
ZWQgZWl0aGVyIGEgbW9yZSB2ZXJib3NlCj4gcmVwcmVzZW50YXRpb24gdXNpbmcgb25lIG5vZGUg
cGVyIGNsb2NrIHRoZXJlLCBvciBoYXZlIGEgc2luZ2xlIG5vZGUKPiBmb3IgdGhlIGVudGlyZSBw
cmNtdSBhbmQgbm90IGJvdGhlciB0byBkZXNjcmliZSB0aGVtIGluIERUIGJ1dCBoYXJkY29kZQo+
IGV2ZXJ5dGhpbmcgaW4gdGhlIHNvdXJjZS4gVGhlIGN1cnJlbnQgcGF0Y2ggZG9lcyB0aGUgbGF0
dGVyLCB3aGljaCBpcwo+IGVhc2llciBub3cgYnV0IG1lYW5zIHdlIGNhbm5vdCBzaW1wbGlmeSB0
aGUgY29kZSBtdWNoIGluIHRoZSBmdXR1cmUKPiB3aGVuIHdlIHJlbW92ZSBBVEFHUyBib290IHN1
cHBvcnQuCgpBcyBhbHJlYWR5IGRpc2N1c3NlZCwgaW4gdGhlIFBSQ01VIGNhc2UgSSdtIGdvaW5n
IHRvIG1ha2UgJ2VudW0KcHJjbXVfY2xvY2sgeycgbG9vayBsaWtlIHJlZ2lzdGVyIFBSQ01fWVlD
TEtFTjBfTUdUX1NFVCBhcyBkZXNjcmliZWQKYnkgdGhlIGRlc2lnbiBzcGVjaWZpY2F0aW9uLCBh
bmQgdXNlIHRoYXQgYXMgb3VyIGluZGV4ZXIuCgo+IEkgaG9wZSBNaWtlIGNhbiBnaXZlIHNvbWUg
YmV0dGVyIGluc2lnaHQgdG8gd2hhdCBoaXMgcHJlZmVyZW5jZXMgYXJlLgo+IAo+IAlBcm5kCgot
LSAKTGVlIEpvbmVzCkxpbmFybyBTVC1Fcmljc3NvbiBMYW5kaW5nIFRlYW0gTGVhZApMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRy
ZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0
aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK

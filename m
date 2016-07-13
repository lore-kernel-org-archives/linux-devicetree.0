From: "William.wu" <William.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Wed, 13 Jul 2016 12:02:29 +0800
Message-ID: <8c62e88e-aa13-a978-1b92-2fe942671c04@rock-chips.com>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860066-15142-4-git-send-email-william.wu@rock-chips.com>
 <20160711145854.GB16636@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160711145854.GB16636@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

RGVhciBSb2IsCgoKT24gMjAxNi83LzExIDIyOjU4LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBU
aHUsIEp1bCAwNywgMjAxNiBhdCAxMDo1NDoyNEFNICswODAwLCBXaWxsaWFtIFd1IHdyb3RlOgo+
PiBBZGQgYSBxdWlyayB0byBjb25maWd1cmUgdGhlIGNvcmUgdG8gc3VwcG9ydCB0aGUKPj4gVVRN
SSsgUEhZIHdpdGggYW4gOC0gb3IgMTYtYml0IGludGVyZmFjZS4gVVRNSSsgUEhZCj4+IGludGVy
ZmFjZSBpcyBoYXJkd2FyZSBwcm9wZXJ0eSwgYW5kIGl0J3MgcGxhdGZvcm0KPj4gZGVwZW5kZW50
LiBOb3JtYWxsLCB0aGUgUEhZSWYgY2FuIGJlIGNvbmZpZ3VyZWQKPiBzL05vcm1hbGwvTm9ybWFs
bHkvClllYWjvvIxJJ2xsIGZpeCBpdC46LSkKPiBzL1BIWUlmL1BIWUlGLwpSZWZlciB0byBEV0Mz
IGNvbnRyb2xsZXIgZGF0YWJvb2ssICJQSFkgSW50ZXJmYWNlIiBjYWxsZWQgIlBIWUlmIiwKc28g
SSBkZXNjcmliZSAiUEhZSWYiIGhlcmUuIEhvd2V2ZXLvvIwgIlBIWUlG4oCdc2VlbXMgbW9yZSB0
aGUgbm9ybSwKSSdsbCBmaXggaXQuOi0pCj4KPj4gZHVyaW5nIGNvcmVjb25zdWx0YW50LiBCdXQg
Zm9yIHNvbWUgc3BlY2lmaWMgdXNiCj4gcy91c2IvVVNCLwoKVGhhbmtzLCBJJ2xsIGZpeCBpdC46
LSkKCj4KPj4gY29yZXMoZS5nLiByazMzOTkgc29jIGR3YzMpLCB0aGUgZGVmYXVsdCBQSFlJZgo+
PiBjb25maWd1cmF0aW9uIHZhbHVlIGlzIGZhdWx0LCBzbyB3ZSBuZWVkIHRvCj4+IHJlY29uZmln
dXJlIGl0IGJ5IHNvZnR3YXJlLgo+Pgo+PiBBbmQgcmVmZXIgdG8gdGhlIGR3YzMgZGF0YWJvb2ss
IHRoZSBHVVNCMlBIWUNGRy5VU0JUUkRUSU0KPiBzL2R3YzMvRFdDMy8KVGhhbmtzLCBJJ2xsIGZp
eCBpdCB0b28uCj4KPj4gbXVzdCBiZSBzZXQgdG8gdGhlIGNvcnJlc3BvbmRpbmcgdmFsdWUgYWNj
b3JkaW5nIHRvCj4+IHRoZSBVVE1JKyBQSFkgaW50ZXJmYWNlLgo+IEFuZCB3cmFwIHlvdXIgbGlu
ZXMgYXQgNzAtNzQgY2hhcmFjdGVycy4KClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLCBJJ2xs
IHBheSBhdHRlbnRpb24gdG8gdGhpcyBwcm9ibGVtIG5leHQgCnBhdGNoLjotKQoKQmVzdCBSZWdh
cmRz77yMCiAgICAgICAgIFdpbGxpYW0gV3UKPgo+IFJvYgo+Cj4KPgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1yb2NrY2hpcCBtYWlsaW5n
IGxpc3QKTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCg==

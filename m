From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] mfd: stmpe: Use devm_*() routines
Date: Fri, 23 Nov 2012 09:40:44 +0000
Message-ID: <20121123094044.GF17471@gmail.com>
References: <f1d508c64a01dfd492a1ab1fda28af4b7647d8ab.1353560936.git.viresh.kumar@linaro.org>
 <20121122102710.GD4328@gmail.com>
 <CAKohpo=gctcd5+bZ8xeJn-Cx3=+=+uxaCzEoZhFmp+XaJSpf9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKohpo=gctcd5+bZ8xeJn-Cx3=+=+uxaCzEoZhFmp+XaJSpf9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMiBOb3YgMjAxMiwgVmlyZXNoIEt1bWFyIHdyb3RlOgoKPiBPbiAyMiBOb3ZlbWJl
ciAyMDEyIDE1OjU3LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+
IE9uIFRodSwgMjIgTm92IDIwMTIsIFZpcmVzaCBLdW1hciB3cm90ZToKPiA+Cj4gPj4gVGhpcyBw
YXRjaCBmcmVlcyBzdG1wZSBkcml2ZXIgZnJvbSB0ZW5zaW9uIG9mIGZyZWVpbmcgcmVzb3VyY2Vz
IDopCj4gPj4gZGV2bV8qIGRlcml2YXRpdmVzIG9mIG11bHRpcGxlIHJvdXRpbmVzIGFyZSB1c2Vk
IHdoaWxlIGFsbG9jYXRpbmcgcmVzb3VyY2VzLAo+ID4+IHdoaWNoIHdvdWxkIGJlIGZyZWVkIGF1
dG9tYXRpY2FsbHkgYnkga2VybmVsLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVmlyZXNoIEt1
bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KPiAKPiA+IEFja2VkLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IAo+IEhpIFNhbWVvLAo+IAo+IFBsZWFzZSBhcHBseSB0
aGlzIHBhdGNoIG9ubHkgZnJvbSB0aGlzIHNlcmllcy4gSSB3aWxsIG5vdCByZXNlbmQgaXQgaW4K
PiBWMyBvZiBteSBzZXQuCgpUaGF0J3Mgbm90IGhvdyBpdCB3b3Jrcy4KCkFwcGx5IG15IEFja2Vk
LWJ5IHlvdXJzZWxmIGFuZCByZS1zZW5kIHRoZSBwYXRjaC1zZXQgYXMgYSB3aG9sZS4KCi0tIApM
ZWUgSm9uZXMKTGluYXJvIFNULUVyaWNzc29uIExhbmRpbmcgVGVhbSBMZWFkCkxpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNl
Ym9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1k
aXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZv
L2RldmljZXRyZWUtZGlzY3Vzcwo=

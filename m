From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: enable pwm3 as pwm regulator for
 rk3066a-rayeager board
Date: Fri, 15 Jan 2016 18:41:52 +0800
Message-ID: <5698CCF0.8040406@rock-chips.com>
References: <1452774780-16493-1-git-send-email-andy.yan@rock-chips.com>
 <1452774956-16621-1-git-send-email-andy.yan@rock-chips.com>
 <2237362.fjXobafQhV@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <2237362.fjXobafQhV@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, inux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGkgSGVpa286CgpPbiAyMDE25bm0MDHmnIgxNOaXpSAyMDo0MSwgSGVpa28gU3R1ZWJuZXIgd3Jv
dGU6Cj4gSGkgQW5keSwKPgo+IEFtIERvbm5lcnN0YWcsIDE0LiBKYW51YXIgMjAxNiwgMjA6MzU6
NTYgc2NocmllYiBBbmR5IFlhbjoKPj4gUmF5ZWFnZXIgYm9hcmQgdXNlIHB3bTMgbW9kdWxhdGUg
dGhlIHZkZF9sb2dpYyB2b2x0YWdlLCBzbyBlbmFibGUgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+Cj4+ICAgYXJjaC9h
cm0vYm9vdC9kdHMvcmszMDY2YS1yYXllYWdlci5kdHMgfCAxNiArKysrKysrKysrKysrKysrCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3JrMzA2NmEtcmF5ZWFnZXIuZHRzCj4+IGIvYXJjaC9hcm0vYm9vdC9k
dHMvcmszMDY2YS1yYXllYWdlci5kdHMgaW5kZXggM2Q0YzEwNC4uZDE3YTViOCAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMDY2YS1yYXllYWdlci5kdHMKPj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvcmszMDY2YS1yYXllYWdlci5kdHMKPj4gQEAgLTc4LDYgKzc4LDE4IEBA
Cj4+ICAgCQl9Owo+PiAgIAl9Owo+Pgo+PiArCXB3bV9yZWd1bGF0b3I6IHB3bS1yZWd1bGF0b3Ig
ewo+PiArCQljb21wYXRpYmxlID0gInB3bS1yZWd1bGF0b3IiOwo+PiArCQlwd21zID0gPCZwd20z
IDAgMTAwMD47Cj4+ICsJCXJlZ3VsYXRvci1uYW1lID0gInZkZF9sb2dpYyI7Cj4+ICsJCXJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDEyMDAwMDA+Owo+PiArCQlyZWd1bGF0b3ItbWF4LW1pY3Jv
dm9sdCA9IDwxMjAwMDAwPjsKPiBJIGd1ZXNzIHRoaXMgaXMgdG8gbWFrZSBzdXJlIGl0IHN0YXlz
IGF0IDEuMlYgYXQgYWxsIHRpbWVzLCBvciBpcyB0aGUgbWluLQo+IG1pY3Jvdm9sdCBzZXR0aW5n
cyBzdXBwb3NlZCB0byBiZSBsb3dlcj8KPgo+Cj4gVGhhbmtzCj4gSGVpa28KPgo+Cj4KICAgIFll
cywgSSB3YW50IHRvIGZpeCBpdCBhdCAxLjJWLiBXaGVuIEkgcmVhZCB0aGUgcmVndWxhdG9yX3Jl
Z2lzdGVyIApmdW5jdGlvbiwgIEkgZm91bmQgaXQgY2FsbCByZWd1bGF0b3JfZG9fc2V0X3ZvbHRh
dGUgb25seSB3aGVuIG1pbj1tYXguIApTbyBJIHNldCBpdCBsaWtlIHdoYXQgeW91IHNlZS4KICAg
IHJlZ3VsYXRvcl9yZWdpc3Rlci0tLT4KICAgICAgICAgICAgICAgICAgICBzZXRfbWFjaGluZV9j
b25zdHJhaW5zLS0tPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWNoaW5l
X2NvbnN0cmFpbnNfdm9sdGFnZS0tPgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tj
aGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=

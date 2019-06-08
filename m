From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Define values for the IPA
 governor for rock960
Date: Sun, 9 Jun 2019 00:05:15 +0200
Message-ID: <945577ba-d57a-cdbc-27a3-755e13dade37@linaro.org>
References: <20190604165802.7338-1-daniel.lezcano@linaro.org>
 <20190604165802.7338-2-daniel.lezcano@linaro.org>
 <CACRpkdazSvjt0G58dQOr=cw6mJTptNd3ZmEXduXVh4=01YHNvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CACRpkdazSvjt0G58dQOr=cw6mJTptNd3ZmEXduXVh4=01YHNvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gMDgvMDYvMjAxOSAwMDoxOCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBUdWUsIEp1biA0
LCAyMDE5IGF0IDY6NTggUE0gRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5v
cmc+IHdyb3RlOgo+IAo+PiBUaGUgaW50ZWxsaWdlbnQgcG93ZXIgYWxsb2NhdG9yIFBJRCBjb2Vm
ZmljaWVudCB0byBiZSBzZXQgaW4gc3lzZnMKPj4gYXJlOgo+Pgo+PiAgICAga19kOiAwCj4+ICAg
ICBrX3BvOiA3OQo+PiAgICAga19pOiAxMAo+PiAgICAga19wdTogNTAKPiAKPiBXaXRoIGFsbCB0
aGUgb3RoZXIgaW50ZXJlc3RpbmcgcGFyYW1ldHJpemF0aW9uIGluIHRoZSBkZXZpY2UgdHJlZQo+
IEkga2luZCBvZiB3b25kZXIgd2h5IHRoZSBQSUQgcmVndWxhdG9yIGNvbnN0YW50cyBkZWZhdWx0
cyBhcmUKPiBub3Qgc2V0IHVwIGZyb20gZGV2aWNlIHRyZWU/Cj4gCj4gQW55IHNwZWNpZmljIHJl
YXNvbj8KCk5vbmUgSSdtIGF3YXJlIG9mLiBJIGd1ZXNzIHRoZXNlIGNvbnN0YW50cyBhcmUgY29u
c2lkZXJlZCBhcyB0d2Vhawp2YWx1ZXMgYW5kIG5vdCBoYXJkd2FyZSByZWxhdGVkLgoKPiBUbyBt
ZSBpdCBzZWVtcyBsaWtlIHRoZSBraW5kIG9mIHN0dWZmIHVzZXJwYWNlIHdpbGwgaW52YXJpYWJs
eSBqdXN0Cj4gZ2V0IHdyb25nIG9yIGZvcmdldCBhYm91dCAoc29tZWJvZHkganVzdCBydW5zIGEg
ZGlmZmVyZW50Cj4gZGlzdHJpYnV0aW9uIHdpdGhvdXQgdGhlIGV4dHJhIG1hZ2ljIHRvIHNldCBz
eXNmcyByaWdodCkgdW5sZXNzCj4gd2Ugc3VwcGx5IGdvb2QgZGVmYXVsdHMuCgpJIGFncmVlLgoK
LS0gCiA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJv
b2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xp
bmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBC
bG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2Nr
Y2hpcAo=

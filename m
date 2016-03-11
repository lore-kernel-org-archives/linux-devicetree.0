From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v1 3/3] ARM64: dts: rk3368: Add mailbox device nodes
Date: Fri, 11 Mar 2016 12:21:12 +0800
Message-ID: <56E247B8.4060306@rock-chips.com>
References: <1445931106-683-1-git-send-email-wxt@rock-chips.com>
 <1445931106-683-4-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1445931106-683-4-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

CuS6jiAyMDE15bm0MTDmnIgyN+aXpSAxNTozMSwgQ2Flc2FyIFdhbmcg5YaZ6YGTOgo+IFRoaXMg
YWRkcyBtYWlsYm94IGRldmljZSBub2RlcyBpbiBkdHMuCj4KPiBNYWlsYm94IGlzIHVzZWQgYnkg
dGhlIFJvY2tjaGlwIENQVSBjb3JlcyB0byBjb21tdW5pY2F0ZQo+IHJlcXVlc3RzIHRvIE1DVSBw
cm9jZXNzb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDYWVzYXIgV2FuZyA8d3h0QHJvY2stY2hpcHMu
Y29tPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MToKPiAtIFBBVENIWzMvM10gZHRzOgo+IC0gZml4
ICJwcm9jZXNzb3JtWiItLT4gInByb2Nlc3NvciIsdGhlIG1pc3MtZmluZ2VyYm9hcmQuCj4gLSBS
ZW1vdmUgdGhlIHNoYXJlZCBtZW1vcnkgaW4gbWFpbGJveCBjb250cm9sbGVyIGR0c2kuCj4KPiAg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzY4LmR0c2kgfCAxMiArKysrKysrKysr
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzNjguZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcm9ja2NoaXAvcmszMzY4LmR0c2kKPiBpbmRleCBjYzA5M2E0Li5jZWZkYWQzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzY4LmR0c2kKPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpCj4gQEAgLTQ4NCw2ICs0
ODQsMTggQEAKPiAgIAkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAl9Owo+ICAgCj4gKwltYm94
OiBtYm94QGZmNmIwMDAwIHsKPiArCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM2OC1tYWls
Ym94IjsKPiArCQlyZWcgPSA8MHgwIDB4ZmY2YjAwMDAgMHgwIDB4MTAwMD4sCnMvLC87Cj4gKwkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDE0NiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiArCQkJICAg
ICA8R0lDX1NQSSAxNDcgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKwkJCSAgICAgPEdJQ19TUEkg
MTQ4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsJCQkgICAgIDxHSUNfU1BJIDE0OSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKPiArCQljbG9ja3MgPSA8JmNydSBQQ0xLX01BSUxCT1g+Owo+ICsJCWNs
b2NrLW5hbWVzID0gInBjbGtfbWFpbGJveCI7Cj4gKwkJI21ib3gtY2VsbHMgPSA8MT47Cj4gKwl9
Owo+ICsKPiAgIAlwbXVncmY6IHN5c2NvbkBmZjczODAwMCB7Cj4gICAJCWNvbXBhdGlibGUgPSAi
cm9ja2NoaXAscmszMzY4LXBtdWdyZiIsICJzeXNjb24iOwo+ICAgCQlyZWcgPSA8MHgwIDB4ZmY3
MzgwMDAgMHgwIDB4MTAwMD47CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKTGludXgtcm9ja2NoaXBAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJvY2tjaGlwCg==

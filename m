From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v3 2/3] arm: dts: rk3288-tinker.dtsi: Enable WiFi
Date: Tue, 12 Mar 2019 15:21:49 +0100
Message-ID: <8fc4cc3c-5a83-4616-9fa2-3055899acdb7@i2se.com>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-2-beagleboard@davidjohnsummers.uk>
 <1822354.MXcUDnUBre@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1822354.MXcUDnUBre@phil>
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
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGkgSGVpa28sCgpBbSAxMi4wMy4xOSB1bSAxNToxOCBzY2hyaWViIEhlaWtvIFN0dWVibmVyOgo+
IEFtIFNhbXN0YWcsIDkuIE3DpHJ6IDIwMTksIDE2OjM5OjIyIENFVCBzY2hyaWViIERhdmlkIFN1
bW1lcnM6Cj4+IFRoaXMgcGF0Y2ggYWRkcyB3aWZpIHN1cHBvcnQgdG8gdGhlIEFTVVMgVGlua2Vy
IEJvYXJkIChTKSBtYWNoaW5lcy4KPj4KPj4gVGhpcyBpcyBwcm92aWRlZCBieSBhbiB3aWZpIGNh
cmQgKFJUTDg3MjNCUykgd2lyZWQgaW50byB0aGUgc2RpbyBpbnRlcmZhY2UuCj4+Cj4+IEl0IHJl
cXVpcmVzIGNlcnRhaW4gcGlucyBwdWxsZWQsIHRvIGVuYWJsZSB0aGUgV2lGaS4KPj4KPj4gVGhl
IHNjaGVtYXRpY3MgZm9yIHRoZXNlIGJvYXJkIGRvIG5vdCBzaG93IHRoZSBXaUZpIGNvbm5lY3Rp
b24sIHNvIHRoZQo+PiBjb25uZWN0aW9ucyBoYXZlIGJlZW4gdGFrZW4gZnJvbToKPj4KPj4gaHR0
cHM6Ly9naXRodWIuY29tL1RpbmtlckJvYXJkL2RlYmlhbl9rZXJuZWwvYmxvYi9kZXZlbG9wL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1taW5pYXJtLmR0cwo+Pgo+PiBJbiBwYXJ0aWN1bGFyIHRo
ZSBwdWxsaW5nIG9mIHR3byBwaW5zLgo+Pgo+PiBUaGlzIHBhdGNoIGlzIGFsbW9zdCBpZGVudGlj
YWwgdG8gdjEuIEEgZmV3IGFkZGl0aW9uYWwgbGluZSBicmVha3MgZm9yCj4+IHJlYWRhYmlsaXR5
LiBPbiBBcm1iaWFuLCB0aGV5IGRpZCBub3QgdXNlIHNkLXVocy1kZHI1MCwgc28gdGhpcyBoYXMK
Pj4gYmVlbiByZW1vdmVkLiBJdCBkb2VzIG5vdCBjaGFuZ2UgZnVuY3Rpb25hbGl0eS4gVGhlIEFT
VVMgcGF0Y2ggc2V0Cj4+IHNkLXVocy1zZHIxMDQ7Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYXZp
ZCBTdW1tZXJzIDxiZWFnbGVib2FyZEBkYXZpZGpvaG5zdW1tZXJzLnVrPgo+PiBTaWduZWQtb2Zm
LWJ5OiBTdGVmYW4gV2FocmVuIDxzdGVmYW4ud2FocmVuQGkyc2UuY29tPgo+IHRyeWluZyB0byB1
bmRlcnN0YW5kIHRoZSByZWxhdGlvbnNoaXAgaGVyZSwgaXMgdGhhdCBhCj4gIkNvLWRldmVsb3Bl
ZC1ieTogU3RlZmFuIFdhaHJlbiA8Li4uPiIgY2FzZT8KCnllcyBpdCBpcy4KClJlZ2FyZHMgU3Rl
ZmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2Nr
Y2hpcAo=

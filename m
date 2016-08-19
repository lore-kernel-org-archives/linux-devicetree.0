From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v9 1/2] Documentation: bindings: add dt doc for Rockchip
 PCIe controller
Date: Fri, 19 Aug 2016 09:15:14 +0800
Message-ID: <57003143-d52e-154f-458a-5a3aacbf2684@rock-chips.com>
References: <1470297128-6213-1-git-send-email-shawn.lin@rock-chips.com>
 <20160818210237.GP27353@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160818210237.GP27353@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

5ZyoIDIwMTYvOC8xOSA1OjAyLCBCam9ybiBIZWxnYWFzIOWGmemBkzoKPiBPbiBUaHUsIEF1ZyAw
NCwgMjAxNiBhdCAwMzo1MjowN1BNICswODAwLCBTaGF3biBMaW4gd3JvdGU6Cj4+IFRoaXMgcGF0
Y2ggYWRkcyBhIGJpbmRpbmcgdGhhdCBkZXNjcmliZXMgdGhlIFJvY2tjaGlwIFBDSWUgY29udHJv
bGxlcgo+PiBmb3VuZCBvbiBSb2NrY2hpcCBTb0NzIFBDSWUgaW50ZXJmYWNlLgo+PiAuLi4KPgo+
PiArLSBtc2ktbWFwOiBNYXBzIGEgUmVxdWVzdGVyIElEIHRvIGFuIE1TSSBjb250cm9sbGVyIGFu
ZCBhc3NvY2lhdGVkLgo+Cj4gQW5kIGFzc29jaWF0ZWQgKndoYXQqPwoKQWgsIHdpbGwgZml4IGl0
LiA6KQoKPgo+PiArLSB2cGNpZTN2My1zdXBwbHk6IFRoZSBwaGFuZGxlIHRvIHRoZSAzLjN2IHJl
Z3VsYXRvciB0byB1c2UgZm9yIHBjaWUuCj4+ICstIHZwY2llMXY4LXN1cHBseTogVGhlIHBoYW5k
bGUgdG8gdGhlIDEuOHYgcmVndWxhdG9yIHRvIHVzZSBmb3IgcGNpZS4KPj4gKy0gdnBjaWUwdjkt
c3VwcGx5OiBUaGUgcGhhbmRsZSB0byB0aGUgMC45diByZWd1bGF0b3IgdG8gdXNlIGZvciBwY2ll
Lgo+Cj4gcy9wY2llL1BDSWUvIChhbHNvIGVsc2V3aGVyZSBpbiB0aGlzIHBhdGNoKQoKc3VyZSwg
SSB3aWxsIHVzZSBQQ0llIGZvciB0aGUgZGVzY3JpcHRpb25zIGluIHRoaXMgcGF0Y2guCgo+Cj4K
PgoKCi0tIApCZXN0IFJlZ2FyZHMKU2hhd24gTGluCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0CkxpbnV4
LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=

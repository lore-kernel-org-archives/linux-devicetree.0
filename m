From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: Fix the external clock name for the RK3036
 EMAC
Date: Sun, 10 Jan 2016 19:23:40 +0100
Message-ID: <1714176.Nme8cQ9zc4@phil>
References: <1452410557-29208-1-git-send-email-zhengxing@rock-chips.com>
 <E6BB80D3-5A62-4BE1-BFC2-74DAC9213C95@rock-chips.com>
 <B588B7A8-EC8A-44A5-AEDF-F75AB5361F01@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <B588B7A8-EC8A-44A5-AEDF-F75AB5361F01-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, xing.zheng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

QW0gU29ubnRhZywgMTAuIEphbnVhciAyMDE2LCAxODozNjoxMiBzY2hyaWViIFhpbmcgWmhlbmc6
Cj4gSGkgSGVpa28sCj4gCj4gPiDlnKggMjAxNuW5tDHmnIgxMOaXpe+8jDE4OjI577yMWGluZyBa
aGVuZyA8emhlbmd4aW5nQHJvY2stY2hpcHMuY29tPiDlhpnpgZPvvJoKPiA+IAo+ID4gCj4gPiBI
aSBIZWlrbywKPiA+IAo+ID4+IOWcqCAyMDE25bm0MeaciDEw5pel77yMMTc6NTnvvIxIZWlrbyBT
dHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiDlhpnpgZPvvJoKPiA+PiAKPiA+PiBIaSBYaW5nLAo+
ID4+IAo+ID4+IEFtIFNvbm50YWcsIDEwLiBKYW51YXIgMjAxNiwgMTU6MjI6Mzcgc2NocmllYiBY
aW5nIFpoZW5nOgo+ID4+PiBCZWNhdXNlIHRoZSBSSzMwMzYgZG9lc24ndCBzdXBwb3J0IEVNQUMs
IGFuZCBvbmx5IHN1cHBvcnQgdGhlIFJNSUkKPiA+Pj4gbW9kZQo+ID4+PiBpbiB0aGUgRU1BQyBJ
UCwgd2UgcmVmZXIgdG8gdGhlIFRSTSBDUlUgYW5kIHVwZGF0ZSB0aGUgbmV3IGV4dGVybmFsCj4g
Pj4+IGNsb2NrIG5hbWUgZm9yIEVNQUMuCj4gPj4+IAo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBYaW5n
IFpoZW5nIDx6aGVuZ3hpbmdAcm9jay1jaGlwcy5jb20+Cj4gPj4gCj4gPj4gYXMgSSBzYWlkIGlu
IHRoZSBvdGhlciBtYWlsLCBJIGFscmVhZHkgZml4ZWQgdGhlIG9yaWdpbmFsIHBhdGNoIG15c2Vs
Zgo+ID4+IDotKSBTbyBJJ20ganVzdCBnb2luZyB0byBkcm9wIHRoaXMgb25lLgo+ID4+IAo+ID4+
IAo+ID4+IEhlaWtvCj4gPj4gCj4gPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4
L2tlcm5lbC9naXQvbW1pbmQvbGludXgtcm9ja2NoaXAuZ2l0L2MKPiA+PiBvbW1pdC8/aD12NC41
LWNsay9maXhlcyZpZD04ODgwNzkwNmFmMTA4YTgzODRkNzdhZDljZmI5NDIxZjE2NGVhOTMxPiAK
PiA+IEkgYW0gc29ycnkgdG8gbWlzdW5kZXJzdGFuZC4KPiA+IAo+ID4gT0ssIHRoYW5rIHlvdSBm
b3IgeW91ciBoZWxwLiAgOikKPiAKPiBZb3VyIHBhdGNoIGlzOgo+IC0gLSAiZXh0X2dtYWMiIC0g
ZXh0ZXJuYWwgR01BQyBjbG9jayAtIG9wdGlvbmFsCj4gKyAtICJybWlpX2Nsa2luIiAtIGV4dGVy
bmFsIEdNQUMgY2xvY2sgLSBvcHRpb25hbAo+IAo+IEkgdGhpbmsgdGhhdCB0aGVzZSBzaG91bGQg
YmUgbGlrZSB0aGlzOgo+IC0gLSAiZXh0X2dtYWMiIC0gZXh0ZXJuYWwgR01BQyBjbG9jayAtIG9w
dGlvbmFsCj4gKyAtICJybWlpX2Nsa2luIiAtIGV4dGVybmFsIEVNQUMgY2xvY2sgLSBvcHRpb25h
bAoKSSBmaXhlZCB0aGF0IHVwIG5vdywgdGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLgoKaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvbW1pbmQvbGludXgtcm9ja2No
aXAuZ2l0L2NvbW1pdC8/aD12NC41LWNsay9maXhlcyZpZD0xYzg4OGViMTA1NGEwODYyMGE4ZDJi
YzVkZDJkN2NjMjkwODk3MzcxCgoKSGVpa28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdApMaW51eC1yb2Nr
Y2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcm9ja2NoaXAK

From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v6] drm/rockchip: hdmi: add Innosilicon HDMI support
Date: Tue, 26 Jan 2016 10:28:03 +0800
Message-ID: <56A6D9B3.4070006@rock-chips.com>
References: <1453686197-20975-1-git-send-email-ykk@rock-chips.com>
 <1453686430-21470-1-git-send-email-ykk@rock-chips.com>
 <1453769119.17181.37.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1453769119.17181.37.camel@tiscali.nl>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Bolle <pebolle@tiscali.nl>, Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ben Chan <benchan@google.com>, Ken Mixte <kmixter@google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

SGkgUGF1bCwKCk9uIDAxLzI2LzIwMTYgMDg6NDUgQU0sIFBhdWwgQm9sbGUgd3JvdGU6Cj4gT24g
bWEsIDIwMTYtMDEtMjUgYXQgMDk6NDcgKzA4MDAsIFlha2lyIFlhbmcgd3JvdGU6Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9LY29uZmlnCj4+ICtjb25maWcgUk9DS0NISVBfSU5OT19IRE1JCj4+ICsJdHJp
c3RhdGUgIlJvY2tjaGlwIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIElubm9zaWxpY29uIEhETUki
Cj4+ICsgICAgICAgIGRlcGVuZHMgb24gRFJNX1JPQ0tDSElQCj4+ICsgICAgICAgIGhlbHAKPj4g
KwkgIFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciBSb2NrY2hpcCBTb0Mgc3BlY2lmaWMgZXh0ZW5z
aW9ucwo+PiArCSAgZm9yIHRoZSBJbm5vc2lsaWNvbiBIRE1JIGRyaXZlci4gSWYgeW91IHdhbnQg
dG8gZW5hYmxlCj4+ICsJICBIRE1JIG9uIFJLMzAzNiBiYXNlZCBTb0MsIHlvdSBzaG91bGQgc2Vs
ZXQgdGhpcyBvcHRpb24uCj4gKFJlYWxseSB0cml2aWFsOiBzdGFydCBpbmRlbnRhdGlvbiB3aXRo
IHRhYnMgb25seSwgcGxlYXNlLiBBbmQKPiBzL3NlbGV0L3NlbGVjdC8uKQpHb3QgaXQKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmMK
Pj4gKyAqIFRoaXMgc29mdHdhcmUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbAo+PiBQdWJsaWMKPj4gKyAqIExpY2Vuc2UgdmVyc2lvbiAyLCBhcyBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwKPj4gYW5kCj4+ICsgKiBtYXkgYmUg
Y29waWVkLCBkaXN0cmlidXRlZCwgYW5kIG1vZGlmaWVkIHVuZGVyIHRob3NlIHRlcm1zLgo+IFRo
aXMgc3RhdGVzIHRoaXMgZmlsZSBpcyBsaWNlbnNlZCBHUEwgdjIgb25seS4KPgo+PiArTU9EVUxF
X0xJQ0VOU0UoIkdQTCIpOwo+IEFuZCwgYWNjb3JkaW5nIHRvIGluY2x1ZGUvbGludXgvbW9kdWxl
LmgsIHRoaXMgbWVhbnMgIkdOVSBQdWJsaWMgTGljZW5zZQo+IHYyIG9yIGxhdGVyIi4KPgo+IFNv
IEkgdGhpbmsgdGhlcmUncyBhIChzdWJ0bGUpIG1pc21hdGNoIGJldHdlZW4gdGhlIGxpY2Vuc2Ug
aWRlbnQgdXNlZAo+IGZvciB0aGlzIGRyaXZlciBhbmQgdGhlIGNvbW1lbnQgYWJvdmUuCgpBaCwg
dGhhbmtzLgoKLSBZYWtpcgoKPiBUaGFua3MsCj4KPgo+IFBhdWwgQm9sbGUKPgo+Cj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

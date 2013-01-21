From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/6] arm: mvebu: Add support for local interrupt
Date: Mon, 21 Jan 2013 20:26:38 -0300
Message-ID: <20130121232637.GA3412@localhost>
References: <1358790842-2986-1-git-send-email-gregory.clement@free-electrons.com>
 <1358790842-2986-2-git-send-email-gregory.clement@free-electrons.com>
 <20130121191744.0a04b941@skate>
 <50FDBC0E.1030706@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50FDBC0E.1030706-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi@marvell>
List-Id: devicetree@vger.kernel.org

SGkgVGhvbWFzIGFuZCBHcmVnb3J5LAoKT24gTW9uLCBKYW4gMjEsIDIwMTMgYXQgMTE6MDc6MTBQ
TSArMDEwMCwgR3JlZ29yeSBDTEVNRU5UIHdyb3RlOgo+IE9uIDAxLzIxLzIwMTMgMDc6MTcgUE0s
IFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4gPj4gKwkJaXJxX3NldF9wZXJjcHVfZGV2aWQodmly
cSk7Cj4gPj4gKwkJaXJxX3NldF9jaGlwX2FuZF9oYW5kbGVyKHZpcnEsICZhcm1hZGFfMzcwX3hw
X2lycV9jaGlwLAo+ID4+ICsJCQkJCWhhbmRsZV9wZXJjcHVfZGV2aWRfaXJxKTsKPiA+PiArCj4g
Pj4gKwl9IGVsc2Ugewo+ID4+ICsJCWlycV9zZXRfY2hpcF9hbmRfaGFuZGxlcih2aXJxLCAmYXJt
YWRhXzM3MF94cF9pcnFfY2hpcCwKPiA+PiArCQkJCQloYW5kbGVfbGV2ZWxfaXJxKTsKPiA+PiAr
CX0KPiA+IAo+ID4gQnJhY2VzIHVzZWxlc3Mgc2luY2UgdGhlcmUgaXMgb25seSBvbmUgc3RhdGVt
ZW50IGluIHRoZSBlbHNlLgo+ID4gCgpJTUhPLCB0aGlzIGlzIGFuIGV4Y2VwdGlvbiB0byB0aGUg
cnVsZS4KU2luY2UgdGhlIGZpcnN0IGJsb2NrIGlzIG1vcmUgdGhhbiBvbmUgbGluZSwKd2UgdXN1
YWxseSBwdXQgYnJhY2VzIG9uIHRoZSBzaW5nbGUgbGluZSBibG9jayB0b28uCihvciBhdCBsZWFz
dCB0aGF0J3Mgd2hhdCBEb2N1bWVudGF0aW9uL0NvZGluZ1N0eWxlIHNheXMpLgoKUmVnYXJkcywK
Ci0tIApFemVxdWllbCBHYXJjw61hLCBGcmVlIEVsZWN0cm9ucwpFbWJlZGRlZCBMaW51eCwgS2Vy
bmVsIGFuZCBBbmRyb2lkIEVuZ2luZWVyaW5nCmh0dHA6Ly9mcmVlLWVsZWN0cm9ucy5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2aWNldHJlZS1k
aXNjdXNzIG1haWxpbmcgbGlzdApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3psYWJzLm9yZwpo
dHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNjdXNzCg==

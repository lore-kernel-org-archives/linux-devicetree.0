From: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Subject: Re: [PATCH 2/3] watchdog: bcm2835: Add poweroff code for the Raspberry
 Pi
Date: Fri, 12 Jun 2015 13:26:59 +0200
Message-ID: <557AC203.6060600@lategoodbye.de>
References: <1433845305-17329-1-git-send-email-noralf@tronnes.org>
 <1433845305-17329-2-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1433845305-17329-2-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: =?UTF-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGkgTm9yYWxmLAoKQW0gMDkuMDYuMjAxNSB1bSAxMjoyMSBzY2hyaWViIE5vcmFsZiBUcsO4bm5l
czoKPiBUaGlzIGFkZHMgYSBuZXcgcG93ZXJvZmYgZnVuY3Rpb24gdG8gdGhlIHdhdGNoZG9nIGRy
aXZlciBmb3IgdGhlCj4gUmFzcGJlcnJ5IFBpLiBDdXJyZW50bHkgcG93ZXJvZmYvaGFsdCByZXN1
bHRzIGluIGEgcmVib290Lgo+Cj4gWy4uLl0KPgo+ICtzdGF0aWMgdm9pZCBycGlfcG93ZXJfb2Zm
KHZvaWQpCj4gK3sKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPQo+ICsJCW9mX2ZpbmRfY29t
cGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJicmNtLHJhc3BiZXJyeXBpLXBtLXdkdCIpOwo+ICsJ
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUobnAp
Owo+ICsJc3RydWN0IGJjbTI4MzVfd2R0ICp3ZHQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2
KTsKPiArCXUzMiB2YWw7Cj4gKwo+ICsJdmFsID0gcmVhZGxfcmVsYXhlZCh3ZHQtPmJhc2UgKyBQ
TV9SU1RTKTsKCmRvIHlvdSB0aGluayBpdCdzIHNhZmUgaGVyZSB0byBhc3N1bWUgd2R0IGNvdWxk
IG5ldmVyIGJlIE5VTEw/CgpNYXkgYmUgaXQncyBuZWNlc3NhcnkgdG8gc2VuZCB0aGUgc2VyaWVz
IHRvIHRoZSB3YXRjaGRvZyAvIGJjbTI4MzUgCm1haW50YWluZXJzIHRvIGdldCBtb3JlIGZlZWRi
YWNrLgoKUmVnYXJkcwpTdGVmYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1ycGkta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1ycGkta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1ycGkta2VybmVsCg==

From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH] cpuidle: kirkwood: Move out of mach directory, add DT.
Date: Fri, 28 Dec 2012 15:32:08 +0100
Message-ID: <50DDAD68.4090704@openwrt.org>
References: <1356698844-4220-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1356698844-4220-1-git-send-email-andrew@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: len.brown@intel.com, devicetree-discuss@lists.ozlabs.org, rafael.j.wysocki@intel.com, Jason Cooper <jason@lakedaemon.net>, linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGVsbG8gQW5kcmV3LAoKTGUgMTIvMjgvMTIgMTM6NDcsIEFuZHJldyBMdW5uIGEgw6ljcml0IDoK
PiBNb3ZlIHRoZSBLaXJrd29vZCBjcHVpZGxlIGRyaXZlciBvdXQgb2YgYXJjaC9hcm0vbWFjaC1r
aXJrd29vZCBhbmQKPiBpbnRvIGRyaXZlcnMvY3B1aWRsZS4gQ29udmVydCB0aGUgZHJpdmVyIGlu
dG8gYSBwbGF0Zm9ybSBkcml2ZXIgYW5kCj4gYWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZy4gQWRk
IGEgRFQgbm9kZSB0byBpbnN0YW50aWF0ZSB0aGUgZHJpdmVyIGZvcgo+IGJvYXJkcyBjb252ZXJ0
ZWQgdG8gRFQsIGFuZCBhIHBsYXRmb3JtIGRhdGEgZm9yIG9sZCBzdHlsZSBib2FyZHMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4gLS0tCgpbc25pcF0K
Cj4KPiArLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gKyAqIENQVSBpZGxlCj4gKyAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqLwo+ICtzdGF0aWMgc3RydWN0IHJlc291cmNlIGtpcmt3b29kX2NwdWlkbGVfcmVz
b3VyY2VbXSA9IHsKPiArCXsKPiArCQkuZmxhZ3MJPSBJT1JFU09VUkNFX01FTSwKPiArCQkuc3Rh
cnQJPSBERFJfT1BFUkFUSU9OX0JBU0UsCj4gKwkJLmVuZAk9IDMsCgpTaG91bGQgbm90IHRoaXMg
YmUgRERSX09QRVJBVElPTl9CQVNFICsgMz8KLS0KRmxvcmlhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

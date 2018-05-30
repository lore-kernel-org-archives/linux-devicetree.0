From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/8] pinctrl: optionally stop deferring probe at end of
 initcalls
Date: Wed, 30 May 2018 09:00:08 +0200
Message-ID: <CACRpkdZ_xrHkrprb=7BiOCrnJrAsXNZVnYDf2Jcp4gF99W+pCA@mail.gmail.com>
References: <20180524175024.19874-1-robh@kernel.org>
 <20180524175024.19874-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20180524175024.19874-6-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/boot-architecture/>
List-Post: <mailto:boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/boot-architecture>,
 <mailto:boot-architecture-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Errors-To: boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Sender: "boot-architecture" <boot-architecture-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, boot-architecture-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgNzo1MCBQTSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IElmIHRoZSBwaW5jdHJsIG5vZGUgaW4gRFQgaW5kaWNhdGVzIHRoYXQg
cGluIHNldHVwIGlzIG9wdGlvbmFsIGFuZCB0aGUKPiBkZWZhdWx0cyBjYW4gYmUgdXNlZCB3aXRo
IHRoZSAncGluY3RybC11c2UtZGVmYXVsdCcsIHRoZW4gb25seSBkZWZlciBwcm9iZQo+IHVudGls
IGluaXRjYWxscyBhcmUgZG9uZS4gVGhpcyBnaXZlcyBwbGF0Zm9ybXMgdGhlIG9wdGlvbiB0byB3
b3JrIHdpdGhvdXQKPiB0aGVpciBwaW5jdHJsIGRyaXZlciBiZWluZyBlbmFibGVkLgo+Cj4gU2ln
bmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkkgdHJ1c3QgdGhhdCB5
b3Uga25vdyB3aGF0IHlvdSdyZSBkb2luZyBzbyBJIGd1ZXNzCkFja2VkLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpib290LWFyY2hpdGVj
dHVyZSBtYWlsaW5nIGxpc3QKYm9vdC1hcmNoaXRlY3R1cmVAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ib290LWFyY2hpdGVjdHVyZQo=

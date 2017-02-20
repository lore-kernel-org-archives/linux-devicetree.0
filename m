From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/4] Documentation: devicetree: arm: Document Marvell
 IAP140
Date: Mon, 20 Feb 2017 14:16:13 +0100
Message-ID: <cac4ed13-5952-cccc-fee7-d9c29e77d8bb@suse.de>
References: <20170219032000.4674-1-afaerber@suse.de>
 <20170219032000.4674-3-afaerber@suse.de>
 <20170220135646.2b0219c1@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170220135646.2b0219c1@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jisheng Zhang <jszhang@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Eric Miao <eric.y.miao@gmail.com>, Jason Cooper <jason@lakedaemon.net>, info@andromedabox.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Daniel Mack <daniel@zonque.org>, Gregory Clement <gregory.clement@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

SGksCgpBbSAyMC4wMi4yMDE3IHVtIDEzOjU2IHNjaHJpZWIgVGhvbWFzIFBldGF6em9uaToKPiBP
biBTdW4sIDE5IEZlYiAyMDE3IDA0OjE5OjU4ICswMTAwLCBBbmRyZWFzIEbDpHJiZXIgd3JvdGU6
Cj4gCj4+ICsgLSBjb21wYXRpYmxlIDogIG11c3QgY29udGFpbiAibXJ2bCxpYXAxNDAiCj4gCj4g
RXZlbiB0aG91Z2ggdGhlcmUncyBpbmRlZWQgYSBnb29kIG51bWJlciBvZiBleGlzdGluZyAibXJ2
bCwiIGNvbXBhdGlibGUKPiBzdHJpbmdzIGluIHRoZSB0cmVlLCB0aGUgb2ZmaWNpYWwgdmVuZG9y
IHByZWZpeCBhY2NvcmRpbmcgdG8KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dmVuZG9yLXByZWZpeGVzLnR4dCBpcyAibWFydmVsbCIuCj4gUHJvYmFibHkgeW91IHNob3VsZCB1
c2UgdGhhdCBpbnN0ZWFkIGZvciBuZXcgYmluZGluZ3M/CgpJJ20gY29uZnVzZWQgbm93LiBBY2Nv
cmRpbmcgdG8gTWFydmVsbCBJUiBbMF0gdGhleSBhcmUgTkFTREFRLWxpc3RlZCBhcwpNUlZMLiBN
eSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaW4gdGhhdCBjYXNlIHRoZSBvZmZpY2lhbCB2ZW5kb3Ig
cHJlZml4CmJlY29tZXMgbXJ2bC4gV2h5IG5vdCBoZXJlPyBXb3VsZCBiZSBnb29kIHRvIHVuZGVy
c3RhbmQgZm9yIG90aGVyCnBlbmRpbmcgdmVuZG9ycyBzdWNoIGFzIEFjdGlvbnMgU2VtaS4KCkFu
eSBjb21tZW50cyBvbiB0aGUgaWFwMTQwIHZzLiBweGExOTA4IG5hbWluZz8gVGhlIENvbW11bmlj
YXRpb24KUHJvY2Vzc29ycyBzZWN0aW9uIGhhcyBkaXNhcHBlYXJlZCBmcm9tIG1hcnZlbGwuY29t
LCBzbyBJIGNvdWxkbid0CnZlcmlmeSB3aGV0aGVyIElBUDE0MCB3YXMgcmVuYW1lZCBmcm9tIFBY
QTE5MDggb3Igd2hldGhlciBib3RoIGNvZXhpc3QKYW5kIHdlIHNob3VsZCBhZGQgYSBzZWNvbmQg
Y29tcGF0aWJsZSBzdHJpbmcgaGVyZT8KClRoYW5rcywKQW5kcmVhcwoKWzBdIGh0dHA6Ly9pbnZl
c3Rvci5tYXJ2ZWxsLmNvbS9waG9lbml4LnpodG1sP2M9MTIwODAyJnA9aXJvbC1pcmhvbWUKCi0t
IApTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQpHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBKYW5lIFNtaXRoYXJkLCBHcmFoYW0gTm9ydG9uCkhS
QiAyMTI4NCAoQUcgTsO8cm5iZXJnKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

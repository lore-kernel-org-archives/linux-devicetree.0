From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH V10 0/3] mtd: read partitions compatible prop for
 "ofpart" type
Date: Tue, 27 Mar 2018 11:41:30 +0200
Message-ID: <20180327114130.0fa3ee0e@bbrezillon>
References: <20180130201059.4424-1-zajec5@gmail.com>
 <20180314121044.12033-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180314121044.12033-1-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>, John Crispin <john@phrozen.org>, Frank Rowand <frowand.list@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Peter Rosin <peda@axentia.se>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAxNCBNYXIgMjAxOCAxMzoxMDo0MSArMDEwMApSYWZhxYIgTWnFgmVja2kgPHphamVj
NUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Cj4gCj4gVGhpcyBwYXRjaHNldCBwcm92aWRlcyBhIHByb3BlciBzdXBwb3J0IGZvciBm
bGFzaCBkZXZpY2UgRFQgbm9kZSB3aXRoCj4gInBhcnRpdGlvbnMiIHN1Ym5vZGUgdXNpbmcgImNv
bXBhdGlibGUiIHByb3BlcnR5LiBJdCdzIGFscmVhZHkKPiBkb2N1bWVudGVkIGluIHRoZTogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb24udHh0Cj4gCj4gV2Ug
YmVsaWV2ZWQgdGhhdCB2ZXJzaW9uIDcgd2FzIHJlYWR5IHRvIGdvLCBidXQgc29vbiBhZnRlciBs
YW5kaW5nIGluCj4gdGhlIGxpbnV4LW5leHQgd2UgZ290IGEgcmVncmVzc2lvbiByZXBvcnQgZnJv
bSBQZXRlci4gTGF0ZXIgdmVyc2lvbnMKPiB0YWtlcyBhIHNhZmUgcGF0aCBieToKPiAxKSBSZXNw
ZWN0aW5nIHBhcnNlcnMgb3JkZXIgYXMgc3BlY2lmaWVkIGluIHRoZSBkZWZhdWx0L2RyaXZlci1w
cm92aWRlZAo+ICAgIGxpc3QuCj4gMikgTG9va2luZyBhdCAiY29tcGF0aWJsZSIgcHJvcGVydHkg
b25seSB3aGVuICJvZnBhcnQiIHR5cGUgZ2V0cwo+ICAgIHNwZWNpaWVkLgo+IAo+IFZlcnNpb24g
OSB3YXMgc3VjY2Vzc2Z1bGx5IHRlc3RlZCBieSBQZXRlciBhbmQgdmVyc2lvbiAxMCBqdXN0IHNx
dWFzaGVzCj4gdHdvIGNvbW1pdHMgaW50byBhIG9uZS4KPiAKPiBJIGRvdWJsZS1jaGVja2VkIHRo
ZSBjb2RlIGFuZCBjYW5ub3QgdGhpbmsgb2YgYW55IHJlZ3Jlc3Npb24gdGhpcyBjb3VsZAo+IGNh
dXNlLiBJIGFsc28gaG9wZSB0aGlzIGRlc2lnbiAocm91Z2hseSBkaXNjdXNzZWQgd2l0aCBCb3Jp
cykgY2FuIGJlCj4gYWNjZXB0YWJsZSBmb3IgdGhlIG10ZCBzdWJzeXN0ZW0uCj4gCj4gVGhlIG1v
c3QgaW1wb3J0YW50IHBhdGNoIGZyb20gdGhpcyBwYXRjaHNldCAoMS8zKSB3YXMgcmV2aWV3ZWQg
YnkgUm9iIGluCj4gdGhlCj4gW1BBVENIIFY2IDEvMl0gbXRkOiBwYXJ0aXRpb25zOiBhZGQgb2Zf
bWF0Y2hfdGFibGUgcGFyc2VyIG1hdGNoaW5nCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9jb21tZW50LzE4MzE1NTEvCj4gCj4gSWYgcG9zc2libGUgdGhpcyBpcyBhIDQuMTcgbWF0ZXJp
YWwuCgpBcHBsaWVkLCBmaW5hbGx5LiBJJ20gc3RpbGwgY29udmluY2VkIHB1dHRpbmcgdGhpcyBp
bmZvcm1hdGlvbiBpbiB0aGUKInBhcnRpdGlvbnMiIG5vZGUgY29tcGF0aWJsZSBpcyBhIGJhZCBp
ZGVhIGJlY2F1c2UgaXQgYWRkcyBleHRyYQpjb21wbGV4aXR5IHRvIHNvbWV0aGluZyB0aGF0IHdh
cyBhbHJlYWR5IHF1aXRlIGNvbXBsZXgsIGJ1dCB5b3Ugd29uIQoKTm90ZSB0aGF0IFJvYiBoYWQg
Y29tbWVudHMgb24gWzFdIHRoYXQgeW91IG5ldmVyIGFuc3dlcmVkLCBzbyBJJ20gbm90CmV2ZW4g
c3VyZSB3aGVuIHdlJ2xsIHN0YXJ0IHNlZWluZyBib2FyZHMgdXNpbmcgdGhpcyBpbmZyYXN0cnVj
dHVyZS4KClsxXWh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC84NTk2OTAvCgotLSAK
Qm9yaXMgQnJlemlsbG9uLCBCb290bGluIChmb3JtZXJseSBGcmVlIEVsZWN0cm9ucykKRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

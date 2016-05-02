From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: include errno.h in of_graph.h
Date: Mon, 2 May 2016 09:00:32 -0500
Message-ID: <20160502140032.GA12801@rob-hp-laptop>
References: <1462186769-2205767-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1462186769-2205767-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBNYXkgMDIsIDIwMTYgYXQgMTI6NTk6MTlQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBXaGVuIENPTkZJR19PRiBpcyBkaXNhYmxlZCwgd2UgaGF2ZSB0byBpbmNsdWRlIGxp
bnV4L2Vycm5vLmggYmVmb3JlCj4gaW5jbHVkaW5nIG9mX2dyYXBoLmgsIG9yIGdldCBidWlsZCBl
cnJvcnMgbGlrZSBpbiB0aGUgbmV3bHkgYWRkZWQKPiBzdW40aSBkcm0gZHJpdmVyOgo+IAo+IElu
IGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmM6
MTQ6MDoKPiBpbmNsdWRlL2xpbnV4L29mX2dyYXBoLmg6IEluIGZ1bmN0aW9uICdvZl9ncmFwaF9w
YXJzZV9lbmRwb2ludCc6Cj4gaW5jbHVkZS9saW51eC9vZl9ncmFwaC5oOjU4OjEwOiBlcnJvcjog
J0VOT1NZUycgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gCj4gQSBi
ZXR0ZXIgc29sdXRpb24gaXMgdG8gZW5zdXJlIHRoYXQgdGhlIGhlYWRlciBjYW4gYmUgaW5jbHVk
ZWQKPiBieSBpdHNlbGYsIHNvIGxldCdzIGluY2x1ZGUgbGludXgvZXJybm8uaCBoZXJlIHRvIGZp
eCB0aGUgZXJyb3IKPiB3ZSBqdXN0IGdvdCwgYW5kIGFueSBzaW1pbGFyIGZ1dHVyZSBlcnJvci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IEZpeGVz
OiA5MDI2ZTBkMTIyYWMgKCJkcm06IEFkZCBBbGx3aW5uZXIgQTEwIERpc3BsYXkgRW5naW5lIHN1
cHBvcnQiKQo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L29mX2dyYXBoLmggfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkLgoKUm9iCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

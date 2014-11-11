From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v7 5/7] drm: bridge/dw-hdmi: add support for multi byte
 register width access
Date: Tue, 11 Nov 2014 15:23:40 +0100
Message-ID: <1415715820.2815.9.camel@pengutronix.de>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
 <1415710432-12167-1-git-send-email-andy.yan@rock-chips.com>
 <54621B23.1020602@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54621B23.1020602@imgtec.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: heiko@sntech.de, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, rmk+kernel@arm.linux.org.uk, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

QW0gRGllbnN0YWcsIGRlbiAxMS4xMS4yMDE0LCAxNDoyMCArMDAwMCBzY2hyaWViIFp1YmFpciBM
dXRmdWxsYWgKS2FrYWtoZWw6Cj4gSGkgQW5keSwKPiAKPiBUaGlzIHBhdGNoIGFkZHMgdGhlIHJl
Zy1pby13aWR0aCBiaW5kaW5nLgo+IAo+IEhlbmNlIHRoZSBiaW5kaW5nIHBhdGNoIHNob3VsZCBj
b21lIGJlZm9yZSBpdC4KPiAKPiAKPiBPbiAxMS8xMS8xNCAxMjo1MywgQW5keSBZYW4gd3JvdGU6
Cj4gPiBPbiByb2NrY2hpcCByazMyODgsIG9ubHkgd29yZCgzMi1iaXQpIGFjY2Vzc2VzIGFyZQo+
ID4gcGVybWl0dGVkIGZvciBoZG1pIHJlZ2lzdGVycy4gIEJ5dGUgd2lkdGggYWNjZXNzZXMgKHdy
aXRlYiwKPiA+IHJlYWRiKSBnZW5lcmF0ZSBhbiBpbXByZWNpc2UgZXh0ZXJuYWwgYWJvcnQuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4K
PiA+IAo+ID4gLS0tCj4gPiAKPiA+ICB9Cj4gPiAgCj4gPiAgc3RhdGljIHZvaWQgaGRtaV9tb2Ri
KHN0cnVjdCBkd19oZG1pICpoZG1pLCB1OCBkYXRhLCB1OCBtYXNrLCB1bnNpZ25lZCByZWcpCj4g
PiBAQCAtMTQ5OSw2ICsxNTI3LDIzIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQo+ID4gIAlzdHJ1
Y3QgZGV2aWNlX25vZGUgKmRkY19ub2RlOwo+ID4gIAlzdHJ1Y3QgcmVzb3VyY2UgKmlvcmVzOwo+
ID4gIAlpbnQgcmV0LCBpcnE7Cj4gPiArCXUzMiB2YWwgPSAxOwo+ID4gKwo+ID4gKwlvZl9wcm9w
ZXJ0eV9yZWFkX3UzMihucCwgInJlZy1pby13aWR0aCIsICZ2YWwpOwo+ID4gKwo+ID4gKwlzd2l0
Y2ggKHZhbCkgewo+ID4gKwljYXNlIDQ6Cj4gPiArCQloZG1pLT53cml0ZSA9IGR3X2hkbWlfd3Jp
dGVsOwo+ID4gKwkJaGRtaS0+cmVhZCA9IGR3X2hkbWlfcmVhZGw7Cj4gPiArCQlicmVhazsKPiA+
ICsJY2FzZSAxOgo+ID4gKwkJaGRtaS0+d3JpdGUgPSBkd19oZG1pX3dyaXRlYjsKPiA+ICsJCWhk
bWktPnJlYWQgPSBkd19oZG1pX3JlYWRiOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWRlZmF1bHQ6Cj4g
PiArCQlkZXZfZXJyKGRldiwgInJlZy1pby13aWR0aCBtdXN0IGJlIDEgb3IgNFxuIik7Cj4gPiAr
CQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJfQo+IAo+IFRoZSBiaW5kaW5nIHBhdGNoIHNheXMgdGhp
cyBpcyBhbiBvcHRpb25hbCBwcm9wZXJ0eS4KPiBCdXQgaGVyZSBpZiB1bmRlZmluZWQgaXQgcmV0
dXJucyAtRUlOVkFMLgo+IAo+IEkgd291bGQga2VlcCBpdCBvcHRpb25hbCBhbmQgZGVmYXVsdCBp
dCB0byBieXRlIGFjY2Vzcy4KClRoYXQncyBleGFjdGx5IHdoYXQgdGhlIHBhdGNoIGRvZXMuIHZh
bCBpcyBpbml0aWFsaXplZCB0byAxLCB3aGljaCBpcwpub3QgY2hhbmdlZCBpZiB0aGUgcHJvcGVy
dHkgY291bGQgbm90IGJlIGZvdW5kIGluIHRoZSBEVC4gVGhlIGRlZmF1bHQKY2FzZSB3aWxsIG9u
bHkgYmUgdGFrZW4gaWYgdGhlIHByb3BlcnR5IGlzIHByZXNlbnQgaW4gRFQgYnV0IGhhcyBhbnkK
b3RoZXIgdmFsdWUgdGhhbiAxIG9yIDQsIHdoaWNoIGlzIGFuIGVycm9yLgoKUmVnYXJkcywKTHVj
YXMKCi0tIApQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgIHwgTHVjYXMgU3RhY2ggICAgICAg
ICAgICAgICAgIHwKSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICB8IGh0dHA6Ly93d3cucGVu
Z3V0cm9uaXguZGUvICB8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

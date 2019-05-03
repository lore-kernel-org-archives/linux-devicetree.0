From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 08/10] staging: octeon-ethernet: support
 of_get_mac_address new ERR_PTR error
Date: Fri, 3 May 2019 22:40:01 +0300
Message-ID: <20190503194001.GP2239@kadam>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
 <1556870168-26864-9-git-send-email-ynezz@true.cz>
 <20190503103456.GF2269@kadam> <20190503190730.GH71477@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20190503190730.GH71477@meh.true.cz>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: devel@driverdev.osuosl.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDk6MDc6MzBQTSArMDIwMCwgUGV0ciDFoHRldGlhciB3
cm90ZToKPiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+IFsyMDE5LTA1
LTAzIDEzOjM0OjU2XToKPiAKPiBIaSwKPiAKPiA+IE9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDA5
OjU2OjA1QU0gKzAyMDAsIFBldHIgxaB0ZXRpYXIgd3JvdGU6Cj4gPiA+IFRoZXJlIHdhcyBOVk1F
TSBzdXBwb3J0IGFkZGVkIHRvIG9mX2dldF9tYWNfYWRkcmVzcywgc28gaXQgY291bGQgbm93Cj4g
PiA+IHJldHVybiBOVUxMIGFuZCBFUlJfUFRSIGVuY29kZWQgZXJyb3IgdmFsdWVzLCBzbyB3ZSBu
ZWVkIHRvIGFkanVzdCBhbGwKPiA+ID4gY3VycmVudCB1c2VycyBvZiBvZl9nZXRfbWFjX2FkZHJl
c3MgdG8gdGhpcyBuZXcgZmFjdC4KPiA+IAo+ID4gV2hpY2ggY29tbWl0IGFkZGVkIE5WTUVNIHN1
cHBvcnQ/ICBJdCBoYXNuJ3QgaGl0IG5ldC1uZXh0IG9yIGxpbnV4LW5leHQKPiA+IHlldC4uLiAg
VmVyeSBzdHJhbmdlLgo+IAo+IHRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIHRoZSBwYXRjaCBzZXJp
ZXNbMV0sIHdoZXJlIHRoZSAxc3QgcGF0Y2hbMl0gYWRkcyB0aGlzCj4gTlZNRU0gc3VwcG9ydCB0
byBvZl9nZXRfbWFjX2FkZHJlc3MgYW5kIGZvbGxvdy11cCBwYXRjaGVzIGFyZSBhZGp1c3RpbmcK
PiBjdXJyZW50IG9mX2dldF9tYWNfYWRkcmVzcyB1c2VycyB0byB0aGUgbmV3IEVSUl9QVFIgcmV0
dXJuIHZhbHVlLgoKQmFzaWNhbGx5IGFsbCB0aGUgcGF0Y2hlcyBuZWVkIHRvIGJlIGZvbGRlZCB0
b2dldGhlciBvdGhlcndpc2UgeW91J3JlCmJyZWFraW5nIGdpdCBiaXNlY3RpYmlsaXR5LiAgSW1h
Z2luZSB0aGF0IHdlIGp1c3QgYXBwbHkgcGF0Y2ggIzEgcmlnaHQ/ClRoZW4gYWxsIHRoZSBjYWxs
ZXJzIHdpbGwgYmUgYnJva2VuLiAgSXQncyBub3QgYWxsb3dlZC4KCnJlZ2FyZHMsCmRhbiBjYXJw
ZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRl
dmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnCmh0dHA6Ly9kcml2
ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1k
ZXZlbAo=

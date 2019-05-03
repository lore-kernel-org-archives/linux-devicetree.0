From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 08/10] staging: octeon-ethernet: support
 of_get_mac_address new ERR_PTR error
Date: Fri, 3 May 2019 13:34:56 +0300
Message-ID: <20190503103456.GF2269@kadam>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
 <1556870168-26864-9-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1556870168-26864-9-git-send-email-ynezz@true.cz>
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

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDk6NTY6MDVBTSArMDIwMCwgUGV0ciDFoHRldGlhciB3
cm90ZToKPiBUaGVyZSB3YXMgTlZNRU0gc3VwcG9ydCBhZGRlZCB0byBvZl9nZXRfbWFjX2FkZHJl
c3MsIHNvIGl0IGNvdWxkIG5vdwo+IHJldHVybiBOVUxMIGFuZCBFUlJfUFRSIGVuY29kZWQgZXJy
b3IgdmFsdWVzLCBzbyB3ZSBuZWVkIHRvIGFkanVzdCBhbGwKPiBjdXJyZW50IHVzZXJzIG9mIG9m
X2dldF9tYWNfYWRkcmVzcyB0byB0aGlzIG5ldyBmYWN0LgoKV2hpY2ggY29tbWl0IGFkZGVkIE5W
TUVNIHN1cHBvcnQ/ICBJdCBoYXNuJ3QgaGl0IG5ldC1uZXh0IG9yIGxpbnV4LW5leHQKeWV0Li4u
ICBWZXJ5IHN0cmFuZ2UuCgpXaHkgd291bGQgb2ZfZ2V0X21hY19hZGRyZXNzKCkgcmV0dXJuIGEg
bWl4IG9mIE5VTEwgYW5kIGVycm9yIHBvaW50ZXJzPwpJbiB0aGF0IHNpdHVhdGlvbiwgdGhlbiBO
VUxMIGlzIGEgc3BlY2lhbCBraW5kIG9mIHN1Y2Nlc3MgbGlrZSB3aGVuIHlvdQpyZXF1ZXN0IGZl
YXR1cmUgYW5kIHRoZSBmZWF0dXJlIHdvcmtzIGJ1dCBpdCdzIGRpc2FibGVkIGJ5IHRoZSB1c2Vy
LiAgV2UKZG9uJ3Qgd2FudCB0byB0cmVhdCBpdCBhcyBhbiBlcnJvciBidXQgd2Ugc3RpbGwgY2Fu
J3QgcmV0dXJuIGEgcG9pbnRlcgp0byBhIGZlYXR1cmUgd2UgZG9uJ3QgaGF2ZS4uLiAgSXQncyBo
YXJkIGZvciBtZSB0byBpbWFnaW5lIGhvdyB0aGF0Cm1ha2VzIHNlbnNlIGZvciBnZXR0aW5nIGEg
bWFjIGFkZHJlc3MuCgpBdCB0aGUgdmVyeSBsZWFzdCwgdGhpcyBwYXRjaCBuZWVkcyBhIEZpeGVz
IHRhZy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcgbGlzdApkZXZlbEBsaW51eGRyaXZl
cnByb2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=

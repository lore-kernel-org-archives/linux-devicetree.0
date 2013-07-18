From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: Kirkwood: Fix the internal register ranges
 translation
Date: Thu, 18 Jul 2013 10:55:06 -0300
Message-ID: <20130718135505.GA3264@localhost>
References: <1371569479-31498-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51E5145A.90404@keymile.com> <20130716125531.GD2317@localhost>
 <51E63B3A.2010807@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E63B3A.2010807-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
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
To: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "Longchamp,
 Valentin" <Valentin.Longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VybGFuZG8sCgpPbiBXZWQsIEp1bCAxNywgMjAxMyBhdCAwODozNTozOEFNICswMjAwLCBH
ZXJsYW5kbyBGYWxhdXRvIHdyb3RlOgo+IE9uIDA3LzE2LzIwMTMgMDI6NTYgUE0sIEV6ZXF1aWVs
IEdhcmNpYSB3cm90ZToKPiBbLi4uXQo+ID4gQWxzbywgc3BlYWtpbmcgb2YgImRldmljZSBidXMi
IHRoaXMgbmFuZCBub2RlIHNob3VsZCBiZSBiZWhpbmQgYSBkZXZpY2VidXMgbm9kZS4KPiA+Cj4g
PiAJCXJhbmdlcyA9IDxNQlVTX0lEKDB4ZjAsIDB4MDEpIDAgMCAweGYxMDAwMDAwIDB4MTAwMDAw
ICAgLyogaW50ZXJuYWwtcmVncyAqLwo+ID4gCQkJICBNQlVTX0lEKDB4MDEsIDB4MmYpIDAgMCAw
eGY0MDAwMDAwIDB4NDAwPjsKPiA+Cj4gPiAJCWRldmJ1cyB7Cj4gPiAJCQlzdGF0dXMgPSAib2th
eSI7Cj4gPiAJCQlyYW5nZXMgPSA8MCBNQlVTX0lEKDB4MDEsIDB4MmYpIDAgMHg0MDA+Owo+ID4K
PiA+IAkJCS8qIG5hbmQgKi8KPiA+IAkJCW5hbmQgewo+ID4gCQkJCWNvbXBhdGlibGUgPSAibWFy
dmVsbCxvcmlvbi1uYW5kIjsKPiA+IAkJCQlyZWcgPSA8MCAweDQwMD47Cj4gPiAJCQl9Owo+ID4g
CQl9Owo+ID4KPiA+IChub3RpY2UgdGhpcyB3aWxsIGFsbG93IHlvdSB0byByZWxvY2F0ZSB0aGUg
YmFzZSBhZGRyZXNzIG9mIHRoZSBOQU5EIHdpbmRvd3MKPiA+IGVhc2lseSBpZiBpdCBjb25mbGlj
dHMgd2l0aCB5b3VyIFBDSWUgbmVlZHMpLgo+IAo+IEkgYW0gTUFZQkUgc2xvd2x5IHN0YXJ0aW5n
IHRvIHVuZGVyc3RhbmQgdGhpcyB3aG9sZSBtYnVzIHJld29yay4KPiBKdXN0IG9uZSByZW1hcmsg
dGhvdWdoOiBkb24ndCB5b3UgdGhpbmsgaXQgd291bGQgbWFrZSBzZW5zZSB0byBhZGQgCj4gc29t
ZXRoaW5nIGxpa2U6Cj4gCj4gI2RlZmluZSBNQlVTX0lEX0lOVEVSTkFMX1JFR1MJTUJVU19JRCgw
eGYwLCAweDAxKQo+ICNkZWZpbmUgTUJVU19JRF9OQU5ECQlNQlVTX0lEKDB4MDEsIDB4MmYpCj4g
CgpZZWFoLCBtYXliZSBpdCB3b3VsZCBtYWtlIHNlbnNlLiBUaGlzIGhhcyBiZWVuIGRpc2N1c3Nl
ZCBpbiB0aGUgcGFzdAphbmQgb3RoZXJzIHdlcmUgYWdhaW5zdCwgc28gdGhhdCdzIHRoZSByZWFz
b24gaXQncyBub3QgaW5jbHVkZWQgaW4KdGhlIHNlcmllcyBJIHN1Ym1pdHRlZC4KCkJ1dCBmZWVs
IGZyZWUgdG8gc2VuZCBhIHBhdGNoIHByb3Bvc2luZyBpdCBvbmNlIHRoZSBNQnVzIGlzIG1lcmdl
ZCEKClRoYW5rcywKLS0gCkV6ZXF1aWVsIEdhcmPDrWEsIEZyZWUgRWxlY3Ryb25zCkVtYmVkZGVk
IExpbnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgRW5naW5lZXJpbmcKaHR0cDovL2ZyZWUtZWxlY3Ry
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
ZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRyZWUtZGlzY3Vzc0BsaXN0cy5v
emxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9kZXZpY2V0cmVlLWRp
c2N1c3MK

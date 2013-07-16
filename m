From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 05/10] watchdog: orion: Add a memory resource for RSTOUT
 register
Date: Tue, 16 Jul 2013 11:18:51 -0300
Message-ID: <20130716141850.GB23904@localhost>
References: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1373931163-12670-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130716140415.GB19448@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130716140415.GB19448-g2DYL2Zd6BY@public.gmane.org>
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
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

QW5kcmV3LAoKT24gVHVlLCBKdWwgMTYsIDIwMTMgYXQgMDQ6MDQ6MTVQTSArMDIwMCwgQW5kcmV3
IEx1bm4gd3JvdGU6Cj4gT24gTW9uLCBKdWwgMTUsIDIwMTMgYXQgMDg6MzI6MzhQTSAtMDMwMCwg
RXplcXVpZWwgR2FyY2lhIHdyb3RlOgo+ID4gSW5zdGVhZCBvZiBhY2Nlc3NpbmcgdGhlIFJTVE9V
VCByZWdpc3RlciBkaXJlY3RseSwgdGhpcyBjb21taXQKPiA+IGFkZHMgYSBwbGF0Zm9ybSBtZW1v
cnkgcmVzb3VyY2UgdG8gbWFwIHRoaXMgcmVnaXN0ZXIgaW50byB0aGUgZHJpdmVyLgo+IAo+IAo+
IEhhdmUgeW91IGxvb2tlZCBhdDoKPiAKPiBhcmNoL2FybS9tYWNoLW12ZWJ1L3N5c3RlbS1jb250
cm9sbGVyLmMKPiAKCk1tbS4uLiBJIHNhdyB0aGUgdXNlIG9mIHRoZSBSU1RPVVQgcmVnaXN0ZXIg
aW4ga2lya3dvb2RfcmVzdGFydCgpCmJ1dCB3YXNuJ3Qgc3VyZSB3aG8gc2hvdWxkIGJlIHRoZSBy
ZWFsICdvd25lcicgb2YgdGhpcyByZWdpc3Rlci4KCj4gSXQgaXMgYWxzbyB1c2luZyB0aGlzIHJl
Z2lzdGVyLiBBcmUgd2UgZ29pbmcgdG8gaGF2ZSBhIHNpbWlsYXIgcHJvYmxlbQo+IGFzIHRoZSBU
SU1FUl9DVFJMIHJlZ2lzdGVyLCB3aGljaCB5b3UgcmVmYWN0ZXJlZCBpbiBhbiBlYXJsaWVyIHBh
dGNoPwo+IAoKUHJvYmFibHkuCgo+ICJtYXJ2ZWxsLG9yaW9uLXN5c3RlbS1jb250cm9sbGVyIiBp
cyBub3QgYWN0dWFsbHkgdXNlZCB5ZXQsIGJ1dCBvbmNlCj4ga2lya3dvb2QgbW92ZXMgaW50byBt
YWNoLW12ZWJ1LCBpdCB3aWxsIHN0YXJ0IHVzaW5nIGl0Lgo+IAoKSSBndWVzcyBzby4gV2Ugc2hv
dWxkIHRha2UgdGhhdCBpbnRvIGFjY291bnQgKm5vdyouIExldCBtZSB0aGluayBhYm91dAppdCBh
bmQgc2VlIGlmIEkgY2FuIGhhdmUgc29tZXRoaW5nIHNhbmUgZm9yIHYyLgoKVGhhbmtzIQotLSAK
RXplcXVpZWwgR2FyY8OtYSwgRnJlZSBFbGVjdHJvbnMKRW1iZWRkZWQgTGludXgsIEtlcm5lbCBh
bmQgQW5kcm9pZCBFbmdpbmVlcmluZwpodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3Vz
cyBtYWlsaW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6
Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=

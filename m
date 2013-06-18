From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation
 to the DT binding
Date: Tue, 18 Jun 2013 18:10:03 -0300
Message-ID: <20130618211002.GC2516@localhost>
References: <20130618174622.GD2204@obsidianresearch.com>
 <51C0A5F8.8030300@gmail.com> <201306182039.50736.arnd@arndb.de>
 <51C0AA8E.9080807@gmail.com>
 <20130618184753.GA6090@obsidianresearch.com>
 <51C0ADF7.5050609@gmail.com>
 <20130618191018.GB6578@obsidianresearch.com>
 <51C0B4A0.90204@gmail.com> <20130618204911.GB2516@localhost>
 <20130618205522.GA13691@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130618205522.GA13691-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
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
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKdW4gMTgsIDIwMTMgYXQgMDI6NTU6MjJQTSAtMDYwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDEzIGF0IDA1OjQ5OjExUE0gLTAzMDAsIEV6ZXF1
aWVsIEdhcmNpYSB3cm90ZToKPiA+IEhpIFNlYmFzdGlhbiwKPiA+IAo+ID4gWW91IGxvb3NlICsx
IGludGVybmV0IHBvaW50cyBmb3IgZHJvcHBpbmcgbWUgZnJvbSBDYyA7LSkKPiA+IAo+ID4gT24g
VHVlLCBKdW4gMTgsIDIwMTMgYXQgMDk6Mjc6MjhQTSArMDIwMCwgU2ViYXN0aWFuIEhlc3NlbGJh
cnRoIHdyb3RlOgo+ID4gPiBPbiAwNi8xOC8yMDEzIDA5OjEwIFBNLCBKYXNvbiBHdW50aG9ycGUg
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGUgZm9ybXMgY291bGQgYmU6Cj4gPiA+ID4KPiA+ID4g
PiAgIDBJQUEwMDAwCj4gPiA+ID4gICBGSzAwMDAwMAo+ID4gPiA+ICAgICAtIEs9MCAtPiAgaW50
ZXJuYWwgcmVncwo+ID4gPiA+ICAgICAtIEs9MSAtPiAgUENJLUUgdGhpbmd5Cj4gPiA+ID4gICAg
ICBldGMKPiA+ID4gPiAgIDFJSUFBMDAwIChmdXR1cmUgZXhwYW5zaW9uIGV4YW1wbGUpCj4gPiA+
IAo+ID4gPiBPaywgZ290IGl0LiBBbnkgZW5jb2RpbmcgaXMgZmluZSB0aGF0IGFsbG93cyB0byBk
aXN0aW5ndWlzaCByZWFsCj4gPiA+IHJlbWFwIHdpbmRvd3MgYW5kIGZha2Ugb25lcy4gSSBhc3N1
bWVkIHRoYXQgbWF5YmUgc29tZWRheSB0aGVyZQo+ID4gPiB3aWxsIGJlIG1vcmUgdGhhbiA0YiB0
YXJnZXQgaWQgc28gMHg4MCBhcyBzcGVjaWFsIGNhc2UgaW5kaWNhdG9yCj4gPiA+IGxlYXZlcyA3
YiBvZiBub3JtYWwgdGFyZ2V0IGlkIGluIHRoZSBfY3VycmVudF8gbWFwcGluZy4KPiA+ID4gCj4g
PiAKPiA+IEknbSBhbHNvIHdvbmRlcmluZyBhYm91dCB3aHkgd2Ugbm90IGNhcmUgYWJvdXQgdGFy
Z2V0IElEcyBiZWluZyBtb3JlCj4gPiB0aGFuIDQgYml0cy4KPiA+IAo+ID4gSmFzb246IChJJ20g
Y2hlY2tpbmcgbm93IGJ1dCBwZXJoYXBzIHlvdSBrbm93IGJldHRlciB0aGFuIG1lKToKPiA+IElz
IHRoZXJlIGFueSBNQnVzLWFyY2hpdGVjdHVyYWwgcmVhc29uIGZvciB5b3UgYXNzdXJpbmcgdGhl
Cj4gPiB0YXJnZXQgSUQgd2lsbCBhbHdheXMgYmUgd2l0aGluIDQtYml0cz8KPiAKPiBUaGUgbWFu
dWFscyBJIGhhdmUgZm9yIHRoZSByZWdpc3RlciBzZXQgc2F5IDQgYml0cyBpcyBhbGxvY2F0ZWQg
Zm9yCj4gbWJ1cyB0YXJnZXRzLi4gQXJlIHlvdXJzIGRpZmZlcmVudD8KPiAKCk5vcGUuIDQgYml0
cyBoZXJlIGFzIHdlbGwuCgo+IElmIHRoZXkgY2hhbmdlIGl0IHRoZW4gdGhlIHdpbmRvdyByZWdp
c3RlciBsYXlvdXQgY2hhbmdlcyBhbmQgdGhlbiB0aGUKPiBtYnVzIGRyaXZlciBwcm9iYWJseSBu
ZWVkIHRvIGNoYW5nZSBhcyB3ZWxsLgo+IAoKT2tleSwgdGhlbi4KCi0tIApFemVxdWllbCBHYXJj
w61hLCBGcmVlIEVsZWN0cm9ucwpFbWJlZGRlZCBMaW51eCwgS2VybmVsIGFuZCBBbmRyb2lkIEVu
Z2luZWVyaW5nCmh0dHA6Ly9mcmVlLWVsZWN0cm9ucy5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2aWNldHJlZS1kaXNjdXNzIG1haWxpbmcgbGlz
dApkZXZpY2V0cmVlLWRpc2N1c3NAbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xpc3RzLm96bGFi
cy5vcmcvbGlzdGluZm8vZGV2aWNldHJlZS1kaXNjdXNzCg==

From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation
 to the DT binding
Date: Tue, 18 Jun 2013 17:49:11 -0300
Message-ID: <20130618204911.GB2516@localhost>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618174622.GD2204@obsidianresearch.com>
 <51C0A5F8.8030300@gmail.com> <201306182039.50736.arnd@arndb.de>
 <51C0AA8E.9080807@gmail.com>
 <20130618184753.GA6090@obsidianresearch.com>
 <51C0ADF7.5050609@gmail.com>
 <20130618191018.GB6578@obsidianresearch.com>
 <51C0B4A0.90204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51C0B4A0.90204-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

SGkgU2ViYXN0aWFuLAoKWW91IGxvb3NlICsxIGludGVybmV0IHBvaW50cyBmb3IgZHJvcHBpbmcg
bWUgZnJvbSBDYyA7LSkKCk9uIFR1ZSwgSnVuIDE4LCAyMDEzIGF0IDA5OjI3OjI4UE0gKzAyMDAs
IFNlYmFzdGlhbiBIZXNzZWxiYXJ0aCB3cm90ZToKPiBPbiAwNi8xOC8yMDEzIDA5OjEwIFBNLCBK
YXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPgo+ID4gVGhlIGZvcm1zIGNvdWxkIGJlOgo+ID4KPiA+
ICAgMElBQTAwMDAKPiA+ICAgRkswMDAwMDAKPiA+ICAgICAtIEs9MCAtPiAgaW50ZXJuYWwgcmVn
cwo+ID4gICAgIC0gSz0xIC0+ICBQQ0ktRSB0aGluZ3kKPiA+ICAgICAgZXRjCj4gPiAgIDFJSUFB
MDAwIChmdXR1cmUgZXhwYW5zaW9uIGV4YW1wbGUpCj4gCj4gT2ssIGdvdCBpdC4gQW55IGVuY29k
aW5nIGlzIGZpbmUgdGhhdCBhbGxvd3MgdG8gZGlzdGluZ3Vpc2ggcmVhbAo+IHJlbWFwIHdpbmRv
d3MgYW5kIGZha2Ugb25lcy4gSSBhc3N1bWVkIHRoYXQgbWF5YmUgc29tZWRheSB0aGVyZQo+IHdp
bGwgYmUgbW9yZSB0aGFuIDRiIHRhcmdldCBpZCBzbyAweDgwIGFzIHNwZWNpYWwgY2FzZSBpbmRp
Y2F0b3IKPiBsZWF2ZXMgN2Igb2Ygbm9ybWFsIHRhcmdldCBpZCBpbiB0aGUgX2N1cnJlbnRfIG1h
cHBpbmcuCj4gCgpJJ20gYWxzbyB3b25kZXJpbmcgYWJvdXQgd2h5IHdlIG5vdCBjYXJlIGFib3V0
IHRhcmdldCBJRHMgYmVpbmcgbW9yZQp0aGFuIDQgYml0cy4KCkphc29uOiAoSSdtIGNoZWNraW5n
IG5vdyBidXQgcGVyaGFwcyB5b3Uga25vdyBiZXR0ZXIgdGhhbiBtZSk6CklzIHRoZXJlIGFueSBN
QnVzLWFyY2hpdGVjdHVyYWwgcmVhc29uIGZvciB5b3UgYXNzdXJpbmcgdGhlCnRhcmdldCBJRCB3
aWxsIGFsd2F5cyBiZSB3aXRoaW4gNC1iaXRzPwoKVGhhbmtzLAotLSAKRXplcXVpZWwgR2FyY8Ot
YSwgRnJlZSBFbGVjdHJvbnMKRW1iZWRkZWQgTGludXgsIEtlcm5lbCBhbmQgQW5kcm9pZCBFbmdp
bmVlcmluZwpodHRwOi8vZnJlZS1lbGVjdHJvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QK
ZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMu
b3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=

From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 06/12] memory: mvebu-devbus: Remove address decoding
 window workaround
Date: Tue, 18 Jun 2013 09:48:04 -0300
Message-ID: <20130618124803.GA25416@localhost>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130618113920.GW31667@titan.lakedaemon.net>
 <20130618141731.56e7966c@skate>
 <20130618123354.GX31667@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130618123354.GX31667-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKdW4gMTgsIDIwMTMgYXQgMDg6MzM6NTRBTSAtMDQwMCwgSmFzb24gQ29vcGVyIHdy
b3RlOgo+IE9uIFR1ZSwgSnVuIDE4LCAyMDEzIGF0IDAyOjE3OjMxUE0gKzAyMDAsIFRob21hcyBQ
ZXRhenpvbmkgd3JvdGU6Cj4gPiBEZWFyIEphc29uIENvb3BlciwKPiA+IAo+ID4gT24gVHVlLCAx
OCBKdW4gMjAxMyAwNzozOToyMCAtMDQwMCwgSmFzb24gQ29vcGVyIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIEp1biAxOCwgMjAxMyBhdCAwODoyNTozMUFNIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3Jv
dGU6Cj4gPiA+ID4gTm93IHRoYXQgbWJ1cyBkZXZpY2UgdHJlZSBiaW5kaW5nIGhhcyBiZWVuIGlu
dHJvZHVjZWQsIHJlbW92ZSB0aGUgYWRkcmVzcwo+ID4gPiA+IGRlY29kaW5nIHdpbmRvdyBtYW5h
Z2VtZW50IGZyb20gdGhpcyBkcml2ZXIuCj4gPiA+ID4gQSBzdWl0YWJsZSAncmFuZ2VzJyBlbnRy
eSBzaG91bGQgYmUgYWRkZWQgdG8gdGhlIGRldmJ1cy1jb21wYXRpYmxlIG5vZGUgaW4KPiA+ID4g
PiB0aGUgZGV2aWNlIHRyZWUsIGFzIGRlc2NyaWJlZCBieSB0aGUgbWJ1cyBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24uCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRXplcXVpZWwgR2FyY2lh
IDxlemVxdWllbC5nYXJjaWFAZnJlZS1lbGVjdHJvbnMuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICBkcml2ZXJzL21lbW9yeS9tdmVidS1kZXZidXMuYyB8IDY0ICsrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBVbmZvcnR1bmF0ZWx5LCB0aGUg
cGF0Y2ggYWRkaW5nIG12ZWJ1LWRldmJ1cyBpcyBnb2luZyB0aHJvdWdoIGdyZWdraCdzCj4gPiA+
IHRyZWUuICBFaXRoZXIgdGhpcyBwYXRjaCBuZWVkcyB0byB3YWl0IGZvciB2My4xMiwgb3IgYXNr
IEdyZWcgaWYgaGUgY2FuCj4gPiA+IHRha2UgdGhpcyBvbmUuCj4gPiAKPiA+IEkgYmVsaWV2ZSB0
aGF0IHdoYXQgd2UncmUgbG9va2luZyBmb3IgcmlnaHQgbm93IGlzIGEgQWNrZWQtYnkgZnJvbSBi
b3RoCj4gPiB0aGUgTWFydmVsbCBtYWludGFpbmVycywgQXJuZCBCZXJnbWFubiBhbmQgSmFzb24g
R3VudGhvcnBlLiBPbmNlIHdlIGdldAo+ID4gdGhvc2UgQWNrZWQtYnksIHdlIGNhbiBmaWd1cmUg
b3V0IHRoZSBtZXJnZSBzdHJhdGVneSBmb3IgdGhpcyBwYXRjaAo+ID4gc2V0Lgo+IAo+IFJpZ2h0
LiAgSSB3YXMgbW9yZSBsb29raW5nIHRvIGdpdmUgRXplcXVpZWwgYSBoZWFkcyB1cAoKLi4gYW5k
IHlvdSBkaWQgOikKClRoYW5rcyBhIGxvdCwKLS0gCkV6ZXF1aWVsIEdhcmPDrWEsIEZyZWUgRWxl
Y3Ryb25zCkVtYmVkZGVkIExpbnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgRW5naW5lZXJpbmcKaHR0
cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmljZXRyZWUt
ZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5m
by9kZXZpY2V0cmVlLWRpc2N1c3MK

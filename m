From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v8 00/28] MBus DT binding for Armada 370/XP and Kirkwood
Date: Tue, 23 Jul 2013 14:35:00 -0300
Message-ID: <20130723173459.GA11373@localhost>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAOesGMh5GjCkaGX1O1VdkQUKdM8z0XPEc08OFPjJcGgP6s9nRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMh5GjCkaGX1O1VdkQUKdM8z0XPEc08OFPjJcGgP6s9nRw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org

T2xvZiwKCk9uIFR1ZSwgSnVsIDIzLCAyMDEzIGF0IDEwOjEwOjMxQU0gLTA3MDAsIE9sb2YgSm9o
YW5zc29uIHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDEzIGF0IDY6MzEgQU0sIEV6ZXF1aWVs
IEdhcmNpYQo+IDxlemVxdWllbC5nYXJjaWFAZnJlZS1lbGVjdHJvbnMuY29tPiB3cm90ZToKPiA+
IEFmdGVyIEFuZHJldyBMdW5uIHJlcG9ydGVkIFsxXSB0aGlzIHdvcmsgbmVlZCB0byB0YWtlIGFj
Y291bnQgb2YgS2lya3dvb2QKPiA+IHRvIHByZXZlbnQgYnJlYWtpbmcgUENJZSBvbiBzdWNoIHBs
YXRmb3JtLCBoZXJlJ3MgYSBuZXcgdmVyc2lvbiBhZGRpbmcKPiA+IE1CdXMgRFQgYmluZGluZyBm
b3IgS2lya3dvb2QgYW5kIGluIHBhcnRpY3VsYXIgdXNpbmcgaXQgdG8gZGVjbGFyZSBQQ0llCj4g
PiBwcm9wZXJseS4KPiAKPiBUaGlzIGlzIGEgcHJpbWUgZXhhbXBsZSBvZiBzb21lb25lIHNlbmRp
bmcgYSB3aG9sZSBwYXRjaCBzZXJpZXMgdG8gdGhlCj4gZGV2aWNldHJlZSBtYWlsaW5nIGxpc3Qs
IHdoZW4gb25seSB0aGUgYmluZGluZ3MgdXBkYXRlcyBzaG91bGQgZ28KPiB0aGVyZS4gVGhlcmUg
YXJlIGEgbG90IG9mIHJlYWRlcnMgb2YgdGhlIGRldmljZXRyZWUgbGlzdHMgdGhhdCBjYW4ndAo+
IGtlZXAgdXAgd2l0aCB0aGUgdm9sdW1lIG9mIGVtYWlsIGR1ZSB0byB0aGlzIHJlYXNvbi4KPiAK
PiBTbywgd2hpbGUgSSdtIGNvbW1lbnRpbmcgb24geW91ciBlbWFpbCwgdGhpcyBnb2VzIGZvciBl
dmVyeWJvZHkKPiBtYWlsaW5nIHRvIHRoaXMgbGlzdCAoYW5kIEkgZXhwZWN0IHRvIHJlcGVhdCBt
eXNlbGYgYSBmZXcgdGltZXMgaW4gdGhlCj4gd2Vla3MgYW5kIG1vbnRocyBhaGVhZCk6IERvIG5v
dCBwb3N0IHRoZSBkcml2ZXIgdXBkYXRlcyB0byB0aGUKPiBkZXZpY2V0cmVlIGxpc3QsIG9ubHkg
dGhlIGJpbmRpbmdzIHVwZGF0ZXMuCj4gCgpPa2V5LCBnb3QgaXQuIFdvbid0IGhhcHBlbiBhZ2Fp
bi4KClRoYW5rcyBmb3IgdGhlIG5vdGljZSwKLS0gCkV6ZXF1aWVsIEdhcmPDrWEsIEZyZWUgRWxl
Y3Ryb25zCkVtYmVkZGVkIExpbnV4LCBLZXJuZWwgYW5kIEFuZHJvaWQgRW5naW5lZXJpbmcKaHR0
cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

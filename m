From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller driver
Date: Mon, 21 Jan 2019 12:18:18 +0800
Message-ID: <3f098e44-9d9b-3d0a-3e19-5913077aeb07@amlogic.com>
References: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
 <20190120160605.33689354@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190120160605.33689354@xps13>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Marek Vasut <marek.vasut@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>, Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

SGkgTWlxdWVsLAoKT24gMjAxOS8xLzIwIDIzOjA2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IEppYW54aW4sCj4gCj4gSmlhbnhpbiBQYW4gPGppYW54aW4ucGFuQGFtbG9naWMuY29tPiB3cm90
ZSBvbiBTdW4sIDIwIEphbiAyMDE5Cj4gMDE6MDI6MzUgKzA4MDA6Cj4gCj4+IEFkZCBlbnRyeSBm
b3IgQW1sb2dpYyBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIGFuZCBpdHMgYmluZGluZ3NbMF0uCj4+
Cj4+IFswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzE1NDc1NjY2ODQtNTc0NzItMS1n
aXQtc2VuZC1lbWFpbC1qaWFueGluLnBhbkBhbWxvZ2ljLmNvbS8KPj4KPj4gU2lnbmVkLW9mZi1i
eTogTGlhbmcgWWFuZyA8bGlhbmcueWFuZ0BhbWxvZ2ljLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
SmlhbnhpbiBQYW4gPGppYW54aW4ucGFuQGFtbG9naWMuY29tPgo+IAo+IElmIHlvdSBhcmUgdGhl
IGF1dGhvciBvZiB0aGUgcGF0Y2ggeW91ciBTaWduZWQtb2ZmLWJ5IHNob3VsZCBjb21lIGZpcnN0
LgpPSy4KPiAKPiBBbHNvLCB3aHkgaXMgTGlhbmcgdGhlIE1haW50YWluZXI/IFdoeSBub3QgeW91
Pwo+IApZYW5nbGlhbmcgaXMgQW1sb2dpYyBtYWludGFpbmVyIGZvciBOQU5EIGNvbnRyb2xsZXIu
IEFuZCBhbGwgcGF0Y2hlcyBhYm91dCBhbWxvZ2ljIE5BTkQgY29udHJvbGxlciBhcmUgZnJvbSBo
aW0uCj4+IC0tLQo+PiAgTUFJTlRBSU5FUlMgfCA3ICsrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRB
SU5FUlMKPj4gaW5kZXggMGFiZWNjNS4uN2Q5NzZhMSAxMDA2NDQKPj4gLS0tIGEvTUFJTlRBSU5F
UlMKPj4gKysrIGIvTUFJTlRBSU5FUlMKPj4gQEAgLTk2MjgsNiArOTYyOCwxMyBAQCBGOglkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lc29uL2FvLWNlYy5jCj4+ICBGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVzb24tYW8tY2VjLnR4dAo+PiAgVDoJZ2l0IGdpdDov
L2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0Cj4+ICAKPj4gK01FU09OIE5BTkQgQ09OVFJPTExF
UiBEUklWRVIgRk9SIEFNTE9HSUMgU09DUwo+PiArTToJTGlhbmcgWWFuZyA8bGlhbmcueWFuZ0Bh
bWxvZ2ljLmNvbT4KPj4gK0w6CWxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+ICtTOglN
YWludGFpbmVkCj4+ICtGOglkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl8qCj4+ICtGOglEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC50eHQK
Pj4gKwo+PiAgTUlDUk9CTEFaRSBBUkNISVRFQ1RVUkUKPj4gIE06CU1pY2hhbCBTaW1layA8bW9u
c3RyQG1vbnN0ci5ldT4KPj4gIFc6CWh0dHA6Ly93d3cubW9uc3RyLmV1L2ZkdC8KPiAKPiBUaGFu
a3MsCj4gTWlxdcOobAo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

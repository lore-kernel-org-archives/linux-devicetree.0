From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 1/6] drivers: bus: add a new driver for WEIM
Date: Thu, 23 May 2013 11:53:37 +0200
Message-ID: <201305231153.38111.arnd@arndb.de>
References: <1369296978-7669-1-git-send-email-b32955@freescale.com>
 <20130523092344.GF32299@pengutronix.de> <519DE2EE.1050006@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <519DE2EE.1050006-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

T24gVGh1cnNkYXkgMjMgTWF5IDIwMTMsIEh1YW5nIFNoaWppZSB3cm90ZToKPiDkuo4gMjAxM+W5
tDA15pyIMjPml6UgMTc6MjMsIFNhc2NoYSBIYXVlciDlhpnpgZM6Cj4gPiBPbiBUaHUsIE1heSAy
MywgMjAxMyBhdCAwNDoxNjoxM1BNICswODAwLCBIdWFuZyBTaGlqaWUgd3JvdGU6Cj4gPj4gKwkJ
CTxjcy1udW1iZXI+ICAwPHBoeXNpY2FsIGFkZHJlc3Mgb2YgbWFwcGluZz4gIDxzaXplPgo+ID4+
ICsKPiA+PiArVGltaW5nIHByb3BlcnR5IGZvciBjaGlsZCBub2Rlcy4gSXQgaXMgbWFuZGF0b3J5
LCBub3Qgb3B0aW9uYWwuCj4gPj4gKwo+ID4+ICsgLSBmc2wsd2VpbS1jcy10aW1pbmc6CVRoZSB0
aW1pbmcgYXJyYXksIGNvbnRhaW5zIDYgdGltaW5nIHZhbHVlcyBmb3IgdGhlCj4gPj4gKwkJCWNo
aWxkIG5vZGUuIFdlIGNhbiBnZXQgdGhlIENTIGluZGV4IGZyb20gdGhlIGNoaWxkCj4gPj4gKwkJ
CW5vZGUncyAicmVnIiBwcm9wZXJ0eS4KPiA+IFRoaXMgc2hvdWxkIGJlIG1vcmUgZGV0YWlsZWQs
IHNvbWV0aGluZyBsaWtlOgo+ID4KPiA+IFRoaXMgY29udGFpbnMgdGhlIHZhbHVlcyBmb3IgdGhl
IHJlZ2lzdGVycyBFSU1fQ1NuR0NSMSwgRUlNX0NTbkdDUjIsCj4gPiBFSU1fQ1NuUkNSMSwgRUlN
X0NTblJDUjIsIEVJTV9DU25XQ1IxLCBFSU1fQ1NuV0NSMiBpbiB0aGlzIG9yZGVyLgo+ID4KPiAK
PiAKPiBkbyB5b3UgbWVhbiBpIHNob3VsZCBhZGQgc29tZSBuZXcgcHJvcGVydGllcywgc3VjaCBh
cwo+ICJmc2wsZWltX2NzbnJjcjEiLCAiZnNsLGVpbV9jc25yY3IyIiAuLi4KCk5vLCB0aGUgcHJv
cGVydHkgaXMgZmluZSwganVzdCB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gdGhlIHdheSB0aGF0
ClNhc2NoYSBzdWdnZXN0ZWQuCgo+ID4+ICtzdGF0aWMgaW50IHdlaW1fcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPj4gK3sKPiA+PiArCXN0cnVjdCBpbXhfd2VpbSAqd2Vp
bSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ID4+ICsKPiA+PiArCWNsa19kaXNhYmxl
X3VucHJlcGFyZSh3ZWltLT5jbGspOwo+ID4gT25jZSBhZ2FpbjogSXMgdGhpcyBjbG9jayBuZWVk
ZWQgZm9yIHRoZSBjaGlsZCBkZXZpY2VzPyBJZiB5ZXMsIHlvdQo+ID4gY2FuJ3QgZGlzYWJsZSBp
dCBoZXJlIGFuZCBsZWF2ZSB0aGUgY2hpbGQgZGV2aWNlcyByZWdpc3RlcmVkLgo+ID4KCkJ1dCB3
ZWltX3JlbW92ZSB3aWxsIG5vdCBiZSBjYWxsZWQgYXMgbG9uZyBhcyB0aGVyZSBhcmUgY2hpbGRy
ZW4KcmVnaXN0ZXJlZCwgcmlnaHQ/CgoJQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkZXZpY2V0cmVlLWRpc2N1c3MgbWFpbGluZyBsaXN0CmRldmlj
ZXRyZWUtZGlzY3Vzc0BsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9s
aXN0aW5mby9kZXZpY2V0cmVlLWRpc2N1c3MK

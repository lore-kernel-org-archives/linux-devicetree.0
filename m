From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv4 4/5] of/mtd/nand: add generic binding and helper for
 NAND_BBT_NO_OOB_BBM
Date: Thu, 24 Jul 2014 08:49:15 +0200
Message-ID: <20140724084915.703a1fa0@ipc1.ka-ro>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
 <20140724020627.GD3711@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140724020627.GD3711@ld-irv-0074>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org, Michael Grzeschik <m.grzeschik@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, linux-kernel@vger.kernel.org, Huang
List-Id: devicetree@vger.kernel.org

SGksCgpCcmlhbiBOb3JyaXMgd3JvdGU6Cj4gKEJUVywgdGhhdCdzIGEgbWlnaHR5IENDIGxpc3Qg
eW91IGhhdmUhIEknbSBub3Qgc3VyZSBhbGwgQ0MnZCBwYXJ0aWVzCj4gYXJlIGludGVyZXN0ZWQg
aW4gdGhpcyBzZXJpZXM7IGUuZy4sIFJ1c3NlbCBhbmQgdGhlIEFSTSBsaXN0IHNlZW0KPiB1bnJl
bGF0ZWQpCj4gCj4gSGkgTG90aGFyLAo+IAo+IFNvcnJ5IGZvciB0aGUgZGVsYXkgb24gdGhpcy4g
SSBnZXQgYnVzeSBlbm91Z2ggdGhhdCBJIGNhbid0L2Rvbid0IHJlcGx5Cj4gdG8gZXZlcnl0aGlu
ZyBxdWlja2x5Li4uCj4gCj4gT24gVGh1LCBKdW4gMTIsIDIwMTQgYXQgMDM6MjA6NDRQTSArMDIw
MCwgTG90aGFyIFdhw59tYW5uIHdyb3RlOgo+ID4gYWRkIGEgYm9vbGVhbiBwcm9wZXJ0eSAnbmFu
ZC1uby1vb2ItYmJtJyBhbmQgaGVscGVyIGZ1bmN0aW9uIHRvIGJlCj4gPiBhYmxlIHRvIHNldCB0
aGUgTkFORF9CQlRfTk9fT09CX0JCTSBmbGFnIGluIERUIGNhcGFibGUgTkFORCBkcml2ZXJzCj4g
PiBhbmQgdXNlIGl0IGZvciBpLk1YIGFuZCBNWFMgbmFuZCBkcml2ZXJzLgo+IAo+IElmIEknbSB1
bmRlcnN0YW5kaW5nIHlvdXIgcHJldmlvdXMgY29udmVyc2F0aW9ucyB3aXRoIEh1YW5nIGNvcnJl
Y3RseSwKPiB5b3UgKm11c3QqIHVzZSBOQU5EX0JCVF9OT19PT0JfQkJNIGlmIHlvdSdyZSBnb2lu
ZyB0byB1c2UgdGhlCj4gZnNsLG5vLWJsb2NrbWFyay1zd2FwIG9wdGlvbi4gQ29ycmVjdD8gSWYg
c28sIHRoZW4geW91IG1pZ2h0IG5vdCBuZWVkCj4gYSBzZXBhcmF0ZSAnbmFuZC1uby1vb2ItYmJt
JyBiaW5kaW5nOyB5b3VyIGRyaXZlciBzaG91bGQgaW1wbHkgZnJvbQo+ICdmc2wsbm8tYmxvY2tt
YXJrLXN3YXAnIHRoYXQgaXQgbXVzdCBhbHNvIGVuYWJsZSBOQU5EX0JCVF9OT19PT0JfQkJNLgo+
IApuby1ibG9ja21hcmstc3dhcCBpbXBsaWVzIE5PX09PQl9CQk0gYnV0IE5PX09PQl9CQk0gbWF5
IGFsc28gYmUgdXNlZAppbmRlcGVuZGVudCBmcm9tIG5vLWJsb2NrbWFyay1zd2FwLgoKSU1PIHdy
aXRpbmcgYSBiYWQgYmxvY2sgbWFya2VyIHRvIGZsYXNoICh3aGljaCBpcyBwcmV2ZW50ZWQgYnkK
dGhlIE5BTkRfQkJUX05PX09PQl9CQk0gZmxhZykgaXMgYSBtaXNpbnRlcnByZXRhdGlvbiBvZiB0
aGUgcHVycG9zZSBvZgp0aGUgQkIgbWFyayBpbiB0aGUgZmlyc3QgcGxhY2UuIFRoZSBtYW51ZmFj
dHVyZXIgZ3VhcmFudGVlcyB0aGF0IGJsb2Nrcwp3aGljaCBhcmUgaW5pdGlhbGx5IGJhZCB3aWxs
IGhhdmUgYXQgbGVhc3Qgb25lIHplcm8gYml0IGluIHRoZSBwb3NpdGlvbgpvZiB0aGUgQkIgbWFy
ay4gVGhhdCdzIGFsbCB0byBpdC4KClRoZXJlIGlzIG5vIGd1YXJhbnRlZSwgdGhhdCB5b3Ugd2ls
bCBldmVuIGJlIGFibGUgdG8gd3JpdGUgYW55CmRldGVybWluaXN0aWMgZGF0YSB0byBhIGJsb2Nr
IHRoYXQgaGFzIHR1cm5lZCBiYWQgZHVlIHRvIHdlYXJvdXQgb3IKb3RoZXIgZmxhc2ggZGVmZWN0
cy4gSXQgaXMgcmF0aGVyIGJvZ3VzIHRvIHJlbHkgb24gZGF0YSB3cml0dGVuIHRvIGEKa25vd24g
YmFkIGJsb2NrIHRvIHJlZmxlY3QgdGhlIHN0YXRlIG9mIHRoZSBibG9jay4KCj4gQWxzbywgYXMg
SSBub3RlZCBpbiBbMV0sIEkgZG9uJ3QgcmVhbGx5IGxpa2UgZXhwb3NpbmcgYSB0b24gb2YKPiBp
bmRpdmlkdWFsIGJvb2xlYW4gRFQgcHJvcGVydGllcyBsaWtlIHRoaXMuIChBdCBsZWFzdCB0aGlz
IHByb3BlcnR5IGlzCj4gb3J0aG9nb25hbCB0byB0aGUgYmFkIGJsb2NrIHRhYmxlOyBJIHdhcyBh
IGxpdHRsZSBvZmYtYmFzZSBpbiBbMV0uKQo+IApIb3cgZWxzZSBzaG91bGQgdGhpcyBpbmZvcm1h
dGlvbiBiZSBjb252ZXllZCB0byB0aGUgZmxhc2ggZHJpdmVycz8KCgpMb3RoYXIgV2HDn21hbm4K
LS0gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCgpLYS1SbyBlbGVjdHJvbmljcyBHbWJIIHwgUGFzY2Fsc3RyYcOfZSAyMiB8IEQgLSA1
MjA3NiBBYWNoZW4KUGhvbmU6ICs0OSAyNDA4IDE0MDItMCB8IEZheDogKzQ5IDI0MDggMTQwMi0x
MApHZXNjaMOkZnRzZsO8aHJlcjogTWF0dGhpYXMgS2F1c3NlbgpIYW5kZWxzcmVnaXN0ZXJlaW50
cmFnOiBBbXRzZ2VyaWNodCBBYWNoZW4sIEhSQiA0OTk2Cgp3d3cua2Fyby1lbGVjdHJvbmljcy5k
ZSB8IGluZm9Aa2Fyby1lbGVjdHJvbmljcy5kZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

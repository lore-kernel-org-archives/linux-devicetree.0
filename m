From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv4 0/5] mtd: gpmi: make blockmark swapping optional
Date: Thu, 26 Jun 2014 12:44:51 +0200
Message-ID: <20140626124451.6014fde3@ipc1.ka-ro>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org, Michael Grzeschik <m.grzeschik@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Brian Norris <computersforpeace@gmail.c>
List-Id: devicetree@vger.kernel.org

SGksCgpMb3RoYXIgV2HDn21hbm4gd3JvdGU6Cj4gV2l0aCBhIGZsYXNoLWJhc2VkIEJCVCB0aGVy
ZSBpcyBubyByZWFzb24gdG8gbW92ZSB0aGUgRmFjdG9yeSBCYWQKPiBCbG9jayBNYXJrZXIgZnJv
bSB0aGUgZGF0YSBhcmVhIGJ1ZmZlciAodG8gd2hlcmUgaXQgaXMgbWFwcGVkIGJ5IHRoZQo+IEdQ
TUkgTkFORCBjb250cm9sbGVyKSB0byB0aGUgT09CIGJ1ZmZlci4gVGh1cywgbWFrZSB0aGlzIGZl
YXR1cmUKPiBjb25maWd1cmFibGUgdmlhIERULiBUaGlzIGlzIHJlcXVpcmVkIGZvciB0aGUgS2Et
Um8gZWxlY3Ryb25pY3MKPiBpLk1YNiBwbGF0Zm9ybXMuCj4gCj4gQ2hhbmdlcyB3cnQuIHYyOgo+
IC0gYWRkZWQgYSB3YXJuaW5nIGZvciBpLk1YMjggdG8gdGhlIGJpbmRpbmcgZG9jdW1lbnRhdGlv
bgo+IC0gZml4ZWQgdGhlIGdwbWlfZWNjX3JlYWRfc3VicGFnZSgpIHJvdXRpbmUgd2hpY2ggdHVy
bmVkIG9uIGJsb2NrbWFyawo+ICAgc3dhcHBpbmcgdW5jb25kaXRpb25hbGx5Cj4gLSB1c2UgIUdQ
TUlfSVNfTVgyMygpIGluIHBsYWNlIG9mIHRoaXMtPnN3YXBfYmxvY2tfbWFyayAod2hpY2ggd2Vy
ZQo+ICAgc3lub255bW91cyB0aGUgb3JpZ2luYWwgY29kZSkgaW4gZ3BtaV9lY2NfcmVhZF9vb2Io
KSBhbmQKPiAgIGdwbWlfYmxvY2tfbWFya2JhZCgpCj4gLSBtYWtlIG5hbmQtb24tZmxhc2gtYmJ0
IGEgcHJlcmVxdWlzaXRlIGZvciB0aGlzIGZlYXR1cmUKPiAKPiBwYXRjaCBhZGRlZDoKPiAtIGFk
ZCBhbiBhZGRpdGlvbmFsIG9wdGlvbiB0byB0dXJuIG9mIEJCIG1hcmsgd3JpdGluZwo+IAo+IENo
YW5nZXMgd3J0LiB2MzoKPiAtIGFkZGVkIHR3byBjb2RlIGNsZWFudXAgcGF0Y2hlcwo+IC0gYWRk
ZWQgYSBwYXRjaCB0byB0dXJuIG9mIE5BTkRfQkJUX0NSRUFURSwgaWYgYmxvY2ttYXJrIHN3YXBw
aW5nIGlzIGRpc2FibGVkCj4gCj4gCmFueSBjb21tZW50cyBvbiB0aGlzIHBhdGNoc2V0PwoKCkxv
dGhhciBXYcOfbWFubgotLSAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KCkthLVJvIGVsZWN0cm9uaWNzIEdtYkggfCBQYXNjYWxzdHJh
w59lIDIyIHwgRCAtIDUyMDc2IEFhY2hlbgpQaG9uZTogKzQ5IDI0MDggMTQwMi0wIHwgRmF4OiAr
NDkgMjQwOCAxNDAyLTEwCkdlc2Now6RmdHNmw7xocmVyOiBNYXR0aGlhcyBLYXVzc2VuCkhhbmRl
bHNyZWdpc3RlcmVpbnRyYWc6IEFtdHNnZXJpY2h0IEFhY2hlbiwgSFJCIDQ5OTYKCnd3dy5rYXJv
LWVsZWN0cm9uaWNzLmRlIHwgaW5mb0BrYXJvLWVsZWN0cm9uaWNzLmRlCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

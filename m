From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/6] Add CPU clock support for Armada 7K/8K
Date: Thu, 10 Jan 2019 08:27:41 -0800
Message-ID: <154713766177.15366.14948014236046606980@swboyd.mtv.corp.google.com>
References: <20181216094147.6468-1-gregory.clement@bootlin.com>
 <87a7k8o5d5.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87a7k8o5d5.fsf@FE-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>, Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

UXVvdGluZyBHcmVnb3J5IENMRU1FTlQgKDIwMTktMDEtMTAgMDg6MTY6MjIpCj4gSGkgU3RlcGhl
biwKPiAgCj4gIE9uIGRpbS4sIGTDqWMuIDE2IDIwMTgsIEdyZWdvcnkgQ0xFTUVOVCA8Z3JlZ29y
eS5jbGVtZW50QGJvb3RsaW4uY29tPiB3cm90ZToKPiAKPiA+IEhlbGxvLAo+ID4KPiA+IFRoaXMg
aXMgdGhlIHRoaXJkIHZlcnNpb24gb2YgYSBzZXJpZXMgYWxsb3dpbmcgdG8gbWFuYWdlIHRoZSBj
cHUKPiA+IGNsb2NrIGZvciBBcm1hZGEgN0svOEsuIEZvciB0aGVzZSBTb0NzLCB0aGUgQ1BVcyBz
aGFyZSB0aGUgc2FtZSBjbG9jawo+ID4gYnkgY2x1c3Rlciwgc28gYWN0dWFsbHkgdGhlIGNsb2Nr
IG1hbmFnZW1lbnQgaXMgZG9uZSBhdCBjbHVzdGVyIGxldmVsLgo+ID4KPiA+IEFzIGZvciB0aGUg
b3RoZXIgQXJtYWRhIDdLLzhLIGNsb2NrcyBpdCBpcyBwb3NzaWJsZSB0byBoYXZlIG11bHRpcGxl
Cj4gPiBBUCBzbyBoZXJlIGFnYWluIHdlIG5lZWQgdG8gaGF2ZSB1bmlxdWUgbmFtZTogdGhlIHB1
cnBvc2Ugb2YgdGhlIHNlY29uZAo+ID4gcGF0Y2ggaXMgdG8gc2hhcmUgYSBjb21tb24gY29kZSB3
aGljaCB3aWxsIGJlIHVzZWQgaW4gMyBkcml2ZXJzLgo+ID4KPiA+IFRoZSBsYXN0IDIgcGF0Y2gg
ZW5hYmxlIHRoZSBkcml2ZXIgYXQgZHQgYW5kIHBsYXRmb3JtIGxldmVsIGFuZCB3aWxsCj4gPiBi
ZSBhcHBsaWVkIHRocm91Z2ggdGhlIG12ZWJ1IHN1YnN5c3RlbS4KPiAKPiBXaGF0IGlzIHRoZSBz
dGF0dXMgb2YgdGhpcyBzZXJpZXM/Cj4gCj4gVGhlIG9ubHkgY29tbWVudHMgSSBoYWQgd2FzIGZy
b20gUm9iIGFib3V0IHRoZSBiaW5kaW5nIGFuZCBJIGFuc3dlcmVkCj4gdGhlbSAzIHdlZWtzIGFn
by4gRG8geW91IGhhdmUgYW55IG90aGVyIGNvbW1lbnRzPyBEbyB5b3UgZXhwZWN0IGEgcmViYXNl
Cj4gb2YgdGhpcyBzZXJpZXMgb24gdjUuMC1yYzE/Cj4gCgpJJ20gd2FpdGluZyBmb3IgUm9iLiBJ
IHRoaW5rIHRoZSBiaW5kaW5nIGlzIG5vdCBwcm9wZXIgc28gcHJlc3VtYWJseSB5b3UKd2lsbCBm
aWd1cmUgb3V0IHdoYXQgUm9iIHdhbnRzIGFuZCB0aGVuIGNoYW5nZSB0aGUgY29kZSBhY2NvcmRp
bmdseSBhbmQKcmVzZW5kPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

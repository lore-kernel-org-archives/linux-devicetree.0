From: Moritz Fischer <moritz.fischer.private@gmail.com>
Subject: Re: [PATCH v2] ARM: zynq: Add #io-channel-cells to (x)adc node for
 iio-hwmon
Date: Thu, 16 Mar 2017 09:39:44 -0700
Message-ID: <CAJYdmeNc48=OOvRiUjqPBJhz9RCbzeaRGu1Tfm=hrvzkJrSsag@mail.gmail.com>
References: <1489003884-2489-1-git-send-email-mdf@kernel.org>
 <e6da3f38-7039-66e5-5b9d-a44ff42aa9c9@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e6da3f38-7039-66e5-5b9d-a44ff42aa9c9@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Julia Cartwright <julia@ni.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBNYXIgMTYsIDIwMTcgYXQgOToxNiBBTSwgTWljaGFsIFNpbWVrIDxtaWNoYWwuc2lt
ZWtAeGlsaW54LmNvbT4gd3JvdGU6Cj4gSGksCj4KPiBPbiA4LjMuMjAxNyAyMToxMSwgTW9yaXR6
IEZpc2NoZXIgd3JvdGU6Cj4+IEZpeAo+Pgo+PiBPRjogL2lpb19od21vbjogY291bGQgbm90IGdl
dCAjaW8tY2hhbm5lbC1jZWxscyBmb3IKPj4gL2FtYmEvYWRjQGY4MDA3MTAwCj4+IE9GOiAvaWlv
X2h3bW9uOiBjb3VsZCBub3QgZ2V0ICNpby1jaGFubmVsLWNlbGxzIGZvcgo+PiAvYW1iYS9hZGNA
ZjgwMDcxMDAKPj4gT0Y6IC9paW9faHdtb246IGNvdWxkIG5vdCBnZXQgI2lvLWNoYW5uZWwtY2Vs
bHMgZm9yCj4+IC9hbWJhL2FkY0BmODAwNzEwMAo+Pgo+PiBieSBhZGRpbmcgdGhlICNpby1jaGFu
bmVsLWNlbGxzIHByb3BlcnR5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNb3JpdHogRmlzY2hlciA8
bWRmQGtlcm5lbC5vcmc+Cj4+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbngu
Y29tPgo+PiBDYzogU8O2cmVuIEJyaW5rbWFubiA8c29yZW4uYnJpbmttYW5uQHhpbGlueC5jb20+
Cj4+IENjOiBKdWxpYSBDYXJ0d3JpZ2h0IDxqdWxpYUBuaS5jb20+Cj4+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnCj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiAt
LS0KPj4KPj4gQ2hhbmdlcyBmcm9tIHYxOgo+PiAtIGZpeCBtZXNzZWQgdXAgY29tbWl0IG1lc3Nh
Z2UKPj4gLS0tCj4+ICBhcmNoL2FybS9ib290L2R0cy96eW5xLTcwMDAuZHRzaSB8IDEgKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy96eW5xLTcwMDAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtNzAwMC5k
dHNpCj4+IGluZGV4IGYzYWM5YmYuLjk4MjMzYTggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3p5bnEtNzAwMC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3p5bnEtNzAw
MC5kdHNpCj4+IEBAIC03Miw2ICs3Miw3IEBACj4+ICAgICAgICAgICAgICAgICAgICAgICBpbnRl
cnJ1cHRzID0gPDAgNyA0PjsKPj4gICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJl
bnQgPSA8JmludGM+Owo+PiAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjIDEy
PjsKPj4gKyAgICAgICAgICAgICAgICAgICAgICNpby1jaGFubmVsLWNlbGxzID0gPDE+Owo+PiAg
ICAgICAgICAgICAgIH07Cj4+Cj4+ICAgICAgICAgICAgICAgY2FuMDogY2FuQGUwMDA4MDAwIHsK
Pj4KPgo+IEkgdGhpbmsgaXQgd2lsbCBiZSBnb29kIHRvIHRoZSBuZXh0IHN0ZXAgdG9vLgo+IEl0
IG1lYW5zIGFsc28gYWRkIGlpby1od21vbiBub2RlIHRvby4KPgo+IFdoYXQgZG8geW91IHRoaW5r
PwoKSSBoYWRuJ3QgcHV0IGl0IGluIHRoZXJlIHNpbmNlIGR0cyBpcyBzdXBwb3NlZCB0byBkZXNj
cmliZSBodywKYnV0IG9idmlvdXNseSBwdXR0aW5nIHRoZSBhY3R1YWwgaHdtb24gaW4gdGhlcmUg
bWFrZXMgaXQgbW9yZSB1c2VmdWwuCgpJIGNhbiByZXN1Ym1pdCB3aXRoIHRoZSBod21vbiBub2Rl
IGluIHRoZXJlLgoKQ2hlZXJzLApNb3JpdHoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

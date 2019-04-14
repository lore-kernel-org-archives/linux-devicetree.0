From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: Re: [PATCH] ARM: dts: bugfix tqma7 soft reset issue
Date: Sun, 14 Apr 2019 18:10:52 +0200
Message-ID: <CAH+2xPCGdJkb9Hj-ukoy6cwJH6WjMJXX+yevj8tL2N+6f6icmQ@mail.gmail.com>
References: <20190414120629.8912-1-bruno.thomsen@gmail.com>
 <CAOMZO5DLiY_Y7xi6c6G=PsBJMdCf5jSxE12qz7Qt8bYoxhxoTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5DLiY_Y7xi6c6G=PsBJMdCf5jSxE12qz7Qt8bYoxhxoTQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <markus.niebel@tq-group.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Lars Alex Pedersen <laa@kamstrup.com>, Sascha Hauer <s.hauer@pengutronix.de>, Clemens Koller <clemens.ml@gmx.net>, ksc@kamstrup.com, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgRmFiaW8sCgpEZW4gc8O4bi4gMTQuIGFwci4gMjAxOSBrbC4gMTcuMzIgc2tyZXYgRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjoKCj4gPiAgJndkb2cxIHsKPiA+ICsgICAgICAg
LyoKPiA+ICsgICAgICAgICogRXJyYXRhIGUxMDU3NDoKPiA+ICsgICAgICAgICogV0RPRyByZXNl
dCBuZWVkcyB0byBydW4gd2l0aCBXRE9HX1JFU0VUX0Igc2lnbmFsIGVuYWJsZWQuCj4gPiArICAg
ICAgICAqIFgxLTUxIChXRE9HMSMpIHNpZ25hbCBuZWVkcyBjYXJyaWVyIGJvYXJkIGhhbmRsaW5n
IHRvIHJlc2V0Cj4gPiArICAgICAgICAqIFRRTWE3IG9uIFgxLTIyIChSRVNFVF9JTiMpLgo+ID4g
KyAgICAgICAgKi8KPiA+ICsgICAgICAgZnNsLGV4dC1yZXNldC1vdXRwdXQ7Cj4gPiAgICAgICAg
IHN0YXR1cyA9ICJva2F5IjsKPgo+IFlvdSBzaG91bGQgYWxzbyBhZGQgYSBwaW5jdHJsIGVudHJ5
IGZvciB0aGUgd2F0Y2hkb2cgcGluLgoKVGhlcmUgaXMgYSBwaW5jdHJsIGVudHJ5IGZvciB0aGUg
d2F0Y2hkb2cgcGluIGluIGlteDctbWJhNy5kdHNpIGZpbGUKYWxtb3N0IGlkZW50aWNhbGx5IHRv
IGlteDdzLXdhcnAuZHRzLiBUaGVyZSBhcmUgdGVjaG5pY2FsIDIgcGlucyB5b3UgY2FuCnVzZSBm
b3IgdGhlIG91dHB1dCwgYW5kIHRoaXMgZHRzaSB3aWxsIGJlIHVzZWQgZm9yIG90aGVyIHByb2R1
Y3QgZGV2aWNlCnRyZWVzIGFzIHdlbGwuIFdoZXJlIHRoZSBpbXg3LW1iYTcuZHRzaSB3aWxsIG9u
bHkgYmUgdXNlZCBmb3IgdGhlCmRldmVsb3BtZW50IGJvYXJkLgpJIGFncmVlIHdpdGggeW91IHRo
YXQgdGhlIHJlYWRhYmlsaXR5IG9mIHRoaXMgZHRzaSB3aWxsIGltcHJvdmUsCmFuZCB0aGUgbmV4
dCBkZXZpY2UgdHJlZSBJIHdhbnQgdG8gbWFpbmxpbmUgYWxzbyB1c2UgdGhpcyBwaW4gY29uZmln
dXJhdGlvbi4KCiBCcnVubwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbAo=

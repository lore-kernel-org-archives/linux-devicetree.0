From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re:  Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq
 related code from core driver
Date: Mon, 30 Sep 2019 21:44:12 +0200
Message-ID: <trinity-d5c9e092-508c-4db6-8f36-d5917466a750-1569872652621@3c-app-gmx-bap76>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
 <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
 <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
 <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
 <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75>
 <1567059876.15320.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567059876.15320.3.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kate Stewart <kstewart@linuxfoundation.org>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SGksCgpidWcgaXMgc3RpbGwgcHJlc2VudCBpbiA1LjQtcmMxCgpkbWVzZyBwcmludHMgdGhpcyBs
aW5lIGFuZCBhdCBsZWFzdCBzd2l0Y2ggaXMgbm90IGluaWFsaXplZCBvbiBiYW5hbmFwaS1yMgoK
bXQ2Mzk3IDEwMDBkMDAwLnB3cmFwOm10NjMyMzogdW5zdXBwb3J0ZWQgY2hpcDogMHgwCgpyZWdh
cmRzIEZyYW5rCgoKPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMjkuIEF1Z3VzdCAyMDE5IHVtIDA4
OjI0IFVocgo+IFZvbjogIkhzaW4taHNpdW5nIFdhbmciIDxoc2luLWhzaXVuZy53YW5nQG1lZGlh
dGVrLmNvbT4KPiBBbjogIkZyYW5rIFd1bmRlcmxpY2giIDxmcmFuay13QHB1YmxpYy1maWxlcy5k
ZT4sICJNYXR0aGlhcyBCcnVnZ2VyIiA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiBDYzogbGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZywgIk1hcmsgUnV0bGFuZCIgPG1hcmsucnV0
bGFuZEBhcm0uY29tPiwgIkFsZXNzYW5kcm8gWnVtbW8iIDxhLnp1bW1vQHRvd2VydGVjaC5pdD4s
ICJBbGV4YW5kcmUgQmVsbG9uaSIgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPiwgc3J2
X2hldXBzdHJlYW1AbWVkaWF0ZWsuY29tLCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgIkdy
ZWcgS3JvYWgtSGFydG1hbiIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiwgIlNlYW4gV2Fu
ZyIgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+LCAiTGlhbSBHaXJkd29vZCIgPGxnaXJkd29vZEBn
bWFpbC5jb20+LCAiUm9iIEhlcnJpbmciIDxyb2JoK2R0QGtlcm5lbC5vcmc+LCBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnLCAiUmljaGFyZCBGb250YW5hIiA8cmZvbnRhbmFAcmVkaGF0LmNv
bT4sICJNYXJrIEJyb3duIiA8YnJvb25pZUBrZXJuZWwub3JnPiwgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnLCAiUmVuw6kgdmFuIERvcnN0IiA8b3BlbnNvdXJjZUB2ZG9yc3Qu
Y29tPiwgIlRob21hcyBHbGVpeG5lciIgPHRnbHhAbGludXRyb25peC5kZT4sICJFZGRpZSBIdWFu
ZyIgPGVkZGllLmh1YW5nQG1lZGlhdGVrLmNvbT4sICJMZWUgSm9uZXMiIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4sICJLYXRlIFN0ZXdhcnQiIDxrc3Rld2FydEBsaW51eGZvdW5kYXRpb24ub3JnPiwg
bGludXgtcnRjQHZnZXIua2VybmVsLm9yZwo+IEJldHJlZmY6IFJlOiBBdzogUmU6IFtCVUddIFtQ
QVRDSCB2NSAwMi8xMF0gbWZkOiBtdDYzOTc6IGV4dHJhY3QgaXJxIHJlbGF0ZWQgY29kZSBmcm9t
IGNvcmUgZHJpdmVyCj4KPiBIaSBGcmFuay9NYXR0aGlhcywKPiAKPiBPbiBGcmksIDIwMTktMDgt
MjMgYXQgMTk6MTYgKzAyMDAsIEZyYW5rIFd1bmRlcmxpY2ggd3JvdGU6Cj4gPiA+IEdlc2VuZGV0
OiBGcmVpdGFnLCAyMy4gQXVndXN0IDIwMTkgdW0gMTc6NDIgVWhyCj4gPiA+IFZvbjogIk1hdHRo
aWFzIEJydWdnZXIiIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+ID4gCj4gPiA+IEkgc3VwcG9z
ZSB0aGF0J3MgYmVjYXVzZSAzLzEwIGhhcyBjb2RlIHRoYXQgc2hvdWxkIGJlIGluIDIvMTAgYW5k
IGZvciBzb21lCj4gPiA+IHJlYXNvbiAzLzEwIHdhcyBub3QgcHVzaGVkIGZvciBsaW51eC1uZXh0
IGluY2x1c2lvbi4gQWx0aG91Z2ggaXQgaGFzIHRoZSBzYW1lCj4gPiA+IEFja2VkLWZvci1tZmQt
YnkgdGFnLgo+ID4gPgo+ID4gPiBARnJhbmssIGNhbiB5b3UgdGVzdCBpZiBhZGRpbmcgMy8xMCB0
byB5b3VyIGNvZGUgYmFzZSBmaXhlcyB0aGUgaXNzdWU/Cj4gPiAKPiA+IGFkZGluZyBwYXJ0IDMg
WzFdIHNlZW1zIHRvIGZpeCB0aGUgaXNzdWUgdG9vCj4gPiAKPiA+IFsgICAgNC45NjAwNTFdIG10
NjMyMy1yZWd1bGF0b3IgbXQ2MzIzLXJlZ3VsYXRvcjogQ2hpcCBJRCA9IDB4MjAyMwo+ID4gCj4g
PiB0aGFua3MKPiA+IAo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTExMTA1MDkvCj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLgo+IFRoZSByb290IGNhdXNlIHNl
ZW1zIEkgZGlkbid0IHNwbGl0IHRoZSBjb2RlIHdlbGwuCj4gSSB3aWxsIGZpeCBpdCBpbiB0aGUg
bmV4dCB2ZXJzaW9uLgo+IAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

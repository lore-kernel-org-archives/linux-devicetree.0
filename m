From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: document Broadcom Northstar
 pin mux controller
Date: Tue, 16 Oct 2018 09:41:37 +0200
Message-ID: <CACRpkdapyFnu=GAqEzK56+a5Gef+vcXsa7a6iJE=isi2MMWKTw@mail.gmail.com>
References: <20180926193103.21241-1-zajec5@gmail.com>
 <20181011222229.GA7470@bogus>
 <7f08ed7bf11a22163bdfd56ff96a9262@milecki.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7f08ed7bf11a22163bdfd56ff96a9262@milecki.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMTA6NTYgQU0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPiB3cm90ZToKCj4gPiBQZXJoYXBzICdjcnUnIGluIHRoZSBjb21wYXRpYmxlIGlm
IHRoYXQncyB3aGF0IHRoZSBoL3cgaXMgY2FsbGVkPwo+ID4KPiA+IEFsc28sIGlmIHRoaXMgaXMg
YSBzdWItYmxvY2ssIHRoZW4gaXQgc2hvdWxkIGJlIGEgY2hpbGQgb2YgdGhlIGJsb2NrCj4gPiB3
aGljaCBzaG91bGQgYmUgZGVmaW5lZCBoZXJlLgo+Cj4gSXQgdG9vayBtZSBzb21lIHRpbWUgdG8g
ZG8gc29tZSBleHRyYSByZXNlYXJjaCBvbiB0aGUgd2hvbGUgQ1JVIHRoaW5nLgo+Cj4gVmFsdWFi
bGUgcmVzb3VyY2VzOgo+IFsxXSBiY201MzAxeF9kbXUuYyAoZnJvbSB0aGUgU0RLKQo+IFsyXSBi
Y201MzAxeF9wY2llLmMgKGZyb20gdGhlIFNESykKPiBbM10gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC83ODg4NjUxLwo+IFs0XSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzUwNTE0NzEvCj4KPiBGaXJzdCBvZiBhbGwgQ1JVIHNlZW1zIHRvIGJlIGEgc3ViLWJs
b2NrIG9mIHRoZSBETVUgKHdoaWNoIHN0YW5kcyBmb3IKPiAiRGV2aWNlIE1hbmFnZW1lbnQgVW5p
dCIgYWNjb3JkaW5nIHRvIHRoZSBbMV0pLiBETVUgc2VlbXMgdG8gYmUKPiBpbmRlcGVuZGVudCBi
bG9jayBhdCAweDE4MDBjMDAwIHdpdGggYSBzaXplIG9mIDB4MTAwMC4KPgo+IEl0IGlzbid0IGFj
dHVhbGx5IGNsZWFyIHdoYXQgdGhlIENSVSBzdGFuZHMgZm9yLiBJbiBCcm9hZGNvbSdzIGNhc2U6
Cj4gMS4gQWNjb3JkaW5nIHRvIHRoZSBbM10gaXQncyAiQ2xvY2sgYW5kIFJlc2V0IFVuaXQiCj4g
Mi4gQWNjb3JkaW5nIHRvIHRoZSBbNF0gaXQncyBhICJjZW50cmFsIHJlc291cmNlIHVuaXQiCj4g
T3RoZXIgdmVuZG9ycyBzZWVtIHRvIHVzZSBDUlUgbmFtZSBmb3IgIkNsb2NrIGFuZCBSZXNldCBV
bml0Ii4KPgo+IEluIGFueSBjYXNlLCB5b3UncmUgcmlnaHQgUm9iLCBpdCdzIGEgc3ViLWJsb2Nr
LCBhIHNldCBvZiByYW5kb20KPiByZWdpc3RlcnMgdGhhdCBjb250cm9sIFNvQy4KPgo+IFNvIEkg
dGhpbmsgdGhhdDoKPiAxKSBXZSBzaG91bGQgaGF2ZSBhIG5vZGUgZm9yIERNVSBhbmQgQ1JVCj4g
MikgV2Ugc2hvdWxkIG5vdCBpbmNsdWRlICJjcnUiIGluIGJpbmRpbmdzIGFzIHBpbm11eGluZyBz
ZWVtcyB0byBiZSBwYXJ0Cj4gICAgIG9mIFNvQyB0aGF0IGp1c3QgaGFwcGVucyB0byBiZSBjb250
cm9sbGVkIHVzaW5nIENSVSByZWdpc3RlcnMKCk9LIGRvIHlvdSB3YW50IG1lIHRvIHJldmVydCB0
aGUgcGF0Y2hlcyBvciBkbyB5b3Ugd2FudCB0bwpmaXggdGhpcyBzdHVmZiBvbiB0b3Agb2YgdGhl
IHBhdGNoZXMgdGhhdCBhcmUgYWxyZWFkeSBpbiB0aGUgdHJlZT8KSSdtIGZpbmUgZWl0aGVyIHdh
eS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: broadcom: Use the .dtb name in the rule,
 rather than .dts
Date: Tue, 25 Sep 2018 22:36:33 +0200
Message-ID: <CAOesGMj2-1o1O0MpKbk8_8e1cyvGSYb2JFvF-M2Nf7CBa-Ujxg@mail.gmail.com>
References: <b42d2e57-8bcd-0d6a-7a4d-aeefedcdd5f3@i2se.com>
 <20180924102228.19656-1-liviu@dudau.co.uk>
 <539eb374-9122-6c09-4c64-80bfa6b7bf89@i2se.com>
 <1c0db58a-5bc2-8de3-f70d-725a29376513@gmail.com>
 <20180925185133.jdom5tvs6zklntr7@localhost>
 <1480797531.286958.1537907616382@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480797531.286958.1537907616382@email.1und1.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Rob Herring <robh+dt@kernel.org>, Eric Anholt <eric@anholt.net>, ARM-SoC Maintainers <arm@kernel.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgMTA6MzMgUE0gU3RlZmFuIFdhaHJlbiA8c3RlZmFuLndh
aHJlbkBpMnNlLmNvbT4gd3JvdGU6Cj4KPgo+ID4gT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20u
bmV0PiBoYXQgYW0gMjUuIFNlcHRlbWJlciAyMDE4IHVtIDIwOjUxIGdlc2NocmllYmVuOgo+ID4K
PiA+Cj4gPiBPbiBUdWUsIFNlcCAyNSwgMjAxOCBhdCAxMToxNzo1MkFNIC0wNzAwLCBGbG9yaWFu
IEZhaW5lbGxpIHdyb3RlOgo+ID4gPiBPbiAwOS8yNC8yMDE4IDA0OjAzIEFNLCBTdGVmYW4gV2Fo
cmVuIHdyb3RlOgo+ID4gPiA+IEFtIDI0LjA5LjIwMTggdW0gMTI6MjIgc2NocmllYiBMaXZpdSBE
dWRhdToKPiA+ID4gPj4gQ29tbWl0IGE3ZWIyNjM5MmI4OTMgKCJhcm02NDogZHRzOiBicm9hZGNv
bTogQWRkIHJlZmVyZW5jZSB0byBDb21wdXRlCj4gPiA+ID4+IE1vZHVsZSBJTyBCb2FyZCBWMyIp
IGFkZHMgdGhlIGJjbTI4MzctcnBpLWNtMy1pbzMuZHRzIGZpbGUgYXMgYSB0YXJnZXQKPiA+ID4g
Pj4gaW4gdGhlIE1ha2VmaWxlLCByYXRoZXIgdGhhbiB0aGUgLmR0YiBuYW1lLiBUaGlzIHdpbGwg
c2tpcCB0aGUKPiA+ID4gPj4gZ2VuZXJhdGlvbiBvZiB0aGUgLmR0YiBmaWxlIGF0IGNvbXBpbGUg
dGltZSBhbmQgd2lsbCBmYWlsIHRoZSBkdGJzX2luc3RhbGwKPiA+ID4gPj4gdGFyZ2V0Lgo+ID4g
PiA+Pgo+ID4gPiA+PiBGaXhlczogYTdlYjI2MzkyYjg5MyAoImFybTY0OiBkdHM6IGJyb2FkY29t
OiBBZGQgcmVmZXJlbmNlIHRvIENvbXB1dGUKPiA+ID4gPj4gTW9kdWxlIElPIEJvYXJkIFYzIikK
PiA+ID4gPj4KPiA+ID4gPj4gU2lnbmVkLW9mZi1ieTogTGl2aXUgRHVkYXUgPGxpdml1QGR1ZGF1
LmNvLnVrPgo+ID4gPiA+Cj4gPiA+ID4gQWNrZWQtYnk6IFN0ZWZhbiBXYWhyZW4gPHN0ZWZhbi53
YWhyZW5AaTJzZS5jb20+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MsIGkgd2lsbCBhZGQgYSBkdGJz
X2luc3RhbGwgc3RlcCB0byBteSB0ZXN0IGpvYnMuCj4gPiA+Cj4gPiA+IFNhbWUgaGVyZS4KPiA+
Cj4gPiBJIGRvIGJ1dCBJIGRvbid0IHNlZW0gdG8gY2F0Y2ggYW55IGVycm9ycyBmcm9tIGl0LiA6
LS8KPgo+IFN0cmFuZ2UsIGknbSBnZXQgZ2V0dGluZyB0aGlzOgo+Cj4gc2NyaXB0cy9NYWtlZmls
ZS5kdGJpbnN0OjMxOiBUYXJnZXQg4oCeYmNtMjgzNy1ycGktY20zLWlvMy5kdHPigJwgcGFzc3Qg
bmljaHQgenVtIFppZWwtTXVzdGVyCj4gICBJTlNUQUxMIGFyY2gvYXJtNjQvYm9vdC9kdHMvYnJv
YWRjb20vYmNtMjgzNy1ycGktMy1iLXBsdXMuZHRiCj4gICBJTlNUQUxMIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYnJvYWRjb20vYmNtMjgzNy1ycGktMy1iLmR0Ygo+ICAgSU5TVEFMTAo+IGNwOiBGZWhs
ZW5kZXIgWmllbGRhdGVp4oCQT3BlcmFuZCBoaW50ZXIgJy90bXAvYnJvYWRjb20nCj4g4oCeY3Ag
LS1oZWxw4oCcIGxpZWZlcnQgd2VpdGVyZSBJbmZvcm1hdGlvbmVuLgo+IHNjcmlwdHMvTWFrZWZp
bGUuZHRiaW5zdDozMjogZGllIFJlZ2VsIGbDvHIgWmllbCDigJ5iY20yODM3LXJwaS1jbTMtaW8z
LmR0c+KAnCBzY2hlaXRlcnRlCj4gbWFrZVsyXTogKioqIFtiY20yODM3LXJwaS1jbTMtaW8zLmR0
c10gRmVobGVyIDEKPiBzY3JpcHRzL01ha2VmaWxlLmR0Ymluc3Q6MzU6IGRpZSBSZWdlbCBmw7xy
IFppZWwg4oCeYnJvYWRjb23igJwgc2NoZWl0ZXJ0ZQo+IG1ha2VbMV06ICoqKiBbYnJvYWRjb21d
IEZlaGxlciAyCj4gYXJjaC9hcm02NC9NYWtlZmlsZToxMzk6IGRpZSBSZWdlbCBmw7xyIFppZWwg
4oCeZHRic19pbnN0YWxs4oCcIHNjaGVpdGVydGUKPiBtYWtlOiAqKiogW2R0YnNfaW5zdGFsbF0g
RmVobGVyIDIKCk9oLCBpdCBmYWlscyBidXQgbXkgcmVwb3J0aW5nIHNjcmlwdHMgZG9uJ3Qgbm90
aWNlIGl0IHNpbmNlIEkgdXN1YWxseQpkb24ndCBjYXB0dXJlIGVycm9ycyBmcm9tIHRoZSBpbnN0
YWxsIHBoYXNlLgoKCi1PbG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

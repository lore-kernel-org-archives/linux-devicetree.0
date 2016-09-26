From: Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v4 2/5] ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 initial support
Date: Mon, 26 Sep 2016 15:44:05 +0200
Message-ID: <119ad2fc-8e74-1193-8ee2-417cf1e6fd49@engicam.com>
References: <1473618641-10159-1-git-send-email-jagan@amarulasolutions.com>
 <1473618641-10159-3-git-send-email-jagan@amarulasolutions.com>
 <CAOMZO5CsrrqqUPaVbU-ya79VSXgxyspa_fbr8HY1voJgpy2LLg@mail.gmail.com>
 <CAMty3ZDKrXxmwDFxSBvL_anJQPdXEfnJ40uNv5B6KssQyJJKhA@mail.gmail.com>
 <CAOMZO5B_ahBJr_Tgz_HShmG9heUwCj4K0N3FHhxja1yg0gCUGA@mail.gmail.com>
 <CAOf5uw=bMMa98RP=kvA=NfS89TWOEqU3Q2HjpEmzUTVrdg2=sQ@mail.gmail.com>
 <CAOMZO5CnP3=CNnQcOzra7eQ-cAwProgH+Kws0FHVOw7Q6nCDow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5CnP3=CNnQcOzra7eQ-cAwProgH+Kws0FHVOw7Q6nCDow@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, Michael Trimarchi <michael@amarulasolutions.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Jagan Teki <jagannadh.teki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgRmFiaW8sCgpPdXIgU09NIGRvZXNuJ3QgdXNlIGV4dGVybmFsIFBNSUMuCgpXZSBwb3dlcmVk
IGFsbCBkZXZpY2VzIHdpdGggYSBmaXggdm9sdGFnZSByZWd1bGF0b3JzIHRoYXQgY2Fubm90IGJl
IApkcml2ZSBkaXJlY3RseSBmcm9tIFNvQyBzbwphbnkgZXh0ZXJuYWwgcG93ZXIgcmFpbCBjYW4g
YmUgZHJpdmVuIGJ5IGRyaXZlcnMuCgpSZWdhcmRzCgpNYXR0ZW8KCgoKSWwgMjEvMDkvMjAxNiAx
ODo0NiwgRmFiaW8gRXN0ZXZhbSBoYSBzY3JpdHRvOgo+IEhpIE1pY2hhZWwsCj4KPiBPbiBUdWUs
IFNlcCAyMCwgMjAxNiBhdCAxMDoyMyBBTSwgTWljaGFlbCBUcmltYXJjaGkKPiA8bWljaGFlbEBh
bWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPj4gRW5naWNhbSB1c2UgZml4ZWQgcmVndWxh
dG9yIGFsd2F5cyBvbiBhbmQgb24gb24gYm9vdC4gVGhlaXIgYm9hcmQgZG9lcwo+PiBub3QgaGF2
ZSBhbnkKPj4gZXh0ZXJuYWwgcG11LiBJcyB0aGlzIGFuc3dlciB0byB5b3VyIGNvbW1lbnQ/Cj4g
QWxsIEkgYW0gc2F5aW5nIGlzIHRoYXQgICJyZWd1bGF0b3ItYm9vdC1vbiIgYW5kICJyZWd1bGF0
b3ItYWx3YXlzLW9uIgo+IHByb3BlcnRpZXMgc2hvdWxkIGJlIHJlbW92ZWQuCj4KPiBUaGUgInJl
Z18zcDN2IiByZWd1bGF0b3Igd2lsbCBiZSB0dXJuZWQgb24gYW5kIG9mZiBieSB0aGUgZmxleGNh
biBkcml2ZXIuCj4KCgotLSAKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpodHRwOi8vd3d3LmVuZ2ljYW0uY29t
IDxodHRwOi8vd3d3LmVuZ2ljYW0uY29tPgoKKi9FTkdJQ0FNIC8qcy5yLmwuCjUwMDE4IFNjYW5k
aWNjaSAtIEZJUkVOWkUKVmlhIGRlaSBQcmF0b25pLCAxNgpUZWwuICszOSAwNTUgNzMxMTM4NwpG
YXguICszOSAwNTUgNzIwNjA4CldlYiB3d3cuZW5naWNhbS5jb20gPGh0dHA6Ly93d3cuZW5naWNh
bS5jb20+CgpDLkYuL1AuSS4gMDUzODkwNzA0ODIKUmVnaXN0cm8gSW1wcmVzZSBkaSBGSVJFTlpF
IDU0MjkxOApDYXBpdGFsZSBzb2NpYWxlIGkudi4gNTAuMDAwLDAw4oKsCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpOT1RJQ0U6IFRoaXMgbWVzc2FnZSBhbmQgYXR0YWNobWVudHMgYXJlIGludGVuZGVkIG9ubHkg
Zm9yIHRoZSB1c2Ugb2YgCnRoZWlyIGFkZHJlc3NlcyBhbmQgbWF5IGNvbnRhaW4gY29uZmlkZW50
aWFsIGluZm9ybWF0aW9uIGJlbG9uZ2luZyB0byAKRW5naWNhbS4gSWYgeW91IGFyZSBub3QgdGhl
IGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJlYnkgbm90aWZpZWQgCnRoYXQgYW55IHJl
YWRpbmcsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwgb3IgY29weWluZyBvZiB0aGlzIApt
ZXNzYWdlLCBvciBhbnkgYXR0YWNobWVudCwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91
IGhhdmUgcmVjZWl2ZWQgCnRoaXMgbWVzc2FnZSBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
b3JpZ2luYWwgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCAKZGVsZXRlIHRoaXMgbWVzc2FnZSwgYWxv
bmcgd2l0aCBhbnkgYXR0YWNobWVudHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

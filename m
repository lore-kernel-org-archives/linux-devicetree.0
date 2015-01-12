From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v4 5/7] ARM: zynq: Enable pinctrl
Date: Mon, 12 Jan 2015 08:35:53 +0100
Message-ID: <b03b673497694585802f77a4e40fd80b@BN1BFFO11FD036.protection.gbl>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
 <1420818231-13451-6-git-send-email-soren.brinkmann@xilinx.com>
 <CACRpkdam4x-cWjrDuWS-0oDD3eGq1_pD3bK6xWEffiOipfBcOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdam4x-cWjrDuWS-0oDD3eGq1_pD3bK6xWEffiOipfBcOg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Heiko Stuebner <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Beniamino Galvani <b.galvani@gmail.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>
List-Id: devicetree@vger.kernel.org

T24gMDEvMTEvMjAxNSAxMDozNiBQTSwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBGcmksIEph
biA5LCAyMDE1IGF0IDQ6NDMgUE0sIFNvcmVuIEJyaW5rbWFubgo+IDxzb3Jlbi5icmlua21hbm5A
eGlsaW54LmNvbT4gd3JvdGU6Cj4gCj4+IFNlbGVjdCBwaW5jdHJsIGFuZCB0aGUgWnlucSBwaW5j
dHJsIGRyaXZlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU29yZW4gQnJpbmttYW5uIDxzb3Jlbi5i
cmlua21hbm5AeGlsaW54LmNvbT4KPj4gVGVzdGVkLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVy
YmVyQHN1c2UuZGU+Cj4+IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIFJGQyB2MjoKPj4gIC0gc2VwYXJh
dGUgbWFjaC16eW5xIGNoYW5nZXMgaW4gdGhlaXIgb3duIHBhdGNoCj4gCj4gQWNrZWQtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAKPiBTaW5jZSB3ZSdyZSBv
bmx5IHNlbGVjdGluZyBzb21lIHN5bWJvbHMgYW5kIHRoZXNlIHdpbGwgYXBwZWFyCj4gaW4gdGhl
IG1lcmdlIHdpbmRvdyB0aGlzIGNhbiBiZSBhcHBsaWVkIG9ydGhvZ29uYWxseSBpbiB0aGUgWnlu
cQo+IHRyZWUgdGFyZ2V0IGZvciBBUk0gU29DLgo+IAoKQXBwbGllZCB0byB6eW5xL3NvYy4KClRo
YW5rcywKTWljaGFsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=

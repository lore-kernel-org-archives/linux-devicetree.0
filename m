From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Sat, 10 Jan 2015 16:11:18 +0100
Message-ID: <20150110151118.GA16036@amd>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, hpa@zytor.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, Grant Likely <grant.likely@linaro.org>, davidb@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, Mark Brown <broonie@kernel.org>, philip@balister.org, dinguyen@opensource.altera.com, Michal Simek <monstr@monstr.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yvanderv@opensource.altera.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>, Alan Tull <delicious.qu>
List-Id: devicetree@vger.kernel.org

T24gU2F0IDIwMTUtMDEtMTAgMTA6MTA6NTEsIFBhbnRlbGlzIEFudG9uaW91IHdyb3RlOgo+IEhp
IFBhdmVsLAo+IAo+ID4gT24gSmFuIDksIDIwMTUsIGF0IDIyOjU2ICwgUGF2ZWwgTWFjaGVrIDxw
YXZlbEBkZW54LmRlPiB3cm90ZToKPiA+IAo+ID4gT24gRnJpIDIwMTUtMDEtMDkgMTM6MTQ6MjQs
IGF0dWxsIHdyb3RlOgo+ID4+IE9uIFdlZCwgNyBKYW4gMjAxNSwgUGF2ZWwgTWFjaGVrIHdyb3Rl
Ogo+ID4+IAo+ID4+PiBPbiBUdWUgMjAxNS0wMS0wNiAxNDoxMzozNywgYXR1bGxAb3BlbnNvdXJj
ZS5hbHRlcmEuY29tIHdyb3RlOgo+ID4+Pj4gKwo+ID4+Pj4gK1doYXQ6CQkvc3lzL2NsYXNzL2Zw
Z2FfbWFuYWdlci88ZnBnYT4vZmlybXdhcmUKPiA+Pj4+ICtEYXRlOgkJT2N0b2JlciAyMDE0Cj4g
Pj4+PiArS2VybmVsVmVyc2lvbjoJMy4xOAo+ID4+Pj4gK0NvbnRhY3Q6CUFsYW4gVHVsbCA8YXR1
bGxAb3BlbnNvdXJjZS5hbHRlcmEuY29tPgo+ID4+Pj4gK0Rlc2NyaXB0aW9uOglOYW1lIG9mIHRo
ZSBGUEdBIGltYWdlIGZpbGUgdG8gbG9hZCB1c2luZyBmaXJtd2FyZQo+ID4+Pj4gY2xhc3MuCj4g
Pj4+IAo+ID4+PiBUaGlzIG9uZSBpcyB1Z2x5OiBpdCB1bm5lY2Nlc3NhcmlseSBwYXNzZXMgZmly
bXdhcmUgbmFtZSB0aHJvdWdoIHRoZQo+ID4+PiBrZXJuZWwuIEp1c3QgbWFrZSBpbnRlcmZhY2Ug
YW5kIGNvZGUgc2ltcGxlciBieSBhbHdheXMgcGFzc2luZwo+ID4+PiAic29jZnBnYS1mcGdhLWlt
YWdlIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+ID4+PiAKPiA+Pj4gVGhhbmtzLAo+ID4+PiAJ
CQkJCQkJCQlQYXZlbAo+ID4+IAo+ID4+IEhpIFBhdmVsLAo+ID4+IAo+ID4+IEl0IG1pZ2h0IGJl
IHVnbHkuICBJdCdzIG5vdCB1bm5lY2Vzc2FyeS4gIFNvbWUgdXNlcyBvZiBGUEdBcyBpbnZvbHZl
Cj4gPj4gc3dpdGNoaW5nIG91dCB0aGUgRlBHQSBpbWFnZXMgZHluYW1pY2FsbHkgdW5kZXIgY29u
dHJvbCBvZiB0aGUgdXNlcnNwYWNlLgo+ID4gCj4gPiBUaGVuIGNvbmZpZ3VyZSB1ZGV2IHRvIGxv
YWQgcmlnaHQgZmlybXdhcmUgZm9yIHlvdSwgb3IgbG4gLXMKPiA+IGltYWdlLWktd2FudC1ub3cg
c29jZnBnYS1mcGdhLWltYWdlIHRvIHNlbGVjdCB0aGUgb25lIHRvIHJlYWTigKY/Cj4gPiAKPiAK
PiBXaG8gc2FpZCB0aGF0IHVkZXYgaXMgZ29pbmcgdG8gYmUgYXZhaWxhYmxlIGluIHRoZSBraW5k
IG9mIHN5c3RlbSB0aGlzIGlzIGdvaW5nIHRvIGVuZCBpbj8KCk5vb25lLgoKPiBEb2luZyBsbiAt
cyB0cmlja3MgdG8gbG9hZCBhIGRpZmZlcmVudCBpbWFnZT8gUmVhbGx5PwoKQnV0IGlmIHlvdSBk
b24ndCBoYXZlIHVkZXYsIHlvdSBjYW4gZG8gbG4gLXMuIEl0IGlzIGJldHRlciB0aGFuCm9wZW4t
Y29kaW5nIHN5bWxpbmsgZnVuY3Rpb25hbGl0eSBpbnRvCi9zeXMvY2xhc3MvZnBnYV9tYW5hZ2Vy
LzxmcGdhPi9maXJtd2FyZSAuLi4gY2F1c2UgdGhhdCdzIHdoYXQgdGhpcyBpcy4KCkFjdHVhbGx5
LCBjbGVhbiBpbXBsZW1lbnRhdGlvbiBvZiAiZmlybXdhcmUiIHdvdWxkIGJlIHN5bWxpbmsgaW4K
c3lzZnM7IGJ1dCBJJ2Qgc2F5IHRoYXQgd291bGQgYmUgb3ZlcmRvaW5nIGl0LgoKPiBJIHNheSB0
aGUgaW50ZXJmYWNlIGlzIGZpbmUgYXMgaXQgaXMuCgpJIHNheSBpdCBpcyBub3QuCgkJCQkJCQkJ
CVBhdmVsCi0tIAooZW5nbGlzaCkgaHR0cDovL3d3dy5saXZlam91cm5hbC5jb20vfnBhdmVsbWFj
aGVrCihjZXNreSwgcGljdHVyZXMpIGh0dHA6Ly9hdHJleS5rYXJsaW4ubWZmLmN1bmkuY3ovfnBh
dmVsL3BpY3R1cmUvaG9yc2VzL2Jsb2cuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJw
cm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK

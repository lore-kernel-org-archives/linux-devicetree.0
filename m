From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: r8a77965-salvator-xs: Enable DU
 external clocks and HDMI
Date: Fri, 27 Apr 2018 22:40:33 +0100
Message-ID: <9566c920-daf7-e470-4552-309f6082524b@ideasonboard.com>
References: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
 <20180427165722.19445-12-kieran.bingham+renesas@ideasonboard.com>
 <35470587.gVktJpfmq0@avalon>
Reply-To: kieran.bingham@ideasonboard.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <35470587.gVktJpfmq0@avalon>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTGF1cmVudCwKCk9uIDI3LzA0LzE4IDIyOjMyLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+
IEhpIEtpZXJhbiwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBGcmlkYXks
IDI3IEFwcmlsIDIwMTggMTk6NTc6MjIgRUVTVCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKPj4gVGhl
IERVMSBleHRlcm5hbCBkb3QgY2xvY2sgaXMgcHJvdmlkZWQgYnkgdGhlIGZpeGVkIGZyZXF1ZW5j
eSBjbG9jawo+PiBnZW5lcmF0b3IgWDIxLCB3aGlsZSB0aGUgRFUwIGFuZCBEVTMgY2xvY2tzIGFy
ZSBwcm92aWRlZCBieSB0aGUKPj4gcHJvZ3JhbW1hYmxlIFZlcnNhY2xvY2s2IGNsb2NrIGdlbmVy
YXRvci4KPj4KPj4gRW5hYmxlIHRoZSBjbG9ja3MsIGFuZCB0aGUgSERNSSBlbmNvZGVyIGZvciB0
aGUgTTMtTiBTYWx2YXRvci1YUywgYW5kCj4+IGhvb2sgaXQgdXAgdG8gdGhlIEhETUkgY29ubmVj
dG9yCj4+Cj4+IEJhc2VkIG9uIHBhdGNoZXMgZnJvbSBUYWtlc2hpIEtpaGFyYSA8dGFrZXNoaS5r
aWhhcmEuZGZAcmVuZXNhcy5jb20+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFt
IDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4+IC0tLQo+PiAgLi4u
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUtc2FsdmF0b3IteHMuZHRzIHwgMjkgKysrKysrKysr
KysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS1zYWx2YXRvci14
cy5kdHMKPj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUtc2FsdmF0b3It
eHMuZHRzIGluZGV4Cj4+IGE4M2EwMGRlZWQ5ZS4uZGNmMTg0OWYxYTY3IDEwMDY0NAo+PiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUtc2FsdmF0b3IteHMuZHRzCj4+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk2NS1zYWx2YXRvci14cy5k
dHMKPj4gQEAgLTE5LDMgKzE5LDMyIEBACj4+ICAJCXJlZyA9IDwweDAgMHg0ODAwMDAwMCAweDAg
MHg3ODAwMDAwMD47Cj4+ICAJfTsKPj4gIH07Cj4+ICsKPj4gKyZkdSB7Cj4+ICsJY2xvY2tzID0g
PCZjcGcgQ1BHX01PRCA3MjQ+LAo+PiArCQkgPCZjcGcgQ1BHX01PRCA3MjM+LAo+PiArCQkgPCZj
cGcgQ1BHX01PRCA3MjE+LAo+PiArCQkgPCZjcGcgQ1BHX01PRCA3Mjc+LAo+PiArCQkgPCZ2ZXJz
YWNsb2NrNiAxPiwKPj4gKwkJIDwmeDIxX2Nsaz4sCj4+ICsJCSA8JnZlcnNhY2xvY2s2IDI+Owo+
PiArCWNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIsICJkdS4zIiwgImx2ZHMuMCIsCj4+ICsJ
CSAgICAgICJkY2xraW4uMCIsICJkY2xraW4uMSIsICJkY2xraW4uMyI7Cj4gCj4gWW91IHNob3Vs
ZCByZW1vdmUgdGhlIExWRFMgY2xvY2sgZnJvbSBoZXJlIHRvby4KCkFoYSwgSSBtaXNzZWQgb25l
IC0gdGhhbmtzLgoKPiAKPiBBcGFydCBmcm9tIHRoYXQsCj4gCj4gUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCkNvbGxlY3Rl
ZC4gVGhhbmtzLgoKCgo+IAo+PiArfTsKPj4gKwo+PiArJmhkbWkwIHsKPj4gKwlzdGF0dXMgPSAi
b2theSI7Cj4+ICsKPj4gKwlwb3J0cyB7Cj4+ICsJCXBvcnRAMSB7Cj4+ICsJCQlyZWcgPSA8MT47
Cj4+ICsJCQlyY2FyX2R3X2hkbWkwX291dDogZW5kcG9pbnQgewo+PiArCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmaGRtaTBfY29uPjsKPj4gKwkJCX07Cj4+ICsJCX07Cj4+ICsJfTsKPj4gK307Cj4+
ICsKPj4gKyZoZG1pMF9jb24gewo+PiArCXJlbW90ZS1lbmRwb2ludCA9IDwmcmNhcl9kd19oZG1p
MF9vdXQ+Owo+PiArfTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v6 0/1] Introduce Innosilicon HDMI driver on Rockchip
 platforms
Date: Tue, 26 Jan 2016 10:34:40 +0800
Message-ID: <56A6DB40.9030209@rock-chips.com>
References: <1453686197-20975-1-git-send-email-ykk@rock-chips.com>
 <30308769.0Ysu5UYYQv@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <30308769.0Ysu5UYYQv@diego>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Zheng Yang <zhengyang@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ken Mixte <kmixter@google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

SGkgSGVpa28sCgpPbiAwMS8yNS8yMDE2IDA4OjQ3IFBNLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToK
PiBBbSBNb250YWcsIDI1LiBKYW51YXIgMjAxNiwgMDk6NDM6MTcgc2NocmllYiBZYWtpciBZYW5n
Ogo+PiBIZXJlIGFyZSBhIGJyaWVmIGludHJvZHVjdGlvbiB0byBJbm5vc2lsaWNvbiBIRE1JIElQ
Ogo+PiAgICAtIFN1cHBvcnQgSERNSSAxLjRhLCBIRENQIDEuMiBhbmQgRFZJIDEuMCBzdGFuZGFy
ZCBjb21wbGlhbnQgdHJhbnNtaXR0ZXIKPj4gICAgLSBTdXBwb3J0IEhETUkxLjQgYS9iIDNEIGZ1
bmN0aW9uIGRlZmluZWQgaW4gSERNSSAxLjQgYS9iIHNwZWMKPj4gICAgLSBEaWdpdGFsIHZpZGVv
IGludGVyZmFjZSBzdXBwb3J0cyBhIHBpeGVsIHNpemUgb2YgMjQsIDMwLCAzNiwgNDhiaXRzCj4+
IGNvbG9yIGRlcHRoIGluIFJHQiAtIFMvUERJRiBvdXRwdXQgc3VwcG9ydHMgUENNLCBEb2xieSBE
aWdpdGFsLCBEVFMgZGlnaXRhbAo+PiBhdWRpbyB0cmFuc21pc3Npb24gKDMyLTE5MmtIeiBGcykg
dXNpbmcgSUVDNjA5NTggYW5kIElFQyA2MTkzNwo+PiAgICAtIFRoZSBFRElEIGFuZCBDRUMgZnVu
Y3Rpb24gYXJlIGFsc28gc3VwcG9ydGVkIGJ5IElubm9zaWxpY29uIEhETUkKPj4gVHJhbnNtaXR0
ZXIgQ29udHJvbGxlCj4gaGF2ZSB5b3UgbG9zdCBzZXBhcmF0ZSB0aGUgZGV2aWNldHJlZS1iaW5k
aW5nIHBhdGNoIHNvbWV3aGVyZT8KPgo+IEkgZG9uJ3QgcmVtZW1iZXIgaXQgZ2V0dGluZyBhcHBs
aWVkIGFuZCBNYXJrIG1heSBtaXNzIGl0IGlmIGl0J3Mgb25seQo+IGNvbnRhaW5lZCBpbiBzb21l
IG9sZCBzZXJpZXMuCgpPcHMsIEkgbWF5IG1pc3VuZGVyc3RhbmQgdGhlIHJ1bGUsIEkgdGhvdWdo
dCBpZiBwYXRjaCB3YXMgYWNrZWQgYnkgCm1haW50YWluZXIsIHRoZW4gSSBzaG91bGQga2VlcCBp
dCBubyBjaGFuZ2VkLiBIbW1tLCBzbyBub3QgQWNrZWQgYnV0IApBcHBsaWVkLCB0aGFua3MsIEkg
d291bGQgdXBkYXRlIG5vdy4KCllha2lyCj4KPiBIZWlrbwo+Cj4KPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

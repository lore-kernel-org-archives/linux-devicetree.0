From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] PCI: add DT bindings for Faraday
	Technology PCI Host Bridge
Date: Sun, 26 Feb 2017 21:17:46 +0100
Message-ID: <CACRpkdZsFfnh8vA_-RQqXyrJOh-emZQytj2bxHXRDkTs9ga+eg@mail.gmail.com>
References: <20170211125220.10273-1-linus.walleij@linaro.org>
 <20170222002640.y2uhumje5csioure@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <20170222002640.y2uhumje5csioure@rob-hp-laptop>
List-Unsubscribe: <https://lists.openwrt.org/cgi-bin/mailman/options/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=unsubscribe>
List-Archive: <http://lists.openwrt.org/pipermail/openwrt-devel/>
List-Post: <mailto:openwrt-devel@lists.openwrt.org>
List-Help: <mailto:openwrt-devel-request@lists.openwrt.org?subject=help>
List-Subscribe: <https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=subscribe>
Errors-To: openwrt-devel-bounces@lists.openwrt.org
Sender: "openwrt-devel" <openwrt-devel-bounces@lists.openwrt.org>
To: Rob Herring <robh@kernel.org>
Cc: openwrt-devel@openwrt.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Feng-Hsin Chiang <john453@faraday-tech.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-pci <linux-pci@vger.kernel.org>, Macpaul Lin <macpaul@andestech.com>, Bjorn Helgaas <bhelgaas@google.com>, Gavin Guo <gavinguo@andestech.com>, Janos Laube <janos.dev@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBGZWIgMjIsIDIwMTcgYXQgMToyNiBBTSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gT24gU2F0LCBGZWIgMTEsIDIwMTcgYXQgMDE6NTI6MTdQTSArMDEwMCwg
TGludXMgV2FsbGVpaiB3cm90ZToKCj4+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSBvbmUgb2YK
Pj4gKyAgImZhcmFkYXkscGNpIgo+PiArICAiZmFyYWRheSxkdWFsLXBjaSIKPgo+IFByb2JhYmx5
IHNob3VsZCBzdGlsbCBoYXZlIGEgQ29ydGluYSBzcGVjaWZpYyBjb21wYXRpYmxlLgoKT0sgSSBy
ZXdyb3RlIGl0IHVzaW5nIHRoZSBzcGVjaWZpYy10by1nZW5lcmljIGNvbXBhdGlibGUgcGF0dGVy
bi4KCj4+ICtwY2lANTAwMDAwMDAgewo+PiArICAgICBjb21wYXRpYmxlID0gImZhcmFkYXkscGNp
IjsKPj4gKyAgICAgcmVnID0gPDB4NTAwMDAwMDAgMHgxMDA+Owo+PiArICAgICBpbnRlcnJ1cHRz
ID0gPDggSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIFBDSSBBICovCj4+ICsgICAgICAgICAgICAg
ICAgICAgICA8MjYgSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIFBDSSBCICovCj4+ICsgICAgICAg
ICAgICAgICAgICAgICA8MjcgSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIFBDSSBDICovCj4+ICsg
ICAgICAgICAgICAgICAgICAgICA8MjggSVJRX1RZUEVfTEVWRUxfSElHSD47IC8qIFBDSSBEICov
Cj4+ICsgICAgICNhZGRyZXNzLWNlbGxzID0gPDM+Owo+PiArICAgICAjc2l6ZS1jZWxscyA9IDwy
PjsKPj4gKyAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPgo+IFRoaXMgZG9lc24ndCBiZWxv
bmcgaGVyZSAoSSB0aGluaykuCgpUaGlzIG5lZWRzIHRvIGJlIGhlcmUgYmVjYXVzZSB0aGUgaW50
ZXJydXB0cyBmb3IKUENJIGFyZSAxIGNlbGwuIFRoZSBQQ0kgaG9zdCBhY3RzIGFzIGludGVycnVw
dCBwYXJlbnQgZm9yIGFsbAp0aGUgY2FyZHMgeW91IHBsdWcgaW4sIGFuZCB0aGV5IGFsd2F5cyBo
YXZlIG9uZSBjZWxsLCB5b3UKY2FuIHNlZSB0aGlzIGluIHRoZSBleGFtcGxlIGZvciBvcGVuLXBp
YyBpbiBEZXZpY2UgVHJlZQpTcGVjaWZpY2F0aW9uIHJlbGVhc2UgMC4xLCBwYWdlIDE5IGZvciBl
eGFtcGxlLgoKSXQgZ2V0cyBhIGJpdCBjb25mdXNpbmcgbWF5YmUgaW4gY2FzZXMgbGlrZSB0aGlz
IChhcyB3aXRoCm9wZW4tcGljKSB3aGVyZSB0aGVyZSBpcyBhIGNhc2NhZGVzIGludGVycnVwdCBj
b250cm9sbGVyCnRoYXQgaW4gdGhpcyBjYXNlIGFsc28gaGFzIDEgY2VsbCBvZiBpbnRlcnJ1cHQg
c3BlY2lmaWVyLgoKT3IgZGlkIHlvdSBtZWFuIHNvbWV0aGluZyBlbHNlPwoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
b3BlbndydC1kZXZlbCBtYWlsaW5nIGxpc3QKb3BlbndydC1kZXZlbEBsaXN0cy5vcGVud3J0Lm9y
ZwpodHRwczovL2xpc3RzLm9wZW53cnQub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVu
d3J0LWRldmVsCg==

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: display: Document the EDT et*
 displays in one file.
Date: Fri, 27 Apr 2018 09:35:50 -0500
Message-ID: <20180427143550.yzc3rnunjeudevhi@rob-hp-laptop>
References: <20180420125108.14197-1-jan.tuerk@emtrion.com>
 <20180427132445.3458-1-jan.tuerk@emtrion.com>
 <20180427132445.3458-2-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180427132445.3458-2-jan.tuerk@emtrion.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: jan.tuerk@emtrion.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBBcHIgMjcsIDIwMTggYXQgMDM6MjQ6MzZQTSArMDIwMCwgamFuLnR1ZXJrQGVtdHJp
b24uY29tIHdyb3RlOgo+IEZyb206IEphbiBUdWVyayA8amFuLnR1ZXJrQGVtdHJpb24uY29tPgo+
IAo+IERvY3VtZW50IHRoZSBFbWVyZ2luZyBEaXNwbGF5IFRlY2hub2xvZ3kgQ29ycC4gKEVEVCkg
dXNpbmcgdGhlCj4gc2ltcGxlLXBhbmVsIGJpbmRpbmcgaW4gb25lIHNpbmdsZSBmaWxlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEphbiBUdWVyayA8amFuLnR1ZXJrQGVtdHJpb24uY29tPgo+IC0tLQo+
IENoYW5nZXMgZm9yIHY0Ogo+ICAgLSByZS1hcnJhbmdlIHRoZSBQYXRjaC1zZXJpZXMgdG8gbWF0
Y2ggdGhlIERULXN1Ym1pdHRpbmctcGF0Y2hlcwo+ICAgLSBBZGRpdGlvbmFsIHBhdGNoIGZvciB0
aGUgRG9jdW1lbnRhdGlvbiBvZiB0aGUgbmV3IERULWJpbmRpbmdzCj4gICAtIG5vIGNoYW5nZSAo
cmUtYXJyYW5nZWQgMy82ID0+IDEvNykKPiAKPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
ZWR0LGV0LXNlcmllcy50eHQgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrCj4gIC4u
Li9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2VkdCxldDA1NzA5MGRodS50eHQgICAgIHwgIDcgLS0t
LQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9lZHQsZXQwNzAwODBkaDYudHh0ICAgICB8
IDEwIC0tLS0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9lZHQsZXRtMDcwMGcwZGg2
LnR4dCAgICB8IDEwIC0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyks
IDI3IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZWR0LGV0LXNlcmllcy50eHQKPiAgZGVsZXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2VkdCxldDA1NzA5MGRodS50eHQKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2VkdCxldDA3MDA4MGRoNi50eHQK
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2VkdCxldG0wNzAwZzBkaDYudHh0CgpSZXZpZXdlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

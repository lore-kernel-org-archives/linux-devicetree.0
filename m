From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: stm32: add pixel clock
 mandatory property
Date: Fri, 19 Jan 2018 16:43:35 -0600
Message-ID: <20180119224335.exrxcfq3xc6op6iy@rob-hp-laptop>
References: <20180112153034.20353-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180112153034.20353-1-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philippe Cornu <philippe.cornu@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Mickael Reulier <mickael.reulier@st.com>, Russell King <linux@armlinux.org.uk>, Fabien Dessenne <fabien.dessenne@st.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Vincent Abriou <vincent.abriou@st.com>, Ludovic Barre <ludovic.barre@st.com>, linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Bhumika Goyal <bhumirks@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBKYW4gMTIsIDIwMTggYXQgMDQ6MzA6MzRQTSArMDEwMCwgUGhpbGlwcGUgQ29ybnUg
d3JvdGU6Cj4gQWRkIHRoZSBEUEkvUkdCIGlucHV0IHBpeGVsIGNsb2NrIGluIG1hbmRhdG9yeSBw
cm9wZXJ0aWVzCj4gYmVjYXVzZSBpdCByZWFsbHkgb2ZmZXJzIGEgYmV0dGVyIHByZWNpc2VuZXNz
IGZvciB0aW1pbmcKPiBjb21wdXRhdGlvbnMuCj4gTm90ZTogRml4IGFsc28gdGhlIERTSSBwYW5l
bCBleGFtcGxlIHdoZXJlICJyZWYiICYgInBjbGsiCj4gY2xvY2tzIHdlcmUgc3dhcHBlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgo+
IC0tLQo+IENoYW5nZXMgaW4gdjI6IHB1dCBuZXcgY2xvY2sgaW4gbGFzdCBwb3NpdGlvbiAoUm9i
IEhlcnJpbmcpCj4gCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3N0LHN0bTMyLWx0ZGMudHh0IHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dAo+IGluZGV4
IDAyOTI1MjI1M2FkNC4uOTQyYjcyMzdhZTg3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0Cj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQK
PiBAQCAtMjksNiArMjksNyBAQCBNYW5kYXRvcnkgcHJvcGVydGllcyBzcGVjaWZpYyB0byBTVE0z
MiBEU0k6Cj4gIC0gY29tcGF0aWJsZTogInN0LHN0bTMyLWRzaSIuCj4gIC0gY2xvY2stbmFtZXM6
Cj4gICAgLSBwaHkgcGxsIHJlZmVyZW5jZSBjbG9jayBzdHJpbmcgbmFtZSwgbXVzdCBiZSAicmVm
Ii4KPiArICAtIERQSS9SR0IgaW5wdXQgcGl4ZWwgY2xvY2sgc3RyaW5nIG5hbWUsIG11c3QgYmUg
InB4X2NsayIuCj4gIC0gcmVzZXRzOiBzZWUgWzVdLgo+ICAtIHJlc2V0LW5hbWVzOiBzZWUgWzVd
Lgo+ICAKPiBAQCAtOTcsOCArOTgsOSBAQCBFeGFtcGxlIDI6IERTSSBwYW5lbAo+ICAJCQkjc2l6
ZS1jZWxscyA9IDwwPjsKPiAgCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1kc2kiOwo+ICAJCQly
ZWcgPSA8MHg0MDAxNmMwMCAweDgwMD47Cj4gLQkJCWNsb2NrcyA9IDwmcmNjIDEgQ0xLX0Y0Njlf
RFNJPiwgPCZjbGtfaHNlPjsKPiAtCQkJY2xvY2stbmFtZXMgPSAicmVmIiwgInBjbGsiOwo+ICsJ
CQljbG9ja3MgPSA8JnJjYyAxIENMS19GNDY5X0RTST4sIDwmY2xrX2hzZT4sCj4gKwkJCQkgPCZy
Y2MgMSBDTEtfTENEPjsKPiArCQkJY2xvY2stbmFtZXMgPSAicGNsayIsICJyZWYiLCAicHhfY2xr
IjsKCllvdSBoYXZlIHRoZSBleGlzdGluZyBuYW1lcyByZXZlcnNlZCBoZXJlLgoKPiAgCQkJcmVz
ZXRzID0gPCZyY2MgU1RNMzJGNF9BUEIyX1JFU0VUKERTSSk+Owo+ICAJCQlyZXNldC1uYW1lcyA9
ICJhcGIiOwo+ICAKPiAtLSAKPiAyLjE1LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

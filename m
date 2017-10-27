From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: stm32: add pixel clock mandatory
 property
Date: Fri, 27 Oct 2017 09:38:15 -0500
Message-ID: <20171027143815.evbb7rqkgqiol7yo@rob-hp-laptop>
References: <1509034356-23885-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1509034356-23885-1-git-send-email-philippe.cornu@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Mickael Reulier <mickael.reulier@st.com>, Russell King <linux@armlinux.org.uk>, Fabien Dessenne <fabien.dessenne@st.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Vincent Abriou <vincent.abriou@st.com>, Ludovic Barre <ludovic.barre@st.com>, linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Bhumika Goyal <bhumirks@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBPY3QgMjYsIDIwMTcgYXQgMDY6MTI6MzZQTSArMDIwMCwgUGhpbGlwcGUgQ29ybnUg
d3JvdGU6Cj4gQWRkIHRoZSBEUEkvUkdCIGlucHV0IHBpeGVsIGNsb2NrIGluIG1hbmRhdG9yeSBw
cm9wZXJ0aWVzCj4gYmVjYXVzZSBpdCByZWFsbHkgb2ZmZXJzIGEgYmV0dGVyIHByZWNpc2VuZXNz
IGZvciB0aW1pbmcKPiBjb21wdXRhdGlvbnMuCj4gTm90ZTogRml4IGFsc28gdGhlIERTSSBwYW5l
bCBleGFtcGxlIHdoZXJlICJyZWYiICYgInBjbGsiCj4gY2xvY2tzIHdlcmUgc3dhcHBlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgo+
IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0z
Mi1sdGRjLnR4dCB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKPiBpbmRleCAwMjkyNTIy
Li45OTgyM2ZiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKPiBAQCAtMjgsNiArMjgsNyBA
QCBNYW5kYXRvcnkgcHJvcGVydGllcyBzcGVjaWZpYyB0byBTVE0zMiBEU0k6Cj4gIC0gI3NpemUt
Y2VsbHM6IFNob3VsZCBiZSA8MD4uCj4gIC0gY29tcGF0aWJsZTogInN0LHN0bTMyLWRzaSIuCj4g
IC0gY2xvY2stbmFtZXM6Cj4gKyAgLSBEUEkvUkdCIGlucHV0IHBpeGVsIGNsb2NrIHN0cmluZyBu
YW1lLCBtdXN0IGJlICJweF9jbGsiLgo+ICAgIC0gcGh5IHBsbCByZWZlcmVuY2UgY2xvY2sgc3Ry
aW5nIG5hbWUsIG11c3QgYmUgInJlZiIuCgpXaGVyZSdzIHBjbGs/CgpUaGUgbmV3IGNsb2NrIHNo
b3VsZCBiZSBsYXN0IHRvIGJlIGJhY2t3YXJkcyBjb21wYXRpYmxlLgoKPiAgLSByZXNldHM6IHNl
ZSBbNV0uCj4gIC0gcmVzZXQtbmFtZXM6IHNlZSBbNV0uCj4gQEAgLTk3LDggKzk4LDkgQEAgRXhh
bXBsZSAyOiBEU0kgcGFuZWwKPiAgCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gIAkJCWNvbXBhdGli
bGUgPSAic3Qsc3RtMzItZHNpIjsKPiAgCQkJcmVnID0gPDB4NDAwMTZjMDAgMHg4MDA+Owo+IC0J
CQljbG9ja3MgPSA8JnJjYyAxIENMS19GNDY5X0RTST4sIDwmY2xrX2hzZT47Cj4gLQkJCWNsb2Nr
LW5hbWVzID0gInJlZiIsICJwY2xrIjsKPiArCQkJY2xvY2tzID0gPCZyY2MgMSBDTEtfRjQ2OV9E
U0k+LCA8JnJjYyAxIENMS19MQ0Q+LAo+ICsJCQkJIDwmY2xrX2hzZT47Cj4gKwkJCWNsb2NrLW5h
bWVzID0gInBjbGsiLCAicHhfY2xrIiwgInJlZiI7Cj4gIAkJCXJlc2V0cyA9IDwmcmNjIFNUTTMy
RjRfQVBCMl9SRVNFVChEU0kpPjsKPiAgCQkJcmVzZXQtbmFtZXMgPSAiYXBiIjsKPiAgCj4gLS0g
Cj4gMS45LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==

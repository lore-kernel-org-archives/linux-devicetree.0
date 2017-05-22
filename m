From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: display: Add STM32 DSI host driver
Date: Mon, 22 May 2017 07:58:48 -0500
Message-ID: <CAL_JsqKUeQXJ-KqKkgwBHsapwW9XdwShSnBQ81RMKgW0XQbODA@mail.gmail.com>
References: <1494600989-13507-1-git-send-email-philippe.cornu@st.com>
 <1494600989-13507-3-git-send-email-philippe.cornu@st.com>
 <20170518214200.e2mmsqpvm3rqnh72@rob-hp-laptop>
 <f8db9525-6c56-85f9-d3de-af7bb8312b46@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f8db9525-6c56-85f9-d3de-af7bb8312b46@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, Yannick FERTRE <yannick.fertre@st.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ludovic BARRE <ludovic.barre@st.com>, Mickael REULIER <mickael.reulier@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBNYXkgMTksIDIwMTcgYXQgMTE6MjUgQU0sIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBw
ZS5jb3JudUBzdC5jb20+IHdyb3RlOgo+Cj4KPiBPbiAwNS8xOC8yMDE3IDExOjQyIFBNLCBSb2Ig
SGVycmluZyB3cm90ZToKPj4gT24gRnJpLCBNYXkgMTIsIDIwMTcgYXQgMDQ6NTY6MjhQTSArMDIw
MCwgUGhpbGlwcGUgQ09STlUgd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGFkZHMgZG9jdW1lbnRhdGlv
biBvZiBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFNUTTMyCj4+PiBEU0kgaG9zdCBkcml2
ZXIgYmFzZWQgb24gdGhlIFN5bm9wc3lzIERXIE1JUEkgRFNJIGRyaXZlciBmcm9tIFJvY2tjaGlw
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5jb3JudUBz
dC5jb20+Cj4+PiAtLS0KPj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxz
dG0zMi1sdGRjLnR4dCAgfCA5MiArKysrKysrKysrKysrKysrKysrKystCj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1s
dGRjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0
bTMyLWx0ZGMudHh0Cj4+PiBpbmRleCA4ZTE0NzY5Li5hNjEzODFiIDEwMDY0NAo+Pj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50
eHQKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0
LHN0bTMyLWx0ZGMudHh0Cj4+PiBAQCAtMSw3ICsxLDYgQEAKPj4+ICAgKiBTVE1pY3JvZWxlY3Ry
b25pY3MgU1RNMzIgbGNkLXRmdCBkaXNwbGF5IGNvbnRyb2xsZXIKPj4+Cj4+PiAgIC0gbHRkYzog
bGNkLXRmdCBkaXNwbGF5IGNvbnRyb2xsZXIgaG9zdAo+Pj4gLSAgbXVzdCBiZSBhIHN1Yi1ub2Rl
IG9mIHN0LWRpc3BsYXktc3Vic3lzdGVtCj4+Cj4+IFdoeSBpcyB0aGlzIHJlbW92ZWQ/IFRoZSAi
bXVzdCIgcmVmZXJzIHRvIHRoZSBsb2NhdGlvbiwgbm90IHdoZXRoZXIKPj4gcHJlc2VudCBvciBu
b3QgaWYgdGhhdCdzIHdoYXQgeW91IHdlcmUgdHJ5aW5nIHRvIGNoYW5nZS4KPj4KPiBEZWFyIFJv
YiwKPiBNYW55IHRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4KPgo+IFRoZXJlIGlzIG5vIG5lZWQg
YW55bW9yZSB0byBoYXZlIGEgc3QtZGlzcGxheS1zdWJzeXN0ZW0gcGFyZW50IG5vZGUgaW4KPiB0
aGUgZGV2aWNlIHRyZWUgZm9yIHRoZSBsdGRjLCB0aGF0IGlzIHdoeSBJIHJlbW92ZWQgdGhpcyAi
bXVzdCIgaW5mb3JtYXRpb24uCgpPa2F5LCB0aGF0J3MgZ29vZCBiZWNhdXNlIEknbSBub3QgYSBm
YW4gb2YgdGhlbS4gVGhhdCBzZWVtcyBsaWtlIGFuCnVucmVsYXRlZCBjaGFuZ2UgdGhvdWdoLgoK
Um9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

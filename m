From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Wed, 2 Aug 2017 17:09:37 +0300
Message-ID: <47ceba83-1097-072e-bed6-d1964bce7a25@ti.com>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
 <20170722065133.GT3053@localhost>
 <2b916330-9b65-f4d5-817f-79b66cc236b3@st.com>
 <20170726052930.GF3053@localhost>
 <f2908e38-dc4d-3886-4058-52a7ad845415@st.com>
 <20170731123157.GJ3053@localhost>
 <e3a76a50-4160-d111-cce9-132b46b66c33@st.com>
 <20170802045522.GU3053@localhost>
 <7d2091fe-a2e5-78bb-b63d-9cb66bdb7e84@ti.com>
 <7bcad698-fa1a-3dc2-e918-4400639ca6d7@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7bcad698-fa1a-3dc2-e918-4400639ca6d7@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>, Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org

77u/ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgw
IEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0Rv
bWljaWxlOiBIZWxzaW5raQoKT24gMjAxNy0wOC0wMiAxNjoxMSwgUGllcnJlIFl2ZXMgTU9SRFJF
VCB3cm90ZToKPiBPdXIgU29DIHdvcmtzIHdpdGggb3Igd2l0aG91dCBETUFNVVguIEJvdGggYmlu
ZGluZyBpcyBhbGxvd2VkLiBVc2luZyBvbmx5IERNQSBhCj4gQ2hhbm5lbElkIGFuZCByZXF1ZXN0
IGxpbmUgaXMgcGFydCBvZiB0aGUgYmluZGluZy4KCkluIG91ciBjYXNlIHRoZSBhbTMzNXgncyBl
RE1BIGNhbiB3b3JrIHdpdGggb3Igd2l0aG91dCB0aGUgcm91dGVyLCB3ZSAKb25seSB1c2UgdGhl
IHJvdXRlciBub2RlIGlmIHdlIG5lZWQgbm9uZSBkZWZhdWx0IGV2ZW50IGZvciBhIGdpdmVuIERN
QSAKcmVxdWVzdCBsaW5lLgoKPiBVc2luZyBETUFNVXggbm93IHRoZSByZXF1ZXN0Cj4gbGluZSBp
cyBjb21pbmcgZnJvbSBkbWFfc3BlYyBmb3J3YXJkcyB0byBkbWEtbWFzdGVyIGFzIHdlbGwgZXhw
bGFpbmVkIGJ5IFBldGVyLgo+IEhvd2V2ZXIgQ2hhbm5lbElEIGlzIG5vdyBnaXZlbiBieSBkbWFf
Z2V0X2FueV9zbGF2ZV9jaGFubmVsIGluc3RlYWQgb2YgYmluZGluZ3MuCj4gRE1BTVVYIGRyaXZl
ciBoYXMgdG8gYmUgYXdhcmUgb2YgdGhpcyBJRCB0byByb3V0ZSByZXF1ZXN0IGxpbmUgdG8gb3V0
IERNQQo+IGNoYW5uZWwuIFRoaXMgY2hhbm5lbCBpZCBpbmZvcm1hdGlvbiBpcyBjYXJyaWVkIG9u
IHVudGlsIERNQU1VWCB0aHJvdWdoCj4gZG1hZW5naW5lX3NsYXZlX2NvbmZpZyB3aXRoIGEgY3Vz
dG9tIEFQSS4KPiBIb3BlIGl0IGNsYXJpZmllcyB0aGUgbmVlZC4KCkkgc2VlLCB0aGlzIGlzIG5v
dCBtdWNoIGRpZmZlcmVudCB0aGVuIHdoYXQgd2UgZmFjZSB3aXRoIG91ciBkcmE3IApkZXZpY2Vz
LiBJbiB0aGVvcnkgd2UgY291bGQgdXNlIGRpcmVjdCBETUEgYmluZGluZyB0byB0aGUgRE1BIGNv
bnRyb2xsZXIgCml0c2VsZiwgYnV0IHNvbWUgcmVxdWVzdHMgd291bGQgbm90IGJlIHJlYWNoYWJs
ZSwgc28gd2UgYWx3YXlzIHVzZSB0aGUgCnJvdXRlcidzIG5vZGUgZm9yIERNQSBvbiBkcmE3IGZh
bWlseS4KCkJhc2ljYWxseSB0aGUgcm91dGVyIHdvdWxkIG1hbmFnZSB0aGUgQ2hhbm5lbElEIGFu
ZCBjcmVhdGUgCidzdCxzdG0zMi1kbWEnIGNvbXBhdGlibGUgZG1hX3NwZWMgKHRoZSBmb3VyIHBh
cmFtZXRlcnMpLgpBZmFpayB5b3UgY291bGQgaGF2ZSAzIHBhcmFtZXRlcnMgZm9yIHRoZSByb3V0
ZXIgYW5kIGNyZWF0ZSBhIGZvdXIgCnBhcmFtZXRlciBkbWFfc3BlYywgd2hlcmUgdGhlIENoYW5u
ZWxJRCBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQuCkJ1dCB5b3UgbmVlZCB0byBjb252ZXJ0IGFs
bCBwZXJpcGhlcmFscyB0byB1c2UgdGhlIHJvdXRlcidzIG5vZGUgZm9yIHRoZSAKRE1BLgoKLSBQ
w6l0ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==

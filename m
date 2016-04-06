From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3 1/5] Documentation: DT: vdma: Rename vdma-chan prefix
 to dma-chan
Date: Wed, 6 Apr 2016 09:20:22 -0700
Message-ID: <20160406162022.GS23198@xsjsorenbubuntu>
References: <1459959335-24083-1-git-send-email-appanad@xilinx.com>
 <1459959335-24083-2-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1459959335-24083-2-git-send-email-appanad@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: mark.rutland@arm.com, moritz.fischer@ettus.com, anirudh@xilinx.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, vinod.koul@intel.com, svemula@xilinx.com, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, galak@codeaurora.org, dmaengine@vger.kernel.org, dan.j.williams@intel.com, appanad@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTA0LTA2IGF0IDIxOjQ1OjMxICswNTMwLCBLZWRhcmVzd2FyYSByYW8gQXBw
YW5hIHdyb3RlOgo+IFRoaXMgcGF0Y2ggcmVuYW1lcyB0aGUgdmRtYS1tbTJzLWNoYW5uZWwvdmRt
YS1zMm1tLWNoYW5uZWwKPiBwcm9wZXJ0eSB3aXRoIGRtYS1tbTJzLWNoYW5uZWwvZG1hLXMybW0t
Y2hhbm5lbCB0byBzeW5jIHdpdGgKPiB0aGUgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtl
ZGFyZXN3YXJhIHJhbyBBcHBhbmEgPGFwcGFuYWRAeGlsaW54LmNvbT4KPiAtLS0KPiBDaGFuZ2Vz
IGZvciB2MzoKPiAtLS0+IE5ldyBwYXRjaC4KPiAKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2RtYS94aWxpbngveGlsaW54X3ZkbWEudHh0IHwgOCArKysrLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3hpbGlueC94aWxpbnhf
dmRtYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3hpbGlueC94
aWxpbnhfdmRtYS50eHQKPiBpbmRleCBhODY3MzdjLi43NjI5MzhmIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEveGlsaW54L3hpbGlueF92ZG1hLnR4
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEveGlsaW54L3hp
bGlueF92ZG1hLnR4dAo+IEBAIC0yNCw4ICsyNCw4IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4g
IAl7M30sIGZsdXNoIHMybW0gY2hhbm5lbAo+ICAKPiAgUmVxdWlyZWQgY2hpbGQgbm9kZSBwcm9w
ZXJ0aWVzOgo+IC0tIGNvbXBhdGlibGU6IEl0IHNob3VsZCBiZSBlaXRoZXIgInhsbngsYXhpLXZk
bWEtbW0ycy1jaGFubmVsIiBvcgo+IC0JInhsbngsYXhpLXZkbWEtczJtbS1jaGFubmVsIi4KPiAr
LSBjb21wYXRpYmxlOiBJdCBzaG91bGQgYmUgZWl0aGVyICJ4bG54LGF4aS1kbWEtbW0ycy1jaGFu
bmVsIiBvcgo+ICsJInhsbngsYXhpLWRtYS1zMm1tLWNoYW5uZWwiLgoKVGhpcyBjaGFuZ2UgaXMg
bm90IGJhY2t3YXJkcyBjb21wYXRpYmxlIGFuZCBicmVha3MgZXZlcnkgdXNlciBvZiB0aGUKY3Vy
cmVudCBiaW5kaW5nLgoKCVPDtnJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=

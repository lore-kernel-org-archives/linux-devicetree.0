From: Appana Durga Kedareswara Rao <appanad@xilinx.com>
Subject: RE: [PATCH v6 2/3] dmaeninge: xilinx_dma: Fix bug in multiple frame
 stores scenario in vdma
Date: Wed, 6 Dec 2017 04:11:12 +0000
Message-ID: <CY1PR02MB1692CA130CB5721CE6AC9425DC320@CY1PR02MB1692.namprd02.prod.outlook.com>
References: <1484372155-19423-1-git-send-email-appanad@xilinx.com>
 <1484372155-19423-3-git-send-email-appanad@xilinx.com>
 <296cffff-3847-4217-bd94-ac72fe044f73@topic.nl>
 <CY1PR02MB169299C7AA719D4CE56F328DDC3B0@CY1PR02MB1692.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY1PR02MB169299C7AA719D4CE56F328DDC3B0@CY1PR02MB1692.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, Mike Looijmans <mike.looijmans@topic.nl>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "Michal Simek (michal.simek@xilinx.com)" <michal.simek@xilinx.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, "luis@debethencourt.com" <luis@debethencourt.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTWlrZSBMb29pam1hbnMsDQoNCglUaGFua3MgZm9yIHRoZSByZXZpZXcuLi4NCglTb3JyeSBm
b3IgdGhlIGxvbmcgZGVsYXkgaW4gdGhlIHJlcGx5Li4uDQpQbGVhc2UgZmluZCBjb21tZW50cyBp
bmxpbmUuLi4gDQoNCjxTbmlwPg0KPk9uIDE0LTAxLTE3IDA2OjM1LCBLZWRhcmVzd2FyYSByYW8g
QXBwYW5hIHdyb3RlOg0KPj7CoMKgV2hlbiBWRE1BIGlzIGNvbmZpZ3VyZWQgZm9yIG1vcmUgdGhh
biBvbmUgZnJhbWUgaW4gdGhlIGgvdy4NCj4+wqDCoEZvciBleGFtcGxlIGgvdyBpcyBjb25maWd1
cmVkIGZvciBuIG51bWJlciBvZiBmcmFtZXMsIHVzZXINCj4+wqDCoFN1Ym1pdHMgbiBudW1iZXIg
b2YgZnJhbWVzIGFuZCB0cmlnZ2VyZWQgdGhlIERNQSB1c2luZyBpc3N1ZV9wZW5kaW5nIEFQSS4N
Cj4+DQo+PsKgwqBJbiB0aGUgY3VycmVudCBkcml2ZXIgZmxvdyB3ZSBhcmUgc3VibWl0dGluZyBv
bmUgZnJhbWUgYXQgYSB0aW1lLA0KPj7CoMKgQnV0IHdlIHNob3VsZCBzdWJtaXQgYWxsIHRoZSBu
IG51bWJlciBvZiBmcmFtZXMgYXQgb25lIHRpbWUNCj4+wqDCoEFzIHRoZSBoL3cgaXMgY29uZmln
dXJlZCBmb3IgbiBudW1iZXIgb2YgZnJhbWVzLg0KPg0KPlRoZSBoYXJkd2FyZSBjYW4gYWx3YXlz
IGhhbmRsZSBhIHNpbmdsZSBmcmFtZSBzdWJtaXNzaW9uLCBieSB1c2luZyB0aGUgInBhcmsiDQo+
Yml0LiBUaGlzIHdvdWxkIG1ha2UgYSBnb29kICJjeWNsaWMiIGltcGxlbWVudGF0aW9uIHRvbyAo
dXNpbmcgdmRtYSBhcw0KPmZyYW1lYnVmZmVyKS4NCj4NCj5JdCBjb3VsZCBhbHNvIGhhbmRsZSBh
bGwgY2FzZXMgZm9yICJrIiBmcmFtZXMgd2hlcmUgbiVrPT0wIChuIGlzIGEgbXVsdGlwbGUgb2YN
Cj5rKSBieSBzaW1wbHkgcmVwbGljYXRpbmcgdGhlIGZyYW1lIHBvaW50ZXJzLg0KDQpBZ3JlZSB3
aXRoIHlvdXIgY29tbWVudHMgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NClNvbWVo
b3cgZGlkbid0IGdldCBlbm91Z2ggdGltZSB0byBzZW5kIG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0
Y2ggc2VyaWVzLg0KV2lsbCBtb2RpZnkgdGhlIGRyaXZlciBhcyBwZXIgeW91ciBjb21tZW50cyBh
bmQgd2lsbCBwb3N0IG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggc2VyaWVzIGF0IHRoZSBlYXJs
aWVzdC4uLiANCg0KUmVnYXJkcywNCktlZGFyLg0KDQo=

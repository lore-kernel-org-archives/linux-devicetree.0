From: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
Subject: Backwards compatiblity for QorIQ FMAN LIODN entries
Date: Thu, 11 Apr 2019 03:28:10 +0000
Message-ID: <1554953290.3747.66.camel@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Language: en-US
Content-ID: <67A1AA396ADF3348A0C67EB6174FC3FE@atlnz.lc>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "paulus@samba.org" <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

SGkgUm9iIGFuZCBNYXJrLA0KDQpJIGFtIHVwZ3JhZGluZyB0aGUga2VybmVsIG9uIGEgRnJlZXNj
YWxlIFAyMDQwIGJhc2VkIHN5c3RlbSBhbmQgaGF2ZQ0Kc3RydWNrIGFuIGlzc3VlIHdpdGggTElP
RE5zIG5vdCBiZWluZyB1cGRhdGVkIGJ5IHVib290IGZvciBhbiBGTUFODQpldGhlcm5ldCBwb3J0
Lg0KDQpNeSBzeXN0ZW0gaGFzIGFuIG9sZCB1Ym9vdCBydW5uaW5nIHdoaWNoIGZhaWxzIGluIGl0
cyBhdHRlbXB0IHRvIHVwZGF0ZQ0KdGhlIGZtYW4gcnggcG9ydCBub2RlIHdpdGggdGhlIHJlcXVp
cmVkIExJT0ROIGVudHJ5LiBUaGlzIGlzIGJlY2F1c2UgbXkNCm9sZCB1Ym9vdCBpbnN0YWxsYXRp
b24gaXMgbG9va2luZyBmb3IgY29tcGF0aWJpbGl0eSB2YWx1ZSAiZnNsLGZtYW4tDQpwb3J0LTFn
LXJ4IiB3aGlsZSB0aGUgbGF0ZXN0IGtlcm5lbCBkZWZpbmVzIHRoZSBjb21wYXRpYmxlIHZhbHVl
IGFzDQoiZnNsLGZtYW4tdjItcG9ydC1yeCIgKHNlZSBmb3INCmluc3RhbmNlwqBhcmNoL3Bvd2Vy
cGMvYm9vdC9kdHMvZnNsL3FvcmlxLWZtYW4tMC0xZy0zLmR0c2kpLg0KTmV3ZXIgdWJvb3QgbG9v
a3MgZm9yIGJvdGggdmFsdWVzIHBlciB0aGlzIGNvbW1pdDoNCmh0dHBzOi8vZ2l0aHViLmNvbS91
LWJvb3QvdS1ib290L2NvbW1pdC85N2E4ZDAxMGUwMjkxMTFlNTcxMWE0NTI2NGE3MjZiDQplZGJl
YjI0YzQjZGlmZi00MzI0M2I5MTA4MzcyODNiYjFkNWQ2MjZmNGQ4OWQ3NQ0KDQpJIGFtIHVuYWJs
ZSB0byB1cGRhdGUgYm9vdGxvYWRlcnMgZm9yIGRldmljZXMgb2YgdGhpcyB0eXBlIGluIHRoZSBm
aWVsZA0Kc28gSSBhbSB3b25kZXJpbmcgaWYgdGhlIGNvcnJlY3QgYXBwcm9hY2ggaXMgdG8gYWRq
dXN0IG15IERUUyBmaWxlDQpsb2NhbGx5IHRvIGFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgbXkg
b2xkIHVib290IGlzIHNlYXJjaGluZyBmb3IsIG9yDQppZiB3ZSBzaG91bGQgYWRkIHRoaXMgdG8g
dGhlIHZhcmlvdXMgcW9yaXEtZm1hbiBkdHNpIGZpbGVzIGluIHRoZQ0Ka2VybmVsIHRvIG1ha2Ug
dGhpcyB3b3JrIGluIGEgbmljZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3YXkuDQoNCkxldCBtZSBr
bm93IHlvdXIgb3Bpbmlvbi4gSSdtIGhhcHB5IHRvIHdvcmsgdXAgYSBwYXRjaCBpZiB5b3UnZCBs
aWtlIHRvDQptYWtlIHRoZSBjaGFuZ2UgaW4gdGhlIGtlcm5lbCwgb3RoZXJ3aXNlIEknbGwgaGFu
ZGxlIGl0IGxvY2FsbHkgYnkNCm92ZXJyaWRpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGluIG15
IHN5c3RlbSdzIGR0cyBmaWxlLg0KDQpUaGFua3MsDQpIYW1pc2ggTQ==

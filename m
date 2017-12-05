From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v8 0/6] stm32 clocksource driver rework
Date: Tue, 5 Dec 2017 11:16:20 +0100
Message-ID: <7f58b43f-62a9-7b5d-c444-b09299b32817@st.com>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
 <dcff2fd0-58ca-51bb-ea2d-dfd1c5ca0cc3@st.com>
 <1f3d581f-e001-5011-829e-bf79e2f639a7@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1f3d581f-e001-5011-829e-bf79e2f639a7@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, tglx@linutronix.de, ludovic.barre@st.com, julien.thierry@arm.com, sudeep.holla@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CgpPbiAxMi8wNS8yMDE3IDExOjE1IEFNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAwNS8x
Mi8yMDE3IDExOjEyLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IFsgLi4uIF0KPiAKPj4+IEJl
bmphbWluIEdhaWduYXJkICg2KToKPj4+ICDCoMKgIGNsb2Nrc291cmNlOiB0aW1lcl9vZjogcmVu
YW1lIHRpbWVyX29mX2V4aXQgdG8gdGltZXJfb2ZfY2xlYW51cAo+Pj4gIMKgwqAgY2xvY2tzb3Vy
Y2U6IHN0bTMyOiBjb252ZXJ0IGRyaXZlciB0byB0aW1lcl9vZgo+Pj4gIMKgwqAgY2xvY2tzb3Vy
Y2U6IHN0bTMyOiBpbmNyZWFzZSBtaW4gZGVsdGEgdmFsdWUKPj4+ICDCoMKgIGNsb2Nrc291cmNl
OiBzdG0zMjogb25seSB1c2UgMzIgYml0cyB0aW1lcnMKPj4+ICDCoMKgIGNsb2Nrc291cmNlOiBz
dG0zMjogYWRkIGNsb2Nrc291cmNlIHN1cHBvcnQKPj4+ICDCoMKgIGFybTogZHRzOiBzdG0zMjog
cmVtb3ZlIHVzZWxlc3MgY2xvY2tzb3VyY2Ugbm9kZXMKPj4+Cj4+PiAgwqAgYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJmNDI5LmR0c2nCoCB8wqAgMzIgLS0tLS0KPj4+ICDCoCBhcmNoL2FybS9ib290
L2R0cy9zdG0zMmY3NDYuZHRzacKgIHzCoCAzMiAtLS0tLQo+Pj4gIMKgIGRyaXZlcnMvY2xvY2tz
b3VyY2UvS2NvbmZpZ8KgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+ICDCoCBkcml2ZXJzL2Nsb2Nr
c291cmNlL3RpbWVyLW9mLmPCoMKgwqAgfMKgwqAgOSArLQo+Pj4gIMKgIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItb2YuaMKgwqDCoCB8wqDCoCAyICstCj4+PiAgwqAgZHJpdmVycy9jbG9ja3Nv
dXJjZS90aW1lci1zdG0zMi5jIHwgMjQyCj4+PiArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLQo+Pj4gIMKgIDYgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlvbnMoKyksIDE4
MCBkZWxldGlvbnMoLSkKPj4+Cj4+Cj4+IFdoYXQgaXMgdGhlIHN0YXR1cyBvZiB0aGlzIHBhdGNo
LXNldCA/IElzIHRoZXJlIGEgY2hhbmNlIHRvIGhhdmUgaXQgZm9yCj4+IHY0LjE2ID8KPiAKPiBJ
IHdpbGwgdGFrZSBjYXJlIG9mIHJldmlld2luZyB0aGVtIHRoaXMgd2Vlay4gSXQgaXMgaW4gbXkg
dG9kbyBsaXN0Lgo+IAo+IApUaGFua3MgRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==

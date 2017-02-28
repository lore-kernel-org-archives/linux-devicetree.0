From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add TWD WD Support to DT
Date: Tue, 28 Feb 2017 21:43:09 +0100
Message-ID: <CACna6rw1oeUn=QuD-c+X8uokypSEqXUP3yqmiMEK2wgMD-ENeQ@mail.gmail.com>
References: <1488313886-17155-1-git-send-email-jon.mason@broadcom.com>
 <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488313886-17155-2-git-send-email-jon.mason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Mason <jon.mason@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMjggRmVicnVhcnkgMjAxNyBhdCAyMTozMSwgSm9uIE1hc29uIDxqb24ubWFzb25AYnJvYWRj
b20uY29tPiB3cm90ZToKPiBAQCAtNzAsMTAgKzcwLDE5IEBACj4gICAgICAgICAgICAgICAgICAg
ICAgICAgY2xvY2tzID0gPCZwZXJpcGhfY2xrPjsKPiAgICAgICAgICAgICAgICAgfTsKPgo+IC0g
ICAgICAgICAgICAgICBsb2NhbC10aW1lckAyMDYwMCB7Cj4gKyAgICAgICAgICAgICAgIHRpbWVy
QDIwNjAwIHsKCklzIHRoZXJlIGEgcmVhc29uIGZvciB0aGlzIHJlbmFtZT8gSSBkb24ndCByZWFs
bHkgaGF2ZSBwcmVmZXJlbmNlIGZvcgphbnkgbmFtZSwgaXQncyBqdXN0IHdlIHNob3VsZG4ndCBr
ZWVwIHJlbmFtaW5nIHRoaXMgZGVwZW5kaW5nIG9mCnBlcnNvbmFsIHByZWZlcmVuY2VzLgoKSXQg
YWxzbyBkb2Vzbid0IHNlZW0gbGlrZSBhZGp1c3RpbmcgdG8gYW55IHNjaGVtYToKYmNtNjMxMzgu
ZHRzaSB1c2VzIGxvY2FsLXRpbWVyQDFlNjAwCmJjbS1uc3AuZHRzaSB1c2VzIHR3ZC10aW1lckAy
MDYwMApiZXJsaW4yY2QuZHRzaSB1c2VzIGxvY2FsLXRpbWVyQGFkMDYwMApiZXJsaW4yLmR0c2kg
dXNlcyBsb2NhbC10aW1lckBhZDA2MDAKYmVybGluMnEuZHRzaSB1c2VzIGxvY2FsLXRpbWVyQGFk
MDYwMAoKCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4
LWE5LXR3ZC10aW1lciI7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MjA2MDAg
MHgxMDA+Owo+IC0gICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1BQSSAx
MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgyMDYwMCAweDIwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19QUEkgMTMgKEdJQ19DUFVfTUFTS19TSU1QTEUoMikgfAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJRX1RZUEVfTEVWRUxfSElHSCk+Owo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmcGVyaXBoX2Nsaz47Cj4gKyAgICAgICAg
ICAgICAgIH07CgpUaGUgcmVzdCBsb29rcyBPSywgdGhhbmtzISA6KQoKLS0gClJhZmHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=

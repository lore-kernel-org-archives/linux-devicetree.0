From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH] ASoC: tda998x: Fix lack of required reg in DT
 documentation
Date: Thu, 20 Mar 2014 16:54:40 +0100
Message-ID: <20140320165440.195cd2ea@armhf>
References: <20140320092639.48F68A6279@smtp3-g21.free.fr>
 <532ADFD8.80301@gmail.com> <20140320140156.5d768b1f@armhf>
 <532AEDE2.3080306@gmail.com> <20140320145221.09252bf6@armhf>
 <20140320143110.GU7528@n2100.arm.linux.org.uk>
 <20140320155935.7a474173@armhf>
 <20140320151934.GV7528@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140320151934.GV7528@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMCBNYXIgMjAxNCAxNToxOTozNCArMDAwMApSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggPGxpbnV4QGFybS5saW51eC5vcmcudWs+IHdyb3RlOgoKPiBJJ20gbm90IHNheWluZyB0aGF0
IGl0IGhhcyB0byBtYXRjaCB0aGUgcGh5c2ljYWwgZGV2aWNlIGZpdHRlZCAtIEknbQo+IG1lcmVs
eSBzdWdnZXN0aW5nIG5vdCB1c2luZyBueHAsdGRhMTk5OHggd2hpY2ggY291bGQgKGFuZCBhcyBT
ZWJhc3RpYW4KPiBoYXMgZm91bmQsIGRvZXMpIGNvbmZsaWN0IHdpdGggb3RoZXIgZGV2aWNlcyB3
aXRoIGRpZmZlcmVudCBwcm9wZXJ0aWVzLgo+IAo+IFdlIHN0aWxsIGF1dG8tZGV0ZWN0IHRoZSBl
eGFjdCBkZXZpY2UgdHlwZSBieSByZWFkaW5nIHRoZSBJRCByZWdpc3Rlcgo+IGJlY2F1c2UgdGhh
dCdzIHRoZSBtb3N0IHJlbGlhYmxlIHdheSB0byBkZXRlY3QgZXhhY3RseSB3aGF0IGtpbmQgb2YK
PiBkZXZpY2UgaXMgZml0dGVkIHRvIHRoZSBib2FyZC4KCkkgZG9uJ3Qgc2VlIHRoZSBwcm9ibGVt
LgoKQWN0dWFsbHkgdGhlIGRyaXZlciBoYW5kbGVzIHRoZSB0ZGE5OTg5LCB0ZGExOTk4OCBhbmQg
dGRhMTk5ODkgKDIKdmFyaWFudHMpLiBJZiBzb21lIGJvYXJkIGhhcywgZm9yIGV4YW1wbGUsIHRo
ZSB0ZGE5OTgzIGFuZCBpZiB0aGUKZHJpdmVyIGlzIGV4dGVuZGVkIHRvIGhhbmRsZSB0aGlzIGNo
aXAgKGkuZS4gbWFpbmx5IGlnbm9yZSB0aGUgQ0VDCnBhcnQpLCBzZXR0aW5nICdueHAsdGRhOTk4
eCcgaW4gdGhlIGFzc29jaWF0ZWQgRFQgd2lsbCBzdGlsbCB3b3JrLgoKVGhlcmUgY291bGQgYmUg
YSBwcm9ibGVtIGlmIHNvbWVib2R5IHdvdWxkIHdyaXRlIGEgc3BlY2lmaWMgZHJpdmVyIGZvciwK
c2F5LCBhIHRkYTk5ODUuIEJ1dCwgdGhlbiwgdGhlIGNvbXBhdGlibGUgd291bGQgYmUgJ254cCx0
ZGE5OTg1Jy4KCi0tIApLZW4gYXIgYydoZW50YcOxCXwJICAgICAgKiogQnJlaXpoIGhhIExpbnV4
IGF0YXYhICoqCkplZgkJfAkJaHR0cDovL21vaW5lamYuZnJlZS5mci8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

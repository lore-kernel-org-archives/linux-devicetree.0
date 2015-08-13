From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/7] drm/vc4: Add KMS support for Raspberry Pi.
Date: Thu, 13 Aug 2015 22:29:36 +0100
Message-ID: <20150813212936.GT7557@n2100.arm.linux.org.uk>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-4-git-send-email-eric@anholt.net>
 <20150813075141.GX17734@phenom.ffwll.local>
 <87d1yqq5po.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <87d1yqq5po.fsf@eliezer.anholt.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBBdWcgMTMsIDIwMTUgYXQgMDE6NDQ6MDNQTSAtMDcwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gU3RydWN0IG11dGV4IGlzIGhlcmUgYmVjYXVzZSB0aGlzIGNvZGUgaXMgZnJvbSB0aGUg
VjNEIHNlcmllcywgd2l0aCB0aGUKPiBpbi1rZXJuZWwgQk8gY2FjaGUgcmlwcGVkIG91dCAoaXQg
dHVybnMgb3V0IHRoYXQgdGhlIENNQSBhbGxvY2F0b3IgaXMKPiBzbG93LCBhbmQgeW91IGNhbid0
IGp1c3QgdXNlcnNwYWNlIGNhY2hlIHNpbmNlIHdlIGhhdmUgdG8gZG8gYWxsb2NhdGlvbnMKPiB3
aXRoaW4gdGhlIGtlcm5lbCB0byB0aGUgdHVuZSBvZiBhIGNvdXBsZSBwZXIgZHJhdyBhbmQgdGhh
dCdzIHRvbyBtdWNoKS4KClRoZSBDTUEgYWxsb2NhdG9yIGlzIGZhc3QgdW50aWwgeW91IGhhdmUg
cGlubmVkIHBhZ2VzIGluIGl0cyByZWdpb24sCndoZXJlIGl0IGJlY29tZXMgX3ZlcnlfIHNsb3cg
dG8gZG8gYWxsb2NhdGlvbnMsIHNvbWV0aW1lcyBnZXR0aW5nIHVwCnRvIHRoZSBvcmRlciBvZiBz
ZWNvbmRzLgoKVGhlIG1haW4gY3VscHJldCBvZiB0aGlzIGFyZSBHRlBfSElHSFVTRVJfTU9WQUJM
RSBhbGxvY2F0aW9ucyB3aGljaAp0aGVuIHBpbiB0aGUgcGFnZS4gIEl0IGRvZXNuJ3QgdGFrZSBt
YW55IG9mIHRob3NlIHRvIG1ha2UgQ01BIHJlYWxseQppbmVmZmljaWVudC4KClRoZSBwcm9ibGVt
IGlzIHRoYXQgQ01BIGRvZXNuJ3QgZ2V0IGFueSBpbmZvcm1hdGlvbiBiYWNrIGZyb20gdGhlCmlu
dGVybmFsIHBhZ2UgbWlncmF0aW9uIGFib3V0IHdoaWNoIHBhZ2VzIGNvdWxkbid0IGJlIG1vdmVk
LCBzbyBpdApkdW1ibHkganVzdCB0cmllcyBpbmNyZW1lbnRpbmcgdGhlIGFsbG9jYXRpb24gYnkg
b25lIHBhZ2UgKHN1YmplY3QKdG8gYWxpZ25tZW50IGNvbnN0cmFpbnRzKSBhbmQgcmV0cnlpbmcg
YWdhaW4gLSByZXBlYXRpbmcgb3ZlciB0aGUKZW50aXJlIENNQSByZWdpb24uICBUaGUgYmlnZ2Vy
IHRoZSByZWdpb24sIHRoZSBtb3JlIHRpbWUgdGhpcyB0YWtlcy4KCi0tIApGVFRDIGJyb2FkYmFu
ZCBmb3IgMC44bWlsZSBsaW5lOiBjdXJyZW50bHkgYXQgMTAuNU1icHMgZG93biA0MDBrYnBzIHVw
CmFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

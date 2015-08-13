From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/7] drm/vc4: Add KMS support for Raspberry Pi.
Date: Thu, 13 Aug 2015 16:03:00 -0700
Message-ID: <87zj1uiyfv.fsf@eliezer.anholt.net>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-4-git-send-email-eric@anholt.net>
 <20150813075141.GX17734@phenom.ffwll.local>
 <87d1yqq5po.fsf@eliezer.anholt.net>
 <20150813212936.GT7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0949860586=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150813212936.GT7557@n2100.arm.linux.org.uk>
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
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0949860586==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Russell King - ARM Linux <linux@arm.linux.org.uk> writes:

> On Thu, Aug 13, 2015 at 01:44:03PM -0700, Eric Anholt wrote:
>> Struct mutex is here because this code is from the V3D series, with the
>> in-kernel BO cache ripped out (it turns out that the CMA allocator is
>> slow, and you can't just userspace cache since we have to do allocations
>> within the kernel to the tune of a couple per draw and that's too much).
>
> The CMA allocator is fast until you have pinned pages in its region,
> where it becomes _very_ slow to do allocations, sometimes getting up
> to the order of seconds.
>
> The main culpret of this are GFP_HIGHUSER_MOVABLE allocations which
> then pin the page.  It doesn't take many of those to make CMA really
> inefficient.
>
> The problem is that CMA doesn't get any information back from the
> internal page migration about which pages couldn't be moved, so it
> dumbly just tries incrementing the allocation by one page (subject
> to alignment constraints) and retrying again - repeating over the
> entire CMA region.  The bigger the region, the more time this takes.

Ouch.

Since I can workaround the allocation cost, the main problem I have
right now is that I've got a set of small allocations for 3D that all
need to have the same high 4 bits of paddr, because someone cleverly
packed some address bits in a GPU-managed structure.  Any
recommendations for ways to handle this with CMA?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVzSIkAAoJELXWKTbR/J7oo14P/iw6hUN33ZedoR9xlCYGSB+p
LluH9tIIKGRc01eO4oCDl6wIJM+Qrw9LOGXkLMSFxo0Qr98tXqVd6Klfmr7BFFqv
tqIGRDf3U5tIBftpXGOCT97SXQhVEcuQTJrSq+pEkPKVhBRjtMXgz5laMKB1sFew
9/4SUoJbrrTyOtPoGAFgRPE3DxJkUzCzRgIes1j0Q75mWnuYaQIb37YKPElwDID4
A1cv+isxEB5QHIFPG0hY31scSrPIjRm/eYcuqL320vEVj3JTxTNIxP9UDOTQAseK
i/V3FdNgJJf45xcEIUwkcUNM7aR20Wut3fDsJ8qg9/IcuUVqLatWsJZrchekzag/
iDxJd/Ypzf4tSA41zWkw1USxErv5y8N1qvf8O8wWQ9IeuzflNe1L7uBqtUlN00Ie
oTjmYbtQvdxQH80j+9Tokiilafq85hQFf/kENjgHRDTEG0BKbdcHlfBRDywhGAjp
j/qo7yfHznFlSPtyxeC5+G1zcduTp2OFjfGRYDqvOKO3aGlnzYSks79lMOtrAuLw
F0sBnoA0c4e2wrfFl7teZF5mD6/ePVkGLNOEGfjVWpgV3JgMFLba7yzM6Q+MAINC
mKJ25pv2MfsFm7VG6jNoVv8xcbEuqCOZbelnkNsFvXCx7S7e+YpFacl375ugHYLq
iosc8rvdKHcn6Sg/7bw2
=cPq5
-----END PGP SIGNATURE-----
--=-=-=--

--===============0949860586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0949860586==--

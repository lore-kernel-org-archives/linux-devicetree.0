From: valdis.kletnieks@vt.edu
Subject: Re: [PATCH v2] of: overlay: user space synchronization
Date: Mon, 15 Oct 2018 20:35:58 -0400
Message-ID: <5408.1539650158@turing-police.cc.vt.edu>
References: <1539649621-5518-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1539650157_2195P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539649621-5518-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, Alan Tull <atull@kernel.org>
List-Id: devicetree@vger.kernel.org

--==_Exmh_1539650157_2195P
Content-Type: text/plain; charset=us-ascii

On Mon, 15 Oct 2018 17:27:01 -0700, frowand.list@gmail.com said:
> From: Frank Rowand <frank.rowand@sony.com>
>
> When an overlay is applied or removed, the live devicetree visible in
> /proc/device-tree/, aka /sys/firmware/devicetree/base/, reflects the
> changes.  There is no method for user space to determine whether the
> live devicetree was modified by overlay actions.
>
> Provide a sysfs file, /sys/firmware/devicetree/tree_version,  to allow
> user space to determine if the live devicetree has remained unchanged
> while a series of one or more accesses of /proc/device-tree/ occur.
>
> The use of both dynamic devicetree modifications and overlay apply and
> removal are not supported during the same boot cycle.  Thus non-overlay
> dynamic modifications are not reflected in the value of tree_version.

Is there an easy way from userspace to detect "yes/no dynamic modifications
have been done since boot"?

--==_Exmh_1539650157_2195P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.8.0 04/21/2017

iQEVAwUBW8UybY0DS38y7CIcAQJaRAf+Il4+gH+j2Zi4KTT3qxKMlNjnKbA+UubA
BHOBGqTG9rD6GOTbR/0Cz2E/yXScYkcG+pmO2+DvhJgkYmAmpGr+epkIjmRBECBx
tA4fHPxH4mKcb09PrlqyjcmAfoRffGcfTkY2yAR9fSkwk9Kk7hOchiqIpE7YkUCR
KN6xkn6pX9xsA1iG7Xuk+L1SSupm4DounP/8km8Bml31ebL/uVMjSKI6+PllM3RN
ScxOHbW6vCy/9Z1F/ZUT0sOovBPl2GSZNyA6L6rbvdmaubVZIR2Yh9DunRIV45Gu
F+B3kWZ56baPpStLDKXr7BhPYv+SctGxyYMsJZgekKONdzqwd7Gy4A==
=AWoN
-----END PGP SIGNATURE-----

--==_Exmh_1539650157_2195P--

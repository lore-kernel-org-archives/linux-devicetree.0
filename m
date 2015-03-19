From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] st33zp24 fix when using irq mode
Date: Thu, 19 Mar 2015 22:34:31 +0100
Message-ID: <201503192234.32531.PeterHuewe@gmx.de>
References: <1426799709-9696-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426799709-9696-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

great timing :) I just sent the pull request for 4.1 out yesterday :)
But thanks for spotting and fixing it.=20
=46ound bugs are good bugs, and fixed ones are even better.

Am Donnerstag, 19. M=E4rz 2015, 22:15:08 schrieb Christophe Ricard:
> Hi,
>=20
> Please find in this patch a fix that fix an improper command completi=
on
> wait. This patch apply on top of for-james branch
> tpm/tpm_infineon: Use struct dev_pm_ops for power management
> 6b37729bd184fdd44f144c6cc4951b06b55bcf4b
>=20
> *** Note: This bug is also present in kernel 4.0 but will not apply a=
s the
> driver structure changed between kernel 4.0 and kernel 4.1.
>=20
> A backported version is also going to be sent to <stable-u79uwXL29TasMV2rI37PzA@public.gmane.org=
org> ?

Are kernels < 4.0 also affected or was this code introduced in 4.0 ?

How critical is the mentioned 'critical failure' ? What will happen?
How often does it happen? =20

If this thing is big enough and kernels < 4.0 are not affected we can t=
ry to=20
get it into 4.0 still, so no stable. (but I still need the backport :) =
)


If it won't hit 4.0 then backport to 4.0.1 is needed,
which will be sent to stable@...
with the upstream commit mentioned.


See=20
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/stable_kernel_rules.txt

Thanks,
Peter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

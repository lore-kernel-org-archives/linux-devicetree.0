From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 00/15] ST33 I2C TPM driver cleanup
Date: Sun, 30 Nov 2014 14:37:18 +0100
Message-ID: <201411301437.18703.PeterHuewe@gmx.de>
References: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413753085-9958-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christophe,

sorry for the late reply :/
 
> This new patchset version is taking into account as much as possible
> Jason Gunthorpe feedbacks. I hope, i am not missing any.
> 
> It still brings:
> - Some few code clean up from code style up to structure
> - Device tree support keeping static platform data configuration support.
> - Fixes & improvement for irq support.
> - Update the GPLv2 license header
> 
> I am also adding the mention Reviewed-By: Jason Gunthorpe
> <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org> on all those patches.
> Jason, please feel free to let me know if i am mistaking here. :).
> 
> This patchset apply on top of James Morris linux-security tree

Unfortunately I get compile warnings:

/data/data-old/linux-2.6/drivers/char/tpm/tpm_i2c_stm_st33.c: In function 
'tpm_stm_i2c_probe':
/data/data-old/linux-2.6/drivers/char/tpm/tpm_i2c_stm_st33.c:748:3: warning: 
passing argument 1 of 'tpm_stm_i2c_of_request_resources' from incompatible 
pointer type [enabled by default]
/data/data-old/linux-2.6/drivers/char/tpm/tpm_i2c_stm_st33.c:670:12: note: 
expected 'struct i2c_client *' but argument is of type 'struct tpm_chip *'
/data/data-old/linux-2.6/drivers/char/tpm/tpm_i2c_stm_st33.c:722:3: warning: 
'chip' may be used uninitialized in this function [-Wuninitialized]

Smatch complains:
/data/data-old/linux-2.6/drivers/char/tpm/tpm_i2c_stm_st33.c:722 
tpm_stm_i2c_probe() error: potentially dereferencing uninitialized 'chip'.



Can you fix this up?

(also if you redo the patchset, moving 
tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
to the front would be nice, as indicated by Jason on v3


Nitpick: maybe you could use ret instead of r in your return code cleanup.
I'm not a fan of one letter variables, except counters)


Peter


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

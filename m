From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v6 00/15] ST33 I2C TPM driver cleanup
Date: Mon, 1 Dec 2014 23:38:47 +0100
Message-ID: <201412012338.47839.PeterHuewe@gmx.de>
References: <1417458780-25977-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417458780-25977-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 1. Dezember 2014, 19:32:45 schrieb Christophe Ricard:
> Hi Peter,
> 
> I have seen one mistake done during the rebase on v5 on patch
> 0010-tpm-tpm_i2c_stm_st33-Add-devicetree-structure.
> ~~ Please discard v5. ~~
> 
> This new patchset version is taking into account as much as possible
> Jason Gunthorpe feedbacks as well as yours. I hope, i am not missing any.
> 
> I have also aligned dts compatible string with other drivers and rephrase
> one part of the st33zp24 dts documentation as pointed by Mark Rutland.
> 
> It still brings:
> - Some few code clean up from code style up to structure
> - Device tree support keeping static platform data configuration support.
> - Fixes & improvement for irq support.
> - Update the GPLv2 license header
> 
> I have moved previous patch 0013 tpm/tpm_i2c_stm_st33: Fix potential bug in
> tpm_stm_i2c_send to 0001 as per your request. I have fixed as some build
> errors seen during the rebase :(. My bad.
> I have also changed the convention in the driver from r to ret.
> 
> This patchset apply on top of James Morris linux-security tree
> on top of ac14ae25b676d721b6bfcfb046dc53a9f7760d83 on next branch
> Hope i am targetting the correct tree.
> 
> Best Regards
> Christophe

Applied to my tree:
https://github.com/PeterHuewe/linux-tpmdd for-james

Will be included in the next pull-request (if no negative feedback from the 
device tree guys).

Thanks,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

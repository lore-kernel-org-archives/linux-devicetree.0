From: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 10/16] tpm/tpm_i2c_stm_st33: Replace wait_for_serirq_timeout
 by wait_for_tpm_stat
Date: Wed, 08 Oct 2014 07:38:30 +0200
Message-ID: <5434CDD6.4050200@gmail.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com> <1412712189-1234-11-git-send-email-christophe-h.ricard@st.com> <20141007221146.GC2366@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141007221146.GC2366-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

  Hi Jason,

The freezer header is here for the freezing(current) function call in 
get_burstcount().

Best Regards
Christophe
On 08/10/2014 00:11, Jason Gunthorpe wrote:
> On Tue, Oct 07, 2014 at 10:03:03PM +0200, Christophe Ricard wrote:
>
>> +++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
>> @@ -39,6 +39,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/delay.h>
>>   #include <linux/wait.h>
>> +#include <linux/freezer.h>
> I'm surprised to see that include here..
>
> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

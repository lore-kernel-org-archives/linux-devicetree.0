From: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 00/16] ST33 I2C TPM driver cleanup
Date: Wed, 08 Oct 2014 07:45:07 +0200
Message-ID: <5434CF63.9070102@gmail.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com> <20141007222525.GD2366@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141007222525.GD2366-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On 08/10/2014 00:25, Jason Gunthorpe wrote:
> On Tue, Oct 07, 2014 at 10:02:53PM +0200, Christophe Ricard wrote:
>> Hi Peter,
>>
>> The following patchset brings:
>> - Some few code clean up from code style up to structure
>> - Device tree support keeping static platform data configuration support.
>> - Fix irq support.
>> - Update the GPLv2 license header
> I really don't have much to say about this - it looks like the older
> driver was never being used so if you have reviewed and tested it
> again in a new system I think that is an improvement..
>
> Can you put this on a github or something? It would be nice to see the
> file new .c file rather than looking at patches..
I will try to.
>   
>>    tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
>>    tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove
>>      tpm_i2c_buffer[0], [1] buffer.
> I'm very happy to see this, this is much better than the old way.
Those tpm_i2c_buffer were actually there to workaround a standby/resume 
ops on very old kernel (may be 5 years old).
They are not necessary any more and quite uggly to read ;). I am happy 
as well :).
>>    tpm/tpm_i2c_stm_st33: Replace err/rc/ret by r for a function return
>>      code
> This is very churny, and I didn't think 'r' was a kernel convention..
I am not sure r is really a kernel convention but i believe at least we 
need to have a convention in each driver.
>
>>    tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*
> What is the part branding? We still have 'st33' in various places..
The branding of this chip is st33zp24. Still, i have tried to have a 
convention for function naming.
There might be st33 at some place in platform data stucture for example.
>   
>>    tpm/tpm_i2c_stm_st33: Add devicetree structure
>>    tpm: dts: st33zp24_i2c: Add DTS Documentation
> Peter: FYI, the protocol for device tree stuff is to wait for an ack
> from the device tree maintainers on the documentation patch..
>
> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

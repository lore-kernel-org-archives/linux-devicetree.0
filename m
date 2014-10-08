From: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 13/16] tpm/tpm_i2c_stm_st33: Add tpm_lock
 mutex for safe irq management
Date: Wed, 08 Oct 2014 07:21:22 +0200
Message-ID: <5434C9D2.7080003@gmail.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com> <1412712189-1234-14-git-send-email-christophe-h.ricard@st.com> <20141007215630.GB2366@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141007215630.GB2366-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

Here i want to prevent a TPM TIS write command sent when a TPM TIS read 
command is on going on the bus.
Basically:
- a TPM TIS write looks like the following format: <W reg data>
- a TPM TIS read looks like the following format: <W reg dummy><R data>

If an interrupt occur a TPM TIS read might be interrupted by a TPM TIS 
write to clear the pending interrupt giving potentially something like that:
<W reg dummy><W reg data> <R data>
The TPM behavior in this situation is unknown...

Best Regards
Christophe
On 07/10/2014 23:56, Jason Gunthorpe wrote:
> On Tue, Oct 07, 2014 at 10:03:06PM +0200, Christophe Ricard wrote:
>> Adding tpm_lock mutex in order to guarantee that a i2c_read_data or a
>> i2c_write_data will not get interrupted by a threaded interrupt.
> Can you elaborate on this?
>
> Any call from the TPM core itself through 'ops' is locked already, and
> I don't see this driver's IRQ handler doing I2C ops..
>
> What scenario is this protecting against?
>
> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

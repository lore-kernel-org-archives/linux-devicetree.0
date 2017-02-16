From: matthew.gerlach@linux.intel.com
Subject: Re: [PATCH 2/4] fpga pr ip: Core driver support for Altera Partial
 Reconfiguration IP.
Date: Thu, 16 Feb 2017 14:47:07 -0800 (PST)
Message-ID: <alpine.DEB.2.20.1702161427410.2932@mgerlach-VirtualBox>
References: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com> <1487193038-3490-3-git-send-email-matthew.gerlach@linux.intel.com> <CAAtXAHd_uk=9A4H=vjdd9VTiwHo5_zX-hPURW9d70KeWSKO-mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHd_uk=9A4H=vjdd9VTiwHo5_zX-hPURW9d70KeWSKO-mg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Alan Tull <atull@opensource.altera.com>, linux-fpga@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


Hi Moritz,

Thanks for the feedback.

On Thu, 16 Feb 2017, Moritz Fischer wrote:

> Hi Matthew,
>
> On Wed, Feb 15, 2017 at 1:10 PM,  <matthew.gerlach@linux.intel.com> wrote:
>
>> +static int alt_pr_fpga_write_complete(struct fpga_manager *mgr,
>> +                                     struct fpga_image_info *info)
>> +{
>> +       u32 i;
>> +
>> +       for (i = 0; i < info->config_complete_timeout_us; i++) {
>> +               switch (alt_pr_fpga_state(mgr)) {
>> +               case FPGA_MGR_STATE_WRITE_ERR:
>> +                       return -EIO;
>> +
>> +               case FPGA_MGR_STATE_OPERATING:
>> +                       dev_info(&mgr->dev,
>> +                                "successful partial reconfiguration\n");
>> +                       return 0;
>> +
>> +               default:
>> +                       break;
>> +               }
>> +               udelay(1);
>
> Does this need to be a udelay? would a usleep_range() do maybe?

The actual timeout required is design specific.  The member,
config_complete_timeout_us, is defined in microseconds, and my experience 
is that a small number of microseconds (e.g. < 10) is usually plenty. 
Other FPGAs and designs might be different.  My quick reading of kernel 
timers says usleep_range() is good for 10 us - 20 ms.  In this driver, if 
usleep_range(1) can put less pressure on the CPU and schedular at the cost 
of little accuracy, I will be happy to switch, but at this time I don't 
know if usleep_range() would be better or not.


>
> Could we maybe pull the timeout part into the framework if all drivers are doing
> is to wait / poll for the state to be a certain value?
>

I think it is safe to say that all variations of FPGAs need some amount of 
time after the bitstream to be delivered before the FPGA is "ready".  If 
that time is exceeded then the fpga programming has failed.  If all FPGA 
variations are doing a poll for some amount of time, then it would be good 
to move the polling up to the framework.  I think such a change would be 
better in its own patch set.

> Thanks,
>
> Moritz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fpga" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

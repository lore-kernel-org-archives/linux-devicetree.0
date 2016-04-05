From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Bypass BAM init if Remotely controlled
Date: Tue, 5 Apr 2016 11:19:50 -0700
Message-ID: <20160405181950.GD8930@vkoul-mobl.iind.intel.com>
References: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
 <56F116AC.2000704@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56F116AC.2000704-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Pramod Gurav <gpramod-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 11:55:56AM +0200, Stanimir Varbanov wrote:
> On 03/22/2016 11:49 AM, Pramod Gurav wrote:
> > On some QOCM platforms(eg 8996) BAM control registers are managed remotely
> > hence can not be accessed by application processor for writes. So skip the bam_init
> > for any such platform if DT property is set.
> > 
> > Tested on 8996 (BAM Global control is through remote) and DB410C boards.
> > Tested with i2c DMA on these targets which uses BAM as DMA controller.
> 
> I have similar patches at [1] already, could you check them first.

was there an update posted on these? I dont have this series or an update in
my queue

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

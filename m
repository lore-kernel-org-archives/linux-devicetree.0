From: Ramiro Oliveira <mymailbox14-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: I2C add ov2640 ?
Date: Fri, 14 Mar 2014 14:02:43 +0000 (UTC)
Message-ID: <loom.20140314T150021-558@post.gmane.org>
References: <52784785.1040406@gtsys.com.hk>	<5278C2B4.802@gtsys.com.hk>	<CAOMZO5DdUyvKAJdwYLpVR2+V5HBCt-AqgDxwgkh4AHQsE+evng@mail.gmail.com>	<527B330D.3040704@gtsys.com.hk> <CAOMZO5Acink+VzWZmv_w1dEyp4AU3mS9fHwt82c28h+VHFDmUw@mail.gmail.com> <527C3A66.4010108@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Chris Ruehl <chris.ruehl@...> writes:

> Hi Fabio,
> 
> Thanks for the hint,, found an old thread
>   https://lkml.org/lkml/2013/7/30/246
> 
> where the clock is provided to a sound card via device tree. I will see if 
I can 
> make a patch and then I post it again.
> 
> Chris
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@...
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

Hi,

Sorry for hijacking this thread, but I'm having some issues with v4l2_clk_get 
which doesn't seem to support device tree. 

Did you manage to find a solution to your problem?

Thanks,
Ramiro


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

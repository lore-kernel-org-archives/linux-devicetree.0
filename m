From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: Re: I2C add ov2640 ?
Date: Fri, 08 Nov 2013 09:12:06 +0800
Message-ID: <527C3A66.4010108@gtsys.com.hk>
References: <52784785.1040406@gtsys.com.hk>	<5278C2B4.802@gtsys.com.hk>	<CAOMZO5DdUyvKAJdwYLpVR2+V5HBCt-AqgDxwgkh4AHQsE+evng@mail.gmail.com>	<527B330D.3040704@gtsys.com.hk> <CAOMZO5Acink+VzWZmv_w1dEyp4AU3mS9fHwt82c28h+VHFDmUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Acink+VzWZmv_w1dEyp4AU3mS9fHwt82c28h+VHFDmUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, November 08, 2013 02:08 AM, Fabio Estevam wrote:
> On Thu, Nov 7, 2013 at 4:28 AM, Chris Ruehl<chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>  wrote:
>
>> c) in the patch dev_err(&adapter->dev, "OV2640 Not probed mclk missing\n");
>> give me the hint was wrong.
>>
>> from your conversation with Sascha Hauer
>> http://www.spinics.net/lists/linux-i2c/msg09099.html
>>
>> I see that's other ways to get a clock, thats works for
>>   v4l2_clk_get(&client->dev, "mclk")
>>   v4l2_clk_get(&client->dev, NULL)
>
> You probably need to pass the mclk clock via device tree.
>
> Please start a new thread about it on linux-media and add Guennadi on Cc.
>
> Regards,
>
> Fabio Estveam

Hi Fabio,

Thanks for the hint,, found an old thread
  https://lkml.org/lkml/2013/7/30/246

where the clock is provided to a sound card via device tree. I will see if I can 
make a patch and then I post it again.

Chris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

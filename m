From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Thu, 26 Feb 2015 18:52:57 +0100
Message-ID: <54EF5D79.9060503@free-electrons.com>
References: <1424089864-15651-1-git-send-email-kaloz@openwrt.org> <54EB7255.7090806@free-electrons.com> <op.xuiwzhcu2s3iss@ecaz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <op.xuiwzhcu2s3iss@ecaz>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Imre,

On 23/02/2015 19:43, Imre Kaloz wrote:
> Hi Gregory,
> 
> On Mon, 23 Feb 2015 19:32:53 +0100, Gregory CLEMENT  
> <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
> ...
> 
>>> @@ -0,0 +1,348 @@
>>> +/*
>>> + * Device Tree file for the Linksys WRT1900AC (Mamba).
>>> + *
>>> + * Note: this board is shipped with a new generation boot loader that
>>> + * remaps internal registers at 0xf1000000. Therefore, if earlyprintk
>>> + * is used, the CONFIG_DEBUG_MVEBU_UART_ALTERNATE option should be
>>
>> This symbol name has been removed and DEBUG_MVEBU_UART0_ALTERNATE would
>> be used instead.
>>
>> Besides this,
>>
>> Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>
>> You don't have to resend a new version for this, I can amend
>> your patch while applying it. So unless there is new comments
>> I will add your patch to the mvebu tree in a couple of days.
> 
> I knew I will forget something - this has been noted by Andrew back then  
> :) Thank you for taking care of this.


Now applied (amended) on mvebu/dt
Thanks,

Gregory

> 
> 
> Best,
> 
> Imre
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

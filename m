From: "Imre Kaloz" <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCHv3] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Mon, 23 Feb 2015 19:43:55 +0100
Message-ID: <op.xuiwzhcu2s3iss@ecaz>
References: <1424089864-15651-1-git-send-email-kaloz@openwrt.org>
 <54EB7255.7090806@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54EB7255.7090806-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gregory,

On Mon, 23 Feb 2015 19:32:53 +0100, Gregory CLEMENT  
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

...

>> @@ -0,0 +1,348 @@
>> +/*
>> + * Device Tree file for the Linksys WRT1900AC (Mamba).
>> + *
>> + * Note: this board is shipped with a new generation boot loader that
>> + * remaps internal registers at 0xf1000000. Therefore, if earlyprintk
>> + * is used, the CONFIG_DEBUG_MVEBU_UART_ALTERNATE option should be
>
> This symbol name has been removed and DEBUG_MVEBU_UART0_ALTERNATE would
> be used instead.
>
> Besides this,
>
> Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> You don't have to resend a new version for this, I can amend
> your patch while applying it. So unless there is new comments
> I will add your patch to the mvebu tree in a couple of days.

I knew I will forget something - this has been noted by Andrew back then  
:) Thank you for taking care of this.


Best,

Imre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

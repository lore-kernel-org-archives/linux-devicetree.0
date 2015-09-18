From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] soc: brcmstb: Add Bus Interface Unit control setup
Date: Fri, 18 Sep 2015 06:12:56 -0700
Message-ID: <CADtm3G4bhPd4Jd+wP-Fa1cZXpY-8su-OKBnPOU3dMN3Be8yx8A@mail.gmail.com>
References: <1442340900-15320-1-git-send-email-f.fainelli@gmail.com>
 <1442340900-15320-3-git-send-email-f.fainelli@gmail.com> <CADtm3G6SkczVkFK0n=fpMCkocj_ijGWtHkfipTZZfp8deC=6zg@mail.gmail.com>
 <55FAFB7A.4010105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55FAFB7A.4010105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 17, 2015 at 10:42 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 16/09/15 23:08, Gregory Fong wrote:
>>> [...]
>>> diff --git a/drivers/soc/brcmstb/biuctrl.c b/drivers/soc/brcmstb/biuctrl.c
>>> new file mode 100644
>>> index 000000000000..1d4deada1c4d
>>> --- /dev/null
>>> +++ b/drivers/soc/brcmstb/biuctrl.c
>>> @@ -0,0 +1,119 @@
>>> [...]
>>> +int __init brcmstb_biuctrl_init(void)
>>> +{
>>> +       int ret = 0;
>>> +
>>> +       ret = setup_hifcpubiuctrl_regs();
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       ret = mcp_write_pairing_set();
>>> +       if (ret) {
>>> +               pr_err("MCP: Unable to disable write pairing!\n");
>>> +               return ret;
>>
>> The return value isn't used in patch 3.  Is there a point to returning
>> an error from this function in either of the above two locations,
>> considering that?
>>
>> Looks good otherwise.
>>
>> Acked-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Not really, how about this:
>
> void __init brcmstb_biuctrl_init(void)
> {
>         int ret;
>
>         setup_hifcpubiuctrl_regs();
>
>         ret = mcp_write_pairing_set();
>         if (ret) {
>                 pr_err("MCP: Unable to disable write pairing!\n");
>                 return;
>         }
>
> #ifdef CONFIG_PM_SLEEP
>         register_syscore_ops(&brcmstb_cpu_credit_syscore_ops);
> #endif
> }
>
> and updating the function prototype accordingly in the header file?

Sure, that works.

Thanks,
Gregory
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

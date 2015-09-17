From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] soc: brcmstb: Add Bus Interface Unit control setup
Date: Thu, 17 Sep 2015 10:42:18 -0700
Message-ID: <55FAFB7A.4010105@gmail.com>
References: <1442340900-15320-1-git-send-email-f.fainelli@gmail.com> <1442340900-15320-3-git-send-email-f.fainelli@gmail.com> <CADtm3G6SkczVkFK0n=fpMCkocj_ijGWtHkfipTZZfp8deC=6zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADtm3G6SkczVkFK0n=fpMCkocj_ijGWtHkfipTZZfp8deC=6zg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16/09/15 23:08, Gregory Fong wrote:
>> [...]
>> diff --git a/drivers/soc/brcmstb/biuctrl.c b/drivers/soc/brcmstb/biuctrl.c
>> new file mode 100644
>> index 000000000000..1d4deada1c4d
>> --- /dev/null
>> +++ b/drivers/soc/brcmstb/biuctrl.c
>> @@ -0,0 +1,119 @@
>> [...]
>> +int __init brcmstb_biuctrl_init(void)
>> +{
>> +       int ret = 0;
>> +
>> +       ret = setup_hifcpubiuctrl_regs();
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = mcp_write_pairing_set();
>> +       if (ret) {
>> +               pr_err("MCP: Unable to disable write pairing!\n");
>> +               return ret;
> 
> The return value isn't used in patch 3.  Is there a point to returning
> an error from this function in either of the above two locations,
> considering that?
> 
> Looks good otherwise.
> 
> Acked-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Not really, how about this:

void __init brcmstb_biuctrl_init(void)
{
        int ret;

        setup_hifcpubiuctrl_regs();

        ret = mcp_write_pairing_set();
        if (ret) {
                pr_err("MCP: Unable to disable write pairing!\n");
                return;
        }

#ifdef CONFIG_PM_SLEEP
        register_syscore_ops(&brcmstb_cpu_credit_syscore_ops);
#endif
}

and updating the function prototype accordingly in the header file?
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Pramod Gurav <pramod.gurav-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
Subject: Re: [Patch v9 2/3] usb: dwc3: Add Qualcomm DWC3 glue layer driver
Date: Sat, 13 Sep 2014 02:03:50 +0530
Message-ID: <541358AE.6010504@smartplayin.com>
References: <1410550088-8754-1-git-send-email-agross@codeaurora.org> <1410550088-8754-3-git-send-email-agross@codeaurora.org> <CAMf-jSm2fPPstFD2h4-gG=MCDty34f-O0ooizDEKyQUd3+CxGQ@mail.gmail.com> <20140912202008.GB25500@saruman.home> <541356CE.1020902@smartplayin.com> <20140912202942.GC25500@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140912202942.GC25500-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Pramod Gurav <pramod.gurav.etc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jack Pham <jackp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 13-09-2014 01:59 AM, Felipe Balbi wrote:
> Hi,
> 
> On Sat, Sep 13, 2014 at 01:55:50AM +0530, Pramod Gurav wrote:
>>>>> +       qdwc = devm_kzalloc(&pdev->dev, sizeof(*qdwc), GFP_KERNEL);
>>>>> +       if (!qdwc)
>>>>> +               return -ENOMEM;
>>>>> +
>>>>> +       platform_set_drvdata(pdev, qdwc);
>>>>> +
>>>>> +       qdwc->dev = &pdev->dev;
>>>>> +
>>>>> +       qdwc->core_clk = devm_clk_get(qdwc->dev, "core");
>>>>> +       if (IS_ERR(qdwc->core_clk)) {
>>>>> +               dev_err(qdwc->dev, "failed to get core clock\n");
>>>>> +               return PTR_ERR(qdwc->core_clk);
>>>>> +       }
>>>>> +
>>>>> +       qdwc->iface_clk = devm_clk_get(qdwc->dev, "iface");
>>>>> +       if (IS_ERR(qdwc->iface_clk)) {
>>>>> +               dev_dbg(qdwc->dev, "failed to get optional iface clock\n");
>>>>> +               qdwc->iface_clk = NULL;
>>>>> +       }
>>>>> +
>>>>> +       qdwc->sleep_clk = devm_clk_get(qdwc->dev, "sleep");
>>>>> +       if (IS_ERR(qdwc->sleep_clk)) {
>>>>> +               dev_dbg(qdwc->dev, "failed to get optional sleep clock\n");
>>>>> +               qdwc->sleep_clk = NULL;
>>>>> +       }
>>>>> +
>>>>> +       ret = clk_prepare_enable(qdwc->core_clk);
>>>>> +       if (ret) {
>>>>> +               dev_err(qdwc->dev, "failed to enable core clock\n");
>>>>> +               goto err_core;
>>>>> +       }
>>>>> +
>>>>> +       ret = clk_prepare_enable(qdwc->iface_clk);
>>>>>
>>>> Should not we check if  qdwc->iface_clk is valid?
>>>
>>> read the sources luke.
>> Now I read that its initialized to NULL in fail case but should we call
>> prepare_enable at all if its NULL?
> 
> now read the source of clk_enable() and clk_prepare() ;-) NULL is a
> valid clock, it just returns 0. This is better than sprinkling IS_ERR()
> all over the place.
Seen that. I was wrong about IS_ERR. Thanks. :)
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

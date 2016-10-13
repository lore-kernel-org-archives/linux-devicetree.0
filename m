From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard
 bootloader/LK entries
Date: Wed, 12 Oct 2016 17:59:41 -0700
Message-ID: <17447be1-4357-0eca-a242-69576d3e2799@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-11-git-send-email-jmcnicol@redhat.com>
 <CAL_Jsq+ew7p6OYPzdTDmB9LAoGOOKasioYzmU=R+jLza2hWQFw@mail.gmail.com>
 <2149904.D2eaQZN3bA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2149904.D2eaQZN3bA@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-10-12 3:39 AM, Arnd Bergmann wrote:
> On Tuesday, October 11, 2016 7:41:22 PM CEST Rob Herring wrote:
>> On Sat, Oct 1, 2016 at 9:38 PM, Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>> These non standard DT entries need to be cast aside as to not
>>> pollute the main device tree bindings.  Without these essential
>>> DT items the bootloader/LK will not pass control over to the kernel
>>> and thus never boot.
>>
>> I discussed this with Stephen recently. I'm okay with leaving these on
>> boards that have no chance of getting updated bootloaders to use the
>> compatible string instead. Having to use dtbTool is far worse than a
>> couple of extra properties IMO. I reserve the right to complain if new
>> stuff continues to use these though.
>>
>>> Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  1 -
>>>  arch/arm64/boot/dts/qcom/msm8994.dtsi              |  3 +--
>>>  .../boot/dts/qcom/nexus6p_bootloader_bits.dtsi     | 24 ++++++++++++++++++++++
>>
>> Just put this into the board file rather than yet another include.
>
> The suggestion that I had was to have two .dts files: the normal
> one without these properties, and another .dts file including the
> first but adding these three for compatibility with the legacy
> bootloaders.
>

So I did it backwards from what you had suggested?
Based on my discussion with, (cant seem to recall) my understanding
was that we simply wanted to have these 3 bootloader specific entries
in another file.

> That way we could have a 'clean' .dtb file once the bootloaders
> get fixed, and can name the other one appropriately to discourage
> copying the method for new machines.
>

Did you miss the part about Ebola or Bubonic plague ?

> Having the bootloader files included from the main .dts files
> would serve no purpose.
>

Well, not really.  What about?

$ git revert <commit that introduced nexus6p_bootloader_bits.dtsi>

-jeremy

> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

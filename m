From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC V2 PATCH 01/12] msm8994 clocks: global clock support Global
 clock support for the msm8994 SOC.
Date: Fri, 21 Oct 2016 01:31:21 -0700
Message-ID: <6e6f959b-2fb7-496e-9b19-a14338101b1e@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-2-git-send-email-jmcnicol@redhat.com>
 <20161009012844.GF18158@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161009012844.GF18158@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, git-LJ92rlH3Dns@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-08 6:28 PM, Rob Herring wrote:
> On Sat, Oct 01, 2016 at 07:38:28PM -0700, Jeremy McNicoll wrote:
>> From: Bastian Köcher <git-LJ92rlH3Dns@public.gmane.org>
>>
>> The clock definition was ported from the Google 3.10 kernel tree to
>> work with the latest kernel.
>>
>> Signed-off-by: Bastian Köcher <mail-LJ92rlH3Dns@public.gmane.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +
>
>>  include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++
>
> It's preferred to but bindings in separate patches.
>

done.

-jeremy

> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>>  drivers/clk/qcom/Kconfig                           |    9 +
>>  drivers/clk/qcom/Makefile                          |    1 +
>>  drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
>>  5 files changed, 2658 insertions(+)
>>  create mode 100644 drivers/clk/qcom/gcc-msm8994.c
>>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

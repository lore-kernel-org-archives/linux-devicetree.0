From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] msm8992/msm8994: Google Nexus 5X/6P initial board
 support
Date: Wed, 26 Oct 2016 17:56:26 -0700
Message-ID: <4288a934-4625-b096-5d6e-4ef56f5d6186@redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477394221-30963-1-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-25 4:16 AM, Jeremy McNicoll wrote:
>
>
> Dropping RFC, as looks like its in reasonable shape for merging.
>
> V1:
>  [http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/442069.html]
>
> V2:
>  [http://www.spinics.net/lists/linux-soc/msg01059.html]
>
> V3:
>  [http://www.spinics.net/lists/linux-soc/msg01089.html]
>
> V4:
>  [http://www.spinics.net/lists/linux-arm-msm/msg23849.html]
>
>
> V4->V5:
>
>   -gave each board their own respective line in Makefile, rolled into
>     this change instead of creating a new commit for just a Makefile
>     update.
>
>   -moved qcom,pmic-id to msm8992-bullhead-rev-101.dts , likewise for
> 	8994.
>
>   -minor cosmetic cleanups of board files:
> 	-removed extra braces for board
>   	-dropped the frequency table
> 	-replaced hardcoded #'s with symbolic names
> 	-removed properties not being used	
>
>   -instead of using msm8974 for basic pinctrl, now we are using
>    Micheal Scott's from here, [https://patches.linaro.org/patch/78750/]
>    All associated dts files updated accordingly.
>
>   -converted all timer,frame interrupt entries to associated symbolic
>    / macro values.  ie) GIC_SPI -> 0
>
>   -defconfig changed to enable 8994 pinctrl instead of 8974
>
>   -updated both 8992, 8994 dts so that the timer node is outside soc.
>
>
>
> Appreciate all the feedback thus far.

These changes were successfully booted on my msm8992 (Nexus 5X).
Unfortunately I don't have a Nexus 6p for testing. (donations greatly 
appreciated)

Downstream (3.10) code has been used for all of this work, but access
to the HW docs would make this work (hopefully) easier.  If you can help
with this feel free to contact me directly.

-jeremy

[..snip..]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

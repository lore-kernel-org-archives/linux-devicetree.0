From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add rk3288-firefly-reload
Date: Sun, 7 Aug 2016 11:40:21 +0800
Message-ID: <413ebccd-e8d6-1401-3065-f9a63b4d66e6@rock-chips.com>
References: <1549971.ctkvOGm2xW@diego>
 <1468855952-2006-1-git-send-email-ayaka@soulik.info>
 <1468855952-2006-2-git-send-email-ayaka@soulik.info>
 <2868781.4x2gJCRbLH@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2868781.4x2gJCRbLH@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016/7/19 3:46, Heiko Stübner wrote:
> Am Montag, 18. Juli 2016, 23:32:32 schrieb Randy Li:
>> The Firefly RK3288 Reload is a combination Firefly rk3288 core board
>> with the Reload baseboard. Add a dtsi for the Firefly rk3288 core
>> which can be included into the dts for the various baseboards
>> in the future and dts for Reload base board.
>>
>> Currently supported are serial console, wired networking, eMMC and
>> SD storage, SPFIF, IR receiver, LEDs, SDIO wifi and USB. But only
>> the OTG could work on the host mode now, the other USB host can't
>> work now, additional patches are required.
>>
>> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> applied [0], after some minor reordering - please double check.
>
> Also, while the branch is named 4.8 this will only go into 4.9, as the merge-
> window supposedly opens on the weekend.

Sorry for the noise here:), but I find there is some mmc stuff
which confuse me. Maybe Randy could elaborate more?

Your sdmmc claims to support UHS-I mode like sd-uhs-sdr104, etc, which
will ask dw_mmc to switch vqmmc from 3V3 to 1V8 after sending CMD11.

But the vqmmc is vccio_sd which is fixed as 3V3? :)


>
>
> Heiko
>
> [0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=e00fdd4931ea4c47f53cba59b7a3800677546bea
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

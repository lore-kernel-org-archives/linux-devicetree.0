From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/7] usb-phy: samsung: Cleanup the unused drivers
Date: Thu, 21 Aug 2014 10:07:30 +0530
Message-ID: <CAFp+6iHJeZsOY-FuamUacrM4yX47LRO8EwiZcUz_ojSmx2kAxg@mail.gmail.com>
References: <1408026240-28365-1-git-send-email-gautam.vivek@samsung.com>
	<20140820181406.GA6023@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140820181406.GA6023-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,


On Wed, Aug 20, 2014 at 11:44 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Thu, Aug 14, 2014 at 07:53:53PM +0530, Vivek Gautam wrote:
>> - This series is based on 'usb-next' branch.
>>
>> Now that we have support for USB PHY controllers for Exynos SoC series,
>> we are free to remove the older usb-phy support.
>> In the process, we are removing the entire phy-samsung-usb3 driver, and
>> besides that all support for Exynos4x and Exynos5 from phy-samsung-usb2
>> driver.
>>
>> We have also removed the older USB-PHY support from ehci-exynos and ohci-exynos
>> since those drivers now can use newer GENERIC-PHYs, and don't need the older
>> USB-PHYs and related code anymore. These patches for ohci-exynos and ehci-exynos
>> now replaces the older sent patch for phy sequence cleanup for them.[1]
>>
>> I have build-tested this series for exynos_defconfig and s3c64xx_defconfig,
>> and have tested the EHCI and OHCI operations on smdk5250 board, but
>> have not tested the actual working due to unavailability of S3C64XX
>> board. So can someone please help me testing this series.
>>
>> [1] https://lkml.org/lkml/2014/8/5/142
>>
>> Vivek Gautam (7):
>>   usb-phy: samsung-usb3: Remove older phy-samsung-usb3 driver
>>   usb-phy: samsung-usb2: Remove support for Exynos5250
>>   usb-phy: samsung-usb2: Remove support for Exynos4X12
>>   usb-phy: samsung-usb2: Remove support for Exynos4210
>>   usb-phy: samsung-usb2: Clean up to leave only S3C64XX support
>>   usb: host: ehci-exynos: Remove unnecessary usb-phy support
>>   usb: host: ohci-exynos: Remove unnecessary usb-phy support
>
> some of these patches are still RFC, can you resend without RFC and all
> proper Acks in place ? Also rebased on top of v3.17-rc1.

As per the discussion in thread [1], i am dropping the [Patch 1/7]
till [Patch 5/7] since
these are part of the cleanup series by Bart: [PATCH 0/5] usb: phy:
samsung: remove old USB PHY code;
and will send out the rebased remaining two patches with Alan's Ack.


[1] https://lkml.org/lkml/2014/8/21/11



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

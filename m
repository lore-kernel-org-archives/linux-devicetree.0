From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for LeMaker BananaPi
Date: Wed, 07 Oct 2015 07:36:29 -0700
Message-ID: <7hzizu924y.fsf@deeprootsystems.com>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de>
	<20150818153631.GH2547@lukather>
	<CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw@mail.gmail.com>
	<20151005173957.B1BD16C8150E@dd34104.kasserver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151005173957.B1BD16C8150E-RzmsueL7+k6AvxNu/8lEInnhMCiq3JZZ@public.gmane.org> (Timo
	Sigurdsson's message of "Mon, 5 Oct 2015 19:39:57 +0200 (CEST)")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: devicetree@vger.kernel.org

"Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org> writes:

> Kevin Hilman schrieb am 24.09.2015 19:57:
>> kernelci.org started finding boot faiulres[1] on bananapi linux-next
>> around next-20150918, but it was only failing in some labs and not
>> others.  I finally bisected it down to this patch, which landed in
>> linux-next in the form of 2d665a8a8350 ARM: dts: sunxi: Add regulators
>> for LeMaker BananaPi.  Reverting that commit on top of next-20150923
>> gets my bananapi booting again.
>> 
>> Note it's kind of an interesting boot failure.  The kernel boots fully
>> to a shell, but panics after running a few commands.  In particular
>> 'dmesg -n1' seems to trigger it usually[2].
>> 
>> Kevin
>> 
>> [1]
>> http://kernelci.org/boot/sun7i-a20-bananapi/job/next/kernel/next-20150923/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=5602504359b514be146c326f
>> [2]
>> http://storage.kernelci.org/next/next-20150923/arm-multi_v7_defconfig/lab-khilman/boot-sun7i-a20-bananapi.html
>
> following up on my last email: I'm back from my vacation and I tried to
> reproduce your problem, but my board doesn't seem to be affected, so I
> cannot trigger it.
>
> I still think that the lower voltages may be the cause of your problem
> with that specific board, so could you please test the attached patch on
> top of my patch that you first experienced the problem with? Please let 
> us know whether this solves your issue or whether we need to dig deeper.

Thanks for the patch.  Looks like it's the OPPs.

I went back to next-20150923 and verified it still fails.  Then, I
applied your patch and saw that it boots just fine.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

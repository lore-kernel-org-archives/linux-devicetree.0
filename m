From: "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add regulators for
 LeMaker BananaPi
Date: Wed,  7 Oct 2015 17:49:18 +0200 (CEST)
Message-ID: <20151007154918.D6F856C800D4@dd34104.kasserver.com>
References: <1438532305-5884-1-git-send-email-public_timo.s@silentcreek.de> <20150818153631.GH2547@lukather> <CAMAWPa-Q7o+Ys2FjhLZt6Nwq=Ja6TTdWFDZFTCYLkoLGjpLpxw@mail.gmail.com> <20151005173957.B1BD16C8150E@dd34104.kasserver.com><7hzizu924y.fsf@deeprootsystems.com>
Reply-To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSJLSE35MGBB7752SYAKGQEWO3B6ZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <7hzizu924y.fsf-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,
Hi Maxime,

Kevin Hilman schrieb am 07.10.2015 16:36:

> "Timo Sigurdsson" <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org> writes:
>> I still think that the lower voltages may be the cause of your problem
>> with that specific board, so could you please test the attached patch on
>> top of my patch that you first experienced the problem with? Please let 
>> us know whether this solves your issue or whether we need to dig deeper.
> 
> Thanks for the patch.  Looks like it's the OPPs.
> 
> I went back to next-20150923 and verified it still fails.  Then, I
> applied your patch and saw that it boots just fine.

Good. Then we can easily fix this, I guess.

@Maxime: How should we handle this? In its current form, the patch applies
only to the BananaPi dts by overriding the inherited opp from the SoC dtsi.
In an earlier discussion, it was said that this can be done, even though it
might not be the most elegant approach. But then again, I think it
shouldn't be necessary to change the opp in the sun7i-a20.dtsi for all A20
boards since this is - to my knowledge - the first and only report that an
A20 board has stability issues at the lower voltages (although not too many
boards use voltage scaling yet). So, would you prefer to keep this as a
patch for BananaPi only, or change the dtsi for all A20 devices instead?

In case we keep it as it is, what is the correct commit to point to as
"Fixes commit ..."? I'd say it fixes the initial opp commit for A20, since
that's where these voltages were defined. But then again, if we don't
change the dtsi, should I point to my regulator patch instead?


Thanks and regards,

Timo

From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Subject: Re: [PATCH] dts: sun8i-h3: add sy8106a to orange pi plus
Date: Sat, 29 Sep 2018 15:16:17 +0200
Message-ID: <20180929131617.GA7940@carbon.kippendief.biz>
References: <20180927083636.5415-1-jorik@kippendief.biz>
 <20180928135516.jxhnsgaa3s2nagv7@flea>
Reply-To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBCR5X7NE2UERBJHWXXOQKGQEVCBX46Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180928135516.jxhnsgaa3s2nagv7@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 28, 2018 at 03:55:16PM +0200, Maxime Ripard wrote:
>The prefix of your commit title should be "ARM: dts: ..."

Sure, will fix it in v2.

>> I have tested this on two Orange Pi Plus boards, and they run stable
>> across a range of voltages (and frequencies).
>
>How was this tested?

Basically using intermittent cpuburn runs and monitor freq/voltage/temp.  
I've included a description of my test in the v2 commit log.

>> +		/*
>> +		 * The datasheet uses 1.1V as the minimum value of VDD-CPUX,
>> +		 * however both the Armbian DVFS table and the official one
>> +		 * have operating points with voltage under 1.1V, and both
>> +		 * DVFS table are known to work properly at the lowest
>> +		 * operating point.
>> +		 *
>> +		 * Use 1.0V as the minimum voltage instead.
>> +		 */
>
>There's not much point to that comment, since it's been that way for
>all the other SoCs from Allwinner. However, that would be great to
>have it in the commit log.

Totally agree, but I thought: there must be a good reason this text is 
in the PC dts, so let's put it in the Plus dts as well. I've moved it 
from the patch to the log in the v2 patch, which I will send right away.

Thanks for reviewing!

Jorik

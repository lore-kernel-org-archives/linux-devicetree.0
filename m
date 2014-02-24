From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: sun6i: Protect CPU clock
Date: Mon, 24 Feb 2014 20:38:44 -0300
Message-ID: <530BD804.5090806@elopez.com.ar>
References: <1393258967-4843-1-git-send-email-maxime.ripard@free-electrons.com> <1393258967-4843-2-git-send-email-maxime.ripard@free-electrons.com> <20140224163034.GN21483@n2100.arm.linux.org.uk>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD73XIMS3EHBBHFQV6MAKGQE5MF4WGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140224163034.GN21483-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Russell,

El 24/02/14 13:30, Russell King - ARM Linux escribi=F3:
> On Mon, Feb 24, 2014 at 05:22:43PM +0100, Maxime Ripard wrote:
>> Right now, AHB is an indirect child clock of the CPU clock. If that happ=
ens to
>> change, since the CPU clock has no other consumers declared in Linux, it=
 would
>> be shut down, which is not really a good idea.
>>
>> Prevent this by forcing it enabled.
>>
>> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>   drivers/clk/sunxi/clk-sunxi.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi=
.c
>> index 23baad9..cedaf4b 100644
>> --- a/drivers/clk/sunxi/clk-sunxi.c
>> +++ b/drivers/clk/sunxi/clk-sunxi.c
>> @@ -1301,6 +1301,14 @@ static void __init sunxi_clock_protect(void)
>>   		clk_prepare_enable(clk);
>>   		clk_put(clk);
>>   	}
>> +
>> +	/* CPU clocks - sun6i */
>> +	clk =3D clk_get(NULL, "cpu");
>> +	if (!IS_ERR(clk)) {
>> +		clk_prepare_enable(clk);
>> +		clk_put(clk);
>> +	}
>
> This is broken.  I'm not sure what's difficult to grasp about the concept
> of "while a clock is in use, you should keep a reference to that clock".
>
> That implies that if you get a clock, and then enable it, you don't
> put the clock until you've disabled it.

Why is this so? Can't a clock be left enabled while nobody has a=20
reference to it? I have looked around in Documentation/ (rather quickly=20
I must say) and have not found any explicit mention that it is required=20
to keep a reference to the clock while it's enabled. I'd appreciate it=20
if you could explain this a bit more verbosely or point me to the=20
relevant documents.

For what it's worth, I've seen this same pattern on=20
enable/disable_clock() on drivers/base/power/clock_ops.c as well.

Cheers,

Emilio

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.

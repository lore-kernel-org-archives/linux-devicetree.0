From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 2/3] MIPS: dts: qca: ar9132: drop unused extosc mentions
Date: Thu, 21 Jan 2016 11:52:18 +0100
Message-ID: <20160121115218.6fa21a3a@tock>
References: <1453370345-16688-1-git-send-email-antonynpavlov@gmail.com>
	<1453370345-16688-3-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453370345-16688-3-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Jan 2016 12:59:04 +0300
Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> At the moment ar913x_clocks_init() does not use extosc node at all,
> the reference clock rate is hardcoded inside arch/mips/ath79/clock.c
> 
>     #define AR913X_BASE_FREQ        5000000
> 
>     ...
> 
>     static void __init ar913x_clocks_init(void)
>     {
>             ref_rate = AR913X_BASE_FREQ;
> 
>     ...
> 
>             ath79_add_sys_clkdev("ref", ref_rate);
> 
> Also please see the commits 'MIPS: ath79: Fix the ar913x reference clock rate'
> and 'MIPS: ath79: Fix the ar724x clock calculation' in Alban Bedel's
> github ath79 branch https://github.com/AlbanBedel/linux/tree/ath79

Yes, the reference clock definition is not yet used by the code, but
the binding define it as required. This is because a proper
implementation would need the reference clock rate.

It would be better to fix the code to get rid of the hard coded rates
when using DT. I haven't done so yet because I wanted to first get DT
support without too many changes, but that's on the TODO list along with
moving to drivers/clk.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

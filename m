From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: register fixed-clock only if #clock-cells property
 is present
Date: Thu, 27 Mar 2014 12:14:01 +0100
Message-ID: <533407F9.7060509@gmail.com>
References: <1395858127-18730-1-git-send-email-s.nawrocki@samsung.com> <CAOMZO5DJPKvha7A-foktsB2dEw9xGXL_++uBXj_3ScAPTXNOkw@mail.gmail.com> <53333145.4080903@gmail.com> <CAOMZO5AEry8sJW_+0aJS8ush+sYPPWk9LRU0b8RUUGa-hO_G1A@mail.gmail.com> <5333DA13.2080505@gmail.com> <5333F704.7020504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5333F704.7020504-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

Le 27/03/2014 11:01, Sylwester Nawrocki a =C3=A9crit :
> Hi Boris,
>
> On 27/03/14 08:58, Boris BREZILLON wrote:
>> This solution solve the problem for this specific case because clks =
are
>> declared in the correct order in imx DTs.
>> But, even with your patch I think we could see similar issues by
>> reordering DT nodes...
>>
>> The real problem here is that imx platform does not declare the CCM =
clocks
>> dependencies upon ckil, ckih1 and osc fixed clocks within the DT [1]=
, and
>> retrieve these clocks when initializing the CCM clocks ([2] and [3])=
=2E
>>
>> We should try to a add these dependencies in the DT and see if it wo=
rks.
> While presumably all of us agree the dependencies should be correctly
> specified in dts I think we should minimize possible regressions by
> keeping the clocks registration order as before, i.e. as parsed by th=
e
> kernel from DT. Rather than explicitly reversing it, which does not g=
ain
> us anything AFAICS. Instead we are seeing regressions where new kerne=
ls
> stop working with old dtbs.

I totally agree with you on this point: my patch is not a replacement o=
f=20
yours.
I just wanted to point out that we need to fix DT definitions to avoid =
these
kind of issues in the future.

>
> I'm going to resend the patch replacing list_add() with list_add_tail=
(),
> with this the mvebu platform would work and there should be no regres=
sion
> on imx and exynos.
>
> Please note that specifying dependencies between CCM on imx and the f=
ixed
> clocks might not be enough. If the fixed clocks get matched on "fixed=
-clock"
> compatible some clock specifiers (i.e. those using phandle to the CCM=
) could
> get invalid, since the clocks won't get registered by the ccm driver,=
 but by
> the regular fixed clock driver. That means a phandle to different nod=
e would
> need to be used to reference the fixed clock. I'm not sure if this is=
 the case
> for imx, but changes may be needed all over various dts files.
> In addition, we should make sure the kernel works with current and mo=
dified
> dtbs.
>
>> [1] http://lxr.free-electrons.com/source/arch/arm/boot/dts/imx6sl.dt=
si#L379
>> [2] http://lxr.free-electrons.com/source/arch/arm/mach-imx/clk-imx6q=
=2Ec#L151
>> [3] http://lxr.free-electrons.com/source/arch/arm/mach-imx/clk.c#L30

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

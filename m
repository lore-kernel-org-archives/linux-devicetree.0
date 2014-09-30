From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: add mxs regulator driver
Date: Tue, 30 Sep 2014 08:40:26 +0200
Message-ID: <542A505A.5030109@i2se.com>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com> <1411779588-22031-3-git-send-email-stefan.wahren@i2se.com> <20140928101650.GL27755@sirena.org.uk> <5428FE7B.8060700@i2se.com> <20140929171314.GW16977@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140929171314.GW16977-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 29.09.2014 um 19:13 schrieb Mark Brown:
> On Mon, Sep 29, 2014 at 08:38:51AM +0200, Stefan Wahren wrote:
>
>> I'm searching for a good regulator implementation example.
>> Does it apply to ti-abb-regulator.c and twl-regulator.c?
> Possibly.  But bear in mind that it's important to understand the
> hardware you're trying to support.

The question refer more to the devicetree binding and it's implementation.

>
>>> This really needs a comment to explain what on earth is going on here -
>>> the whole thing with writing the same thing twice with two delays is
>>> more than a little odd.  It looks like the driver is trying to busy wait
>>> in cases where the change happens quickly but the comments about "fast"
>>> and "normal" mode make this unclear.
>> The regulator driver polls for the DC_OK bit in the power status register.
>> Quote for reference manual (p. 935): "High when switching DC-DC
>> converter control loop has stabilized after a voltage target change."
>> The two loops comes from the different regulator modes
>> (REGULATOR_MODE_FAST, REGULATOR_MODE_NORMAL).
>> In REGULATOR_MODE_FAST the voltage steping is disabled and changing
>> voltage should be fast. In REGULATOR_MODE_NORMAL voltage steping is
>> enabled and it's take a while for reaching the target voltage.
> I don't think you've fully understood what the different modes mean
> here, that's not normally how a buck convertor works.  The different
> modes would typically control the ability of the regulator to respond
> quickly to changes in load without drifting off regulation, fast mode
> makes the regulator less efficient but more responsive to load changes
> (probably marginally with modern regulators).  It should have relatively
> little to do with the ability to ramp the voltage and certainly not on
> the scale there.
>
>> Do you see more a problem with the two different loops or the redundant
>> register write?
> Both.  The code right now just looks really obscure.

That leads me to the conclusion to drop both mode functions. My
intention is to get the cpufreq-cpu0 aka cpufreq-dt working on i.MX28,
not to build up the complete power system.

@Fabio, @Shawn: What is your opinion?

Best regards

Stefan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

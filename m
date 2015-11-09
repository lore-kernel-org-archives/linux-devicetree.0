From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Mon, 9 Nov 2015 11:41:20 -0600
Message-ID: <5640DAC0.9080008@ti.com>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk> <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk> <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk> <563CED25.6020405@ti.com>
 <20151106211651.GJ18409@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151106211651.GJ18409-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/06/2015 03:16 PM, Mark Brown wrote:
> On Fri, Nov 06, 2015 at 12:10:45PM -0600, Andrew F. Davis wrote:
>> On 11/06/2015 04:43 AM, Mark Brown wrote:
>
>>> No, you need to fix the bug that is causing dev->of_node to be populated
>>> for the MFD function device.  Probably the issue is that you have put
>>> this pointless compatible string in your DT.
>
>> If it is pointless what is the reason we have .of_compatible in mfd_cell?
>
> There are cases where it's useful where we're abstracting something and
> gaining some meaningful reuse.  This really does not appear to be one of
> those cases, there are no parameters in the DT and the compatible string
> is the full device name.
>

As before I see no reason to make that call now and limit ourselves.

>> How else do you want us to populate the sub-device dev->of_node? Looking
>
> You do not need to populate it.  There is no value in populating it and
> as previously discussed putting the Linux driver model into DT can be
> actively harmful if we change our idea of how we should model things.
>

The dev passed to regulator_register needs to have of_node populated for
your OF init_data helper to work. Devices with OF tables can just pass
their own dev. Others have to use their parents' nodes, this is a
workaround, OF devices should be probed with their of_node pre-populated.

>>> Please stop this.  I don't understand why you are pushing so hard to put
>>> the Linux device model representation of the device into DT but it's
>>> getting very repetitive.
>
>> I'm not pushing anything, this is how other sub-nodes of MFD devices are
>
> Every time we go through this we finish the discussion and then you come
> back with yet another excuse for trying to push the current Linux device
> model into the DT or another version of the patch with the same problem.
>

I keep finding different problems, do you expect me to ignore them?

>> represented, I'm not sure what you think I'm doing that is so wrong here.
>
> I am providing the same review feedback repeatedly, this is not good.
>
>> No one else seems to have an issue with the DT for this device, I see no
>> reason the regulator node has to be different than the other sub-device
>> nodes.
>
> I would prefer it if other areas where there's no reuse gained by
> breaking things down and where we're just encoding the Linux driver
> model into DT weren't done like that either.  Perhaps other people care
> less here, perhaps they haven't been bitten by the problems that can
> arise.  If I read such patches I'd probably comment on the issue but
> I've got enough to do already without trying to review every single DT
> binding.
>
>> It looks rather out of place to have regulators be singled out like this,
>> for instance look at the mfd_cells for drivers/mfd/rt5033.c
>
> The fact that other people have merged imperfect code into the kernel is
> not a good reason to merge even more of it when we have better tools.
> Looking at that binding I'm seeing no reason why any of the subfunctions
> should have compatible strings (and if we're going down the route you're
> trying to go down we really ought to have something in the binding for
> at least an interrupt controller in there as well...).
>

These are not "subfunctions" they are full drivers, they only need
register accessors passed in, they do not call the core and the core
does not call them.

If your problem is with the DT binding for this or other MFDs, then
nack *them* and explain to everyone why what they are doing is wrong
and why regulators should be special cases. Blocking the regulator
drivers to force a change in DT is not going to fix this issue.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

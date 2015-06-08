From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Mon, 8 Jun 2015 22:09:13 +0200
Message-ID: <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com> <20150608184713.446B7C406AA@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150608184713.446B7C406AA-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant


On Mon, Jun 8, 2015 at 8:47 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Ricardo,
>
> Comments below...
>
> On Sun, 7 Jun 2015 20:13:15 +0200
> , Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  wrote:
>> Hello Grant
>>
>> I would ask you to go through all the discussion related to this bug.
>> Here is a summary (please anyone involved correct me if I am wrong)
>>
>> 1) I send a patch to fix the oops if release resource is executed with
>> a resource without parent
>> 2) Bjorn says that we should fix the issue of the problem, which he
>> pointed out being that we use platform_device_del() after using
>> of_device_add()
>
> Bjorn's comments on v3 of your patchset were correct. The proposed bug
> fix hacked the __release_resource function directly, when the bug is in
> the platform_bus_type code.
>

The bug is not in the platform subsystem but in the of subsystem. Your
patch fixes it in the platform subsystem, so it is as bad as fixing it
directly on the resource interface.


>> 3) I resend a patchset to use platform_devide_add()
>> 4) 3 series of cleanouts after the help from Rob and Bjorn
>> 5) Greg adds the series (v5) to his device core tree
>
> The series is still wrong.
>
> Greg, please drop Ricardo's series. It isn't correct and it will cause
> breakage.

The series can be kept, only

patch "of/platform: Use platform_device interface"

needs to be reverted.

>
> There are two issues that need to be delt with:
>
> First, there is the immediate bug fix which should go to Linus before
> v4.1. I believe my patch handles it correctly. I've included a test
> case, but I would like to have acks from Rob and Pantelis before merging
> it. Ricardo's v5 patch 2/4 comes close to solving it, but it still
> doesn't make the unregister path symmetric with the register path.

Could you please be more specific. what is not symmetric after
applying the patchset?


> Second, there is the issue of making devicetree platform_devices request
> resources.  That's harder, and we are *NOT* ready to merge anything. Nor
> is it a time critical issue.
>
>> 6) You complaint that that series can break miss behaved platforms
>
> Yes, because it will.
>
>> 7) I send a couple of patches that fix your problem and leaves the
>> window open to blacklist the platforms that miss behave.
>
> I've replied to that series. It isn't a good solution either.

I have also replied, please provide a testcase and we will figure it
if it is not handled properly. So far it works fine on my tests.

>>
>> now you send a patch that takes us to back to step 1), and adds some
>> code that is already merged into gregk's
>> https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git/tree/drivers/base/platform.c?h=driver-core-testing#n314
>
> My patch is different. In v3 __release_resource was hacked directly. By
> v5 you were fixing platform_device_{add,del}, which is the right thing,
> but still isn't symmetric. My patch I think handles the bug fix
> correctly.

There is no need to apply your patch, that behaviour is already
impletented in my patchset. If we want to pospone the non registry of
resources on of devices we just need to revert

"of/platform: Use platform_device interface"

I believe reverting 1 patch is patch is better than reverting 4
reviewed patches and applying a new one.

>
>> Wouldn't you agree that it will be a better solution to give your
>> feedback regarding https://lkml.org/lkml/2015/6/5/246 and fix this
>> issue together?
>
> That I've done. I'm not happy with it. Sorry.

No worries :), but we need to find another sollution. And if we can
remove all the duplicated code in /of we will have much less bugs in
the future.


Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

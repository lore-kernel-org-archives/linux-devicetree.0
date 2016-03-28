From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm: bridge: anx78xx: Add anx78xx bridge driver support.
Date: Mon, 28 Mar 2016 13:03:48 +0100
Message-ID: <CACvgo51Gs2EZM5=1f7p7BiRj2Ut5ZFQwWCWEzHe077ZCuLVvCw@mail.gmail.com>
References: <1458816106-11596-1-git-send-email-enric.balletbo@collabora.com>
	<1458816106-11596-4-git-send-email-enric.balletbo@collabora.com>
	<20160324112818.GC5273@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160324112818.GC5273@mwanda>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, span-RZiUC8FWO7+l5r2w9Jh5Rg@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, jb.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cjiao@analogixsemi.
List-Id: devicetree@vger.kernel.org

Hi all,

On 24 March 2016 at 11:28, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, Mar 24, 2016 at 11:41:46AM +0100, Enric Balletbo i Serra wrote:
>> +     /* Map slave addresses of ANX7814 */
>> +     for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
>> +             anx78xx->i2c_dummy[i] = i2c_new_dummy(client->adapter,
>> +                                             anx78xx_i2c_addresses[i] >> 1);
>> +             if (!anx78xx->i2c_dummy[i]) {
>> +                     DRM_ERROR("Failed to reserve i2c bus %02x.\n",
>> +                               anx78xx_i2c_addresses[i]);
>
> Missing error code here.
>
>> +                     goto err_i2c;
>> +             }
>
> I'm, of course, not a fan of the naming.  The name should be based on
> what the goto location does...  In this case it turns it off.  Which is
> slightly weird because we have not turned it on yet...  I always say
> that you should have multiple error labels and you only undo things
> which have been done.
>
> Having a common exit path for the other functions where it was "goto out"
> makes sense.  But again in those cases I would prefer a meaningful label
> name like "goto unlock;".  In the kernel "goto out;" is meaningless, it
> could do anything or everything or nothing.  A lot of people like it
> of course, but out: label code tends to be buggier than using a
> meaningful name.
>
Dan, I'm so glad to see another like minded person on the topic. It
seems that we're a minority though :-(

Enric, if you want to increase the chances of this getting reviewed I
would humbly suggest adding a per-patch changelog (must), explicitly
Cc (in the commit message) the people who commented on your patch
(highly recommended), and perhaps cutting down the 20+ people from the
To/Cc list (nitpicking).

Another option would be to assist/review similar (drm bridge) patches
for other contributors, who should return with the same :-)

Just some suggestions (my 2c as they say), seeing that this has been
around for a while.

Regards,
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about of/base.c:of_update_property()
Date: Mon, 14 Apr 2014 16:29:09 -0500
Message-ID: <CAL_JsqKW23XYFzPcft04n22S__T6fDx68xayV55NG0h+h--UVA@mail.gmail.com>
References: <53474303.6030108@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53474303.6030108-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 10, 2014 at 8:18 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> Hi folks,
>
> looking into drivers/of/base.c, I notices a couple of oddities in
> of_update_property(). Both were interoduced with commit 75b57ecf
> (of: Make device nodes kobjects so they show up in sysfs).
> In both cases, there is an unnecessary value check. Sending
> a patch to remove the checks would be simple, but I want to
> make sure that the checks are not supposed to address some other
> condition.
>
> 1) Unnecessary check if rc != 0
>
> Here are all the uses of the 'rc' variable in of_update_property():
>
>         rc = of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop);
>         if (rc)
>                 return rc;
>         ...
>         while (*next) {
>                 ...
>         }
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>         if (rc)
>                 return rc;
>
> What is the purpose of the second check ? Can it be removed,
> or is there some other condition which should have been checked
> instead ? Should the check possibly be "if (!found)" ?

Looks like cut 'n paste from of_add_property. I believe the second one
should be removed and !found should be checked before updating sysfs.

>
> 2) Unnecessary check if oldprop != NULL
>
>         oldprop = of_find_property(np, newprop->name, NULL);
>         if (!oldprop)
>                 return of_add_property(np, newprop);
>         ...
>         /* Update the sysfs attribute */
>         if (oldprop)
>                 sysfs_remove_bin_file(&np->kobj, &oldprop->attr);
>
> oldprop is not modified between the two checks. Can the check be
> removed, or is there some other condition which should have been
> checked instead ?

Yes, it can be removed.

> 3) At the very end of the function, there is a check
>
>        if (!found)
>                 return -ENODEV;
>
> This is _after_ the sysfs entry for the old property was removed,
> and the sysfs entry for the new property was created. Yet, '!found'
> suggests that there is some inconsistency in the property, so I wonder
> if the check should happen earlier, before sysfs entries are touched.

Right.

Can you send a patch fixing these.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

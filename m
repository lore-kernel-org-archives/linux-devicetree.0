From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [1/2] drivers/of: Add check for null property in of_remove_property()
Date: Thu,  5 May 2016 08:40:23 +1000 (AEST)
Message-ID: <3r0Y074wcfz9t4k@ozlabs.org>
References: <1461821695-19204-1-git-send-email-sjitindarsingh@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461821695-19204-1-git-send-email-sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-28-04 at 05:34:54 UTC, Suraj Jitindar Singh wrote:
> The validity of the property input argument to of_remove_property() is
> never checked within the function and thus it is possible to pass a null
> value. It happens that this will be picked up in __of_remove_property()
> as no matching property of the device node will be found and thus an
> error will be returned, however once again there is no explicit check
> for a null value. By the time this is detected 2 locks have already been
> acquired which is completely unnecessary if the property to remove is
> null.
> 
> Add an explicit check in the function of_remove_property() for a null
> property value and return -ENODEV in this case, this is consistent with
> what the previous return value would have been when the null value was
> not detected and passed to __of_remove_property().
> 
> By moving an explicit check for the property paramenter into the
> of_remove_property() function, this will remove the need to perform this
> check in calling code before invocation of the of_remove_property()
> function.
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1c173cb23486f540ea08a5050a

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

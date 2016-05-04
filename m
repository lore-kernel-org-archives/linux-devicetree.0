From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [2/2] powerpc: Update of_remove_property() call sites to remove null checking
Date: Thu,  5 May 2016 08:40:25 +1000 (AEST)
Message-ID: <3r0Y092fNPz9t5T@ozlabs.org>
References: <1461821695-19204-2-git-send-email-sjitindarsingh@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461821695-19204-2-git-send-email-sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-28-04 at 05:34:55 UTC, Suraj Jitindar Singh wrote:
> After obtaining a property from of_find_property() and before calling
> of_remove_property() most code checks to ensure that the property
> returned from of_find_property() is not null. The previous patch
> moved this check to the start of the function of_remove_property() in
> order to avoid the case where this check isn't done and a null value is
> passed. This ensures the check is always conducted before taking locks
> and attempting to remove the property. Thus it is no longer necessary
> to perform a check for null values before invoking of_remove_property().
> 
> Update of_remove_property() call sites in order to remove redundant
> checking for null property value as check is now performed within the
> of_remove_property function().
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/676669b666574a23f7bd62870c

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

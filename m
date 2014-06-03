From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v2] coccinelle: Check for missing NULL terminators in
 of_device_id tables
Date: Tue, 3 Jun 2014 20:14:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1406032013150.2009@localhost6.localdomain6>
References: <1401213858-31950-1-git-send-email-sboyd@codeaurora.org> <alpine.DEB.2.02.1406031208380.2036@localhost6.localdomain6> <538E09C1.30200@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538E09C1.30200-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>, Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 3 Jun 2014, Stephen Boyd wrote:

> On 06/03/14 03:15, Julia Lawall wrote:
> > Failure to terminate an of_device_id table can lead to confusing
> > failures depending on where the compiler places the array. Add a
> > check to make sure these tables are terminated. Thanks to Mitchel
> > Humpherys for coming up with the pattern initially.
> >
> > Cc: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> > Cc: Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>
> > Cc: Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>
> > Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
> >
> > ---
> >
> > v3: Removed unneeded rule bad_of_table.  Placed * in context rule on the 
> > closing brace; putting it on the field caused all fields to be marked.
> >
> 
> 
> These seem like only minor changes. Why was my authorship removed?

Probably because I don't know how to provide a new vesion of the patch 
properly.  What should I have done?  There were quite a lot of 
modifications.  It seemed easier to just send a complete new version.

julia
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

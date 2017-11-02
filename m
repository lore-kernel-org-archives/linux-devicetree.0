From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] of: platform: Create dummy routines for
 !CONFIG_OF_ADDRESS
Date: Thu, 2 Nov 2017 10:18:23 +0530
Message-ID: <20171102044823.GV4240@vireshk-i7>
References: <2d798213e4fefc074a66ccb7ab2fc243ee2b1e1a.1509186356.git.viresh.kumar@linaro.org>
 <20171101211458.wo4at67k7sxo5fah@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171101211458.wo4at67k7sxo5fah@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01-11-17, 16:14, Rob Herring wrote:
> On Sat, Oct 28, 2017 at 03:56:46PM +0530, Viresh Kumar wrote:
> > Few routines don't have their dummy counterparts which results in build
> > failures where these routines are used without CONFIG_OF_ADDRESS
> > enabled.
> > 
> > Fix those by defining the dummy versions.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > V2:
> > - Rebased again latest rc and resolved conflicts.
> > - No comments received on V1.
> 
> What's your user?

It was the previous version of boot constraint core, though I have
moved to another helper now.

https://marc.info/?l=linux-kernel&m=150157976217258&w=2

Wouldn't it be better to define them anyway?

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard
 bootloader/LK entries
Date: Fri, 21 Oct 2016 12:44:37 -0700
Message-ID: <20161021194437.GA7509@tuxbot>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <2149904.D2eaQZN3bA@wuerfel>
 <17447be1-4357-0eca-a242-69576d3e2799@redhat.com>
 <4976066.k14mpQt0HJ@wuerfel>
 <20161019214643.GC3145@hector.attlocal.net>
 <CAL_Jsq+wjnEByg2vgx-P+bLJaQm+s=UX7nj=KwviagnQDG_3hQ@mail.gmail.com>
 <20161020031712.GD3145@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020031712.GD3145-3KkwrOJo9xYlRp7syxWybdHuzzzSOjJt@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, git-LJ92rlH3Dns@public.gmane.org, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed 19 Oct 20:17 PDT 2016, Andy Gross wrote:

> On Wed, Oct 19, 2016 at 08:07:25PM -0500, Rob Herring wrote:
[..]
> > Makes sense to me for things like Nexus phones here. What about DB410
> > for example? Is there hope for a fix there? My bootloader is only a
> > couple of months old and needs the properties still.
> 
> There won't be a fix for the 410c.  We barely got them to respin to use PSCI.
> Stephen can correct me if I am wrong on this.
> 
> If this is fixed, it would be 8996+.  If..........
> 
> So this means introducing the msm-id's for the boards that currently require it,
> and for the boards that will require it in the future.  And this would stay in
> effect until the bootloader is able to parse the compatible strings or figure
> this out without the msm-ids.
> 

But if the bootloader at any point in the future would support picking a
dtb by compatible strings instead of {msm,board,pmic}-id we wouldn't we
just be back to the ridiculous compatible strings that tipped over into
acceptance to these ids in the first place.

Or do we expect the boot loader to do a deep scan of the dtb to match on
multiple nodes from the tree?

Am I missing something here?

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

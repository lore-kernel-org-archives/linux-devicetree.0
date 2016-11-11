From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/23] Support qcom's HSIC USB and rewrite USB2 HS
 support
Date: Fri, 11 Nov 2016 15:40:17 +0800
Message-ID: <20161111074017.GA21045@b29397-desktop>
References: <20161018015636.11701-1-stephen.boyd@linaro.org>
 <20161018093139.GB6294@b29397-desktop>
 <147682389932.20076.4186408979552866325@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <147682389932.20076.4186408979552866325@sboyd-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Ivan T. Ivanov" <iivanov.xz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 18, 2016 at 01:51:39PM -0700, Stephen Boyd wrote:
> Quoting Peter Chen (2016-10-18 02:31:40)
> > On Mon, Oct 17, 2016 at 06:56:13PM -0700, Stephen Boyd wrote:
> > > I've also sent separate patches for other minor pieces to make this
> > > all work. The full tree can be found here[2], hacks and all to get
> > > things working. I've tested this on the db410c, apq8074 dragonboard,
> > > and ifc6410 with configfs gadgets and otg cables.
> > > 
> > > Patches based on v4.8-rc1
> 
> Oops should be v4.9-rc1 here.
> 
> > > 
> > > Changes from v4:
> > >  * Picked up Acks from Rob
> > >  * Updated HS phy init sequence DT property to restrict it to offsets
> > 
> > I remembered that you got all my acks for chipidea patches, right? I did
> > not check for this series.
> 
> Sorry I've added in one more patch
> 
>    usb: chipidea: Emulate OTGSC interrupt enable path
> 
> to fix extcon interrupt emulation even further.
> 
> > 
> > Besides, the patch "gpu: Remove depends on RESET_CONTROLLER when not a
> > provider" [1]  still not be accepted, I need this patch to be merged
> > first, then apply your chipidea part, otherwise, there is a building
> > warning.
> > 
> > [1] https://patchwork.kernel.org/patch/9322583/
> 
> Yes, I'm going to resend that patch now. I hope that David will apply it
> for -rc2.

Stephen, just a mind. I have rebased Greg's usb-next tree (v4.9-rc3 on
it), your GPU fix is still not there.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] EDAC: Add AMD Seattle SoC EDAC
Date: Tue, 20 Oct 2015 18:57:44 +0200
Message-ID: <20151020165744.GE31130@pd.tnic>
References: <1445282597-18999-1-git-send-email-brijeshkumar.singh@amd.com>
 <20151019205236.GB453@leverpostej>
 <56266F7E.6030404@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56266F7E.6030404-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brijesh Singh <brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 20, 2015 at 11:44:46AM -0500, Brijesh Singh wrote:
> > This second property doesn't describe the hardware in any way. It should
> > be runtime-configurable and dpesn't belong in the DT.
> > 
> > Regardless, the binding is wrong. This is in no way specific to AMD
> > Seattle, and per the code is actually used to imply the presence of a
> > Cortex-A57 feature. No reference to AMD Seattle belongs in the DT
> > binding (with the exception of the example, perhaps), nor in the driver.
> > 
> > NAK while this pretends to be something that it isn't. At minimum, you
> > need to correctly describe the feature you are trying to add support
> > for.
> > 
> I will remove AMD specific string in compatibility field and make the poll-delay-msec optional. Will also expose this as module parameter as you suggested below.

Btw, how much of this is implementing generic A57 functionality?

If a lot, can we make this a generic a57_edac driver so that multiple
vendors can use it?

How fast and how ugly can something like that become?

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

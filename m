From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] touchscreen: sun4i-ts: A10 (sun4i) has
 a different temperature curve
Date: Sun, 8 Mar 2015 14:11:17 -0700
Message-ID: <20150308211117.GA23193@dtor-ws>
References: <1425848022-18001-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP6N55ZUYDRB6XV6KTQKGQEBXSINNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425848022-18001-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Sun, Mar 08, 2015 at 09:53:39PM +0100, Hans de Goede wrote:
> Hi Dmitry, Maxime, et al.
> 
> Here is a patch-set for the sun4i-ts driver temperature sensor support,
> it consists of 2 fixes:
> 
> 1) Use a better temperature curve for A10 SoCs to avoid reporting a way to
> high temperature.
> 
> 2) Start with reporting an "estimated" temperature of 40 degrees rather then
> returning -EAGAIN until we get the first temperature ready interrupt to avoid
> the kernel tempzone core logging errors because of our -EAGAIN return.

No, I think we better teach thermal core not to complain about
-EAGAINs.

> 
> Dmitry can you please queue up the 2 sun4i-ts patches for 4.1, and Maxime,
> can you please queue up the matching dts change ?
> 
> Thanks & Regards,
> 
> Hans

-- 
Dmitry

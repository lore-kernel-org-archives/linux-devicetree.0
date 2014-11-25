From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/9] clk: sunxi: Add prcm mod0 clock driver
Date: Tue, 25 Nov 2014 09:37:13 +0100
Message-ID: <54743FB9.7070601@redhat.com>
References: <1416498928-1300-1-git-send-email-hdegoede@redhat.com> <1416498928-1300-4-git-send-email-hdegoede@redhat.com> <20141121084933.GL24143@lukather> <546F0226.2040700@redhat.com> <20141124220327.GS4752@lukather> <54743DE1.7020704@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQX72CRQKGQEUYJSS4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54743DE1.7020704-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/25/2014 09:29 AM, Hans de Goede wrote:

<snip>

> Well one reasons why clocks are instantiated the way they are is to have
> them available as early as possible, which is really convenient and works
> really well.
>
> You are asking for a whole lot of stuff to be changed, arguably in a way
> which makes it worse, just to save 47 lines of code...

Thinking more about this one alternative which should work is to just put the
clocks in the prcm in the clocks node, then they get their own reg property,
rather then being part of the prcm reg range, and the standard of_clk mod0
driver we have will just work.

Regards,

Hans

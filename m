From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH] Input: sun4i-ts - allow to adjust some
 settings via device-tree properties.
Date: Mon, 23 Mar 2015 09:12:22 -0700
Message-ID: <20150323161222.GC8666@dtor-ws>
References: <1426175150-27005-1-git-send-email-karme@karme.de>
 <20150318103744.GR4638@lukather>
 <55095B26.209@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP6N55ZUYDRB2XWYCUAKGQEL7MW3HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55095B26.209-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2015 at 12:01:58PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 18-03-15 11:37, Maxime Ripard wrote:
> >On Thu, Mar 12, 2015 at 04:45:50PM +0100, Jens Thiele wrote:
> >>This commit introduces two new optional device-tree properties:
> >>"tp-sensitive-adjust": adjust sensitivity of pen down detection
> >>"filter-type": select median and averaging filter
> >>
> >>The previous fixed defaults, didn't work well for the Olimex
> >>A13-LCD10TS (I have).
> >>
> >>Signed-off-by: Jens Thiele <karme-k/3wkfGq5Xs@public.gmane.org>
> >>---
> >>  .../devicetree/bindings/input/touchscreen/sun4i.txt |   19 +++++++++++++++++--
> >>  drivers/input/touchscreen/sun4i-ts.c                |   17 +++++++++++++----
> >>  2 files changed, 30 insertions(+), 6 deletions(-)
> >>
> >>diff --git a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
> >>index 433332d..c93edfa 100644
> >>--- a/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
> >>+++ b/Documentation/devicetree/bindings/input/touchscreen/sun4i.txt
> >>@@ -8,8 +8,20 @@ Required properties:
> >>   - #thermal-sensor-cells: shall be 0
> >>
> >>  Optional properties:
> >>- - allwinner,ts-attached: boolean indicating that an actual touchscreen is
> >>-			  attached to the controller
> >>+ - allwinner,ts-attached	 : boolean indicating that an actual touchscreen
> >>+				   is attached to the controller
> >>+ - allwinner,tp-sensitive-adjust : integer (4 bits)
> >>+				   adjust sensitivity of pen down detection
> >>+				   between 0 (least sensitive) and 15
> >>+				   (defaults to 15)
> >>+ - allwinner,filter-type 	 : integer (2 bits)
> >>+   				   select median and averaging filter
> >>+				   samples used for median / averaging filter
> >>+				   0: 4/2
> >>+				   1: 5/3
> >>+				   2: 8/4
> >>+				   3: 16/8
> >>+				   (defaults to 1)
> >
> >You shouldn't rely on any bits length in your binding.
> >
> >And this looks really more of a configuration option, and would be
> >better exposed through sysfs.
> 
> Erm, no, this is to adjust for properties of the touchscreen, so this is
> hardware configuration, and as such definitely belongs in the dts.

Applied, thank you.

-- 
Dmitry

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/11] clk: sunxi-ng: Add A80 CCU
Date: Fri, 27 Jan 2017 15:13:48 -0600
Message-ID: <20170127211348.quf2mfjf7bp37sqs@rob-hp-laptop>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-6-wens@csie.org>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBDPQV3CAKGQEA7O5UII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170124023230.3990-6-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 10:32:24AM +0800, Chen-Yu Tsai wrote:
> Add support for the main clock unit found in the A80.
> 
> Note that on the A80, some subsystems have separate clock controllers
> downstream of the main clock unit. These include the MMC, USB, and
> display engine subsystems.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |    1 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/clk/sunxi-ng/Kconfig                       |   10 +
>  drivers/clk/sunxi-ng/Makefile                      |    1 +
>  drivers/clk/sunxi-ng/ccu-sun9i-a80.c               | 1223 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun9i-a80.h               |   57 +
>  include/dt-bindings/clock/sun9i-a80-ccu.h          |  162 +++
>  include/dt-bindings/reset/sun9i-a80-ccu.h          |  102 ++
>  7 files changed, 1556 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80.h
>  create mode 100644 include/dt-bindings/clock/sun9i-a80-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun9i-a80-ccu.h

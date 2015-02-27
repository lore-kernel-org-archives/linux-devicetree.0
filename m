From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 4/7] clk: Add clock driver for mb86s7x
Date: Thu, 26 Feb 2015 17:28:22 -0800
Message-ID: <20150227012822.421.16727@quantum>
References: <1423188007-17047-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <1423188649-17216-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423188649-17216-1-git-send-email-Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Vincent Yang (2015-02-05 18:10:49)
> From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
>  The CRG11 clock controller is managed by remote f/w.
> This driver simply maps Linux CLK ops onto mailbox api.
> 
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
> ---
>  .../bindings/clock/fujitsu,mb86s70-crg11.txt       |  26 ++
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-mb86s7x.c                          | 386 +++++++++++++++++++++
>  3 files changed, 413 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt
>  create mode 100644 drivers/clk/clk-mb86s7x.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt b/Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt
> new file mode 100644
> index 0000000..3323962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt
> @@ -0,0 +1,26 @@
> +Fujitsu CRG11 clock driver bindings
> +-----------------------------------
> +
> +Required properties :
> +- compatible : Shall contain "fujitsu,mb86s70-crg11"
> +- #clock-cells : Shall be 3 {cntrlr domain port}
> +
> +The consumer specifies the desired clock pointing to its phandle.
> +
> +Example:
> +
> +       clock: crg11 {
> +               compatible = "fujitsu,mb86s70-crg11";
> +               #clock-cells = <3>;
> +       };
> +
> +       mhu: mhu0@2b1f0000 {
> +               #mbox-cells = <1>;
> +               compatible = "arm,mhu";
> +               reg = <0 0x2B1F0000 0x1000>;
> +               interrupts = <0 36 4>, /* LP Non-Sec */
> +                            <0 35 4>, /* HP Non-Sec */
> +                            <0 37 4>; /* Secure */
> +               clocks = <&clock 0 2 1>; /* Cntrlr:0 Domain:2 Port:1 */

Some preprocessor definitions would be better than hardcoding the values
for Cntrlr, Domain and Port. The DT include chroot should help you
here. Doing so will help you maintain this stuff into the future :-)

Regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

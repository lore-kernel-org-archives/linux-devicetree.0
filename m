From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 3/3] fpga manager: Adding FPGA Manager support for
 Xilinx Zynq 7000
Date: Mon, 19 Oct 2015 09:28:13 -0700
Message-ID: <CAAtXAHf1nqSmcb64VYv+G5MMo59AuHTW2KXqZfo5_hp9R3bagw@mail.gmail.com>
References: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com>
	<1445035350-3569-4-git-send-email-moritz.fischer@ettus.com>
	<20151018180259.GI12756@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151018180259.GI12756-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 18, 2015 at 11:02 AM, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org> wrote:
> Hey Moritz-
>
> On Fri, Oct 16, 2015 at 03:42:30PM -0700, Moritz Fischer wrote:
>> This commit adds FPGA Manager support for the Xilinx Zynq chip.
>> The code borrows some from the xdevcfg driver in Xilinx'
>> vendor tree.
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> v2:
>>  - Replaced locking error flag and broken completion with irq masking
>>    and changed completion handling
>>  - Dealing with timeout cases
>>  - Reworked clock handling
>>  - Moved initialization from probe() to write_init()
>>  - Fixed return value of devm_request_irq() check to check for non-zero
>>  - Alphabetized includes ;-)
>>  - Changed some of the comments, to better explain what's happening
> [..]
>> +static int zynq_fpga_probe(struct platform_device *pdev)
>> +{
> [..]
>> +     priv->clk = devm_clk_get(dev, "ref_clk");
>> +     if (IS_ERR(priv->clk)) {
>> +             dev_err(dev, "input clock not found");
>> +             return PTR_ERR(priv->clk);
>> +     }
>> +
>> +     err = clk_prepare_enable(priv->clk);
>> +     if (err) {
>> +             dev_err(dev, "unable to enable clock");
>> +             return err;
>> +     }
>
> prepare_cnt = 1, enable_cnt = 1
>
>> +
>> +     /* unlock the device */
>> +     zynq_fpga_write(priv, UNLOCK_OFFSET, UNLOCK_MASK);
>> +
>> +     clk_disable(priv->clk);
>
> prepare_cnt = 1, enable_cnt = 0
>> +
>> +     err = fpga_mgr_register(dev, "Xilinx Zynq FPGA Manager",
>> +                             &zynq_fpga_ops, priv);
>> +     if (err) {
>> +             dev_err(dev, "unable to register FPGA manager");
>> +             clk_disable_unprepare(priv->clk);
>
> prepare_cnt = 0, enable_cnt = -1 /* OOPS! */
>
> Clock management is still wonky.  I think you only want clk_unprepare here.
>
>> +             return err;
>> +     }
>> +
>
> Assuming all goes well, you'll be leaving probe() with:
>
> prepare_cnt = 1, enable_cnt = 0.
>
>> +     return 0;
>> +}
>> +
>> +static int zynq_fpga_remove(struct platform_device *pdev)
>> +{
>> +     struct zynq_fpga_priv *priv;
>> +
>> +     fpga_mgr_unregister(&pdev->dev);
>> +
>> +     priv = platform_get_drvdata(pdev);
>> +
>> +     clk_disable_unprepare(priv->clk);
>
> Which means, symmetrically, you'll only want this to be a clk_unprepare().
>
>   Josh

Greg had already queued the v2 this weekend (which caught me by
suprise). I tried to figure out if it's possible to send a v3,
but he said to send follow up patches as he can't rebase the branch he
merged it into.
I will have access to hardware this afternoon, and send out follow up
patches to fix the unbalanced clock handling.

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

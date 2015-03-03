From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 4/7] clk: Add clock driver for mb86s7x
Date: Tue, 3 Mar 2015 12:10:36 +0530
Message-ID: <CAJe_ZhcBvWuoKTRO6nRfyoeTXNUwykkvGtpbcRb3oxdoNqbcjQ@mail.gmail.com>
References: <1423188007-17047-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1423188649-17216-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<20150227012822.421.16727@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150227012822.421.16727@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27 February 2015 at 06:58, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Vincent Yang (2015-02-05 18:10:49)
>> From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>>  The CRG11 clock controller is managed by remote f/w.
>> This driver simply maps Linux CLK ops onto mailbox api.
>>
>> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
>> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
>> ---
>>  .../bindings/clock/fujitsu,mb86s70-crg11.txt       |  26 ++
>>  drivers/clk/Makefile                               |   1 +
>>  drivers/clk/clk-mb86s7x.c                          | 386 +++++++++++++++++++++
>>  3 files changed, 413 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt
>>  create mode 100644 drivers/clk/clk-mb86s7x.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt b/Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt
>> new file mode 100644
>> index 0000000..3323962
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/fujitsu,mb86s70-crg11.txt
>> @@ -0,0 +1,26 @@
>> +Fujitsu CRG11 clock driver bindings
>> +-----------------------------------
>> +
>> +Required properties :
>> +- compatible : Shall contain "fujitsu,mb86s70-crg11"
>> +- #clock-cells : Shall be 3 {cntrlr domain port}
>> +
>> +The consumer specifies the desired clock pointing to its phandle.
>> +
>> +Example:
>> +
>> +       clock: crg11 {
>> +               compatible = "fujitsu,mb86s70-crg11";
>> +               #clock-cells = <3>;
>> +       };
>> +
>> +       mhu: mhu0@2b1f0000 {
>> +               #mbox-cells = <1>;
>> +               compatible = "arm,mhu";
>> +               reg = <0 0x2B1F0000 0x1000>;
>> +               interrupts = <0 36 4>, /* LP Non-Sec */
>> +                            <0 35 4>, /* HP Non-Sec */
>> +                            <0 37 4>; /* Secure */
>> +               clocks = <&clock 0 2 1>; /* Cntrlr:0 Domain:2 Port:1 */
>
> Some preprocessor definitions would be better than hardcoding the values
> for Cntrlr, Domain and Port. The DT include chroot should help you
> here. Doing so will help you maintain this stuff into the future :-)
>
What macros do you have in mind? I was actually made to get rid of
macros in earlier version, but the implementation was different then.
I hope
     #clock-cells : Shall be 3 {cntrlr domain port}
in the binding should be telling enough.

Thanks
jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

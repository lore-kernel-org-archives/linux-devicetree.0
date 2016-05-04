From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 10:24:42 -0700 (PDT)
Message-ID: <75debca7-554e-4e15-9675-73a9bc92cc6f@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CAGb2v66E2TuN3+tYaAbniV3q67waDZOfqKAW14VJz6xZFomZ=Q@mail.gmail.com>
 <57285162.2000704@schinagl.nl>
 <CAGb2v66r9m7qVW6BszeT2wqs0KyEr4x5ivTJYqu2Fes=R9-Ltw@mail.gmail.com>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
 <5729F07C.3080308@schinagl.nl>
 <948be370-4401-43cb-862e-d4376755a75d@googlegroups.com>
 <5729F6D6.8030100@schinagl.nl>
 <4704fa35-9a2a-4e6e-8fd4-f4778405c598@googlegroups.com>
 <572A0052.9060202@schinagl.nl>
 <2e745ef7-ddc0-40fc-b867-414543690276@googlegroups.com>
 <572A10B3.2020803@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_4177_881679067.1462382682466"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBW7AVC4QKGQEUF4BTRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <572A10B3.2020803-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_4177_881679067.1462382682466
Content-Type: multipart/alternative;
	boundary="----=_Part_4178_839273576.1462382682470"

------=_Part_4178_839273576.1462382682470
Content-Type: text/plain; charset=UTF-8

Hi Oliver,

I have just tested your patch and the access to eMMC is working.
There you are complete patch I have applied against kernel 4.5.2:
index d5c796c..1f5339d 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -188,6 +188,15 @@
     status = "okay";
 };
 
+&mmc2 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&mmc2_pins_a>;
+    vmmc-supply = <&reg_vcc3v3>;
+    bus-width = <8>;
+    non-removable;
+    status = "okay";
+};
+
 &ohci0 {
     status = "okay";
 };
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 3d5087b..78668aa 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -504,7 +504,7 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 
*ext_csd)
                 pr_info("%s: MAN_BKOPS_EN bit is not set\n",
                     mmc_hostname(card->host));
         }
-
+#if 0
         /* check whether the eMMC card supports HPI */
         if (!broken_hpi && (ext_csd[EXT_CSD_HPI_FEATURES] & 0x1)) {
             card->ext_csd.hpi = 1;
@@ -519,7 +519,7 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 
*ext_csd)
             card->ext_csd.out_of_int_time =
                 ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] * 10;
         }
-
+#endif
         card->ext_csd.rel_param = ext_csd[EXT_CSD_WR_REL_PARAM];
         card->ext_csd.rst_n_function = ext_csd[EXT_CSD_RST_N_FUNCTION];
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c b/drivers/pinctrl/
sunxi/pinctrl-sun7i-a20.c
index cf1ce0c..9fc12d2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
@@ -314,19 +314,23 @@ static const struct sunxi_desc_pin sun7i_a20_pins[] = 
{
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ4 */
+          SUNXI_FUNCTION(0x2, "nand0"),        /* NDQ4 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D4 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ5 */
+          SUNXI_FUNCTION(0x2, "nand0"),    /* NDQ5 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D5 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ6 */
+          SUNXI_FUNCTION(0x2, "nand0"),    /* NDQ6 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D6 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ7 */
+          SUNXI_FUNCTION(0x2, "nand0"),    /* NDQ7 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D7 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),

And the boot messages:
[    3.598495] sunxi-mmc 1c0f000.mmc: Got CD GPIO
[    3.631826] sunxi-mmc 1c0f000.mmc: base:0xf08da000 irq:26
[    3.668943] mmc0: host does not support reading read-only switch, 
assuming write-enable
[    3.671887] sunxi-mmc 1c11000.mmc: base:0xf08de000 irq:27
[    3.671935] mmc0: new high speed SDHC card at address 0007
[    3.672939] mmcblk0: mmc0:0007 SD04G 3.71 GiB
[    3.674799]  mmcblk0: p1
[    3.682634] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RTO !!
[    3.687921] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.688785] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.689643] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.690477] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.725492] mmc1: MAN_BKOPS_EN bit is not set
[    3.729187] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RD EBE !!
[    3.729228] sunxi-mmc 1c11000.mmc: data error, sending stop command
[    3.729247] sunxi-mmc 1c11000.mmc: send stop command failed
[    3.729270] mmc1: switch to bus width 2 failed
[    3.733592] mmc1: new high speed MMC card at address 0001
[    3.734478] mmcblk1: mmc1:0001 P1XXXX 3.60 GiB
[    3.734889] mmcblk1boot0: mmc1:0001 P1XXXX partition 1 16.0 MiB
[    3.735305] mmcblk1boot1: mmc1:0001 P1XXXX partition 2 16.0 MiB
[    3.736551]  mmcblk1: p1
[    4.155620] EXT4-fs (mmcblk0p1): mounted filesystem with writeback data 
mode. Opts: (null)
[    8.163191] EXT4-fs (mmcblk0p1): re-mounted. Opts: commit=600,errors=
remount-ro
where mmc0 is SD/MMC card and mmc1 is eMMC on my A20-Olinuxino-Lime2-eMMC 
board.

Fortunately or not the same error and fail messages can be observed in my 
board log.

How can I verify how wide is the eMMC bus used in real?

Best regards
Chris


On Wednesday, May 4, 2016 at 6:09:44 PM UTC+3, Olliver Schinagl wrote:
>
> Christo,
>
> On 04-05-16 16:31, Christo Radev wrote:
>
> Tanks Oliver,
>
> It could be the problem to get 8-bit access working.
>
> Unfortunately, I do not see where to make this changes because original 
> dts files 
> <https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts?id=refs/tags/v4.5.2> 
> are used in Armbian build.
> I also see '*SUNXI_PINCTRL_PIN*' and '*SUNXI_FUNCTION*' may require some 
> patches in addition.
>
> check out drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
>
> my patch should still work aginst that.
>
>
> I am ready to make 8-bit eMMC access tests again so could you help me with 
> the needed staff it has to be used.
>
> I don't mind, but lets take it off list for that :)
>
> Olliver
>
>
> Best regards
> Chris
>
> On Wednesday, May 4, 2016 at 4:59:52 PM UTC+3, Olliver Schinagl wrote: 
>>
>> Hey Christo,
>>
>> On 04-05-16 15:32, Christo Radev wrote:
>>
>> Hi Oliver,
>>
>> I do: that 
>> http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7359
>> The syntax error seen there was fixed and the result is: 
>> http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7361
>>
>> Nope, you are still forgetting and seeing an 'unsupported function' error 
>> because of it.
>>
>> You forgot to add:
>>
>> >>>*          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
>> *>>>*                    SUNXI_FUNCTION(0x0, "gpio_in"),
>> *>>>*                    SUNXI_FUNCTION(0x1, "gpio_out"),
>> *>>>* -                 SUNXI_FUNCTION(0x2, "nand0")),        /* NDQ4 */
>> *>>>* +                 SUNXI_FUNCTION(0x2, "nand0"),         /* NDQ4 */
>> *>>>* +                 SUNXI_FUNCTION(0x3, "mmc2")),         /* D4 */
>> *>>>*          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
>> *>>>*                    SUNXI_FUNCTION(0x0, "gpio_in"),
>> *>>>*                    SUNXI_FUNCTION(0x1, "gpio_out"),
>> *>>>* -                 SUNXI_FUNCTION(0x2, "nand0")),        /* NDQ5 */
>> *>>>* +                 SUNXI_FUNCTION(0x2, "nand0"),         /* NDQ5 */
>> *>>>* +                 SUNXI_FUNCTION(0x3, "mmc2")),         /* D5 */
>> *>>>*          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
>> *>>>*                    SUNXI_FUNCTION(0x0, "gpio_in"),
>> *>>>*                    SUNXI_FUNCTION(0x1, "gpio_out"),
>> *>>>* -                 SUNXI_FUNCTION(0x2, "nand0")),        /* NDQ6 */
>> *>>>* +                 SUNXI_FUNCTION(0x2, "nand0"),         /* NDQ6 */
>> *>>>* +                 SUNXI_FUNCTION(0x3, "mmc2")),         /* D6 */
>> *>>>*          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
>> *>>>*                    SUNXI_FUNCTION(0x0, "gpio_in"),
>> *>>>*                    SUNXI_FUNCTION(0x1, "gpio_out"),
>> *>>>* -                 SUNXI_FUNCTION(0x2, "nand0")),        /* NDQ7 */
>> *>>>* +                 SUNXI_FUNCTION(0x2, "nand0"),         /* NDQ7 */
>> *>>>* +                 SUNXI_FUNCTION(0x3, "mmc2")),         /* D7 */*
>>
>>
>> to actually get the pin functions.
>>
>>
>> The same tests was done on legacy kernel 3.4.111 modifying fex file and 
>> the result is the same: 
>> http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7265
>>
>>
>> Best regards
>> Chris
>>
>>
>> On Wednesday, May 4, 2016 at 4:19:20 PM UTC+3, Olliver Schinagl wrote: 
>>>
>>> Hey Christo,
>>>
>>> On 04-05-16 15:07, Christo Radev wrote:
>>>
>>> Hi Olliver,
>>>
>>> I have already test it a few weeks ago and definitely can say that 8-bit 
>>> bus did not work on A20-Olinuxino-Lime2-eMMC with mainline kernel.
>>> See may post here 
>>> <http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7361>
>>> .
>>>
>>> I saw, but you forgot to define the pins for 4.x :)
>>>
>>> See my patch from earlier: 
>>> <http://lists.infradead.org/pipermail/linux-arm-kernel/2015-September/368887.html>
>>> http://lists.infradead.org/
>>> pipermail/linux-arm-kernel/2015-September/368887.html
>>>
>>> Olliver
>>>
>>>
>>> Best regards
>>>
>>> Chris
>>>
>>> On Wednesday, May 4, 2016 at 3:52:17 PM UTC+3, Olliver Schinagl wrote: 
>>>>
>>>> Hey Radoslav, 
>>>>
>>>> On 04-05-16 14:30, Radoslav Kolev wrote: 
>>>> > 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai <we...-jdAy2FN1RRM@public.gmane.org>: 
>>>> >> On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl <oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> 
>>>> wrote: 
>>>> >>>>> +       bus-width = <4>; 
>>>> >>>> Only 4 bits? We normally see eMMC with 8 bits. 4 bits are some 
>>>> kind of 
>>>> >>>> embedded SD card. 
>>>> >>> On A20 as well? Our investigations so far have concluded that the 
>>>> A10 and 
>>>> >>> A20 have those pins not mapped out to pads. The IP does support it 
>>>> however 
>>>> >>> we assume. 
>>>> >> You're right. My bad. First time A10/A20 sees eMMC support. 
>>>> > I can't say anything about A10/A20, but I have a board with A13 and 
>>>> > the same eMMC chip and it works fine in 8 bit mode. 
>>>> Yep, sun5i actually brings them all out to pads, the A20 however does 
>>>> not :( We first thought that the A20 would also be an 8bitter, because 
>>>> the mmc IP appears to be the same as sun5i, but initial tests show it 
>>>> is 
>>>> not. As for A10, it has older IP and it might not even support 8 bit 
>>>> mode, let alone bring out the pins. 
>>>>
>>>> But with A20's + eMMC being available via the lime2, others may repeat 
>>>> my experiments! The lime2 is 8 bit connected. 
>>>>
>>>> Olliver 
>>>> > 
>>>> > Regards, 
>>>> > Radoslav 
>>>>
>>>>
>>>
>>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_4178_839273576.1462382682470
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oliver,<br><br>I have just tested your patch and the ac=
cess to eMMC is working.<br>There you are complete patch I have applied aga=
inst kernel 4.5.2:<br><div class=3D"prettyprint" style=3D"background-color:=
 rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-style: solid;=
 border-width: 1px; word-wrap: break-word;"><code class=3D"prettyprint"><di=
v class=3D"subprettyprint"><span style=3D"color: #000;" class=3D"styled-by-=
prettify">index d5c796c</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">..</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1f5339d</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">100644<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">---</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> a</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">arch</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">arm</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">boot</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">dts</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">sun7i</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">a20</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">olinuxino</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">lime2</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">dts<br>=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">+++</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> b</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">arch</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">arm</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">boot</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">dts</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">sun7i</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">a20</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">olinuxino</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">lime2</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>dts<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">@@=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">188</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">6</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">+</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">188</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">15</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0status </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #080;" class=3D"styled-by-prettify">&quot;okay&quot;</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">;</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">};</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"><br>=C2=A0<br></span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">+&amp;</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify">mmc2 </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">{</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">+</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> =C2=A0 =C2=A0pinctrl</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">names </span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;def=
ault&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0pinctrl</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">&lt;&amp;</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">mmc2_pins_a</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">&gt;;</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">+</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0vmmc</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">su=
pply </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">&lt;&amp;</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">reg_vcc3v3</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">&gt;;</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0bus</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">width </span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">&lt;</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">8</span><span style=3D"color: #660;" class=3D"styled-by-prettify">&gt;=
;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0non</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">removable</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">;</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0status </span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> </span><span style=3D"color: #080;" class=3D"s=
tyled-by-prettify">&quot;okay&quot;</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">;</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">+};</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">&amp;</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">ohci0 </span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">{</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0stat=
us </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #080;" class=3D"styled-by-prettify">&quot;okay&quot;</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">;</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">};</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br>diff </span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">--</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify">git a</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">drivers</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">core</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify">mmc</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">c b</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">drivers</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">core</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify">mmc</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">c<br>index </span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">3d5087b</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">..</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">78668aa</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">100644</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">---</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> a</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">drivers</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">mmc</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify">core</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">c<br><=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">+++</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> b</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">drivers</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">mmc</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify">core</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify">c<br></span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">-</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">504</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">,</span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">7</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">504</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">@@</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-pre=
ttify">static</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">int</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc_decode_e=
xt_csd</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</s=
pan><span style=3D"color: #008;" class=3D"styled-by-prettify">struct</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc_card </span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">*</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">card</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> u8 </span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">*</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">ext_csd</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
_info</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;%s: MAN_=
BKOPS_EN bit is not set\n&quot;</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mmc_hostname</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">card</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">-&gt;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">h=
ost</span><span style=3D"color: #660;" class=3D"styled-by-prettify">));</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">}</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">-=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span st=
yle=3D"color: #800;" class=3D"styled-by-prettify">#if 0</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettify">=
/* check whether the eMMC card supports HPI */</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
/span><span style=3D"color: #008;" class=3D"styled-by-prettify">if</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">(!</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">broken_hpi </span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">&amp;&amp;</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">ext_csd</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify">EXT_CSD_HPI_FEATURES</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">&amp;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x1</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">))</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">{</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0card</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">-&gt;</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">ext_csd</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">hpi </span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">;</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">@@</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">-</span><span style=3D"color: #066;" class=3D"styled-by-prettify">519</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">7</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">+</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">519</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">,</span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">7</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">@@</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span sty=
le=3D"color: #008;" class=3D"styled-by-prettify">static</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #008;" class=3D"styled-by-prettify">int</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> mmc_decode_ext_csd</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #008;=
" class=3D"styled-by-prettify">struct</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> mmc_card </span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">*</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">card</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> u8 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">*</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">ext_csd</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0card</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-&gt;</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">ext_csd</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">out_of_int_time </span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext=
_csd</span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">EXT_CSD_OUT_OF_=
INTERRUPT_TIME</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">*</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">10</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">;</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">}</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">+</span><span style=3D"color: #800;" class=3D"sty=
led-by-prettify">#endif</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-&gt;</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">ext_csd</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify">rel_param </span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> ext_csd</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">EXT_CSD_WR_REL_PARAM</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">];</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">-&gt;</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">ext_csd</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify">rst_n_function </span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> ext_csd</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">EXT_CSD_RST_N_FUNCTION</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">];</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0<br>diff </span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">--</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify">git a</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">drivers</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">p=
inctrl</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">sunxi</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">pinctrl</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">sun7i</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">a20</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">c b</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">drivers<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify">pinctrl</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">sunxi</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify">pinctrl</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">sun7i</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">a20</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">c<br>index cf=
1ce0c</span><span style=3D"color: #660;" class=3D"styled-by-prettify">..</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">9fc12d2</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">100644</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">---</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> a</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">drivers</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify">pinctrl</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">sunxi</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">pinctrl</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">sun7i</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">a20</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify">c<br></span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">+++</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 b</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">drivers</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">pinctrl</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">sunxi</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify">pinctrl</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">sun7i</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">a20</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">c<br></span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">-</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">314</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">,</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">19</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">314</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">23</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">@@</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-pre=
ttify">static</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">const<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">struct</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> sunxi_desc_pin sun7i_a2=
0_pins</span><span style=3D"color: #660;" class=3D"styled-by-prettify">[]</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">{</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0SUNXI_PIN</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">SUNXI_PINCTRL_PIN</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">C</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">12</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">0x0</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #080;" class=3D"style=
d-by-prettify">&quot;gpio_in&quot;</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">0x1</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;=
" class=3D"styled-by-prettify">&quot;gpio_out&quot;</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">0x2</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" class=
=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">)),</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #800;" c=
lass=3D"styled-by-prettify">/* NDQ4 */</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0x2</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" class=
=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"c=
olor: #800;" class=3D"styled-by-prettify">/* NDQ4 */</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTIO=
N</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">0x3</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080=
;" class=3D"styled-by-prettify">&quot;mmc2&quot;</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">)),</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span st=
yle=3D"color: #800;" class=3D"styled-by-prettify">/* D4 */</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0SUN=
XI_PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">SUNXI_PINCTRL=
_PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">C</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">13</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTIO=
N</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">0x0</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080=
;" class=3D"styled-by-prettify">&quot;gpio_in&quot;</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x=
1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_out&quot;</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI=
_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x2</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #080;" class=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">)),</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D=
"color: #800;" class=3D"styled-by-prettify">/* NDQ5 */</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCT=
ION</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0x2</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
80;" class=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color:=
 #800;" class=3D"styled-by-prettify">/* NDQ5 */</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0x3</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" =
class=3D"styled-by-prettify">&quot;mmc2&quot;</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">)),</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"color: #800;" class=3D"styled-by-prettify">/* D5 */</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0SUNX=
I_PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">SUNXI_PINCTRL_=
PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">C</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">14</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">0x0</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;=
" class=3D"styled-by-prettify">&quot;gpio_in&quot;</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x=
1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_out&quot;</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI=
_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x2</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #080;" class=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">)),</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D=
"color: #800;" class=3D"styled-by-prettify">/* NDQ6 */</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCT=
ION</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0x2</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
80;" class=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color:=
 #800;" class=3D"styled-by-prettify">/* NDQ6 */</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0x3</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" =
class=3D"styled-by-prettify">&quot;mmc2&quot;</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">)),</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"color: #800;" class=3D"styled-by-prettify">/* D6 */</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0SUNX=
I_PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">SUNXI_PINCTRL_=
PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">C</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">15</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">0x0</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;=
" class=3D"styled-by-prettify">&quot;gpio_in&quot;</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x=
1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_out&quot;</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI=
_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x2</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #080;" class=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">)),</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D=
"color: #800;" class=3D"styled-by-prettify">/* NDQ7 */</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCT=
ION</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0x2</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
80;" class=3D"styled-by-prettify">&quot;nand0&quot;</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color:=
 #800;" class=3D"styled-by-prettify">/* NDQ7 */</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0x3</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" =
class=3D"styled-by-prettify">&quot;mmc2&quot;</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">)),</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span><span style=
=3D"color: #800;" class=3D"styled-by-prettify">/* D7 */</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0SUNX=
I_PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">SUNXI_PINCTRL_=
PIN</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">C</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">16</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">),</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">0x0</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;=
" class=3D"styled-by-prettify">&quot;gpio_in&quot;</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x=
1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_out&quot;</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br></span></div></code><=
/div><br>And the boot messages:<br><div class=3D"prettyprint" style=3D"back=
ground-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-=
style: solid; border-width: 1px; word-wrap: break-word;"><code class=3D"pre=
ttyprint"><div class=3D"subprettyprint"><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">3.598495</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000.mmc=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">Got</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> CD GPIO<br></span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color:=
 #066;" class=3D"styled-by-prettify">3.631826</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">1c0f000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">base</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">0xf08da000</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> irq</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">26</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">3.668943</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> mmc0</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> host =
does </span><span style=3D"color: #008;" class=3D"styled-by-prettify">not</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> support rea=
ding read</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">only </spa=
n><span style=3D"color: #008;" class=3D"styled-by-prettify">switch</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> assuming write</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">enable<br></span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">3.671887</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">base</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">0xf08de000</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> irq</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">27</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">3.671935</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> mmc0</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #008;" class=3D"styled-by-prettify">new</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> high speed SDHC card =
at address </span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0007</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">3.672939</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk0</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> mmc0</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0007</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> SD04G </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">3.71</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">=
GiB</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">3.674799</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0mmcblk0</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> p1<br></span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">3.682634</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> sm=
c </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> err</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> cmd </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">8</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> RTO </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">!!</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.68=
7921</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> smc </span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> err</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> cmd </span><span style=3D"color: #066;" class=3D"styled-by-prettify">5=
5</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">!!</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">3.688785</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> sm=
c </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> err</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> cmd </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">55</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> RTO </span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">!!</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.6=
89643</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> smc </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> err</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> cmd </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
55</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">!!</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">3.690477</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> s=
mc </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> err</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> cmd </span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">55</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> RTO </span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">!!</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
3.725492</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> MAN_BKOPS_EN bit </span>=
<span style=3D"color: #008;" class=3D"styled-by-prettify">is</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #008;" class=3D"styled-by-prettify">not</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" clas=
s=3D"styled-by-prettify">set</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">3.729187</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> sun=
xi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> smc </span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> err</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> cmd </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">8</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> RD EBE =
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">!!</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">3.729228</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify">mmc </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> data error</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> sending stop command<br></span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-=
by-prettify">3.729247</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> send stop command failed=
<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0<=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.729270</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;"=
 class=3D"styled-by-prettify">switch</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> to bus width </span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">2</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> failed<br></span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">3.733592</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> mmc1</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #008;" class=3D"styled-by-prettify">new</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> high speed MMC card a=
t address </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">3.734478</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk1</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> mmc1</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0001</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> P1XXXX </span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">3.60</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify"=
>GiB</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">3.734889</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk1boot0</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> mmc1</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">0001</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> P1XXXX partition </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">16.0</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">MiB<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">3.735305</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> mmcblk1boot1</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> mmc1</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0001</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> P1XXXX partition </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">2</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">16.0</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">MiB</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">3.736551</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0mmcblk1</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> p1<br></span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">4.155620</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> EXT4</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">fs </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">mmcblk0p1</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">):</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> mounted filesystem </=
span><span style=3D"color: #008;" class=3D"styled-by-prettify">with</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> writeback data mo=
de</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span sty=
le=3D"color: #606;" class=3D"styled-by-prettify">Opts</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">(</span><span style=3D"color: #008;" class=3D"styl=
ed-by-prettify">null</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">8.163191</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> EXT4</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">fs </span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">mmcblk0p1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">):</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> re</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
mounted</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #606;" class=3D"styled-by-prettify">Opts</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> commit</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">600</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">errors</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">remount</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">ro<br></=
span></div></code></div>where mmc0 is SD/MMC card and mmc1 is eMMC on my A2=
0-Olinuxino-Lime2-eMMC board.<br><br>Fortunately or not the same error and =
fail messages can be observed in my board log.<br><br>How can I verify how =
wide is the eMMC bus used in real?<br><br>Best regards<br>Chris<br><br><br>=
On Wednesday, May 4, 2016 at 6:09:44 PM UTC+3, Olliver Schinagl wrote:<bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-l=
eft: 1px #ccc solid;padding-left: 1ex;">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Christo,<br>
    <br>
    <div>On 04-05-16 16:31, Christo Radev wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Tanks Oliver,<br>
        <br>
        It could be the problem to get 8-bit access working.<br>
        <br>
        Unfortunately, I do not see where to make this changes because <a h=
ref=3D"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git=
/tree/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts?id=3Drefs/tags/v4.5.2=
" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https:=
//www.google.com/url?q\x3dhttps%3A%2F%2Fgit.kernel.org%2Fcgit%2Flinux%2Fker=
nel%2Fgit%2Fstable%2Flinux-stable.git%2Ftree%2Farch%2Farm%2Fboot%2Fdts%2Fsu=
n7i-a20-olinuxino-lime2.dts%3Fid%3Drefs%2Ftags%2Fv4.5.2\x26sa\x3dD\x26sntz\=
x3d1\x26usg\x3dAFQjCNHD7JrvZYOc4d7A6cMVRqMcZqYGXw&#39;;return true;" onclic=
k=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgit.ker=
nel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux-stable.git%2Ftree%2F=
arch%2Farm%2Fboot%2Fdts%2Fsun7i-a20-olinuxino-lime2.dts%3Fid%3Drefs%2Ftags%=
2Fv4.5.2\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHD7JrvZYOc4d7A6cMVRqMcZqYG=
Xw&#39;;return true;">original
          dts files</a> are used in Armbian build.<br>
        I also see &#39;<i>SUNXI_PINCTRL_PIN</i>&#39; and &#39;<i>SUNXI_FUN=
CTION</i>&#39;
        may require some patches in addition.<br>
      </div>
    </blockquote>
    check out drivers/pinctrl/sunxi/pinctrl-<wbr>sun7i-a20.c<br>
    <br>
    my patch should still work aginst that.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        I am ready to make 8-bit eMMC access tests again so could you
        help me with the needed staff it has to be used.<br>
      </div>
    </blockquote>
    I don&#39;t mind, but lets take it off list for that :)<br>
    <br>
    Olliver<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        Best regards<br>
        Chris<br>
        <br>
        On Wednesday, May 4, 2016 at 4:59:52 PM UTC+3, Olliver Schinagl
        wrote:
        <blockquote class=3D"gmail_quote" style=3D"margin:0;margin-left:0.8=
ex;border-left:1px #ccc solid;padding-left:1ex">
          <div bgcolor=3D"#FFFFFF" text=3D"#000000"> Hey Christo,<br>
            <br>
            <div>On 04-05-16 15:32, Christo Radev wrote:<br>
            </div>
            <blockquote type=3D"cite">
              <div dir=3D"ltr">Hi Oliver,<br>
                <br>
                I do: that
                <a href=3D"http://forum.armbian.com/index.php/topic/853-arm=
bian-customization/page-2#entry7359" rel=3D"nofollow" target=3D"_blank" onm=
ousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Ffo=
rum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customization%2Fpage-2%23=
entry7359\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH5u6ETws26SAQHFNCGkmh0s_a=
--g&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.com/ur=
l?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-cus=
tomization%2Fpage-2%23entry7359\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH5u=
6ETws26SAQHFNCGkmh0s_a--g&#39;;return true;">http://forum.armbian.com/<wbr>=
index.php/topic/853-armbian-<wbr>customization/page-2#entry7359</a><br>
                The syntax error seen there was fixed and the result is:
                <a href=3D"http://forum.armbian.com/index.php/topic/853-arm=
bian-customization/page-2#entry7361" rel=3D"nofollow" target=3D"_blank" onm=
ousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Ffo=
rum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customization%2Fpage-2%23=
entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJsEMhE0Sir_4R5oOoGRnKYa0=
slg&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.com/ur=
l?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-cus=
tomization%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJs=
EMhE0Sir_4R5oOoGRnKYa0slg&#39;;return true;">http://forum.armbian.com/<wbr>=
index.php/topic/853-armbian-<wbr>customization/page-2#entry7361</a><br>
              </div>
            </blockquote>
            Nope, you are still forgetting and seeing an &#39;unsupported
            function&#39; error because of it.<br>
            <br>
            You forgot to add:<br>
            <br>
            <pre>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12=
),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, &quot;gpio_in&qu=
ot;),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, &quot;gpio_out&q=
uot;),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
)),        /* NDQ4 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
),         /* NDQ4 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, &quot;mmc2&quot;)=
),         /* D4 */
</i>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, &quot;gpio_in&qu=
ot;),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, &quot;gpio_out&q=
uot;),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
)),        /* NDQ5 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
),         /* NDQ5 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, &quot;mmc2&quot;)=
),         /* D5 */
</i>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, &quot;gpio_in&qu=
ot;),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, &quot;gpio_out&q=
uot;),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
)),        /* NDQ6 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
),         /* NDQ6 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, &quot;mmc2&quot;)=
),         /* D6 */
</i>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, &quot;gpio_in&qu=
ot;),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, &quot;gpio_out&q=
uot;),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
)),        /* NDQ7 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, &quot;nand0&quot;=
),         /* NDQ7 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, &quot;mmc2&quot;)=
),         /* D7 */</i></pre>
            <br>
            to actually get the pin functions.<br>
            <blockquote type=3D"cite">
              <div dir=3D"ltr"><br>
                The same tests was done on legacy kernel 3.4.111
                modifying fex file and the result is the same:
                <a href=3D"http://forum.armbian.com/index.php/topic/853-arm=
bian-customization/page-2#entry7265" rel=3D"nofollow" target=3D"_blank" onm=
ousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Ffo=
rum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customization%2Fpage-2%23=
entry7265\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFsHlW6DpcWfYW9wa2q9ogNJ8U=
S_g&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.com/ur=
l?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-cus=
tomization%2Fpage-2%23entry7265\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFsH=
lW6DpcWfYW9wa2q9ogNJ8US_g&#39;;return true;">http://forum.armbian.com/<wbr>=
index.php/topic/853-armbian-<wbr>customization/page-2#entry7265</a><br>
                <br>
                <br>
                Best regards<br>
                Chris<br>
                <br>
                <br>
                On Wednesday, May 4, 2016 at 4:19:20 PM UTC+3, Olliver
                Schinagl wrote:
                <blockquote class=3D"gmail_quote" style=3D"margin:0;margin-=
left:0.8ex;border-left:1px #ccc solid;padding-left:1ex">
                  <div bgcolor=3D"#FFFFFF" text=3D"#000000"> Hey Christo,<b=
r>
                    <br>
                    <div>On 04-05-16 15:07, Christo Radev wrote:<br>
                    </div>
                    <blockquote type=3D"cite">
                      <div dir=3D"ltr">Hi Olliver,<br>
                        <br>
                        I have already test it a few weeks ago and
                        definitely can say that 8-bit bus did not work
                        on A20-Olinuxino-Lime2-eMMC with mainline
                        kernel.<br>
                        See may post <a href=3D"http://forum.armbian.com/in=
dex.php/topic/853-armbian-customization/page-2#entry7361" rel=3D"nofollow" =
target=3D"_blank" onmousedown=3D"this.href=3D&#39;http://www.google.com/url=
?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-cust=
omization%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJsE=
MhE0Sir_4R5oOoGRnKYa0slg&#39;;return true;" onclick=3D"this.href=3D&#39;htt=
p://www.google.com/url?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Fto=
pic%2F853-armbian-customization%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d=
1\x26usg\x3dAFQjCNHJsEMhE0Sir_4R5oOoGRnKYa0slg&#39;;return true;">here</a>.=
<br>
                      </div>
                    </blockquote>
                    I saw, but you forgot to define the pins for 4.x :)<br>
                    <br>
                    See my patch from earlier: <a href=3D"http://lists.infr=
adead.org/pipermail/linux-arm-kernel/2015-September/368887.html" rel=3D"nof=
ollow" target=3D"_blank" onmousedown=3D"this.href=3D&#39;http://www.google.=
com/url?q\x3dhttp%3A%2F%2Flists.infradead.org%2Fpipermail%2Flinux-arm-kerne=
l%2F2015-September%2F368887.html\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNG5=
8Mu-lGULS_w3sxXaj81hwQG6Eg&#39;;return true;" onclick=3D"this.href=3D&#39;h=
ttp://www.google.com/url?q\x3dhttp%3A%2F%2Flists.infradead.org%2Fpipermail%=
2Flinux-arm-kernel%2F2015-September%2F368887.html\x26sa\x3dD\x26sntz\x3d1\x=
26usg\x3dAFQjCNG58Mu-lGULS_w3sxXaj81hwQG6Eg&#39;;return true;"></a><a href=
=3D"http://lists.infradead.org/" target=3D"_blank" rel=3D"nofollow" onmouse=
down=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Flists.=
infradead.org%2F\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGfzdcqChpL6dlzvORs=
f8ll1F35lQ&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google=
.com/url?q\x3dhttp%3A%2F%2Flists.infradead.org%2F\x26sa\x3dD\x26sntz\x3d1\x=
26usg\x3dAFQjCNGfzdcqChpL6dlzvORsf8ll1F35lQ&#39;;return true;">http://lists=
.infradead.org/</a>pip<wbr>ermail/linux-arm-kernel/2015-<wbr>September/3688=
87.html<br>
                    <br>
                    Olliver<br>
                    <br>
                    <blockquote type=3D"cite">
                      <div dir=3D"ltr"><br>
                        Best regards<br>
                        <br>
                        Chris<br>
                        <br>
                        On Wednesday, May 4, 2016 at 3:52:17 PM UTC+3,
                        Olliver Schinagl wrote:
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
;margin-left:0.8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Radosla=
v, <br>
                          <br>
                          On 04-05-16 14:30, Radoslav Kolev wrote: <br>
                          &gt; 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai
                          &lt;<a>we...-jdAy2FN1RRM@public.gmane.org</a>&gt;:
                          <br>
                          &gt;&gt; On Tue, May 3, 2016 at 3:21 PM,
                          Olliver Schinagl &lt;<a>oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org</a>&gt=
;


                          wrote: <br>
                          &gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 bus-w=
idth =3D
                          &lt;4&gt;; <br>
                          &gt;&gt;&gt;&gt; Only 4 bits? We normally see
                          eMMC with 8 bits. 4 bits are some kind of <br>
                          &gt;&gt;&gt;&gt; embedded SD card. <br>
                          &gt;&gt;&gt; On A20 as well? Our
                          investigations so far have concluded that the
                          A10 and <br>
                          &gt;&gt;&gt; A20 have those pins not mapped
                          out to pads. The IP does support it however <br>
                          &gt;&gt;&gt; we assume. <br>
                          &gt;&gt; You&#39;re right. My bad. First time
                          A10/A20 sees eMMC support. <br>
                          &gt; I can&#39;t say anything about A10/A20, but =
I
                          have a board with A13 and <br>
                          &gt; the same eMMC chip and it works fine in 8
                          bit mode. <br>
                          Yep, sun5i actually brings them all out to
                          pads, the A20 however does <br>
                          not :( We first thought that the A20 would
                          also be an 8bitter, because <br>
                          the mmc IP appears to be the same as sun5i,
                          but initial tests show it is <br>
                          not. As for A10, it has older IP and it might
                          not even support 8 bit <br>
                          mode, let alone bring out the pins. <br>
                          <br>
                          But with A20&#39;s + eMMC being available via the
                          lime2, others may repeat <br>
                          my experiments! The lime2 is 8 bit connected.
                          <br>
                          <br>
                          Olliver <br>
                          &gt; <br>
                          &gt; Regards, <br>
                          &gt; Radoslav <br>
                          <br>
                        </blockquote>
                      </div>
                    </blockquote>
                    <br>
                  </div>
                </blockquote>
              </div>
            </blockquote>
            <br>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_4178_839273576.1462382682470--

------=_Part_4177_881679067.1462382682466--

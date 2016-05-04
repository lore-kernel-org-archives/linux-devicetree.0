From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 17:09:39 +0200
Message-ID: <572A10B3.2020803@schinagl.nl>
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
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------040009050504030702080107"
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBNVBVC4QKGQE5T5QOVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2e745ef7-ddc0-40fc-b867-414543690276-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------040009050504030702080107
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Christo,

On 04-05-16 16:31, Christo Radev wrote:
> Tanks Oliver,
>
> It could be the problem to get 8-bit access working.
>
> Unfortunately, I do not see where to make this changes because=20
> original dts files=20
> <https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tre=
e/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts?id=3Drefs/tags/v4.5.2>=20
> are used in Armbian build.
> I also see '/SUNXI_PINCTRL_PIN/' and '/SUNXI_FUNCTION/' may require=20
> some patches in addition.
check out drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c

my patch should still work aginst that.
>
> I am ready to make 8-bit eMMC access tests again so could you help me=20
> with the needed staff it has to be used.
I don't mind, but lets take it off list for that :)

Olliver
>
> Best regards
> Chris
>
> On Wednesday, May 4, 2016 at 4:59:52 PM UTC+3, Olliver Schinagl wrote:
>
>     Hey Christo,
>
>     On 04-05-16 15:32, Christo Radev wrote:
>>     Hi Oliver,
>>
>>     I do: that
>>     http://forum.armbian.com/index.php/topic/853-armbian-customization/p=
age-2#entry7359
>>     <http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7359>
>>     The syntax error seen there was fixed and the result is:
>>     http://forum.armbian.com/index.php/topic/853-armbian-customization/p=
age-2#entry7361
>>     <http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7361>
>     Nope, you are still forgetting and seeing an 'unsupported
>     function' error because of it.
>
>     You forgot to add:
>
>     >>>/SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12), />>>/SUNXI_FUNCTION(0x0, "gpi=
o_in"), />>>/SUNXI_FUNCTION(0x1, "gpio_out"), />>>/- SUNXI_FUNCTION(0x2, "n=
and0")), /* NDQ4 */ />>>/+ SUNXI_FUNCTION(0x2, "nand0"), /* NDQ4 */ />>>/+ =
SUNXI_FUNCTION(0x3, "mmc2")), /* D4 */ />>>/SUNXI_PIN(SUNXI_PINCTRL_PIN(C, =
13), />>>/SUNXI_FUNCTION(0x0, "gpio_in"), />>>/SUNXI_FUNCTION(0x1, "gpio_ou=
t"), />>>/- SUNXI_FUNCTION(0x2, "nand0")), /* NDQ5 */ />>>/+ SUNXI_FUNCTION=
(0x2, "nand0"), /* NDQ5 */ />>>/+ SUNXI_FUNCTION(0x3, "mmc2")), /* D5 */ />=
>>/SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14), />>>/SUNXI_FUNCTION(0x0, "gpio_in"),=
 />>>/SUNXI_FUNCTION(0x1, "gpio_out"), />>>/- SUNXI_FUNCTION(0x2, "nand0"))=
, /* NDQ6 */ />>>/+ SUNXI_FUNCTION(0x2, "nand0"), /* NDQ6 */ />>>/+ SUNXI_F=
UNCTION(0x3, "mmc2")), /* D6 */ />>>/SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15), />=
>>/SUNXI_FUNCTION(0x0, "gpio_in"), />>>/SUNXI_FUNCTION(0x1, "gpio_out"), />=
>>/- SUNXI_FUNCTION(0x2, "nand0")), /* NDQ7 */ />>>/+ SUNXI_FUNCTION(0x2, "=
nand0"), /* NDQ7 */ />>>/+ SUNXI_FUNCTION(0x3, "mmc2")), /* D7 *//
>
>
>     to actually get the pin functions.
>>
>>     The same tests was done on legacy kernel 3.4.111 modifying fex
>>     file and the result is the same:
>>     http://forum.armbian.com/index.php/topic/853-armbian-customization/p=
age-2#entry7265
>>     <http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7265>
>>
>>
>>     Best regards
>>     Chris
>>
>>
>>     On Wednesday, May 4, 2016 at 4:19:20 PM UTC+3, Olliver Schinagl
>>     wrote:
>>
>>         Hey Christo,
>>
>>         On 04-05-16 15:07, Christo Radev wrote:
>>>         Hi Olliver,
>>>
>>>         I have already test it a few weeks ago and definitely can
>>>         say that 8-bit bus did not work on A20-Olinuxino-Lime2-eMMC
>>>         with mainline kernel.
>>>         See may post here
>>>         <http://forum.armbian.com/index.php/topic/853-armbian-customiza=
tion/page-2#entry7361>.
>>         I saw, but you forgot to define the pins for 4.x :)
>>
>>         See my patch from earlier:
>>         http://lists.infradead.org/pipermail/linux-arm-kernel/2015-Septe=
mber/368887.html
>>         <http://lists.infradead.org/pipermail/linux-arm-kernel/2015-Sept=
ember/368887.html>
>>
>>         Olliver
>>
>>>
>>>         Best regards
>>>
>>>         Chris
>>>
>>>         On Wednesday, May 4, 2016 at 3:52:17 PM UTC+3, Olliver
>>>         Schinagl wrote:
>>>
>>>             Hey Radoslav,
>>>
>>>             On 04-05-16 14:30, Radoslav Kolev wrote:
>>>             > 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai <we...-jdAy2FN1RRM@public.gmane.org>:
>>>             >> On Tue, May 3, 2016 at 3:21 PM, Olliver Schinagl
>>>             <oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> wrote:
>>>             >>>>> +       bus-width =3D <4>;
>>>             >>>> Only 4 bits? We normally see eMMC with 8 bits. 4
>>>             bits are some kind of
>>>             >>>> embedded SD card.
>>>             >>> On A20 as well? Our investigations so far have
>>>             concluded that the A10 and
>>>             >>> A20 have those pins not mapped out to pads. The IP
>>>             does support it however
>>>             >>> we assume.
>>>             >> You're right. My bad. First time A10/A20 sees eMMC
>>>             support.
>>>             > I can't say anything about A10/A20, but I have a board
>>>             with A13 and
>>>             > the same eMMC chip and it works fine in 8 bit mode.
>>>             Yep, sun5i actually brings them all out to pads, the A20
>>>             however does
>>>             not :( We first thought that the A20 would also be an
>>>             8bitter, because
>>>             the mmc IP appears to be the same as sun5i, but initial
>>>             tests show it is
>>>             not. As for A10, it has older IP and it might not even
>>>             support 8 bit
>>>             mode, let alone bring out the pins.
>>>
>>>             But with A20's + eMMC being available via the lime2,
>>>             others may repeat
>>>             my experiments! The lime2 is 8 bit connected.
>>>
>>>             Olliver
>>>             >
>>>             > Regards,
>>>             > Radoslav
>>>
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--------------040009050504030702080107
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type=
">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Christo,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 04-05-16 16:31, Christo Radev wrote:<=
br>
    </div>
    <blockquote
      cite=3D"mid:2e745ef7-ddc0-40fc-b867-414543690276-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr">Tanks Oliver,<br>
        <br>
        It could be the problem to get 8-bit access working.<br>
        <br>
        Unfortunately, I do not see where to make this changes because <a
          moz-do-not-send=3D"true"
href=3D"https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.gi=
t/tree/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts?id=3Drefs/tags/v4.5.=
2">original
          dts files</a> are used in Armbian build.<br>
        I also see '<i>SUNXI_PINCTRL_PIN</i>' and '<i>SUNXI_FUNCTION</i>'
        may require some patches in addition.<br>
      </div>
    </blockquote>
    check out drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c<br>
    <br>
    my patch should still work aginst that.<br>
    <blockquote
      cite=3D"mid:2e745ef7-ddc0-40fc-b867-414543690276-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr"><br>
        I am ready to make 8-bit eMMC access tests again so could you
        help me with the needed staff it has to be used.<br>
      </div>
    </blockquote>
    I don't mind, but lets take it off list for that :)<br>
    <br>
    Olliver<br>
    <blockquote
      cite=3D"mid:2e745ef7-ddc0-40fc-b867-414543690276-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr"><br>
        Best regards<br>
        Chris<br>
        <br>
        On Wednesday, May 4, 2016 at 4:59:52 PM UTC+3, Olliver Schinagl
        wrote:
        <blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left:
          0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
          <div bgcolor=3D"#FFFFFF" text=3D"#000000"> Hey Christo,<br>
            <br>
            <div>On 04-05-16 15:32, Christo Radev wrote:<br>
            </div>
            <blockquote type=3D"cite">
              <div dir=3D"ltr">Hi Oliver,<br>
                <br>
                I do: that
                <a moz-do-not-send=3D"true"
href=3D"http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7359"
                  target=3D"_blank" rel=3D"nofollow"
                  onmousedown=3D"this.href=3D'http://www.google.com/url?q\x=
3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customiz=
ation%2Fpage-2%23entry7359\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH5u6ETws=
26SAQHFNCGkmh0s_a--g';return
                  true;"
                  onclick=3D"this.href=3D'http://www.google.com/url?q\x3dht=
tp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customizatio=
n%2Fpage-2%23entry7359\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH5u6ETws26SA=
QHFNCGkmh0s_a--g';return
                  true;">http://forum.armbian.com/<wbr>index.php/topic/853-=
armbian-<wbr>customization/page-2#entry7359</a><br>
                The syntax error seen there was fixed and the result is:
                <a moz-do-not-send=3D"true"
href=3D"http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7361"
                  target=3D"_blank" rel=3D"nofollow"
                  onmousedown=3D"this.href=3D'http://www.google.com/url?q\x=
3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customiz=
ation%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJsEMhE0=
Sir_4R5oOoGRnKYa0slg';return
                  true;"
                  onclick=3D"this.href=3D'http://www.google.com/url?q\x3dht=
tp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customizatio=
n%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJsEMhE0Sir_=
4R5oOoGRnKYa0slg';return
                  true;">http://forum.armbian.com/<wbr>index.php/topic/853-=
armbian-<wbr>customization/page-2#entry7361</a><br>
              </div>
            </blockquote>
            Nope, you are still forgetting and seeing an 'unsupported
            function' error because of it.<br>
            <br>
            You forgot to add:<br>
            <br>
            <pre>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12=
),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, "gpio_in"),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, "gpio_out"),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, "nand0")),       =
 /* NDQ4 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, "nand0"),        =
 /* NDQ4 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, "mmc2")),        =
 /* D4 */
</i>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, "gpio_in"),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, "gpio_out"),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, "nand0")),       =
 /* NDQ5 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, "nand0"),        =
 /* NDQ5 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, "mmc2")),        =
 /* D5 */
</i>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, "gpio_in"),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, "gpio_out"),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, "nand0")),       =
 /* NDQ6 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, "nand0"),        =
 /* NDQ6 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, "mmc2")),        =
 /* D6 */
</i>&gt;&gt;&gt;<i>          SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x0, "gpio_in"),
</i>&gt;&gt;&gt;<i>                    SUNXI_FUNCTION(0x1, "gpio_out"),
</i>&gt;&gt;&gt;<i> -                 SUNXI_FUNCTION(0x2, "nand0")),       =
 /* NDQ7 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x2, "nand0"),        =
 /* NDQ7 */
</i>&gt;&gt;&gt;<i> +                 SUNXI_FUNCTION(0x3, "mmc2")),        =
 /* D7 */</i></pre>
            <br>
            to actually get the pin functions.<br>
            <blockquote type=3D"cite">
              <div dir=3D"ltr"><br>
                The same tests was done on legacy kernel 3.4.111
                modifying fex file and the result is the same:
                <a moz-do-not-send=3D"true"
href=3D"http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7265"
                  target=3D"_blank" rel=3D"nofollow"
                  onmousedown=3D"this.href=3D'http://www.google.com/url?q\x=
3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customiz=
ation%2Fpage-2%23entry7265\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFsHlW6Dp=
cWfYW9wa2q9ogNJ8US_g';return
                  true;"
                  onclick=3D"this.href=3D'http://www.google.com/url?q\x3dht=
tp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-customizatio=
n%2Fpage-2%23entry7265\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFsHlW6DpcWfY=
W9wa2q9ogNJ8US_g';return
                  true;">http://forum.armbian.com/<wbr>index.php/topic/853-=
armbian-<wbr>customization/page-2#entry7265</a><br>
                <br>
                <br>
                Best regards<br>
                Chris<br>
                <br>
                <br>
                On Wednesday, May 4, 2016 at 4:19:20 PM UTC+3, Olliver
                Schinagl wrote:
                <blockquote class=3D"gmail_quote"
                  style=3D"margin:0;margin-left:0.8ex;border-left:1px #ccc
                  solid;padding-left:1ex">
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
                        See may post <a moz-do-not-send=3D"true"
href=3D"http://forum.armbian.com/index.php/topic/853-armbian-customization/=
page-2#entry7361"
                          rel=3D"nofollow" target=3D"_blank"
                          onmousedown=3D"this.href=3D'http://www.google.com=
/url?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-=
customization%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCN=
HJsEMhE0Sir_4R5oOoGRnKYa0slg';return
                          true;"
                          onclick=3D"this.href=3D'http://www.google.com/url=
?q\x3dhttp%3A%2F%2Fforum.armbian.com%2Findex.php%2Ftopic%2F853-armbian-cust=
omization%2Fpage-2%23entry7361\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNHJsE=
MhE0Sir_4R5oOoGRnKYa0slg';return
                          true;">here</a>.<br>
                      </div>
                    </blockquote>
                    I saw, but you forgot to define the pins for 4.x :)<br>
                    <br>
                    See my patch from earlier: <a
                      moz-do-not-send=3D"true"
href=3D"http://lists.infradead.org/pipermail/linux-arm-kernel/2015-Septembe=
r/368887.html"
                      rel=3D"nofollow" target=3D"_blank"
                      onmousedown=3D"this.href=3D'http://www.google.com/url=
?q\x3dhttp%3A%2F%2Flists.infradead.org%2Fpipermail%2Flinux-arm-kernel%2F201=
5-September%2F368887.html\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNG58Mu-lGU=
LS_w3sxXaj81hwQG6Eg';return
                      true;"
                      onclick=3D"this.href=3D'http://www.google.com/url?q\x=
3dhttp%3A%2F%2Flists.infradead.org%2Fpipermail%2Flinux-arm-kernel%2F2015-Se=
ptember%2F368887.html\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNG58Mu-lGULS_w=
3sxXaj81hwQG6Eg';return
                      true;"><a class=3D"moz-txt-link-freetext" href=3D"htt=
p://lists.infradead.org/">http://lists.infradead.org/</a><wbr>pipermail/lin=
ux-arm-kernel/<wbr>2015-September/368887.html</a><br>
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
                        <blockquote class=3D"gmail_quote"
                          style=3D"margin:0;margin-left:0.8ex;border-left:1=
px
                          #ccc solid;padding-left:1ex">Hey Radoslav, <br>
                          <br>
                          On 04-05-16 14:30, Radoslav Kolev wrote: <br>
                          &gt; 2016-05-03 10:25 GMT+03:00 Chen-Yu Tsai
                          &lt;<a moz-do-not-send=3D"true">we...-jdAy2FN1RRM@public.gmane.org</a=
>&gt;:
                          <br>
                          &gt;&gt; On Tue, May 3, 2016 at 3:21 PM,
                          Olliver Schinagl &lt;<a moz-do-not-send=3D"true">=
oli...-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org</a>&gt;


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
                          &gt;&gt; You're right. My bad. First time
                          A10/A20 sees eMMC support. <br>
                          &gt; I can't say anything about A10/A20, but I
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
                          But with A20's + eMMC being available via the
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
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--------------040009050504030702080107--

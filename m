Return-Path: <SRS0=48tE=NL=monstr.eu=monstr@kernel.org>
MIME-Version: 1.0
References: <20181029094245.7886-1-manivannan.sadhasivam@linaro.org> <CACRpkdYThcGjdV9Ezs4qMr8K6_jH40SDUgt0Tps8d+_4sSESyg@mail.gmail.com>
In-Reply-To: <CACRpkdYThcGjdV9Ezs4qMr8K6_jH40SDUgt0Tps8d+_4sSESyg@mail.gmail.com>
From: Michal Simek <monstr@monstr.eu>
Date: Wed, 31 Oct 2018 16:46:48 +0100
Message-ID: <CAHTX3dJTXtuA0i-ffPjoiWuxEcF_5JY55VJtWd9zxW4HxK1K3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Standardize onboard LED support for 96Boards
Content-Type: multipart/alternative; boundary="000000000000884fd40579883608"
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, xuwei5@hisilicon.com, LKML <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, nicolas.dechesne@linaro.org, koen.kooi@linaro.org, linux-arm <linux-arm-kernel@lists.infradead.org>, Pavel Machek <pavel@ucw.cz>, Andy Gross <andy.gross@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, ezequiel@collabora.com, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000884fd40579883608
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

st 31. 10. 2018 v 14:39 odes=C3=ADlatel Linus Walleij <linus.walleij@linaro=
.org>
napsal:

> On Mon, Oct 29, 2018 at 10:43 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
>
> > This patchset standardizes the onboard LEDs on 96Boards by maintaining
> > common labels and triggers as below:
> >
> > green:user1  default-trigger: heartbeat
> > green:user2  default-trigger: mmc0/disk-activity (onboard-storage)
> > green:user3  default-trigger: mmc1 (SD card)
> > green:user4  default-trigger: none, panic-indicator
> > yellow:wlan  default-trigger: phy0tx
> > blue:bt      default-trigger: hci0-power
> >
> > This standardization is required to provide a common behaviour of LEDs
> > across all mainline supported 96Boards and also making it easier to
> > control it using an userspace library like MRAA.
> >
> > For Rock960 and Ficus boards, the LED support is added in this patchset=
.
> > Rest of the boards are converted to adopt the standard.
> >
> > Note: Since there is no UFS trigger available for now, user2 LED trigge=
r
> > is set to none on HiKey960.
>
> This series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> It makes a lot of sense to try to unify the userspace ABI so we get
> some kind of order here instead of trying to counteract it with
> per-device kludges in userspace. It definately makes things better!
>

No doubt about it that this is good. If this is there from day 1 all will
be good.
I am just saying that we are all the time
saying that we shouldn't break userspace. Right now if there is single
application
which uses existing names we are breaking it.

Thanks,
Michal



---
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform

--000000000000884fd40579883608
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">st 31. 10. 2018 v=C2=A014:39 odes=C3=ADlatel Linus Walleij &lt;<a href=3D=
"mailto:linus.walleij@linaro.org">linus.walleij@linaro.org</a>&gt; napsal:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Mon, Oct 29, 2018 at 10:43 AM Ma=
nivannan Sadhasivam<br>
&lt;<a href=3D"mailto:manivannan.sadhasivam@linaro.org" target=3D"_blank">m=
anivannan.sadhasivam@linaro.org</a>&gt; wrote:<br>
<br>
&gt; This patchset standardizes the onboard LEDs on 96Boards by maintaining=
<br>
&gt; common labels and triggers as below:<br>
&gt;<br>
&gt; green:user1=C2=A0 default-trigger: heartbeat<br>
&gt; green:user2=C2=A0 default-trigger: mmc0/disk-activity (onboard-storage=
)<br>
&gt; green:user3=C2=A0 default-trigger: mmc1 (SD card)<br>
&gt; green:user4=C2=A0 default-trigger: none, panic-indicator<br>
&gt; yellow:wlan=C2=A0 default-trigger: phy0tx<br>
&gt; blue:bt=C2=A0 =C2=A0 =C2=A0 default-trigger: hci0-power<br>
&gt;<br>
&gt; This standardization is required to provide a common behaviour of LEDs=
<br>
&gt; across all mainline supported 96Boards and also making it easier to<br=
>
&gt; control it using an userspace library like MRAA.<br>
&gt;<br>
&gt; For Rock960 and Ficus boards, the LED support is added in this patchse=
t.<br>
&gt; Rest of the boards are converted to adopt the standard.<br>
&gt;<br>
&gt; Note: Since there is no UFS trigger available for now, user2 LED trigg=
er<br>
&gt; is set to none on HiKey960.<br>
<br>
This series:<br>
Reviewed-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@linaro.org" =
target=3D"_blank">linus.walleij@linaro.org</a>&gt;<br>
<br>
It makes a lot of sense to try to unify the userspace ABI so we get<br>
some kind of order here instead of trying to counteract it with<br>
per-device kludges in userspace. It definately makes things better!<br></bl=
ockquote></div></div><div><br></div><div>No doubt about it that this is goo=
d. If this is there from day 1 all will be good.</div><div> I am just sayin=
g that we are all the time</div><div>saying that we shouldn&#39;t break use=
rspace. Right now if there is single application</div><div>which uses exist=
ing names we are breaking it.</div><div><br></div><div>Thanks,</div><div>Mi=
chal<br></div><div><br></div><div><br></div><div><br></div><div>---<br><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">M=
ichal Simek, Ing. (M.Eng), OpenPGP -&gt; KeyID: FE3D1F91<br>w: <a href=3D"h=
ttp://www.monstr.eu" target=3D"_blank">www.monstr.eu</a> p: +42-0-721842854=
<br>Maintainer of Linux kernel - Microblaze cpu - <a href=3D"http://www.mon=
str.eu/fdt/" target=3D"_blank">http://www.monstr.eu/fdt/</a><br>Maintainer =
of Linux kernel - Xilinx Zynq ARM architecture<br>Microblaze U-BOOT custodi=
an and responsible for u-boot arm zynq platform</div></div></div>

--000000000000884fd40579883608--

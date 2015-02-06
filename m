Return-Path: <wangbintian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANMBJr7wx=BwDK9inc-2LdXQhyv-tZZry86Ojr=oH8z53Un76Q@mail.gmail.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
	<CANMBJr685FzZzQ660Z1aNJX+Kzkw1OqM6RJAviARbL+5a=MJ2A@mail.gmail.com>
	<CAOesGMgjv9iLnLmpLADQYoAw=oUkJDAJs72Q5q=DQ75paQ+A-g@mail.gmail.com>
	<CANMBJr7wx=BwDK9inc-2LdXQhyv-tZZry86Ojr=oH8z53Un76Q@mail.gmail.com>
Date: Fri, 6 Feb 2015 12:21:43 +0800
Message-ID: <CAAS=xmhj8UMwooYrXQBqzR=J5ernj+EWGV1AqEtHHoWiBgw8gA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64,hi6220: Enable Hisilicon Hi6220 SoC
From: Brent Wang <wangbintian@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc14380bfa8d050e63c2ef
To: Tyler Baker <tyler.baker@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Bintian Wang <bintian.wang@huawei.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@linaro.org>, Zhangfei Gao <zhangfei.gao@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Xu Wei <xuwei5@hisilicon.com>, Jaehoon Chung <jh80.chung@samsung.com>, Haifeng Yan <yanhaifeng@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Guodong Xu <guodong.xu@linaro.org>, dan.zhao@hisilicon.com, "huxinwei@huawei.com" <huxinwei@huawei.com>, xuyiping@hisilicon.com, victor.lixin@hisilicon.com, btw@mail.itp.ac.cn, puck.chen@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, XinWei Kong <kong.kongxinwei@hisilicon.com>, heyunlei@huawei.com, w.f@huawei.com, z.liuxinliang@huawei.com
List-ID: <devicetree@vger.kernel.org>

--047d7bdc14380bfa8d050e63c2ef
Content-Type: text/plain; charset=UTF-8

Hello Olof and Tyler,

2015-02-06 7:52 GMT+08:00 Tyler Baker <tyler.baker@linaro.org>:

> On 5 February 2015 at 11:02, Olof Johansson <olof@lixom.net> wrote:
> > On Thu, Feb 5, 2015 at 10:46 AM, Tyler Baker <tyler.baker@linaro.org>
> wrote:
> >> Hi Bintian,
> >>
> >> On 5 February 2015 at 01:24, Bintian Wang <bintian.wang@huawei.com>
> wrote:
> >>> Hello,
> >>>
> >>> Hi6220 is one mobile solution of Hisilicon, this patchset contains
> >>> initial support for Hi6220 SoC and HiKey development board, which
> >>> is based on ARM Cortex A53 architecture. Initial support is minimal
> >>> and includes just the arch configuration, clock driver, device tree
> >>> configuration.
> >>>
> >>> Many peripheral drivers will be submitted later.
> >>>
> >>> Any comments will be appreciated!
> >>>
> >>> Thanks,
> >>>
> >>> Bintian Wang (3):
> >>>   arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
> >>>   clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
> >>>   arm64: dts: Add dts files for Hisilicon Hi6220 SoC
> >>
> >> Thanks for posting these! I've applied this series on top of
> >> next-20150204, however there was some fuzz that needed to be cleaned
> >> up on 3/3 [1]. I've confirmed the platform is booting to a basic user
> >> space without issue.
> >
> > From ramdisk only, right?
>
> Correct, ramdisk only.
>
> > Given the timing of the posting of this
> > patch set, I'm not going to merge it for 3.20. Hopefully for 3.21
> > there will be some more peripheral support as well -- at least some
> > sort of storage device.
>
> Seem fair to me. I also hope to see more patches posted shortly.
>
Yes, the mmc and sd drivers will be submitted soon, should they be included
in this patchset?  I have thought submitting this patch first for review,
if there
is no problem for this patchset and then submit other drivers, you know,
other
drivers will depend on this patchset.

Thanks,

>
> >
> > -Olof
>
> Cheers,
>
> Tyler
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>


-- 
Best Regards,

Bintian
===========================
Don't be nervous, just be happy!

--047d7bdc14380bfa8d050e63c2ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Olof and Tyler,<br><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">2015-02-06 7:52 GMT+08:00 Tyler Baker <span dir=3D=
"ltr">&lt;<a href=3D"mailto:tyler.baker@linaro.org" target=3D"_blank">tyler=
.baker@linaro.org</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On 5 February 2015 at 11:02, Olof Johansson &lt;<a href=3D"mailto=
:olof@lixom.net">olof@lixom.net</a>&gt; wrote:<br>
&gt; On Thu, Feb 5, 2015 at 10:46 AM, Tyler Baker &lt;<a href=3D"mailto:tyl=
er.baker@linaro.org">tyler.baker@linaro.org</a>&gt; wrote:<br>
&gt;&gt; Hi Bintian,<br>
&gt;&gt;<br>
&gt;&gt; On 5 February 2015 at 01:24, Bintian Wang &lt;<a href=3D"mailto:bi=
ntian.wang@huawei.com">bintian.wang@huawei.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi6220 is one mobile solution of Hisilicon, this patchset cont=
ains<br>
&gt;&gt;&gt; initial support for Hi6220 SoC and HiKey development board, wh=
ich<br>
&gt;&gt;&gt; is based on ARM Cortex A53 architecture. Initial support is mi=
nimal<br>
&gt;&gt;&gt; and includes just the arch configuration, clock driver, device=
 tree<br>
&gt;&gt;&gt; configuration.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Many peripheral drivers will be submitted later.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Any comments will be appreciated!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Bintian Wang (3):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0arm64: Enable Hisilicon ARMv8 SoC family in Kconfi=
g and defconfig<br>
&gt;&gt;&gt;=C2=A0 =C2=A0clk: hi6220: Clock driver support for Hisilicon hi=
6220 SoC<br>
&gt;&gt;&gt;=C2=A0 =C2=A0arm64: dts: Add dts files for Hisilicon Hi6220 SoC=
<br>
&gt;&gt;<br>
&gt;&gt; Thanks for posting these! I&#39;ve applied this series on top of<b=
r>
&gt;&gt; next-20150204, however there was some fuzz that needed to be clean=
ed<br>
&gt;&gt; up on 3/3 [1]. I&#39;ve confirmed the platform is booting to a bas=
ic user<br>
&gt;&gt; space without issue.<br>
&gt;<br>
&gt; From ramdisk only, right?<br>
<br>
</span>Correct, ramdisk only.<br>
<span class=3D""><br>
&gt; Given the timing of the posting of this<br>
&gt; patch set, I&#39;m not going to merge it for 3.20. Hopefully for 3.21<=
br>
&gt; there will be some more peripheral support as well -- at least some<br=
>
&gt; sort of storage device.<br>
<br>
</span>Seem fair to me. I also hope to see more patches posted shortly.<br>=
</blockquote><div>Yes, the mmc and sd drivers will be submitted soon, shoul=
d they be included<br></div><div>in this patchset?=C2=A0 I have thought sub=
mitting this patch first for review, if there<br>is no problem for this pat=
chset and then submit other drivers, you know, other<br></div><div>drivers =
will depend on this patchset. <br></div><div><br></div><div>Thanks,<br><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
&gt;<br>
&gt;<br>
&gt; -Olof<br>
<br>
Cheers,<br>
<br>
Tyler<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-kernel=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><b=
r>
Please read the FAQ at=C2=A0 <a href=3D"http://www.tux.org/lkml/" target=3D=
"_blank">http://www.tux.org/lkml/</a><br>
</div></div></blockquote></div><br><br>-- <br><div class=3D"gmail_signature=
">Best Regards,<br><br>Bintian<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Don&#39;t be nervous, just be=
 happy! <br></div>
</div></div>

--047d7bdc14380bfa8d050e63c2ef--

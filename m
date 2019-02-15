From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: h6: Add CPU Operating
 Performance Points table
Date: Fri, 15 Feb 2019 22:09:51 +0800
Message-ID: <CAEExFWt84MmpoWeibVf4bBJXOuPy9P7RrAFmEx304zz5z1GHwQ@mail.gmail.com>
References: <20190214130910.9201-1-tiny.windzz@gmail.com> <20190214130910.9201-5-tiny.windzz@gmail.com>
 <20190214143842.nqsh6trwdjxq2ecd@flea> <CAEExFWuxrVC1J0g93R3ifaDxOGy-20B4jftoHw932V7+wqhtxw@mail.gmail.com>
 <CAEExFWv_K_07e30dgPbafVhDD_smwZkpi6Fqk6yzCahesdnrGg@mail.gmail.com> <20190215135613.sdz56vtiawqeryi5@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215135613.sdz56vtiawqeryi5@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, mark.rutland@arm.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 9:56 PM Maxime Ripard <maxime.ripard@bootlin.com> w=
rote:
>
> Hi
>
> On Fri, Feb 15, 2019 at 12:56:03AM +0800, Frank Lee wrote:
> > How about to implement a thermal driver that is not integrated with
> > gpadc =EF=BC=9F
> >
> > GPADC on soc is rarely used now.
>
> You mean GPADC in general, or the gpadc driver in particular?
> Otherwise, yes, having a driver for the thermal sensor in the H6
> sounds like a good plan for thermal throttling, but I don't see it as
> a dependency for that whole series.
At present, sunxi's thermal driver is integrated with the gpadc driver.
I have a idea to implement the thermal driver alone. I haven't started yet,
and it may take a while to do it.

How about the plan to implement a thermal drive alone and put i
under drivers/thermal?

In addition to the cpu dvfs of H6, patch v2 has been sent.

Thanks,
Yangtao
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

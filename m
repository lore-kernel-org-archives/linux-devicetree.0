From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH 0/4] clk: Provide support for always-on
 clocks
Date: Thu, 2 Apr 2015 11:52:09 +0100
Message-ID: <20150402105209.GA9447@x1>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
 <20150402081210.GB3567@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150402081210.GB3567@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mturquette@linaro.org, sboyd@codeaurora.org, kernel@stlinux.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 02 Apr 2015, Peter Griffin wrote:

> Hi Lee,
>=20
> On Fri, 27 Feb 2015, Lee Jones wrote:
>=20
> > Some hardware contains bunches of clocks which must never be
> > turned off.  If drivers a) fail to obtain a reference to any
> > of these or b) give up a previously obtained reference
> > during suspend, the common clk framework will attempt to
> > disable them and a platform can fail irrecoverably as a
> > result.  Usually the only way to recover from these failures
> > is to reboot.
> >=20
> > To avoid either of these two scenarios from catastrophically
> > disabling an otherwise perfectly healthy running system,
> > clocks can be identified as always-on using this property
> > from inside a clocksource's node.  The CLK_IGNORE_UNUSED
> > flag will be applied to each clock instance named in this
> > property, thus preventing them from being shut down by the
> > framework.
>=20
> Great stuff.
>=20
> One minor comment is that assuming this works on stih407 and stih410
> to the extent that the platform can now boot without clk_ignore_unuse=
d
> kenel parameter then you should have an additional patch to remove
> clk_ignore_unused from the default bootargs in stih407-b2120.dts and
> stih410-b2120.dts files.

It's already on my TODO list:

TODO:
  - Clock Domain
    - Once the clk domain driver has been accepted, remove early return=
s in SPI driver
    - Remove clk_ignore_unused from the DT files
    - Add LMI1 clk to STiH418

> Maxime - Is it possible for you to test this series on stih418-b2199 =
as
> a well? As it could most likely also be removed from stih418-b2199.dt=
s file
> to, but neither Lee or myself have the hardware to test.

Take a look at the third item on my TODO. :)

Yes Maxime, if you can test the set once I've completed item 3, that
would be splendid.

> Apart from that, for the series: -
>  Acked-by: Peter Griffin <peter.griffin@linaro.org>

Thanks Peter.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

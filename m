From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v2 RESEND 2/2] mfd: arizona: Update DT
 binding to support OUTn_MONO init_data
Date: Tue, 20 Jan 2015 16:02:48 +0000
Message-ID: <20150120160248.GK13701@x1>
References: <1420185829-24886-1-git-send-email-ideal.song@samsung.com>
 <1420185829-24886-3-git-send-email-ideal.song@samsung.com>
 <20150120122005.GA13701@x1>
 <20150120132001.GA21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150120132001.GA21293@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Inha Song <ideal.song@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, ckeepax@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, 20 Jan 2015, Mark Brown wrote:

> On Tue, Jan 20, 2015 at 12:20:05PM +0000, Lee Jones wrote:
> > On Fri, 02 Jan 2015, Inha Song wrote:
>=20
> > > This patch update DT binding to support OUTn_MONO init_data. Each
> > > output signal can be configurated as a mono differential output.
> > > The mono differential configuration is selected using the OUTn_MO=
NO
> > > registers.
>=20
> > This requires a DT Ack and an entry in the example.
>=20
> The DT maintainers have said they're OK with maintainers just merging
> things if they're comfortable with it (see the bindings specific
> submitting-patches.txt) and given their workload and general resultin=
g
> responsiveness it's going to make it difficult go get anything done.

I only tend to poke the DT guys when I am unsure of something in the
binding.  In this case it was a doubt whether we should be encoding
register values inside a property like this.

I would also be happy to take it with your Ack if you're happy with
it?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

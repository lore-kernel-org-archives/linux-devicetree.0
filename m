From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v6 00/18] Add support for FDMA DMA controller and slim
 core rproc found on STi chipsets
Date: Wed, 6 Jul 2016 20:49:21 +0100
Message-ID: <20160706194921.GA7213@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
 <1467823249.8360.28.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467823249.8360.28.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Wed, 06 Jul 2016, Joe Perches wrote:

> On Wed, 2016-07-06 at 09:54 +0100, Peter Griffin wrote:
> > This patchset adds support for the Flexible Direct Memory Access (F=
DMA) core
> > found on STi chipsets from STMicroelectronics. The FDMA is a slim c=
ore CPU
> > with a dedicated firmware. It is a general purpose DMA controller s=
upporting
> > 16 independent channels and data can be moved from memory to memory=
 or between
> > memory and paced latency critical real time targets.
> []
> > =A0include/linux/remoteproc/st_slim_rproc.h=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0|=A0=A053 ++
>=20
> Is this directory really necessary?

Yes, I believe so.

>=20
> Why shouldn't this file be local to drivers/remoteproc/?

Because it has to be included by the various client drivers which are b=
ased
around the slim core IP. Currently drivers/dma/st_fdma.c but also in th=
e future
LDVB demux driver.

regards,

Peter.

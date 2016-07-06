From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v6 00/18] Add support for FDMA DMA controller and slim
 core rproc found on STi chipsets
Date: Wed, 06 Jul 2016 09:40:49 -0700
Message-ID: <1467823249.8360.28.camel@perches.com>
References: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-07-06 at 09:54 +0100, Peter Griffin wrote:
> This patchset adds support for the Flexible Direct Memory Access (FDM=
A) core
> found on STi chipsets from STMicroelectronics. The FDMA is a slim cor=
e CPU
> with a dedicated firmware. It is a general purpose DMA controller sup=
porting
> 16 independent channels and data can be moved from memory to memory o=
r between
> memory and paced latency critical real time targets.
[]
> =A0include/linux/remoteproc/st_slim_rproc.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0|=A0=A053 ++

Is this directory really necessary?

Why shouldn't this file be local to drivers/remoteproc/?

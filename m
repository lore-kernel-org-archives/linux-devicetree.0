From: Rob Herring <robh@kernel.org>
Subject: Re: [Patch v4 6/9] driver/edac/fsl_ddr: Add support of little endian
Date: Wed, 10 Aug 2016 17:26:19 -0500
Message-ID: <20160810222619.GA1530@rob-hp-laptop>
References: <1470779760-16483-1-git-send-email-york.sun@nxp.com>
 <1470779760-16483-7-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470779760-16483-7-git-send-email-york.sun@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: York Sun <york.sun@nxp.com>
Cc: linux-edac@vger.kernel.org, morbidrsa@gmail.com, oss@buserror.net, stuart.yoder@nxp.com, bp@alien8.de, Mark Rutland <mark.rutland@arm.com>, Doug Thompson <dougthompson@xmission.com>, mchehab@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 02:55:43PM -0700, York Sun wrote:
> Get endianness from device tree. Both big endian and little endian
> are supported. Default to big endian for backward compatibility to
> MPC85xx.
> 
> Signed-off-by: York Sun <york.sun@nxp.com>
> 
> ---
> Change log
>   v4: Absorb name changes by "Rename macros and names"
>       Drop testing for big-endian as suggested
>       Use of_property_read_bool() as suggested
>   v3: no change
>   v2: Separated from "Add support for ARM-based SoCs" patch
> 
>  .../fsl/ddr.txt}                                   |  2 +
>  drivers/edac/fsl_ddr_edac.c                        | 96 +++++++++++++---------
>  2 files changed, 58 insertions(+), 40 deletions(-)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/mem-ctrlr.txt => memory-controllers/fsl/ddr.txt} (86%)

Acked-by: Rob Herring <robh@kernel.org>

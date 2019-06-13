From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] Documentation: dt: binding: fsl: Add 'little-endian'
 and update Chassis define
Date: Thu, 13 Jun 2019 16:07:29 -0600
Message-ID: <20190613220729.GA29761@bogus>
References: <20190517024748.15534-1-ran.wang_1@nxp.com>
 <20190517024748.15534-2-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517024748.15534-2-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Li Yang <leoyang.li@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, 17 May 2019 10:47:47 +0800, Ran Wang wrote:
> By default, QorIQ SoC's RCPM register block is Big Endian. But
> there are some exceptions, such as LS1088A and LS2088A, are Little
> Endian. So add this optional property to help identify them.
> 
> Actually LS2021A and other Layerscapes won't totally follow Chassis
> 2.1, so separate them from powerpc SoC.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

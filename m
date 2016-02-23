From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/7] bindings: move cpm_qe binding from powerpc/fsl to
 soc/fsl
Date: Tue, 23 Feb 2016 14:24:50 -0600
Message-ID: <20160223202450.GA10076@rob-hp-laptop>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
 <1455757572-44955-4-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455757572-44955-4-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 09:06:09AM +0800, Zhao Qiang wrote:
> cpm_qe is supported on both powerpc and arm.
> and the QE code has been moved from arch/powerpc into
> drivers/soc/fsl, so move cpm_qe binding from powerpc/fsl
> to soc/fsl
> 
> Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v2
> 	- new added
> 
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm.txt     | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/brg.txt | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/i2c.txt | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/pic.txt | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/usb.txt | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/gpio.txt    | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/network.txt | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe.txt      | 0
>  .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/firmware.txt       | 0
>  .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/par_io.txt         | 0
>  .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/pincfg.txt         | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/ucc.txt  | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/usb.txt  | 0
>  Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/serial.txt  | 0
>  .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/uqe_serial.txt        | 0
>  15 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/brg.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/i2c.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/pic.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/usb.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/gpio.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/network.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/firmware.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/par_io.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/pincfg.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/ucc.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/usb.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/serial.txt (100%)
>  rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/uqe_serial.txt (100%)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

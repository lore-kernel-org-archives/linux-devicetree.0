From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/7] QE: Add uqe_serial document to bindings
Date: Wed, 18 May 2016 11:47:16 -0500
Message-ID: <20160518164716.GA32436@rob-hp-laptop>
References: <1463452743-21462-1-git-send-email-qiang.zhao@nxp.com>
 <1463452743-21462-3-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463452743-21462-3-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, xiaobo.xie-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2016 at 10:38:59AM +0800, Zhao Qiang wrote:
> Add uqe_serial document to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v2
> 	- modify tx/rx-clock-name specification
> Changes for v3
> 	- NA 
> Changes for v4
> 	- drop device_type
> 	- modify to SoC specific compatible 
> Changes for v5
> 	- add fsl to compatible as prefix 
> Changes for v6
> 	- modify property to "fsl,<chip>-ucc-uart"
> 
>  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

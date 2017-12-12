From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: devicetree: Add DT bindings to
 xlnx_vcu driver
Date: Tue, 12 Dec 2017 14:07:03 -0600
Message-ID: <20171212200703.nxabyfcjbswwbp4v@rob-hp-laptop>
References: <20171207104757.GA27343@kroah.com>
 <1512682276-6082-1-git-send-email-dshah@xilinx.com>
 <1512682276-6082-2-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512682276-6082-2-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 01:31:15PM -0800, Dhaval Shah wrote:
> Add Device Tree binding document for logicoreIP. This logicoreIP
> provides the isolation between the processing system and
> programmable logic. Also provides the clock related information.
> 
> Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v2:
>  * Describe the h/w
>  * compatible string is updated to make it more specific
>    based on the logicoreIP version.
>  * Removed that encoder and decoder child nodes and relatd properties as that
>    will be a separate driver and dts nodes. other team is working on that.
>  * Updated to use as a single driver.
> 
>  .../devicetree/bindings/misc/xlnx,vcu.txt          | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,vcu.txt

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

One nit. Use "dt-bindings: misc: ..." for the subject.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

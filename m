From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] devicetree: bindings: Document qcom board
 compatible format
Date: Mon, 23 Nov 2015 16:47:22 -0800
Message-ID: <20151124004722.GL19156@codeaurora.org>
References: <1448062280-15406-1-git-send-email-sboyd@codeaurora.org>
 <1448062280-15406-2-git-send-email-sboyd@codeaurora.org>
 <20151122204935.GA465@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151122204935.GA465@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/22, Rob Herring wrote:
> On Fri, Nov 20, 2015 at 03:31:16PM -0800, Stephen Boyd wrote:
> > Some qcom based bootloaders identify the dtb blob based on a set
> > of device properties like SoC, platform, PMIC, and revisions of
> > those components. In downstream kernels, these values are added
> > to the different component dtsi files (i.e. pmic dtsi file, SoC
> > dtsi file, board dtsi file, etc.) via qcom specific DT
> > properties. The dtb files are parsed by a program called dtbTool
> > that picks out these properties and creates a table of contents
> > binary blob with the property information and some offsets into
> > the concatenation of all the dtbs (termed a QCDT image).
> > 
> > The suggestion is to do this via the board compatible string
> > instead, because these qcom specific properties are never used by
> > the kernel. Add a document describing the format of the
> > compatible string that encodes all this information that's
> > currently encoded in the qcom,{msm-id,board-id,pmic-id}
> > properties in downstream devicetrees. Future bootloaders may be
> > updated to look at the compatible field instead of looking for
> > the table of contents image. For non-updateable bootloaders, a
> > new dtbTool program will parse the compatible string and generate
> > a QCDT image from it.
> > 
> > Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Much more reasonable now. I do find the '/' in it a bit strange though.

I can remove the backslash if you like. Is a dash more preferred?

> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 

and if so can I keep the ack? I'll resend with that change and
add the ack.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

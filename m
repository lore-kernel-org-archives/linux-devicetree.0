From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/6] usb: dwc3: dwc3-st: Update the incorrect DT dwc3
 example.
Date: Thu, 7 May 2015 16:13:58 +0100
Message-ID: <20150507151358.GA14123@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1430400652-3366-1-git-send-email-peter.griffin@linaro.org>
 <1430400652-3366-4-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430400652-3366-4-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Thu, 30 Apr 2015, Peter Griffin wrote:

> There is a subtle typo phys-names should be phy-names. Using the
> current example means you don't have working usb (as you fail to
> obtain the phys). Also update the example to use the generic phy
> type constants which are now used for miphy28.
> 
> Additionally also remove the unnecessary new line in the example.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>

Can you take this dwc3 DT doc update patch via your tree?

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

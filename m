From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: STi: STiH407: Add reset controller support.
Date: Wed, 2 Jul 2014 11:19:27 +0100
Message-ID: <20140702101927.GC8809@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1404225047-9495-1-git-send-email-peter.griffin@linaro.org>
 <1404225047-9495-4-git-send-email-peter.griffin@linaro.org>
 <20140702085102.GF10311@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140702085102.GF10311@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

> > +		picophyreset: picophyreset-controller {
> > +			#reset-cells = <1>;
> > +			compatible = "st,stih407-picophyreset";
> > +		};
> > +
> 
> I'd always put the compatible string at the very top of the node.

Thanks for reviewing, have changed in v2.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

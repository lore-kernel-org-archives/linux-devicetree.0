From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 07/13] ARM: STi: DT: STiH407: Add usb2 picophy dt nodes
Date: Thu, 13 Nov 2014 10:22:18 +0000
Message-ID: <20141113102218.GA25886@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-8-git-send-email-peter.griffin@linaro.org>
 <20141110101131.GP21424@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141110101131.GP21424@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

Thanks for reviewing.

On Mon, 10 Nov 2014, Lee Jones wrote:
> > +			reg =	<0xf8 0x04>,	/* syscfg 5062 */
> > +				<0xf4 0x04>;    /* syscfg 5061 */
> 
> Are there really only 2 32bit registers to control this h/w?

Yes

> 
> > +			reg-names =	"param",
> > +					"ctrl";
> 
> Superflous indentation after 'reg = ' and 'reg-names = '.

Fixed in v2.

> > +			st,syscfg = <&syscfg_core>;
> > +			resets = <&softreset STIH407_PICOPHY_SOFTRESET>,
> > +				 <&picophyreset STIH407_PICOPHY0_RESET>;
> > +			reset-names = "global",
> > +				      "port";
> 
> May as well put these on the same line.

Fixed in v2.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

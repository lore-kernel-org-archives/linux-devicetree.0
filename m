From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: DT: STi: STiH407: Add dwc3 usb3 DT node.
Date: Wed, 25 Feb 2015 15:22:01 +0000
Message-ID: <20150225152201.GA14329@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-5-git-send-email-peter.griffin@linaro.org>
 <20150225151229.GE5132@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150225151229.GE5132@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, 25 Feb 2015, Lee Jones wrote:

> > +			resets		= <&powerdown STIH407_USB3_POWERDOWN>,
> > +					  <&softreset STIH407_MIPHY2_SOFTRESET>;
> > +			reset-names	= "powerdown",
> > +					  "softreset";
> 
> Nit: What's the purpose of having these on separate lines?

The only reason was to stay aligned with the example in
Documentation/devicetree/bindings/usb/dwc3-st.txt.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

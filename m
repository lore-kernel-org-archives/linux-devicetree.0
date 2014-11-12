From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/13] ARM: STi: DT: STiH410: Add STiH410 SoC clock
 support.
Date: Wed, 12 Nov 2014 13:48:01 +0000
Message-ID: <20141112134801.GB20187@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-13-git-send-email-peter.griffin@linaro.org>
 <88469624.TsXJ3Gpfe2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <88469624.TsXJ3Gpfe2@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for reviewing.

> On Friday 07 November 2014 11:57:54 Peter Griffin wrote:
> > +
> > +       soc {
> > +
> > +               ohci0: usb@9a03c00 {
> > +                       status = "okay";
> > +               };
> > +
> > +               ehci0: usb@9a03e00 {
> > +                       status = "okay";
> > +               };
> > +
> > +               ohci1: usb@9a83c00 {
> > +                       status = "okay";
> > +               };
> > +
> > +               ehci1: usb@9a83e00 {
> > +                       status = "okay";
> > +               };
> > +       };
> > +};
> > 
> 
> These seem to refer to an existing device in the base dtsi file. Just put the label
> in the shared file and remove the exact names here. Alternatively, drop the labels
> you don't use.

Based on Maximes feedback in V2 I've created a seperate stih410.dtsi file
which has the extra ehci / ohci device nodes in it. This means they don't need to be
enabled in the board file any more.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

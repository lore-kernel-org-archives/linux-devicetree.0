From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/12] [media] dvb-pll: Add support for THOMSON DTT7546X
 tuner.
Date: Thu, 30 Jul 2015 10:47:38 +0100
Message-ID: <20150730094738.GD488@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1435158670-7195-1-git-send-email-peter.griffin@linaro.org>
 <1435158670-7195-3-git-send-email-peter.griffin@linaro.org>
 <1435195057.9377.18.camel@perches.com>
 <20150722185811.2d718baa@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150722185811.2d718baa-+RedX5hVuTR+urZeOPWqwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mauro / Joe,

On Wed, 22 Jul 2015, Mauro Carvalho Chehab wrote:

> Em Wed, 24 Jun 2015 18:17:37 -0700
> Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> escreveu:
> 
> > On Wed, 2015-06-24 at 16:11 +0100, Peter Griffin wrote:
> > > This is used in conjunction with the STV0367 demodulator on
> > > the STV0367-NIM-V1.0 NIM card which can be used with the STi
> > > STB SoC's.
> > 
> > Barely associated to this specific patch, but for
> > dvb-pll.c, another thing that seems possible is to
> > convert the struct dvb_pll_desc uses to const and
> > change the "entries" fixed array size from 12 to []
> > 
> > It'd save a couple KB overall and remove ~5KB of data.
> > 
> > $ size drivers/media/dvb-frontends/dvb-pll.o*
> >    text	   data	    bss	    dec	    hex	filename
> >    8520	   1552	   2120	  12192	   2fa0	drivers/media/dvb-frontends/dvb-pll.o.new
> >    5624	   6363	   2120	  14107	   371b	drivers/media/dvb-frontends/dvb-pll.o.old
> 
> Peter,
> 
> Please add this patch on the next patch series you submit.

Ok will do, I've added this patch with a slightly updated commit message
to my series.

Joe - Can I add your signed-off-by?

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

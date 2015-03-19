From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/6] drm/exynos: dsi: add support for Exynos5433 SoC
Date: Thu, 19 Mar 2015 10:18:10 +0900
Message-ID: <20150319101810.2244b509@hwh-ubuntu>
References: <1426666591-16103-1-git-send-email-human.hwang@samsung.com>
 <1426666591-16103-5-git-send-email-human.hwang@samsung.com>
 <CAPj87rPBZ7rG8BScFhp4tyKfOOJVCYoW8pgCMvHttT=NAbma9Q@mail.gmail.com>
 <20150319100252.03be7dda@hwh-ubuntu>
 <CAPj87rPeUS9h=GCBR7ccNhugaGoyHw3x6oZ3Spq6P8uEg4ZcUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAPj87rPeUS9h=GCBR7ccNhugaGoyHw3x6oZ3Spq6P8uEg4ZcUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Daniel,

On Thu, 19 Mar 2015 01:13:21 +0000
Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org> wrote:

> Hi Hyungwon,
> 
> On 19 March 2015 at 01:02, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> wrote:
> >> > +       /*
> >> > +        * The input PLL clock for MIPI DSI in Exynos5433 seems
> >> > to be fixed
> >> > +        * by OSC CLK.
> >> > +        */
> >> > +       fin = 24 * MHZ;
> >>
> >> Er, is this always true on other platforms as well? Shouldn't this
> >> be a part of the DeviceTree description?
> >
> > I forgot to change the comment in development. Finally it is found
> > that all exynos mipi dsi's fin is OSC clk which is 24 MHz. So I
> > will remove the comment, but remain the code as it is.
> 
> Fair enough. Should pll_clk be removed from the DT description then,
> if it's fixed to the oscillator?

Yes. It is redundant to represent pll_clk in DT, and it should be
removed.

> 
> > Thanks for your review. I will send it again with the changes you
> > suggested.
> 
> Thanks very much!
> 
> Cheers,
> Daniel

Best regards,
Hyungwon Hwang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

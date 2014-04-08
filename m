From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 2/2] ARM: dts: MSM8974: Add pinctrl node
Date: Tue, 08 Apr 2014 15:14:44 +0300
Message-ID: <1396959284.28420.45.camel@iivanov-dev>
References: <1391700529-11816-1-git-send-email-iivanov@mm-sol.com>
	 <1391700529-11816-2-git-send-email-iivanov@mm-sol.com>
	 <CAOZdJXVE7MSMBaL+bt0kjw5LEidz-aVp+vrWqQWkye6HdE7EeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAOZdJXVE7MSMBaL+bt0kjw5LEidz-aVp+vrWqQWkye6HdE7EeA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi,

On Mon, 2014-04-07 at 18:53 -0500, Timur Tabi wrote:
> On Thu, Feb 6, 2014 at 9:28 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
> > +                       spi8_default: spi8_default {
> > +                               mosi {
> > +                                       pins = "gpio45";
> > +                                       function = "blsp_spi8";
> > +                               };
> > +                               miso {
> > +                                       pins = "gpio46";
> > +                                       function = "blsp_spi8";
> > +                               };
> > +                               cs {
> > +                                       pins = "gpio47";
> > +                                       function = "blsp_spi8";
> > +                               };
> > +                               clk {
> > +                                       pins = "gpio48";
> > +                                       function = "blsp_spi8";
> > +                               };
> 
> I'm confused by this.  Isn't this information already defined in the
> pinctrl-msm8x74.c driver?
> 
> static const char * const blsp_spi8_groups[] = {
>     "gpio45", "gpio46", "gpio47", "gpio48"
> };

I am not sure that I understand the question. This is one of 
possible ways to describe relationship between pins and functions. 
As they are described is visible what is their real purpose.

Regards,
Ivan

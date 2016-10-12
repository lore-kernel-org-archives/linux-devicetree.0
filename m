From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC 0/1] misc: Add Allwinner Q8 tablet hardware manager
Date: Wed, 12 Oct 2016 10:48:11 +0100
Message-ID: <20161012094811.GA19509@remoulade>
References: <20160901190820.21987-1-hdegoede@redhat.com>
 <CAL_JsqJVkPPiDh66nhfh0D7BvkZ7KKN0X7uhfPGgiYbc2Ca1rg@mail.gmail.com>
Reply-To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRMFBMIXEGBBZMN7C7QKGQEUZ5HELQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAL_JsqJVkPPiDh66nhfh0D7BvkZ7KKN0X7uhfPGgiYbc2Ca1rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 09, 2016 at 04:32:06PM -0500, Rob Herring wrote:
> On Thu, Sep 1, 2016 at 2:08 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > Hi All,
> >
> > Here is a first RFC for the q8 tablet hw-manager I've been talking
> > about for a while now.
> >
> > The touchscreen part is finished, I'll start working on the
> > accelerometer bits next.
> 
> This at least partially overlaps with the "overlay manager" just
> posted. A dev board having different devices attached and a production
> device have 2nd source components are not really different problems.
> We need a common solution and can't have each platform making up their
> own scheme.

To follow up discussions at ELC-E, I agree that we need a common solution (if
this has to happen in the kernel rather than in an earlier stage of the boot
process).

Otherwise, we're creating pseudo-board-files, and a whole new set of problems
for ourselves.

Thanks
Mark.

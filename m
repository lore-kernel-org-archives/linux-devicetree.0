From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/1] misc: Add Allwinner Q8 tablet hardware manager
Date: Fri, 9 Sep 2016 16:32:06 -0500
Message-ID: <CAL_JsqJVkPPiDh66nhfh0D7BvkZ7KKN0X7uhfPGgiYbc2Ca1rg@mail.gmail.com>
References: <20160901190820.21987-1-hdegoede@redhat.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERB3WUZS7AKGQE2OJ4XVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160901190820.21987-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 1, 2016 at 2:08 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi All,
>
> Here is a first RFC for the q8 tablet hw-manager I've been talking
> about for a while now.
>
> The touchscreen part is finished, I'll start working on the
> accelerometer bits next.

This at least partially overlaps with the "overlay manager" just
posted. A dev board having different devices attached and a production
device have 2nd source components are not really different problems.
We need a common solution and can't have each platform making up their
own scheme. What's different for you is how you select what changes or
overlay to apply and that is fine to be platform specific. I think you
should be using overlays here as well.

> Note that this requires the "of: changesets: Introduce changeset
> helper methods" patch from Pantelis. If that is still not upstream
> when I'm ready to post a non RFC, I'll post a new version of that
> myself.

I'm waiting for it to be reposted. IIRC, I only had some minor comments.

Rob

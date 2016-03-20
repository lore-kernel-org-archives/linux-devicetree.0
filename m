From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: dts: sun8i: Orangepi Plus dts improvements
Date: Mon, 21 Mar 2016 00:05:08 +0800
Message-ID: <CAGb2v65THg3fcdTJvFBCxxbSU_vOWmB9tP4f2QUbPyUU9D=zig@mail.gmail.com>
References: <1458489636-2825-1-git-send-email-hdegoede@redhat.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBS4UXO3QKGQEY57FV4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1458489636-2825-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Krzysztof Adamski <k@japko.eu>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Mar 21, 2016 at 12:00 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Maxime and Chen-Yu,
>
> Here is a series with various improvements for the Orangepi Plus dts.
> Some (most) of these patches have been submitted before, esp. the USB
> ones have multiple revisions before. But I lost count of their version,
> so I'm posting this as a "new" set.
>
> About the USB patches, these rely on the patches to add support for
> multiple-reset controllers to ohci-platform / ehci-platform. These
> patches are all acked up and will go upstream as soon as v4.6-rc1 is
> released (they depend on changes which will go into v4.6-rc1).

Does this mean you or I can send the Orange Pi PC DTS patch?

Thanks
ChenYu

> The old ohci-platform / ehci-platform will only look at the first reset
> specified in the dt and as such will fail to load with the new dt nodes
> (because they cannot talk to the controller).
>
> I've also included a v6 of Krzysztof Adamski <k@japko.eu> leds / switches
> patch, fixing the comments you had in your review of v5. I've done this
> to avoid conflicts with my other patches.
>
> Regards,
>
> Hans

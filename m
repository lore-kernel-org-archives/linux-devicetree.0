From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Wed, 08 Jan 2014 17:00:53 +0100
Message-ID: <52CD7635.8040102@redhat.com>
References: <1388963080-12544-1-git-send-email-hdegoede@redhat.com> <201401060816.02998.arnd@arndb.de> <52CA603B.3070203@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBQHMWWLAKGQE6J4UXUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52CA603B.3070203-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/06/2014 08:50 AM, Hans de Goede wrote:

<snip>

>> Otherwise you don't know the difference between "no clock
>> provided", "error getting the clock reference" and "clock controller not
>> initialized yet, try again".
>
> I guess of these 3 we really only want to continue on "no clock provided",
> so I think something like this (for both clks and the phy) would be best:
>
>          priv->ahb_clk = devm_clk_get(&dev->dev, "ahb");
>          if (IS_ERR(priv->ahb_clk)) {
>              err = PTR_ERR(priv->ahb_clk);
>              if (err != -EINVAL && err != -ENODATA)
>                  goto err_put_hcd;
>              priv->ahb_clk = NULL; /* No clock provided */
>          }
>
> To clarify -EINVAL will be returned when there is no clock-names, and
> -ENODATA when the specified name is not found in clock-names.

Ok, so I've got this wrong, if there is no clk by that name specified
in dt -ENOENT will be returned. Actually -ENOENT is the only
error clk_get and thus devm_clk_get will ever return.

So it seems that clk_get currently is not properly passing along
probe-deferral. To make things future proof I will add a probe
deferral check to the next version of my patch.

Regards,

Hans

From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v2 1/2] mfd: retu: Add OF device ID table
Date: Thu, 30 Mar 2017 07:41:13 -0500
Message-ID: <CAL_JsqJTxT1V1Y8Wte4W22UjFcAKUuny5VCFpurwjkPz=hGxVQ@mail.gmail.com>
References: <20170315104958.24919-1-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170315104958.24919-1-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 5:49 AM, Javier Martinez Canillas
<javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
> The driver doesn't have a struct of_device_id table but supported devices
> are registered via Device Trees. This is working on the assumption that a
> I2C device registered via OF will always match a legacy I2C device ID and
> that the MODALIAS reported will always be of the form i2c:<device>.

It should also have the OF MODALIAS.

> But this could change in the future so the correct approach is to have a
> OF device ID table if the devices are registered via OF.

I believe this is already the case.

> The compatible strings don't have a vendor prefix because that's how it's
> used currently, and changing this will be a Device Tree ABI break.

How so? These "compatible" strings are not documented, so there is no
ABI. You may have been lucky to get things working using the driver
name as the compatible string.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

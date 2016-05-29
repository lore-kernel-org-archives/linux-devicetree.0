From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/3] firmware: Amlogic: Add secure monitor driver
Date: Sun, 29 May 2016 13:36:58 +0200
Message-ID: <20160529113658.GA21309@mephisto>
References: <1464520323-19531-1-git-send-email-carlo@caione.org>
 <1464520323-19531-2-git-send-email-carlo@caione.org>
 <CANe6Qb8ECk_1S=pyJBACUwSRyNUi7ROF-GvybcpYLTks4L38fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANe6Qb8ECk_1S=pyJBACUwSRyNUi7ROF-GvybcpYLTks4L38fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <bjdooks-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/05/16 12:27, Ben Dooks wrote:

[...]
> > +u32 meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
> > +                      unsigned int cmd_index, u32 arg0, u32 arg1,
> > +                      u32 arg2, u32 arg3, u32 arg4)
> > +{
> > +       u32 size;
> > +
> > +       if (!fw->chip->cmd_shmem_out_base)
> > +               return -EINVAL;
> > +
> > +       size = meson_sm_call(fw, cmd_index, arg0, arg1, arg2, arg3, arg4);
> > +       if (size <= 0 || size > fw->chip->shmem_size)
> > +               return -EINVAL;
> > +
> u32 cannot be less than 0

Ouch. Definitely overlooked that. Fix coming.

[...]
> > +static int meson_sm_probe(struct platform_device *pdev)
> > +{
> > +       const struct meson_sm_chip *chip;
> > +       struct meson_sm_firmware *fw;
> > +
> > +       fw = devm_kzalloc(&pdev->dev, sizeof(*fw), GFP_KERNEL);
> > +       if (!fw)
> > +               return -ENOMEM;
> > +
> > +       fw->dev = &pdev->dev;
> > +
> > +       chip = of_device_get_match_data(fw->dev);
> > +       if (!chip) {
> > +               dev_err(fw->dev, "Unable to setup secure-monitor data\n");
> > +               return -ENODEV;
> > +       }
> -ENODEV not best return here. Return -EINVAL better. -ENODEV won't get
> reported by device layer

Ok

[...]
> > +               if (!fw->sm_shmem_in_base)
> > +                       goto out;
> > +       }
>   Maybe use WarnOn here

Alright.

Cheers,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

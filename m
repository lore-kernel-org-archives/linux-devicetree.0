From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 7/7] net: phy: icplus: allow configuring the interrupt
 function on IP101GR
Date: Sun, 18 Nov 2018 18:30:44 +0100
Message-ID: <CAFBinCBkH3OrtxROpcbqF-1BtRY=6QqS2zkhZTo=W==1FKqZsw@mail.gmail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
 <20181117182007.14791-8-martin.blumenstingl@googlemail.com> <20181118171340.GG5591@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118171340.GG5591@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sun, Nov 18, 2018 at 6:13 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Hi Martin
>
> > +static int ip101a_g_probe(struct phy_device *phydev)
> > +{
> > +     struct device *dev = &phydev->mdio.dev;
> > +     struct ip101a_g_phy_priv *priv;
> > +
> > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     if (device_property_read_bool(dev, "icplus,select-rx-error"))
> > +             priv->sel_intr32 = IP101GR_SEL_INTR32_RXER;
> > +     else if (device_property_read_bool(dev, "icplus,select-interrupt"))
> > +             priv->sel_intr32 = IP101GR_SEL_INTR32_INTR;
> > +     else
> > +             priv->sel_intr32 = IP101GR_SEL_INTR32_KEEP;
>
> It would be good to return -EINVAL if both properties are found.
that makes sense
I'll wait a few days for more feedback and re-send this series with
that issue fixed

> This looks good otherwise.
great, thanks for looking into it!


Regards
Martin

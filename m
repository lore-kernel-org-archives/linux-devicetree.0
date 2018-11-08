From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 5/6] dt-bindings: anybuss-host: document
 devicetree binding
Date: Thu, 8 Nov 2018 09:21:22 -0500
Message-ID: <CAGngYiW5=oc486wq15yLbRLvO243PNALmouTDEh7QpO6GLO9Mg@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-6-TheSven73@googlemail.com> <CAK8P3a1ZUaxJzfzYoqAK+_ZBazHzF6nG1V2aiZSoiQr6nDhiSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1ZUaxJzfzYoqAK+_ZBazHzF6nG1V2aiZSoiQr6nDhiSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd, thank you for the review and the feedback !

>
> To allow describing connected devices, I think we need a #address-cells
> and #size-cells property here, with fixed values.

I'm not sure I understand. Connected devices aren't described in the
devicetree. The anybus specification defines an id register, which is
then used to load the client driver automatically, in the manner of
pci/usb.

In case I have misinterpreted your feedback, could you clarify a bit?
Thanks,
Sven

E.g. here's the definition of an anybus client driver, a profinet card:

static struct anybuss_client_driver profinet_driver = {
    .probe = profinet_probe,
    .remove = profinet_remove,
    .driver = {
        .name   = "hms-profinet",
        .owner = THIS_MODULE,
    },
    .fieldbus_type = 0x0089,
};

static int __init profinet_init(void)
{
    return anybuss_client_driver_register(&profinet_driver);
}
module_init(profinet_init);

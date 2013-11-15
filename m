From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] misc: bmp085: Add DT bindings for EOC gpio line and direct irq.
Date: Fri, 15 Nov 2013 14:56:19 +0100
Message-ID: <201311151456.19585.arnd@arndb.de>
References: <1384465609-26485-1-git-send-email-marek@goldelico.com> <1384465609-26485-3-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1384465609-26485-3-git-send-email-marek@goldelico.com>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Belisko <marek@goldelico.com>
Cc: gregkh@linuxfoundation.org, neilb@suse.de, hns@goldelico.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 November 2013, Marek Belisko wrote:
> +       if (node && !pdata) {
> +               pdata = devm_kzalloc(dev, sizeof(struct bmp085_platform_data),
> +                                       GFP_KERNEL);
> +               if (!pdata)
> +                       return -ENOMEM;
> +       }
> +

I generally recommend against allocating platform data from inside the driver,
as this requires more code and more memory than just adding fields to the
driver-specific data structure and copying over the fields from either
DT or the supplied platform data, depending on which one is used.

	Arnd

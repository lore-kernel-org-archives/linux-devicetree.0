From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 9/9 v2] usb: usb251xb: Use GPIO descriptor consumer
 interface
Date: Thu, 21 Sep 2017 10:23:38 +0200
Message-ID: <20170921082338.GA30669@kroah.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-10-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170916104220.3742-10-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: richard.leitner@skidata.com, robh+dt@kernel.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 01:42:20PM +0300, Serge Semin wrote:
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 71994b883..c2dd9742f 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -3,6 +3,7 @@
>   * Configuration via SMBus.
>   *
>   * Copyright (c) 2017 SKIDATA AG
> + * Copyright (c) 2017 T-platforms

Again, no, please consult with your corporate lawyers why this isn't ok.

greg k-h

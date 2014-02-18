From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2 2/3] usb: chipidea: msm: Add device tree support
Date: Tue, 18 Feb 2014 19:14:54 +0200
Message-ID: <1392743694.17130.18.camel@iivanov-dev>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
	 <1392729681-21022-3-git-send-email-iivanov@mm-sol.com>
	 <20140218140854.GC31116@joshc.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140218140854.GC31116@joshc.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Peter Chen <Peter.Chen@freescale.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-02-18 at 08:08 -0600, Josh Cartwright wrote: 
> Hey Ivan-
> 
> Nit below.
> 
> On Tue, Feb 18, 2014 at 03:21:20PM +0200, Ivan T. Ivanov wrote:

> >  
> > +static struct of_device_id msm_ci_dt_match[] = {
> 
> const?
> 

Thanks, will do.

Regards,
Ivan

> > +	{ .compatible = "qcom,ci-hdrc", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, msm_ci_dt_match);
> 

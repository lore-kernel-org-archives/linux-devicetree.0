From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH -next] tty: of_serial: fix return value check in
 of_platform_serial_setup()
Date: Thu, 1 Nov 2012 14:48:52 +0000
Message-ID: <20121101144852.763ffa6f@bob.linux.org.uk>
References: <CAPgLHd--dWeXNH_QVU34afv5Q1ju2MZJcwLKwyRr89+RvOTOBw@mail.gmail.com>
	<50928060.3010806@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <50928060.3010806@ti.com>
Sender: linux-serial-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, gregkh@linuxfoundation.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, seth.heasley@intel.com, yongjun_wei@trendmicro.com.cn, linux-serial@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


> >   				"clk or clock-frequency not
> > defined\n");
> > -			return -ENODEV;
> > +			return PTR_ERR(info->clk);
> I think this is wrong. it should return -ENODEV;

Returning the clock error at least ensures the real reason for the fail
is reported. I think its better to use the PTR_ERR but I'd not class
either as wrong.

Alan

From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V4 02/12] misc: xilinx-sdfec: add core driver
Date: Thu, 6 Jun 2019 21:04:06 +0200
Message-ID: <20190606190406.GA20166@kroah.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-3-git-send-email-dragan.cvetic@xilinx.com>
 <20190606132517.GA7943@kroah.com>
 <CH2PR02MB63592DAB5E23A35C86F81D09CB170@CH2PR02MB6359.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CH2PR02MB63592DAB5E23A35C86F81D09CB170@CH2PR02MB6359.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 06:16:48PM +0000, Dragan Cvetic wrote:
> > 
> > > +
> > > +	misc_deregister(&xsdfec->miscdev);
> > > +	atomic_dec(&xsdfec_ndevs);
> > > +	return 0;
> > 
> > You free nothing?
> > 
> > You are leaking resources like crazy here, this is not ok at all.
> 
> The managed resources are used.
> Anyway, I'll test for memory leak and search for the answer.

Oops, no, you are right, I missed the "devm" prefix on those calls.  My
fault.

thanks,

greg k-h

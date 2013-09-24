From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH] powerpc/83xx: gianfar_ptp: select 1588 clock source
 through dts file
Date: Tue, 24 Sep 2013 19:14:10 +0200
Message-ID: <20130924171410.GB4073@netboy>
References: <1380008397-22980-1-git-send-email-aida.mynzhasova@skitlab.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1380008397-22980-1-git-send-email-aida.mynzhasova@skitlab.ru>
Sender: netdev-owner@vger.kernel.org
To: Aida Mynzhasova <aida.mynzhasova@skitlab.ru>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2013 at 11:39:57AM +0400, Aida Mynzhasova wrote:
> Currently IEEE 1588 timer reference clock source is determined through
> hard-coded value in gianfar_ptp driver. This patch allows to select ptp
> clock source by means of device tree file node.
> 
> For instance:
> 
> 	fsl,cksel = <0>;
> 
> for using external (TSEC_TMR_CLK input) high precision timer
> reference clock.
> 
> Other acceptable values:
> 
> 	<1> : eTSEC system clock
> 	<2> : eTSEC1 transmit clock
> 	<3> : RTC clock input

I think it would be useful to have this table in the binding document
as well.

Thanks,
Richard

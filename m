From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Add arm pl353 smc nand driver for xilinx zynq
 soc
Date: Thu, 09 Jul 2015 07:05:25 +0200
Message-ID: <559E0115.4010304@xilinx.com>
References: <1433786918-21500-1-git-send-email-punnaia@xilinx.com>
 <20150708194051.GP25028@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150708194051.GP25028-ew3lsbMjNqt5wtABiV/Xjqyly8cj88Ttqxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jussi.kivilinna-X3B1VOXEql0@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, joern-PCqxUs/MD9bYtjvyW6yDsg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/08/2015 09:40 PM, Josh Cartwright wrote:
> On Mon, Jun 08, 2015 at 11:38:35PM +0530, Punnaiah Choudary Kalluri wrote:
>> The following patches add arm pl353 static memory controller driver for
>> xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and
>> nor/sram memory interfaces. The current implementation supports only a
>> single SMC instance and nand specific configuration.
> 
> What's the integration plan for this guy?  Looks like we missed 4.2.
> It'd be swell to get have NAND support land for Zynq in 4.3.
> 
> Assuming there is nothing else holding it back:
> 
> Brian- I'm assuming you'll want to take this through your tree.
> 
> It looks like most of the stuff in drivers/memory have historically gone
> through arm-soc/drivers, Michal- does it make sense for you to pick up
> http://lkml.kernel.org/r/1433786857-32575-1-git-send-email-punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org?

I am happy to take this via zynq tree and arm-soc tree if this is the
right way.

Josh: Also none can stop you to give us you ACK or Tested-by line.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

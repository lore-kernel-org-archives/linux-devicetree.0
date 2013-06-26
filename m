From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/2] uio: Use of_match_ptr() macro in uio_pdrv_genirq.c
Date: Wed, 26 Jun 2013 08:00:03 -0700
Message-ID: <20130626150003.GA14117@kroah.com>
References: <03c8973cc1e9efcd203e4d95d2dd9469afbcb39b.1372240320.git.michal.simek@xilinx.com>
 <CAK9yfHzVSt1XN7=OZOtF_n_3jbpXObqoiay_t6n3EauTjUUX+w@mail.gmail.com>
 <51CAC0A7.7090708@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51CAC0A7.7090708@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "Hans J. Koch" <hjk@hansjkoch.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2013 at 12:21:27PM +0200, Michal Simek wrote:
> On 06/26/2013 12:00 PM, Sachin Kamat wrote:
> > On 26 June 2013 15:22, Michal Simek <michal.simek@xilinx.com> wrote:
> >> This eliminates having an #ifdef returning NULL for the case
> >> when OF is disabled.
> >>
> >> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > 
> > I have already submitted a similar patch for doing this:
> > https://lkml.org/lkml/2013/3/14/169
> 
> Ok. I don't care about it.
> Greg: Can you please add any of this patch to your char-misc tree?

I did that yesterday, can't you see it in there already, or did I mess
something up?

thanks,

greg k-h

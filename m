From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Thu, 30 May 2019 06:04:00 -0700
Message-ID: <8bc749161a8b8640ebdf78d693111d5350514638.camel@perches.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
         <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
         <20190530115732.GB14088@kroah.com>
         <0ebfe8d7-3e0c-e0be-abd5-5e10b7d4b6aa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0ebfe8d7-3e0c-e0be-abd5-5e10b7d4b6aa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hhhawa@amazon.com, Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-05-30 at 15:52 +0300, hhhawa@amazon.com wrote:
> On 5/30/19 2:57 PM, Greg KH wrote:
> > On Thu, May 30, 2019 at 01:15:29PM +0300, Hanna Hawa wrote:
> > > +static void al_a57_edac_cpumerrsr(void *arg)
> > > +{
> > > +	struct edac_device_ctl_info *edac_dev =
> > > +		(struct edac_device_ctl_info *)arg;
> > No need for casting anything here, just assign it.  Doesn't checkpatch
> > catch this type of thing these days?  You did run it, right?
> 
> I did, but checkpatch didn't catch this. I'll fix in next patch-set.
> 
> Thanks for your review.

checkpatch is brainless about the types of variables/arguments.

coccinelle is another very useful tool so you could also run
scripts/coccicheck on your sources.

see: Documentation/dev-tools/coccinelle.rst

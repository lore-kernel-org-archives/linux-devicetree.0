From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Fri, 30 Oct 2015 23:50:20 +0100
Message-ID: <3785872.6m49nEREgo@wuerfel>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org> <4552697.VhjWnxQoIo@wuerfel> <5633F0FD.7060506@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5633F0FD.7060506@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 30 October 2015 17:36:45 Timur Tabi wrote:
> On 10/30/2015 05:28 PM, Arnd Bergmann wrote:
> >>> > >Why ENODEV? Could you make this handle restarted system calls?
> >> >
> >> >This is the self test code. It gets called from probe. If there is a
> >> >problem with the device or system configuration, I don't want to enable
> >> >this device. I can certainly return a different error code though.
> >> >What's a good code?
> > I see. probe() is not restartable, so it cannot be -ERESTARTSYS.
> >
> > Maybe better use wait_event_timeout and not handle the signals then.
> > It will eventually time out if something goes wrong.
> 
> What about -EPROBE_DEFER?  Isn't that "restartable"?  Granted, it's only 
> supposed to be used if the driver is dependent on another driver to 
> probe, so I'm not sure it applies here.  If the self-test fails, then it 
> is possible that it could succeed later?

No, this is different. The probe function can get called from all sorts
of contexts (sys_init_module, device_create, deferred probing), and not
all of them go back to user space when returning an error, so we cannot
deliver a signal to the calling process this way.

	Arnd

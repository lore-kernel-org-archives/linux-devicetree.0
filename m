From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH 0/2] Add Updown Counter support for Milbeaut M10V SoC
Date: Sun, 31 Mar 2019 11:09:32 +0900
Message-ID: <20190331020932.GA4108@icarus>
References: <1553581954-13487-1-git-send-email-kanematsu.shinji@socionext.com>
 <20190330183603.55886d4f@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190330183603.55886d4f@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jonathan Cameron <jic23@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kasai.kazuhiro@socionext.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 30, 2019 at 06:36:03PM +0000, Jonathan Cameron wrote:
> On Tue, 26 Mar 2019 15:32:34 +0900
> Shinji Kanematsu <kanematsu.shinji@socionext.com> wrote:
> 
> > This is a series of patch which adds Updown Counter support on
> > Milbeaut M10V SoC.
> > 
> > The Updown Counter counts input pulse signal from external quadrature encoder.
> > It also has input pulse signal counter function.
> Hi Shinji,
> 
> Are you aware of the counter subsystem that has been proposed (and
> as far as I am concerned is ready to be merged)?
> 
> https://patchwork.kernel.org/project/linux-iio/list/?series=147
> (I think that's the latest version posted)..
> William, perhaps you could give an update?
> 
> (bad luck, you are getting popular ;)
> 
> I'll take a quick review as it stands, as some issues may carry over.
> I appreciate that it's always unfortunate to try to upstream stuff at the
> same time as a new framework is being developed / upstreamed, but I don't
> intend to take any additional counter drivers into IIO.  We just
> end up having to maintain old interfaces in more and more drivers.
> 
> Thanks,
> 
> Jonathan

Shinji,

If you reimplement this driver to use the new Generic Counter API, I can
pick it up and include it with my next patchset submission. Please base
your patches ontop of the "generic_counter_v10" branch from my personal
repository:

https://gitlab.com/vilhelmgray/iio/commits/generic_counter_v10

Documentation can be found at:

	Documentation/driver-api/generic-counter.rst
	Documentation/ABI/testing/sysfs-bus-counter

Look at the existing drivers inside the drivers/counter directory to
serve as references:

	drivers/counter/ftm-quaddec.c
	drivers/counter/stm32-timer-cnt.c

If you have any troubles or difficulties with the API, send me a message
and I will be happy to help. :-)

Thank you,

William Breathitt Gray

> 
> > 
> > Shinji Kanematsu (2):
> >   dt-bindings: iio: counter: Add Milbeaut Updown Counter
> >   iio: counter: Add support for Milbeaut Updown Counter
> > 
> >  .../bindings/iio/counter/milbeaut-updown_cnt.txt   |  22 ++
> >  drivers/iio/counter/Kconfig                        |  12 +
> >  drivers/iio/counter/Makefile                       |   1 +
> >  drivers/iio/counter/milbeaut-updown.h              |  38 ++
> >  drivers/iio/counter/milbeaut-updown_cnt.c          | 385 +++++++++++++++++++++
> >  5 files changed, 458 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt
> >  create mode 100644 drivers/iio/counter/milbeaut-updown.h
> >  create mode 100644 drivers/iio/counter/milbeaut-updown_cnt.c
> > 
> 

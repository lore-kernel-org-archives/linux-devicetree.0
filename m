From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v10 3/8] add fpga manager core
Date: Fri, 14 Aug 2015 11:42:25 -0700
Message-ID: <CAAtXAHcLXtexeW-LuaeD_c9F+dN8QiTfv7FNm=xQ6phsqr6y=A@mail.gmail.com>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
	<1439487452-23977-5-git-send-email-atull@opensource.altera.com>
	<CAAtXAHc=+nzcDQ-=-gkj=BfpjCeMu-nu5yW6bZPhB3w1=_Ek7g@mail.gmail.com>
	<alpine.DEB.2.02.1508140925560.1866@linuxheads99>
	<alpine.DEB.2.02.1508141026280.661@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1508141026280.661@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, Philip Balister <philip@balister.org>, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, balbi@ti.com, m.chehab@samsung.com, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@linaro.org>, pawel.moll@arm.com, mark.rutland
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Fri, Aug 14, 2015 at 8:46 AM, atull <atull@opensource.altera.com> wrote:
> On Fri, 14 Aug 2015, atull wrote:
>
>> On Fri, 14 Aug 2015, Moritz Fischer wrote:
>>
>> > Hi Alan,
>> >
>> > I've updated my Zynq driver (it can be found in an older version
>> > against your v8 in the Xilinx tree, too)
>> >
>> > https://github.com/mfischer/linux/tree/alan-fpga-mgr-v10
>>
>> Since we are both already using this and have been for a while now, I hope it
>> can go up into the mainstream instead of continuing to exist only in Altera
>> and Xilinx's git trees.

Yeah, that was definitely my intention. I just held off submitting my
driver for mainline,
because your patchset was still sort of a moving target.
And that would be like the 3rd layer of dependencies :-)

The reason for inclusion into the Xilinx tree was so people can play
around with it already.
>>
>
> Hi Moritz,
>
> I fetched your git tree and took a look at your low level driver.
>
> I had a some feedback.  write_complete() is a blocking call, waiting for the
> FPGA to go into operating state and timing out (ETIMEDOUT) if necessary.  The
> fpga-mgr.c framework is assuming that when write_complete exits with status 0,
> that means that the FPGA is in operating state.  That's why it's proper for us
> to add "mgr->state = FPGA_MGR_STATE_OPERATING" after write_complete returns
> success as you noted.  My suggestion is that your write_complete() should check
> status in this way.  Whatever error codes it returns will get propagated.

Fair enough, I had misunderstood the API then :-) Another option would
have been to have the sysfs
function actually query the state function instead of using the cached
mgr->state value.
I'll fix my driver ;-) I'll probably do something like

#define zynq_fpga_poll_timeout(priv, addr, val, cond, sleep_us, timeout_us) \
       readl_poll_timeout(priv->io_base + addr, val, cond, sleep_us, \
                          timeout_us)

>
> Also, I'm wondering how the simple-fpga-bus stuff looks to you now that you've
> had it for a little while.

To be honest I haven't played much with it aside from making sure it
works. I had to submit another patchset for
the Zynq's reset controller to make it work. The whole dt overlay is
pretty cool, but the syntax took some getting used to.

>
> Thank,
> Alan

Thanks for your feedback,

Moritz

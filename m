From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
Date: Mon, 31 Aug 2015 10:28:41 +0800
Message-ID: <20150831022840.GC25516@shlinux2>
References: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
 <CALHRZuqFtaRFNd9D=a+x2rZ2848ZOGYbTkSWCHxNPcW_NvocxA@mail.gmail.com>
 <20150827043339.GA29157@shlinux2>
 <CAGnW=BYMnOFTaMQJtLXZ9ckCEHs+gCOCQR0VQFfO4HP=SMHBDQ@mail.gmail.com>
 <20150827143307.GA3775@nathan3500-linux-VM>
 <20150828013011.GA15341@shlinux2>
 <20150828144256.GA30916@nathan3500-linux-VM>
 <20150831004032.GB25516@shlinux2>
 <CAGnW=Ba9cycEJtx2F1pRs1ocYLT7BuLpVCTpWUrD1hB10gSz+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnW=Ba9cycEJtx2F1pRs1ocYLT7BuLpVCTpWUrD1hB10gSz+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: punnaiah choudary kalluri <punnaia@xilinx.com>
Cc: Nathan Sullivan <nathan.sullivan@ni.com>, sundeep subbaraya <sundeep.lkml@gmail.com>, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 31, 2015 at 09:01:51AM +0530, punnaiah choudary kalluri wrote:
> On Mon, Aug 31, 2015 at 6:10 AM, Peter Chen <peter.chen@freescale.com> wrote:
> > On Fri, Aug 28, 2015 at 09:42:56AM -0500, Nathan Sullivan wrote:
> >> On Fri, Aug 28, 2015 at 09:30:12AM +0800, Peter Chen wrote:
> >> > On Thu, Aug 27, 2015 at 09:33:07AM -0500, Nathan Sullivan wrote:
> >> > > On Thu, Aug 27, 2015 at 01:11:30PM +0530, punnaiah choudary kalluri wrote:
> >> > > > Hi,
> >> > > >
> >> > > > On Thu, Aug 27, 2015 at 10:03 AM, Peter Chen <peter.chen@freescale.com> wrote:
> >> > > > > On Thu, Aug 27, 2015 at 10:59:22AM +0530, sundeep subbaraya wrote:
> >> > > > >> Hi,
> >> > > > >>
> >> > > > >>
> >> > > > >> On Wed, Aug 26, 2015 at 8:57 PM, Nathan Sullivan <nathan.sullivan@ni.com> wrote:
> >> > > > >> > The Xilinx Zynq udc does not need the CI_HDRC_DISABLE_STREAMING flag,
> >> > > > >> > unlike the default platform data.  Add platform data specific to the
> >> > > > >> > Zynq udc.
> >> > > > >> >
> >> > > > >> > Based on a patch by the same name from the Xilinx vendor tree.
> >> > > > >>
> >> > > > >> I am that Xilinx guy who sent this patch :). It is in Xilinx tree as
> >> > > > >> temporary fix and
> >> > > > >> I did not debug further why UDC works only when streaming is enabled.
> >> > > > >> Probably this is right time to post my question here.
> >> > > > >> I was expecting like:
> >> > > > >> Streaming disabled - both low bandwidth and high bandwidth systems
> >> > > > >> should work fine
> >> > > > >> Streaming enabled - only for high bandwidth systems
> >> > > > >> but this is not the case, Zynq UDC works only when Streaming is enabled.
> >> > > > >> Please correct me if I am wrong.
> >> > > > >
> >> > > > > You are right, stream mode disabled should work at anytime.
> >> > > > > It is so strange why zynq UDC only works when stream mode is enabled.
> >> > > >
> >> > > > I am referring the section 8.5.2 in Synopsys usb 2.0 HS controllervDoc 2.20a,
> >> > > >  this is what it says about SDIS (streaming mode disable option)
> >> > > >
> >> > > > Before activating this mode, the user must check if the TX latency
> >> > > > buffers per endpoint are able to
> >> > > > accommodate at least one entire maximum size packet. The RX buffer
> >> > > > size must, at least, double the TX
> >> > > > buffer size per endpoint. To optimize the stream disable performance,
> >> > > > system bus burst must be set as high
> >> > > > as possible.
> >> > > > When the stream disable mode is used, the burst size (VUSB_HS_RX_BURST
> >> > > > and VUSB_HS_TX_BURST)
> >> > > > must be a integer sub-multiple of the latency buffer size
> >> > > > (VUSB_HS_RX_DEPTH for RX buffer and
> >> > > > VUSB_HS_TX_CHAN for the TX buffer). If this is not respected the
> >> > > > controller will not work properly in stream
> >> > > > disable mode.
> >> > > > The stream disable mode should just be used in situations where the
> >> > > > available system bandwidth is low or the
> >> > > > system bus access latency is high, in order to avoid underruns and
> >> > > > overruns in the latency buffers. This works
> >> > > > for all types of endpoints, except for ISO endpoints.
> >> > > > Such a system can't ensure the real time support that the ISO
> >> > > > endpoints require, so the ISO endpoints are not
> >> > > > supported when the SDIS bit is set.
> >> > > >
> >> > > > Definitely we need to root cause why disable streaming mode is not
> >> > > > working for zynq but from controller spec
> >> > > > point of view it is possible that controller not work properly in
> >> > > > stream disable mode.
> >> > > >
> >> > > > Regards,
> >> > > > Punnaiah
> >> > > >
> >> > >
> >> > > Maybe the burst size isn't set correctly by default?  It does say the controller
> >> > > won't work correctly with stream disable set and an invalid burst size.  Looks
> >> > > like TX and RX burst both default to 16, per the Zynq manual.
> >> > >
> >> > > With the stream disable bit set, the behvior we see on our hardware is
> >> > > that priming just stops, with an outstanding transfer in memory marked
> >> > > active in the status field by the controller.  This happens at random, even
> >> > > when doing single transfers at a time like with g_ether set to have a queue
> >> > > size of 1.  With SDIS clear everything works great.  Given that the Zynq is not
> >> > > bandwidth constrained, it seems like SDIS clear should be the default.
> >> > >
> >> >
> >> > I suspect the possible reason is the tx buffer for each endpoint is
> >> > small (<=512 bytes), so it can't copy one packet (assume max packet size
> >> > for bulk) to tx buffer, then the prime can't be finished.
> >> >
> >> > Would you help to dump the registers HWTXBUF ($BASE + 0x10) and DCCPARAMS
> >> > ($BASE + 124)?
> >> >
> >> > tx buffer size = ((2 ^ HWTXBUF.VUSB_HS_TX_ADD) / DCCPARAMS.DEN) *
> >> > (DWORD_PER_BYTES)
> >> >
> >> > DWORD_PER_BYTES is 4
> >> >
> >> > --
> >> >
> >> > Best Regards,
> >> > Peter Chen
> >>
> >> HWTXBUF is 0x80060A10, DCCPARAMS is 0xE0003124.
> >
> > Are you sure you read correct address? Your DCCPARAMS means
> > it is host capable, but not device capable.
> 
> HWTXBUF is 0x8060A10
> DCCPARAMS is 0x0000018C
> 
> VUSB_HS_TX_ADD - 0xA
> DEN - 0xC
> 
> From the above formula tx buffer size is 341.33 bytes.
> 
> 

ok, so your platform can't use stream mode disabled.

-- 

Best Regards,
Peter Chen

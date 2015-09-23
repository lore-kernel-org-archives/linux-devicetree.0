From: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Subject: RE: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
Date: Wed, 23 Sep 2015 07:01:31 +0000
Message-ID: <F1B223389110CE49B4CF055ABA2E5D3D78C9B4A3@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1440602865-30468-1-git-send-email-nathan.sullivan@ni.com>
 <CALHRZuqFtaRFNd9D=a+x2rZ2848ZOGYbTkSWCHxNPcW_NvocxA@mail.gmail.com>
 <20150827043339.GA29157@shlinux2>
 <CAGnW=BYMnOFTaMQJtLXZ9ckCEHs+gCOCQR0VQFfO4HP=SMHBDQ@mail.gmail.com>
 <20150827143307.GA3775@nathan3500-linux-VM>
 <20150828013011.GA15341@shlinux2>
 <20150828144256.GA30916@nathan3500-linux-VM>
 <20150831004032.GB25516@shlinux2>
 <CAGnW=Ba9cycEJtx2F1pRs1ocYLT7BuLpVCTpWUrD1hB10gSz+w@mail.gmail.com>
 <20150831022840.GC25516@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
Cc: Nathan Sullivan <nathan.sullivan@ni.com>, sundeep subbaraya <sundeep.lkml@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Please ignore got the answer.

> -----Original Message-----
> From: Subbaraya Sundeep Bhatta
> Sent: Wednesday, September 23, 2015 12:29 PM
> To: 'Peter Chen'; Punnaiah Choudary Kalluri
> Cc: 'Nathan Sullivan'; 'sundeep subbaraya'; 'robh+dt@kernel.org';
> 'pawel.moll@arm.com'; 'Mark Rutland'; 'ijc+devicetree@hellion.org.uk'; 'Kumar
> Gala'; 'Greg Kroah-Hartman'; 'devicetree@vger.kernel.org'; 'linux-
> kernel@vger.kernel.org'; 'linux-usb@vger.kernel.org'
> Subject: RE: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
> 
> Hi Nathan and Peter,
> 
> Is this patch applied? Please let me know I have some other patches to send on
> top of this.
> 
> Thanks,
> Sundeep
> 
> > -----Original Message-----
> > From: Subbaraya Sundeep Bhatta
> > Sent: Tuesday, September 01, 2015 12:22 PM
> > To: 'Peter Chen'; Punnaiah Choudary Kalluri
> > Cc: Nathan Sullivan; sundeep subbaraya; robh+dt@kernel.org;
> > pawel.moll@arm.com; Mark Rutland; ijc+devicetree@hellion.org.uk; Kumar
> > Gala; Greg Kroah-Hartman; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-usb@vger.kernel.org
> > Subject: RE: [PATCH 1/2] usb: chipidea: add xilinx zynq platform data
> >
> > Hi,
> >
> > > -----Original Message-----
> > > From: Peter Chen [mailto:peter.chen@freescale.com]
> > > Sent: Monday, August 31, 2015 7:59 AM
> > > To: Punnaiah Choudary Kalluri
> > > Cc: Nathan Sullivan; sundeep subbaraya; Subbaraya Sundeep Bhatta;
> > > robh+dt@kernel.org; pawel.moll@arm.com; Mark Rutland;
> > > ijc+devicetree@hellion.org.uk; Kumar Gala; Greg Kroah-Hartman;
> > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > > usb@vger.kernel.org
> > > Subject: Re: [PATCH 1/2] usb: chipidea: add xilinx zynq platform
> > > data
> > >
> > > On Mon, Aug 31, 2015 at 09:01:51AM +0530, punnaiah choudary kalluri
> > > wrote:
> > > > On Mon, Aug 31, 2015 at 6:10 AM, Peter Chen
> > > <peter.chen@freescale.com> wrote:
> > > > > On Fri, Aug 28, 2015 at 09:42:56AM -0500, Nathan Sullivan wrote:
> > > > >> On Fri, Aug 28, 2015 at 09:30:12AM +0800, Peter Chen wrote:
> > > > >> > On Thu, Aug 27, 2015 at 09:33:07AM -0500, Nathan Sullivan wrote:
> > > > >> > > On Thu, Aug 27, 2015 at 01:11:30PM +0530, punnaiah choudary
> > > kalluri wrote:
> > > > >> > > > Hi,
> > > > >> > > >
> > > > >> > > > On Thu, Aug 27, 2015 at 10:03 AM, Peter Chen
> > > <peter.chen@freescale.com> wrote:
> > > > >> > > > > On Thu, Aug 27, 2015 at 10:59:22AM +0530, sundeep
> > > subbaraya wrote:
> > > > >> > > > >> Hi,
> > > > >> > > > >>
> > > > >> > > > >>
> > > > >> > > > >> On Wed, Aug 26, 2015 at 8:57 PM, Nathan Sullivan
> > > <nathan.sullivan@ni.com> wrote:
> > > > >> > > > >> > The Xilinx Zynq udc does not need the
> > > > >> > > > >> > CI_HDRC_DISABLE_STREAMING flag, unlike the default
> > > > >> > > > >> > platform data.  Add platform data specific to the Zynq udc.
> > > > >> > > > >> >
> > > > >> > > > >> > Based on a patch by the same name from the Xilinx
> > > > >> > > > >> > vendor
> > > tree.
> > > > >> > > > >>
> > > > >> > > > >> I am that Xilinx guy who sent this patch :). It is in
> > > > >> > > > >> Xilinx tree as temporary fix and I did not debug
> > > > >> > > > >> further why UDC works only when streaming is enabled.
> > > > >> > > > >> Probably this is right time to post my question here.
> > > > >> > > > >> I was expecting like:
> > > > >> > > > >> Streaming disabled - both low bandwidth and high
> > > > >> > > > >> bandwidth systems should work fine Streaming enabled -
> > > > >> > > > >> only for high bandwidth systems but this is not the
> > > > >> > > > >> case, Zynq UDC works only when Streaming is enabled.
> > > > >> > > > >> Please correct me if I am wrong.
> > > > >> > > > >
> > > > >> > > > > You are right, stream mode disabled should work at anytime.
> > > > >> > > > > It is so strange why zynq UDC only works when stream
> > > > >> > > > > mode is
> > > enabled.
> > > > >> > > >
> > > > >> > > > I am referring the section 8.5.2 in Synopsys usb 2.0 HS
> > > > >> > > > controllervDoc 2.20a,  this is what it says about SDIS
> > > > >> > > > (streaming mode disable option)
> > > > >> > > >
> > > > >> > > > Before activating this mode, the user must check if the
> > > > >> > > > TX latency buffers per endpoint are able to accommodate
> > > > >> > > > at least one entire maximum size packet. The RX buffer
> > > > >> > > > size must, at least, double the TX buffer size per
> > > > >> > > > endpoint. To optimize the stream disable performance,
> > > > >> > > > system bus burst must be set as high as possible.
> > > > >> > > > When the stream disable mode is used, the burst size
> > > > >> > > > (VUSB_HS_RX_BURST and VUSB_HS_TX_BURST) must be a
> > > integer
> > > > >> > > > sub-multiple of the latency buffer size (VUSB_HS_RX_DEPTH
> > > > >> > > > for RX buffer and VUSB_HS_TX_CHAN for the TX buffer). If
> > > > >> > > > this is not respected the controller will not work
> > > > >> > > > properly in stream disable mode.
> > > > >> > > > The stream disable mode should just be used in situations
> > > > >> > > > where the available system bandwidth is low or the system
> > > > >> > > > bus access latency is high, in order to avoid underruns
> > > > >> > > > and overruns in the latency buffers. This works for all
> > > > >> > > > types of endpoints, except for ISO endpoints.
> > > > >> > > > Such a system can't ensure the real time support that the
> > > > >> > > > ISO endpoints require, so the ISO endpoints are not
> > > > >> > > > supported when the SDIS bit is set.
> > > > >> > > >
> > > > >> > > > Definitely we need to root cause why disable streaming
> > > > >> > > > mode is not working for zynq but from controller spec
> > > > >> > > > point of view it is possible that controller not work
> > > > >> > > > properly in stream disable mode.
> > > > >> > > >
> > > > >> > > > Regards,
> > > > >> > > > Punnaiah
> > > > >> > > >
> > > > >> > >
> > > > >> > > Maybe the burst size isn't set correctly by default?  It
> > > > >> > > does say the controller won't work correctly with stream
> > > > >> > > disable set and an invalid burst size.  Looks like TX and
> > > > >> > > RX burst both default
> > > to 16, per the Zynq manual.
> > > > >> > >
> > > > >> > > With the stream disable bit set, the behvior we see on our
> > > > >> > > hardware is that priming just stops, with an outstanding
> > > > >> > > transfer in memory marked active in the status field by the
> > > > >> > > controller.  This happens at random, even when doing single
> > > > >> > > transfers at a time like with g_ether set to have a queue
> > > > >> > > size of 1.  With SDIS clear everything works great.  Given
> > > > >> > > that the Zynq
> > > is not bandwidth constrained, it seems like SDIS clear should be the default.
> > > > >> > >
> > > > >> >
> > > > >> > I suspect the possible reason is the tx buffer for each
> > > > >> > endpoint is small (<=512 bytes), so it can't copy one packet
> > > > >> > (assume max packet size for bulk) to tx buffer, then the
> > > > >> > prime can't be
> > finished.
> > > > >> >
> > > > >> > Would you help to dump the registers HWTXBUF ($BASE + 0x10)
> > > > >> > and DCCPARAMS ($BASE + 124)?
> > > > >> >
> > > > >> > tx buffer size = ((2 ^ HWTXBUF.VUSB_HS_TX_ADD) /
> > > DCCPARAMS.DEN) *
> > > > >> > (DWORD_PER_BYTES)
> > > > >> >
> > > > >> > DWORD_PER_BYTES is 4
> > > > >> >
> > > > >> > --
> > > > >> >
> > > > >> > Best Regards,
> > > > >> > Peter Chen
> > > > >>
> > > > >> HWTXBUF is 0x80060A10, DCCPARAMS is 0xE0003124.
> > > > >
> > > > > Are you sure you read correct address? Your DCCPARAMS means it
> > > > > is host capable, but not device capable.
> > > >
> > > > HWTXBUF is 0x8060A10
> > > > DCCPARAMS is 0x0000018C
> > > >
> > > > VUSB_HS_TX_ADD - 0xA
> > > > DEN - 0xC
> > > >
> > > > From the above formula tx buffer size is 341.33 bytes.
> > > >
> > > >
> > >
> > > ok, so your platform can't use stream mode disabled.
> >
> > This is patch can be applied then. Thank you all.
> >
> > Sundeep
> > >
> > > --
> > >
> > > Best Regards,
> > > Peter Chen

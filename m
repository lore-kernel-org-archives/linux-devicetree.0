Return-Path: <SRS0=uA7j=Q2=gmail.com=dmitry.torokhov@kernel.org>
Date: Tue, 19 Feb 2019 00:13:23 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v6 2/2] input: touchscreen: Add support for Azoteq
 IQS550/572/525
Message-ID: <20190219081323.GA65896@dtor-ws>
References: <1549838394-3852-1-git-send-email-jeff@labundy.com>
 <1549838394-3852-2-git-send-email-jeff@labundy.com>
 <20190218064054.GA242714@dtor-ws>
 <20190219020549.GA2531@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190219020549.GA2531@labundy.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 18, 2019 at 08:05:49PM -0600, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> Many thanks for your kind review. All of your comments sound great
> to me; would just like to provide some background behind the first
> one before spinning a v7 (comments below).
> 
> On Sun, Feb 17, 2019 at 10:40:54PM -0800, Dmitry Torokhov wrote:
> > Hi Jeff,
> > 
> > On Sun, Feb 10, 2019 at 04:39:54PM -0600, Jeff LaBundy wrote:
> > > This patch adds support for the Azoteq IQS550/572/525 family of
> > > trackpad/touchscreen controllers.
> > > 
> > > The driver has been tested with an IQS550EV02 evaluation board. A
> > > demonstration of the driver's capabilities is available here:
> > > 
> > > https://youtu.be/sRNNx4XZBts
> > 
> > A few comments:
> > 
> > - we have request_ihex_firmware that requests and validates biary
> >   representation of ihex into the kernel. There is not really a good
> >   reason to parse text ihex in kernel.
> >   There is idex2bin in ./firmware to convert it.
> 
> Agreed on all counts; using request_ihex_firmware was my original
> intent. However the vendor's ihex format is slightly nonstandard in
> that the checksum field is not calculated for every record, and the
> EOF record contains a nonzero address (0xFFFF), both of which cause
> ihex2bin to produce an error.
> 
> This means the vendor's firmware would have to be passed through a
> second (custom) fixup tool before being converted yet again with
> ihex2bin. Therefore I (reluctantly) made the decision to handle the
> vendor's semi-custom ihex format in the driver directly.
> 
> If that's a deal breaker, I'm happy to adopt request_ihex_firmware
> and contact the vendor to suggest that their configuration tool is
> updated to export true ihex files. However, there is no guarantee
> as to when/if that would happen, and it seems I would need to offer
> said fixup tool in the meantime (which I can certainly do).
> 
> Let me know if that background changes your mind, or if you would
> still like to see this changed (either way works for me).

OK, I guess we can keep the parser in the driver then. Can you please
call out in the comments that standard parser is not suitable?

Thanks.

-- 
Dmitry

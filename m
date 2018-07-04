Return-Path: <SRS0=lYNq=JU=gmail.com=dmitry.torokhov@kernel.org>
Date: Wed, 4 Jul 2018 15:47:28 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 0/4] input: touchscreen: eeti: DT bindings and
 clean-ups
Message-ID: <20180704154728.t5yykanltuz5f5od@penguin>
References: <20180623154533.26901-1-daniel@zonque.org>
 <e32434be-cb77-e00b-15d6-aa8592399560@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e32434be-cb77-e00b-15d6-aa8592399560@zonque.org>
To: Daniel Mack <daniel@zonque.org>
Cc: robh+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 02, 2018 at 09:55:25AM +0200, Daniel Mack wrote:
> Hi Dmitry,
> 
> On Saturday, June 23, 2018 05:45 PM, Daniel Mack wrote:
> > This is v2 of the series that brings DT bindings to the eeti driver and
> > cleans up the code a bit.
> 
> Is this set good to go in or should I repost it with Rob's Reviewed-by in
> 1/4?

No, I applied the lot, thanks.

> 
> 
> Thanks,
> Daniel
> 
> 
> > 
> > Changelog:
> > 
> > v1 → v2:
> > * dropped module parameters
> > * use touchscreen_report_pos() and drop some code for that
> > * squashes 4/5 and 5/5 of v1
> > 
> > Daniel Mack (4):
> >    dt-bindings: input: touchscreen: add bindings for eeti touchscreen
> >      controller
> >    input: touchscreen: eeti: add device tree matching table
> >    input: touchscreen: eeti: drop module parameters, parse DT properties
> >    input: touchscreen: eeti: fix link to documentation and email address
> >      in header
> > 
> >   .../bindings/input/touchscreen/eeti.txt       | 31 ++++++++++++++++
> >   drivers/input/touchscreen/eeti_ts.c           | 37 +++++++++----------
> >   2 files changed, 48 insertions(+), 20 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> > 
> 

-- 
Dmitry

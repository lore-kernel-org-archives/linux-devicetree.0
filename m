From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/2] dt-bindings: rtc: Move trivial RTCs to rtc.txt
Date: Tue, 4 Dec 2018 01:04:41 +0100
Message-ID: <20181204000441.GQ8952@piout.net>
References: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
 <20181111193114.24307-2-alexandre.belloni@bootlin.com>
 <20181203234558.GA10722@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203234558.GA10722@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/12/2018 17:45:58-0600, Rob Herring wrote:
> On Sun, Nov 11, 2018 at 08:31:14PM +0100, Alexandre Belloni wrote:
> > Move trivial RTCs to the rtc generic binding documentation as they all also
> > support at least 'start-year'.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/rtc.txt | 34 +++++++++++++++++++
> >  .../devicetree/bindings/trivial-devices.txt   | 24 -------------
> >  2 files changed, 34 insertions(+), 24 deletions(-)
> 
> Okay if I take these 2 to avoid conflicts with trivial-devices.txt?
> 

Sure, I was actually planning for them to go through your tree for this
reason.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

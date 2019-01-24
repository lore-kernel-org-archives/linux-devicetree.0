From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] firmware: xilinx: Add reset API's
Date: Thu, 24 Jan 2019 11:10:43 +0100
Message-ID: <1548324643.6014.8.camel@pengutronix.de>
References: <20190125074654.10950-1-nava.manne@xilinx.com>
         <20190125074654.10950-2-nava.manne@xilinx.com>
         <1548322989.6014.4.camel@pengutronix.de>
         <e0f6e1d3-e443-040e-8c07-79359e2af37a@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0f6e1d3-e443-040e-8c07-79359e2af37a@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Nava kishore Manne <nava.manne@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, rajanv@xilinx.com, jollys@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-01-24 at 10:49 +0100, Michal Simek wrote:
> On 24. 01. 19 10:43, Philipp Zabel wrote:
> > On Fri, 2019-01-25 at 13:16 +0530, Nava kishore Manne wrote:
> > > This Patch Adds reset API's to support release, assert
> > > and status functionalities by using firmware interface.
> > > 
> > > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> > 
> > Michal, Should I merge this through the reset tree together with the
> > reset driver?
> 
> It would be better if this goes via my tree. There is at least one
> series which also touches the same parts in these files that's why there
> will be collisions.
> 
> If you can review that I will take it via my tree and arm-soc guys to
> mainline.

Ok, thanks. Feel free to add my

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to to reset patches and pick them up together into your tree.

regards
Philipp

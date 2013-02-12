From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH] of: dma.c: fix memory leakage
Date: Tue, 12 Feb 2013 09:40:25 -0800
Message-ID: <20130212174025.GB17659@intel.com>
References: <1358600805-20193-1-git-send-email-dinggnu@gmail.com>
 <50FC6EB1.4050704@gmail.com>
 <20130122101053.GA2427@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130122101053.GA2427@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cong Ding <dinggnu@gmail.com>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2013 at 10:10:53AM +0000, Cong Ding wrote:
> On Sun, Jan 20, 2013 at 04:24:49PM -0600, Rob Herring wrote:
> > On 01/19/2013 07:06 AM, Cong Ding wrote:
> > > The memory allocated to ofdma might be a leakage when error occurs.
> > > 
> > > Signed-off-by: Cong Ding <dinggnu@gmail.com>
> > 
> > You need to send this to whomever is working on DMA bindings.
> Thank you bob, I added Vinod the the receiver list.
I have moved the of/dma.c to dma/of-dma.c, can you regenerate this patch and
resend to me

--
~Vinod

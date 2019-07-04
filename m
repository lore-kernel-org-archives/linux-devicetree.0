From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
Date: Thu, 4 Jul 2019 09:02:39 +0200
Message-ID: <20190704070239.GB32707@kroah.com>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
 <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 04, 2019 at 12:13:40PM +0530, Sai Prakash Ranjan wrote:
> On 7/4/2019 1:32 AM, Mathieu Poirier wrote:
> > Hi Greg,
> > 
> > On Thu, 27 Jun 2019 at 12:15, Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> > > 
> > > Do not assume the affinity to CPU0 if cpu phandle is omitted.
> > > Update the DT binding rules to reflect the same by changing it
> > > to a required property.
> > > 
> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > 
> > I'm all good with this patch - can you pick this up for the coming
> > merge window?  If not I'll simply keep it in my tree for 5.4.
> > 
> > Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> 
> I think you missed adding Greg, adding him now ;)

I don't see any patch here for me to actually take :(

From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [RESEND PATCHv4 1/1] coresight: Do not default to CPU0 for
 missing CPU phandle
Date: Thu, 27 Jun 2019 23:51:56 +0530
Message-ID: <0e33a1f2-f535-91e3-635d-dc8852833a0b@codeaurora.org>
References: <cover.1561610498.git.saiprakash.ranjan@codeaurora.org>
 <0a20cf9eb34b14a191381af98af1694bbc222734.1561610498.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkyaeroow1dRaffy5pxSCH7ocb9=EMeZeSjgpjDWXu18vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANLsYkyaeroow1dRaffy5pxSCH7ocb9=EMeZeSjgpjDWXu18vg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Leo Yan <leo.yan@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 6/27/2019 10:54 PM, Mathieu Poirier wrote:
> 
> I want to apply your code to my tree but it isn't easy for me to do
> so.  Did you notice the checkpatch.pl warning about the DT bindings
> being in a separate patch?  In this case it is not a new binding but
> following the process gives the DT maintainers the opportunity to at
> least look at your patch.  Because the changes are trivial they may
> decide to ignore it but that choice it theirs to make.
> 

Hmm, git log on coresight dt-bindings showed some examples like
this where bindings were updated in the same patch.

Anyways, I have separated out the patch now and resent v5.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

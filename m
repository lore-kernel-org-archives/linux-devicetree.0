From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 2/2] dma: sprd: Add Spreadtrum DMA driver
Date: Tue, 26 Sep 2017 08:15:54 +0800
Message-ID: <CAMz4kuLPVio6x+Twj+stYHAKGTdqBfMivBMH3_TaEK2VgghOdw@mail.gmail.com>
References: <69228f2ae8af7cff6b2a5e75503a08bd756a0d5e.1504777856.git.baolin.wang@spreadtrum.com>
 <6225db538d6f22c608da89520576669784a82e1e.1504777856.git.baolin.wang@spreadtrum.com>
 <20170925094759.GB30097@localhost> <CAMz4kuK-4Op0+zk4=V8h-8K+oKR+AnsyvV9mwJbP3xNUMpw9Fg@mail.gmail.com>
 <20170925211406.r2zqips6vxv6fgjv@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170925211406.r2zqips6vxv6fgjv@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vinod.koul@intel.com>, Baolin Wang <baolin.wang@spreadtrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26 September 2017 at 05:14, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 26, 2017 at 04:02:52AM +0800, Baolin Wang wrote:
>> On 25 September 2017 at 17:47, Vinod Koul <vinod.koul@intel.com> wrote:
>> > On Thu, Sep 07, 2017 at 06:00:04PM +0800, Baolin Wang wrote:
>> >
>> >> +static void sprd_dma_chn_update(struct sprd_dma_chn *schan, u32 reg,
>> >> +                             u32 mask, u32 val)
>
>> > right justfied pls
>
>> I have made these to right justified, but I do not know why it looks
>> like in this email. I checked the patch in patchwork[1], it already
>> right justified. But I will check again to make sure they are right
>> justified.
>
> This happens as a result of indenting with tabs - when things get quoted
> or the characters get added at the start of the line you can get an
> extra couple of characters on the line with no blank space but that's
> less than a tab so the lines indented by tabs suddenly aren't lined up.
> It'll be fine once the patch is applied.

Make sense. Thanks.

-- 
Baolin.wang
Best Regards

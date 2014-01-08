From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Wed, 08 Jan 2014 19:04:57 +0100
Message-ID: <4160932.uvjJSNcuKL@amdc1227>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
 <20140108171544.GC14575@lee--X1> <20140108175939.27803.30462@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <20140108175939.27803.30462@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 08 of January 2014 09:59:39 Mike Turquette wrote:
> Quoting Lee Jones (2014-01-08 09:15:44)
> > > I believe Lee has already applied this one, but in future, to avoid such
> > > confusion, if it's more convenient for you, I can send you any clock
> > > series as pull requests.
> > 
> > Me? I haven't applied any clk patches.
> 
> I have taken patches 1-7 into clk-next just now.

Thanks.

> I can take patch #8 as
> well but it would probably be better to send it through arm-soc?

Hmm, patch 8 is trivial enough to not cause any merge conflicts, but since
it's unlikely that any users depending on introduced changes will show up
for 3.14 it shouldn't really matter which tree it goes through...

Best regards,
Tomasz

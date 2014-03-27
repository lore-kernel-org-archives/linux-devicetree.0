From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC v3 1/2] clk: Add function parsing arbitrary clock list
 DT property
Date: Thu, 27 Mar 2014 19:02:47 +0100
Message-ID: <533467C7.7020804@samsung.com>
References: <1395922579-28547-1-git-send-email-s.nawrocki@samsung.com>
 <1395922579-28547-2-git-send-email-s.nawrocki@samsung.com>
 <3164460.aT5tTxdc17@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <3164460.aT5tTxdc17@amdc1032>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, t.figa@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, grant.likely@linaro.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Bart,

On 27/03/14 18:17, Bartlomiej Zolnierkiewicz wrote:
>> +struct clk *of_clk_get_by_property(struct device_node *np,
>
> This causes build brake with s3c6400_defconfig
> (it should be 'static inline').

Thanks for reporting it, I assume you meant "build break"? ;)
Will fix that and similar issue in patch 2/2 for next iteration.

--
Regards,
Sylwester

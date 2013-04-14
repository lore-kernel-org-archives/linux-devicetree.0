From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: si5351: Add gapless tuning for SI5351 PLL
Date: Sun, 14 Apr 2013 00:00:56 -0700
Message-ID: <20130414070056.6507.87735@quantum>
References: <1365495975-792-1-git-send-email-michal.bachraty@streamunlimited.com>
 <20130412183809.6507.27844@quantum> <51685F60.9010802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51685F60.9010802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michal Bachraty <michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Sebastian Hesselbarth (2013-04-12 12:24:16)
> On 04/12/2013 08:38 PM, Mike Turquette wrote:
> > Quoting Michal Bachraty (2013-04-09 01:26:15)
> >> For gapless tuning, there is no need for PLL reset and clkout power-down
> >> when tuning output. "silabs,gapless-tuning" parameter enables gapless tuning
> >> for specific clock output.
> >>
> >> Signed-off-by: Michal Bachraty<michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>
> >
> > Hi Michal,
> >
> > This did not apply cleanly on the latest (v8) si5351 clk driver.  Can
> > you refresh it?  I do not plan on taking any more patches for 3.10 after
> > 3.9-rc7 drops (likely on Sunday or Monday).  So this patch may need to
> > wait until after the merge window.
> 
> Mike,
> 
> I have integrated the above function into clk-si5351 during development
> (see clk-si5351 changelog from v6->v7). I think we can drop this patch,
> as Michal added his Tested-by to clk-si5351.
> 

Great.

Thanks,
Mike

> Regards,
>    Sebastian

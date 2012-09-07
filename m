From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: add of_clk_src_onecell_get() support
Date: Fri, 7 Sep 2012 08:26:20 +0800
Message-ID: <20120907002618.GB26709@S2101-09.ap.freescale.net>
References: <1345642590-29905-1-git-send-email-shawn.guo@linaro.org>
 <1345642590-29905-2-git-send-email-shawn.guo@linaro.org>
 <20120831064125.GA3271@r65073-Latitude-D630>
 <20120906221155.20289.73650@nucleus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120906221155.20289.73650@nucleus>
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
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 06, 2012 at 03:11:55PM -0700, Mike Turquette wrote:
> Quoting Shawn Guo (2012-08-30 23:41:27)
> > Ping, Mike.
> > 
> 
> Hi Shawn,
> 
> Do you want me to take everything including patch #2?  I'm OK with the
> series but want to make sure it won't cause too much problem for you if
> the DTS and arch/arm changes go through my tree.
> 
It will cause conflicts to have those arch/arm changes to go through
your tree, so I expect you only take patch #1 and ensure your branch
is stable.  I will ask arm-soc people to pull in your branch as
dependency, and then I can have other patches go via arm-soc tree.

-- 
Regards,
Shawn

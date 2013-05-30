From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] clk/mpc85xx: Update the compatible string
Date: Thu, 30 May 2013 14:26:38 -0500
Message-ID: <17C23704-7017-427C-A00F-CEFA6247D65D@kernel.crashing.org>
References: <1369210939-25087-1-git-send-email-Yuantian.Tang@freescale.com>
 <20130530185732.4470.91176@quantum> <20130530192143.4470.23214@quantum>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130530192143.4470.23214@quantum>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On May 30, 2013, at 2:21 PM, Mike Turquette wrote:

> Quoting Mike Turquette (2013-05-30 11:57:32)
>> Quoting Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org (2013-05-22 01:22:19)
>>> From: Tang Yuantian <yuantian.tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> 
>>> The compatible string of clock is changed from *-2 to *-2.0
>>> on chassis 2. So updated it accordingly.
>>> 
>>> Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> 
>> Taken into clk-next.
>> 
> 
> One small nitpick.  I updated the $SUBJECT to:
> 
> clk: mpc85xx: Update the compatible string
> 
> The difference being "clk: mpc85xx:" versus "clk/mpc85xx:".  Please use
> the former format in the future.
> 
> Thanks,
> Mike

Mike,

If clk-ppc-corenet.c went into v3.10, than I think this fix is needed there and shouldn't wait til v3.11

- k

From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCHv4 00/13] VIC DT binding and MULTI_IRQ_HANDLER
Date: Wed, 9 Nov 2011 10:01:44 +0000
Message-ID: <20111109100144.GA4253@totoro>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1320369010-23428-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2011 at 01:09:57AM +0000, Jamie Iles wrote:
> Since the last revision I've updated the handling loop as suggested by
> Linus and Russell, added a patch for picoxcell and added a final patch
> to remove the non MULTI_IRQ_HANDLER support for VIC.  The final patch
> assumes that all VIC users will be converted to MULTI_IRQ_HANDLER which
> I would hope would be the case but this could be dropped if not.
> 
> I've also included Marc's patch for reference as the mach patches are
> dependent on it.
> 
> Jamie Iles (12):
>   ARM: vic: device tree binding
>   ARM: vic: MULTI_IRQ_HANDLER handler
>   ARM: ep93xx: convert to MULTI_IRQ_HANDLER
>   ARM: netx: convert to MULTI_IRQ_HANDLER
>   ARM: nomadik: convert to MULTI_IRQ_HANDLER
>   ARM: s3c64xx: convert to MULTI_IRQ_HANDLER
>   ARM: spear: convert to MULTI_IRQ_HANDLER
>   ARM: u300: convert to MULTI_IRQ_HANDLER
>   ARM: versatile: convert to MULTI_IRQ_HANDLER
>   ARM: samsung: convert to MULTI_IRQ_HANDLER
>   ARM: picoxcell: convert to MULTI_IRQ_HANDLER
>   ARM: VIC: remove non MULTI_IRQ_HANDLER support

Marc has kindly offered to take these with his GIC patches so I'd like 
to send him a pull request tomorrow.  Some Acked-by/Tested-by's for the 
other platforms would be much appreciated!

Thanks,

Jamie

From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: use C pre-processor with dtc
Date: Tue, 25 Sep 2012 14:35:46 -0500
Message-ID: <1348601746.5565.18@snotra>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="Flowed"; DelSp="Yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348599998-2729-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (from
 swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org on Tue Sep 25 14:06:35 2012)
Content-Disposition: inline
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2012 02:06:35 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This series adds some build rules to run cpp on *.dts-cpp prior to
> invoking dtc, and converts Tegra to the new rule as an example. What  
> do
> people think?
> 
> I assume that you've applied the dtc patches I sent yesterday. They
> aren't in this series. See:
> 
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020182.html
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020183.html
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-September/020181.html
> 
> Note: those patches are against upstream dtc. If you wish to test this
> series, apply the dtc patches to upstream dtc, build it, and copy the
> resultant dtc binary over the top of scripts/dtc/dtc.
> 
> Stephen Warren (3):
>   kbuild: introduce cmd_dtc_cpp
>   ARM: use cmd_dtc_cpp for compilation of *.dts-cpp to *.dtb
>   ARM: tegra: compile all DT files with cpp

Do you have an example of where you'd actually benefit from this?  I'd  
think most things could either be done reasonably well with what's  
built into DTC (see what we've done in arch/powerpc/boot/dts/fsl), or  
would need math expression support in DTC (or has that been added?).

-Scott

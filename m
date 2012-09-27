From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: use C pre-processor with dtc
Date: Thu, 27 Sep 2012 07:40:38 +0200
Message-ID: <20120927054038.GL17667@game.jcrosoft.org>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348599998-2729-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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

On 13:06 Tue 25 Sep     , Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This series adds some build rules to run cpp on *.dts-cpp prior to
> invoking dtc, and converts Tegra to the new rule as an example. What do
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
I do not like the extention

can we run gcc everytime?

or just do as done for lds

*.dts.S

Best Regards,
J.

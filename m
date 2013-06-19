From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 0/5] mfd: twl4030-power: Start DT conversion and updates
Date: Wed, 19 Jun 2013 10:23:48 +0200
Message-ID: <20130619082348.GQ7161@zurbaran>
References: <1371561480-28325-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371561480-28325-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
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
To: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Cc: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

On Tue, Jun 18, 2013 at 03:17:55PM +0200, Florian Vaussard wrote:
> Hello,
> 
> This series enables a partial DT support for twl4030-power. The
> missing part is the power management scripts, as the required
> binding should be defined first. It however enables the complete
> shutdown of the processor at poweroff when booting with DT,
> dropping the power consumption from around 350 mA on Overo+Tobi
> to about 40 mA.
> 
> The poweroff callback was tested with both DT and non-DT boots.
> 
> The last two patches simplify the error path in the probe function,
> and fix registers relocking on error.
> 
> Best regards,
> 
> Florian
> 
> Since v1:
> - use module_platform_driver()
> - split the refactoring of the probe function into a dedicated patch
> - new patch to fix registers relocking on error
> - rebased on mfd-next
> 
> 
> Florian Vaussard (5):
>   mfd: twl4030-power: Split from twl-core into a dedicated module
>   mfd: twl4030-power: Simplify probing of power scripts and resources
>   mfd: twl4030-power: Start transition to DT
>   mfd: twl4030-power: Simplify error path
>   mfd: twl4030-power: Fix relocking on error
All 5 patches applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/

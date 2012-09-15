From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V4 REPOST] mfd: add MAX8907 core driver
Date: Sun, 16 Sep 2012 00:51:42 +0200
Message-ID: <20120915225142.GI3647@sortiz-mobl>
References: <1346973015-7252-1-git-send-email-swarren@wwwdotorg.org>
 <5050B850.807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5050B850.807-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: Gyungoh Yoo <jack.yoo-4qAbB/aHxuBWk0Htik3J/w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Sep 12, 2012 at 10:29:04AM -0600, Stephen Warren wrote:
> On 09/06/2012 05:10 PM, Stephen Warren wrote:
> > From: Gyungoh Yoo <jack.yoo-4qAbB/aHxuBWk0Htik3J/w@public.gmane.org>
> > 
> > The MAX8907 is an I2C-based power-management IC containing voltage
> > regulators, a reset controller, a real-time clock, and a touch-screen
> > controller.
> 
> Samuel,
> 
> This patch as-is won't compile due to the mfd_add_devices() API change.
> Do you want to fix this up when you apply (simply add an extra parameter
> "NULL" to the mfd_add_devices() call), or should I send an updated V5
> for this?
I'll fix it up, don't bother sending a v5.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/

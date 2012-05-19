From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 0/4] MFD: twl6040: Device tree support
Date: Sat, 19 May 2012 17:32:36 +0200
Message-ID: <20120519153236.GQ12015@sortiz-mobl>
References: <1337166718-8458-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337166718-8458-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: Dmitry Torokhov <dtor-JGs/UdohzUI@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Misael Lopez Cruz <misael.lopez-l0cyMroinI0@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Wed, May 16, 2012 at 02:11:54PM +0300, Peter Ujfalusi wrote:
> Hello,
> 
> Changes since v2:
> - Child devices are no longer described in dts, they are created with
>   mfd_add_devices()
> - ASoC codec device is created unconditionally (main function of twl6040)
> 
> Changes since v1:
> - Commit message for patch 2 (Allocate IRQ numbers dynamically) has been updated
>   to describe that the twl6040 can not be used as IRQ extender type of device.
> 
> Commit message from v1:
> 
> The following series adds device tree support for the twl6040 MFD core driver.
> Support for the child drivers (vibra, ASoC codec) will be submitted via the
> corresponding subsystem since there is no compile time dependency between them.
> 
> The first patch is a minor clean up patch to remove wrapped lines in the
> twl6040-irq.c. The resulting code is more natural to read to me.
> 
> The series depends on the regulator support patch for the twl6040:
> http://marc.info/?l=linux-kernel&m=133596703610515&w=2
All 4 patches applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/

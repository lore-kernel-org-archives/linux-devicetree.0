From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: adding devicetree support for an interrupt controller
Date: Tue, 17 Apr 2012 12:56:38 -0700
Message-ID: <1334692598.31514.1.camel@rklein-linux>
References: <1334281118.24034.1592.camel@rklein-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334281118.24034.1592.camel@rklein-linux>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2012-04-12 at 18:38 -0700, Rhyland Klein wrote:
> So I am working on adding DT support for the tps65910 pmic. It (amongst
> other things) is an interrupt controller. I am looking to convert that
> code as well, and I am curious if there is a good example to work off.
> 
> The driver's irq_base is not set, so it needs to use a dynamic domain.
> The examples I saw seemed to be all platform devices and then used
> something like irq_setup_generic_chip_domain, but since the tps65910 is
> an i2c device, its device doesn't have resources associated with it, and
> can't therefore pass them to this function. 
> 
> Is there already a defined path for i2c interrupt controllers like this?
> 
> thanks,
> Rhyland

Resending as I didn't see a response. Is there an established way to
initialize and irq controller that is an i2c device using dt yet?

-rhyland


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------

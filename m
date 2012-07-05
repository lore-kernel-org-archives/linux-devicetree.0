From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 0/2] mfd: tps65910: add support for enabling external
 32-kHz oscillator
Date: Thu, 5 Jul 2012 17:23:34 +0200
Message-ID: <20120705152334.GH18200@sortiz-mobl>
References: <1340878822-28444-1-git-send-email-jhovold@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1340878822-28444-1-git-send-email-jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Johan,

On Thu, Jun 28, 2012 at 12:20:20PM +0200, Johan Hovold wrote:
> These patches (against v3.5-rc4) add support for enabling the external 32-kHz
> oscillator input in tps6591x devices. Depending on boot-mode, the internal
> RC-oscillator may be used by default and the external crystal-oscillator input
> must be enabled by clearing a flag in the device-control register.
> 
> These patches are needed in order to get an accurate system clock on boards
> such as the Craneboard.
> 
> Thanks,
> Johan
> 
> Johan Hovold (2):
>   mfd: tps65910: add support for enabling external 32-kHz oscillator
>   mfd: tps65910: add device-tree entry to enable external 32-kHz
>     oscillator
Both patches applied, although the misc_init() naming is quite vague. If you
can come up with a follow up patch for a better name, I'll take it.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/

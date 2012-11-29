From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 4/9] usb: chipidea: ci13xxx-imx: add "dr_mode" property to
 device tree bindings
Date: Thu, 29 Nov 2012 14:54:02 +0200
Message-ID: <87pq2wmuxh.fsf@ashishki-desk.ger.corp.intel.com>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-5-git-send-email-m.grzeschik@pengutronix.de>
 <878va17oii.fsf@ashishki-desk.ger.corp.intel.com>
 <20121126094626.GB15740@nchen-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121126094626.GB15740@nchen-desktop>
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
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:

> On Fri, Nov 16, 2012 at 01:53:09PM +0200, Alexander Shishkin wrote:
>> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
>> I'd prefer this function to live in ci13xxx_imx, since that's where it's
>> used and it doesn't really need anything from core.c anyway. Or maybe it
>> would make sense to make it even more generic (for other devitetree
>> users), since you're saying that other drivers are using this already.
>> 
>> Looks good to me otherwise.
>
> I think it supplies a way that the platform can override the usb role,
> only freescale uses it, but also other platforms may use it. It is a
> generic feature, other chipidea users may need it.

I'm not objecting against the flags, I just don't like the function in
chipidea core. Platform code can just use the flags. It can be either
part of the platform driver or a generic dt helper, in case there are
more users, it doesn't belong to chipidea core.

Regards,
--
Alex

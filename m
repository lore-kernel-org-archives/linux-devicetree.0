From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v5 0/1] drivers: mfd: Versatile Express SPC support
Date: Tue, 16 Jul 2013 23:26:49 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1307162323530.14924@syhkavp.arg>
References: <1373990743-23106-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373990743-23106-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Achin Gupta <achin.gupta-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 16 Jul 2013, Lorenzo Pieralisi wrote:

> Hello,
> 
> version v5 of VExpress SPC driver, please read on the changelog for major
> changes and explanations.
> 
> The probing scheme is unchanged, since after trying the early platform
> devices approach it appeared that the end result was no better than the
> current one. The only clean solution relies either on changing how
> secondaries are brought up in the kernel (later than now) or enable
> early platform device registration through DT. Please check this
> thread for the related discussion:
> 
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-June/036542.html
> 
> The interface was adapted to regmap and again reverted to old driver for
> the following reasons:
> 
> - Power down registers locking is hairy and requires arch spinlocks in
>   the MCPM back end to work properly, normal spinlocks cannot be used
> - Regmap adds unnecessary code to manage SPC since it is just a bunch of
>   registers used to control power management flags, the overhead is just
>   not worth it (talking about power down registers, not the vexpress config
>   interface)
> - The locking scheme behind regmap requires all registers in the map
>   to be protected with the same lock, which is not exactly what we want
>   here
> - Given the reasons above, adding a regmap interface buys us nothing from
>   a driver readability and maintainability perspective (again just talking
>   about the power interface, a few registers) because for the SPC it would
>   simply not be used
> 
> /drivers/mfd is probably not the right place for this code as it stands (but
> probably will be when the entire driver, with DVFS and config interface, is
> complete).
> 
> Thank you for the review in advance,
> Lorenzo

I've integrated this patch in my MCPM backend for TC2 patch series.

ACKs from concerned/interested people would be appreciated so I could 
send this for ARM-SOC inclusion right away.


Nicolas

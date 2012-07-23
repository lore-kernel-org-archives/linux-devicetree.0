From: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Forcing PIO mode instead of DMA via DT property
Date: Mon, 23 Jul 2012 09:19:57 +0530
Message-ID: <500CC9E5.4060109@nvidia.com>
References: <201207222328.27008.marex@denx.de>
 <ACB6D0C0104CFF42A45A5D82A0DD4F3D079B4DAE@039-SN2MPN1-013.039d.mgd.msft.net>
 <201207230531.02305.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201207230531.02305.marex-ynQEQJNshbs@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


>> One option would be to
>> put a compile time flag in the driver, which prefers PIO than DMA. I
>> believe by default DMA is the first preference.
> Certainly, but please consider you might want to use PIO only on selected
> instances of the driver (aka. selected busses, I wasn't probably clear enough,
> this is a bus driver), not degrade performance on all of them. Possibly due to a
> specific hardware wiring of the particular system.
>

Device Trees are a replacement for board files. If your board uses PIO 
mode due to some hardware limitations, then you need to specify this in 
the .dt for that board. The driver should then just query this property 
and proceed with its init.

Regards,
Varun

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------

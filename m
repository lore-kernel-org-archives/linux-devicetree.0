From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 1/5] ARM i.MX6q: Add GPU, VPU, IPU, and OpenVG resets
 to system reset controller
Date: Thu, 10 Jan 2013 11:19:18 -0700
Message-ID: <50EF0626.1050301@wwwdotorg.org>
References: <1357751839-19680-1-git-send-email-p.zabel@pengutronix.de>
 <1357751839-19680-2-git-send-email-p.zabel@pengutronix.de>
 <50EDB3D1.5010900@wwwdotorg.org>
 <1357825911.2363.667.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357825911.2363.667.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/10/2013 06:51 AM, Philipp Zabel wrote:
> Hi Stephen,
> 
> Am Mittwoch, den 09.01.2013, 11:15 -0700 schrieb Stephen Warren:
>> On 01/09/2013 10:17 AM, Philipp Zabel wrote:
>>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/reset/fsl,imx-src.txt      |   45 ++++++++++++++++++++
>>
>> I proposed something very similar a while back; it may be useful to look
>> at the previous discussion there:
>>
>> http://www.spinics.net/lists/arm-kernel/msg202451.html
> 
> Thanks, I had started playing around with some "reset subsystem"
> patches, but so far shied away from what feels like a whole lot of code
> for little effect. I came to the same conclusion that replacing gpio
> resets would probably be overkill, but I was only peripherally aware of
> the tegra reset controller.

> So a simple common struct and some oftree parsing code in drivers/reset
> that can replace both the proposed imx patch and what
> tegra_periph_reset_* do would be considered useful?

Yes, I didn't really imagine the "reset subsystem" would do more than
parsing the DT property that represented the reset and look up the
registered reset controller and reset ID. Plus, provide some central
function to pass the parsed reset ID to the reset controller driver. Of
course, if it expanded to cover non-DT cases it might get more complex,
but that can always be added later.

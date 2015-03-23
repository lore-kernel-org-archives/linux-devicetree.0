From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v5 03/12] mfd: axp20x: add AXP22x PMIC support
Date: Mon, 23 Mar 2015 09:58:52 -0700
Message-ID: <CAGb2v66Q+7t=wMUsEKFg57mCTcd6QE5=Q67YrYR40CQDgQo_Mw@mail.gmail.com>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-4-git-send-email-wens@csie.org> <20150323115225.GA24422@x1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZEMYGUAKGQEKA774GA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150323115225.GA24422@x1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Mar 23, 2015 at 4:52 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 10 Mar 2015, Chen-Yu Tsai wrote:
>
>> From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>
>> Add support for the AXP22x PMIC devices to the existing AXP20x driver.
>> This includes the AXP221 and AXP223, which are identical except for
>> the external data bus. Only AXP221 is added for now. AXP223 will be
>> added after it's Reduced Serial Bus (RSB) interface is supported.
>>
>> AXP22x defines a new set of registers, power supplies and regulators,
>> but most of the API is similar to the AXP20x ones.
>>
>> A new irq chip definition is used, even though the available interrupts
>> on AXP22x is a subset of those on AXP20x. This is done so the interrupt
>> numbers match those on the datasheet.
>>
>> This patch only enables the interrupts, system power-off function, and PEK
>> sub-device. The regulator driver must first support different variants
>> before we enable it from the mfd driver.
>>
>> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> [wens-jdAy2FN1RRM@public.gmane.org: fix interrupts and move regulators to separate patch]
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  drivers/mfd/axp20x.c       | 98 ++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/axp20x.h | 86 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 184 insertions(+)
>
> For my own reference:
>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> How do you wish for these patches to be managed?  Are they okay to be
> sucked up individually, or do you wish for them to go through together
> through a single tree?  If the latter, when which tree?

The driver code (both mfd and regulator) have compile time dependencies
which need to go through the same tree Mark already reviewed the
regulator patches, so if you could take all the mfd and regulator
patches, that would be great.

Maxime already merged some of the dt patches. I still need to fix
up one comment, but he can merge them individually.

Thanks!


Regards
ChenYu

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] tegra: Add tegra keyboard support
Date: Mon, 12 Dec 2011 11:31:36 -0700
Message-ID: <4EE64888.9030703@nvidia.com>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>	<1322881071-11148-5-git-send-email-sjg@chromium.org>	<4EDFE259.9080201@nvidia.com>	<CAPnjgZ3AP2d7kGqawm=CyySd=y0UfXAsYr4r0TvXaX+64pdUuA@mail.gmail.com>	<4EE64135.5070300@nvidia.com>
 <CAPnjgZ1dskr04mNfdkTPVLjbv8EnJisQvt1YrYOjKSSa=AbhkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ1dskr04mNfdkTPVLjbv8EnJisQvt1YrYOjKSSa=AbhkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2011 11:10 AM, Simon Glass wrote:
> On Mon, Dec 12, 2011 at 10:00 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/08/2011 02:56 PM, Simon Glass wrote:
...
>> I'd like to ask for comments in linux-input in case they have any other
>> ideas, e.g. whether a set of separately documented modifier mapping
>> properties makes sense. If not, I suppose the following set of
>> properties would suffice:
>>
>> nvidia,keycode-plain
>> nvidia,keycode-fn
>> u-boot,keycode-shift
>> u-boot,keycode-ctrl
>>
>> (although the last two seem to want both nvidia, and u-boot, prefixes)
> 
> OK. Since this seems to be a kernel issue and Nvidia-specific can I
> ask if you can please send this email? I will wait for confirmation
> that this is OK before going further.

OK, I'll send the email.

I would like to point out though that this is neither a kernel issue nor
NVIDIA-specific: It's a device tree issue dealing with how to best
represent certain HW features, and it will apply equally to any HW that
has a keyboard with modifier keys; essentially all of them.

-- 
nvpublic

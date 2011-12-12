From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 4/6] tegra: Add tegra keyboard support
Date: Mon, 12 Dec 2011 12:03:58 -0800
Message-ID: <CAPnjgZ3VA5hb3MrsWWJ-tQQgK+a9_o9Nw7wVzwgtd-yozRWqMQ@mail.gmail.com>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>
	<1322881071-11148-5-git-send-email-sjg@chromium.org>
	<4EDFE259.9080201@nvidia.com>
	<CAPnjgZ3AP2d7kGqawm=CyySd=y0UfXAsYr4r0TvXaX+64pdUuA@mail.gmail.com>
	<4EE64135.5070300@nvidia.com>
	<CAPnjgZ1dskr04mNfdkTPVLjbv8EnJisQvt1YrYOjKSSa=AbhkA@mail.gmail.com>
	<4EE64888.9030703@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EE64888.9030703@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, U-Boot Mailing List <u-boot@lists.denx.de>, Rakesh Iyer <riyer@nvidia.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Dec 12, 2011 at 10:31 AM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/12/2011 11:10 AM, Simon Glass wrote:
>> On Mon, Dec 12, 2011 at 10:00 AM, Stephen Warren <swarren@nvidia.com> wrote:
>>> On 12/08/2011 02:56 PM, Simon Glass wrote:
> ...
>>> I'd like to ask for comments in linux-input in case they have any other
>>> ideas, e.g. whether a set of separately documented modifier mapping
>>> properties makes sense. If not, I suppose the following set of
>>> properties would suffice:
>>>
>>> nvidia,keycode-plain
>>> nvidia,keycode-fn
>>> u-boot,keycode-shift
>>> u-boot,keycode-ctrl
>>>
>>> (although the last two seem to want both nvidia, and u-boot, prefixes)
>>
>> OK. Since this seems to be a kernel issue and Nvidia-specific can I
>> ask if you can please send this email? I will wait for confirmation
>> that this is OK before going further.
>
> OK, I'll send the email.

Thanks.

>
> I would like to point out though that this is neither a kernel issue nor
> NVIDIA-specific: It's a device tree issue dealing with how to best
> represent certain HW features, and it will apply equally to any HW that
> has a keyboard with modifier keys; essentially all of them.

Sorry I don't quite understand what you mean by that, given your
comments that we should ask on linux-input. While it could apply to
the two existing keyboard drivers, they each do their own thing at
present.

Regards,
Simon

>
> --
> nvpublic

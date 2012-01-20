From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 2/7] fdt: Add function to allow aliases to
 refer to multiple nodes
Date: Thu, 19 Jan 2012 16:31:43 -0800
Message-ID: <CAPnjgZ3kAtC1Qp=iO33YipB_eW=jnbrK1aviKRjMZjpKRzbKoQ@mail.gmail.com>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
	<1326394818-32227-3-git-send-email-sjg@chromium.org>
	<4F1881BD.2050704@nvidia.com>
	<CAPnjgZ3c6POmEoNRiz+wX8YGVzAtUyzzjXyaz9W9wepLsByoGw@mail.gmail.com>
	<4F18B28C.4030203@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F18B28C.4030203@nvidia.com>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, Jan 19, 2012 at 4:17 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 01/19/2012 04:45 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Thu, Jan 19, 2012 at 12:49 PM, Stephen Warren <swarren@nvidia.com> wrote:
>>> On 01/12/2012 12:00 PM, Simon Glass wrote:
>>>> Some devices can deal with multiple compatible properties. The devices
>>>> need to know which nodes to bind to which features. For example an
>>>> I2C driver which supports two different controller types will want to
>>>> know which type it is dealing with in each case.
>>>>
>>>> The new fdtdec_add_aliases_for_id() function deals with this by allowing
>>>> the driver to search for additional compatible nodes for a different ID.
>>>> It can then detect the new ones and perform appropriate processing.
>>>>
>>>> Another option considered was to return a tuple (node offset, compat id)
>>>> and have the function be passed a list of compatible IDs. This is more
>>>> overhead for the common case though. We may add such a function later if
>>>> more drivers in U-Boot require it.
> ...
>>> I'm not convinced this patch is correct in all cases. It'll probably
>>> work fine for simply device-trees though. Consider the following case:
>>>
>>> 4 device nodes
>>> A: compat=i2c alias for usb0
>>> B: compat=i2c no alias
>>> C: compat=i2c alias for usb2
>>> D: compat=i2cx alias for usb1
>>>
>>> First, we search for all compat=i2c, the list comes back:
>>>
>>> 0=A
>>> 1=B
>>> 2=C
>>>
>>> Then we search for all compat=i2cx, the list comes back:
>>>
>>> -1
>>> -1
>>> -1
>>> D
>>>
>>> So D's alias of 1 isn't honored even though if both IDs were searched
>>> for together, it would have been.
>>
>> Do we really want that behaviour? Overall I think it is a bit odd to
>> have devices with no aliases if you actually care about the ordering.
>> At least in U-Boot ordering is important. The simple fix above is to
>> provide an alias for everything, which is what we do. If we do want
>> the behaviour you suggest then I will need the change to doing it in
>> one pass.
>
> I think that behaviour is the intended given that DT content. Despite
> the fact that content is admittedly a little twisted and perhaps not
> commonly useful, since this is user-supplied content in general, I don't
> think we can simply not accept it or not implement the fairly obvious
> intent.
>
>>> Also, what about the scenario where a driver searches for both
>>> nvidia,tegra20-i2c then later nvidia,tegra30-i2c, given that all the DT
>>> nodes are probably compatible with both?
>>
>> If all DT notes are compatible with both, why are you searching for
>> one and then the other? Why not just search for one?
>
> I suppose one /shouldn't/ need to.
>
> I was thinking of supporting the case where somebody only wrote
> compatible = "nvidia,tegra30-i2c" and left out the Tegra20 variant.
> Still, is arguably a bug, and that won't work in the kernel either since
> we're not going around adding all the new compatible values into the
> drivers when the devices are compatible with the existing HW anyway.
>
> I guess if we do get some legitimate case that trips this issue, we can
> just fix it then, since it's entirely isolated to the code and doesn't
> impact anything externally visible etc.

Hmmm well perhaps I should add a code comment and see how we go. It
would be nice if this situation could be spotted. I am concerned about
anything that is non-obvious here. Will take a look but otherwise it
sounds like we can punt this until later (unless we decide to move to
the one-pass option).

Anyway this is in a place by itself with unit tests so we should be
able to fiddle if needed.

Regards,
Simon

>
> --
> nvpublic

From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: sun7i: dt: Add new Olimex A20 EVB device
Date: Fri, 21 Aug 2015 09:43:37 +0200
Message-ID: <55D6D6A9.3080006@redhat.com>
References: <1440002596-2611-1-git-send-email-codekipper@gmail.com>
 <20150820154545.GF30520@lukather>
 <CAEKpxBnQ+kCVYfE8JL5JzH5ZXb3azjwmjfAE5OXULaVm0bj2ew@mail.gmail.com>
 <55D6D674.7060205@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBLNN3OXAKGQEYCUYBQA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55D6D674.7060205-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 21-08-15 09:42, Hans de Goede wrote:
> Hi,
>
> On 21-08-15 07:36, Code Kipper wrote:
>> On 20 August 2015 at 17:45, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> wrote:
>>
>>> Hi,
>>>
>>> On Wed, Aug 19, 2015 at 06:43:16PM +0200, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> The A20-SOM-EVB is a reference design of a 2-layer board for the
>>>> A20-SOM.
>>>> It expands the features of A20-SOM by adding VGA connector, HDMI
>>>> connector, audio In/Out, LCD connector, 2 Mpix camera, gigabit
>>>> Ethernet, SATA, USB-OTG and 2 USB hosts.
>>>>
>>>> This patch adds basic support for the device
>>>> https://www.olimex.com/Products/SOM/A20/A20-SOM-EVB/
>>>>
>>>> More information on the SOM can be found here
>>>> http://linux-sunxi.org/Olimex_A20-SOM.
>>>>
>>>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Is there any other SOM planned that could work with that baseboard? Or
>>> any other baseboard for that SOM?
>>>
>> I've seen neither. We could always create a som.dtsi later is one emerges.
>>
>>>
>>>> ---
>>>>   arch/arm/boot/dts/Makefile                    |   1 +
>>>>   arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts | 233
>>> ++++++++++++++++++++++++++
>>>>   2 files changed, 234 insertions(+)
>>>>   create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-evb.dts
>>>
>> Relooking at their website I can see that the device does not come under
>> the olinuxino brand so maybe I should rename the dts to
>> sun7i-a20-olimex-som-evb.dts
>
> Ack for renaming / +1
>
> Regards,
>
> Hans

p.s.

Can you please also send a v2 of the u-boot patch taking the renaming into
account ?

Regards,

Hans

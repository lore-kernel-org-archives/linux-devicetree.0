From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Thu, 3 Oct 2019 22:51:38 +0200
Message-ID: <b8695418-9d3a-96a6-9587-c9a790f49740@redhat.com>
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
 <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03-10-2019 22:37, John Stultz wrote:
> On Thu, Oct 3, 2019 at 2:25 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 03-10-2019 01:16, John Stultz wrote:
>>> From: Yu Chen <chenyu56@huawei.com>
>>>
>>> This patch adds notifier for drivers want to be informed of the usb rol=
e
>>> switch.
>>
>> I do not see any patches in this series actually using this new
>> notifier.
>>
>> Maybe it is best to drop this patch until we actually have in-kernel
>> users of this new API show up ?
>=20
> Fair point. I'm sort of taking a larger patchset and trying to break
> it up into more easily reviewable chunks, but I guess here I mis-cut.
>=20
> The user is the hikey960 gpio hub driver here:
>    https://git.linaro.org/people/john.stultz/android-dev.git/commit/?id=
=3Db06158a2d3eb00c914f12c76c93695e92d9af00f

Hmm, that seems to tie the TypeC data-role to the power-role, which
is not going to work with role swapping.

What is controlling the usb-role-switch, and thus ultimately
causing the notifier you are suggesting to get called ?

Things like TYPEC_VBUS_POWER_OFF and TYPEC_VBUS_POWER_ON
really beg to be modeled as a regulator and then the
Type-C controller (using e.g. the drivers/usb/typec/tcpm/tcpm.c
framework) can use that regulator to control things.
in case of the tcpm.c framework it can then use that
regulator to implement the set_vbus callback.

You really do not want to tie this do the usb_switch, both
because doing so ties the data and power-roles together
which is not supposed to happen and because role-swapping
requires careful timing of the VBUS on / off at different
moments then the moments when you actually set the mux/switch
for connecting the Dp/Dn lines to the host or gadget
controller.

The usb role switch abstraction is really only intended
for the data-lines switch and should not be tied together
with other stuff.

Regards,

Hans

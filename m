From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sunxi: Add regulator-boot-on
 to usb host port regulator nodes
Date: Tue, 23 Jun 2015 00:54:41 +1000
Message-ID: <CAGRGNgXrXgGXhLAQYXVVyG98NbJF4bDE5OWM9TSgYzZYkOR29g@mail.gmail.com>
References: <1434814810-26285-1-git-send-email-hdegoede@redhat.com>
 <1434814810-26285-2-git-send-email-hdegoede@redhat.com> <CAGRGNgU7179K408=PekziP9ZzzG7+rvhm=e7TWjZk1UhkAnVZQ@mail.gmail.com>
 <5587C720.9040007@redhat.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBRGDUCWAKGQE26X6OHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5587C720.9040007-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Mon, Jun 22, 2015 at 6:28 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 22-06-15 02:30, Julian Calaby wrote:
>>
>> Hi Hans,
>>
>> On Sun, Jun 21, 2015 at 1:40 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> wrote:
>>>
>>> u-boot will have turned on the power to the usb host ports, so mark them
>>> as regulator-boot-on, this stops the power on the ports from temporarily
>>> getting turned off during boot, causing issues with e.g. usb powered
>>> harddisks.
>>
>>
>> Stupid question: shouldn't u-boot set this property?
>
>
> We could make u-boot set this property but that will require a lot of code
> on
> u-boot's side which is simply not there atm. And traditionally this property
> is is simply a part of the dts files as shipped with the kernel.

Fair enough.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/

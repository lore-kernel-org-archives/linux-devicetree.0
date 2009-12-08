From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/3] mpc52xx/wdt: WDT uses GPT api
Date: Tue, 8 Dec 2009 14:21:54 -0700
Message-ID: <fa686aa40912081321hc9b1ed3o3e7820f16b960ec6@mail.gmail.com>
References: <fa686aa40911101159y7bef3f9bte74e9aeb5c6e864b@mail.gmail.com>
	<1257884778.14374.5@antares> <20091112213630.GE19336@infomag.iguana.be>
	<fa686aa40911122221s24efdcc9k1daf63b600e7b429@mail.gmail.com>
	<20091208204854.GE4291@infomag.iguana.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091208204854.GE4291-flHiHfN8CTwhDM6iD19NGrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2009 at 1:48 PM, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org> wrote:
> Hi Grant,
>
> Sorry for the delay, I need to deliver a project in a weeks time...

understood.

>> In actual fact, it is a single device with multiple functions, some of
>> which can be used at the same time. =A0The driver for the device
>> determines what the device instance supports and registers the
>> appropriate interfaces. =A0There is a GPIO controller, a PWM controller,
>> a general purpose timer, and the watchdog. =A0Because of the
>> multifunction nature of the device, there are subtle interactions
>> between the functions that the driver needs to maintain. =A0I don't want
>> to export functions from the driver which will only be used by a
>> watchdog instance. =A0I also don't want the added code and complexity of
>> a secondary probe path. =A0It is simpler and less code to roll all the
>> behaviour up into the one driver single driver that gets probed once.
>>
>> >From the maintenance perspective, having the main driver in
>> arch/powerpc and the watchdog bit in drivers/watchdog doesn't really
>> help much anyway because anything that changes the internal driver API
>> (between the core and watchdog bits) will require cross-maintainer
>> changes. =A0ie. do changes go through my tree because they touch
>> arch/powerpc, or do they go through yours because they touch
>> drivers/watchdog? =A0I'd much rather all the internal details be
>> contained within a single driver.
>
> Your argument about maintenance is the same one as I have: If all watchdog
> driver pieces are under drivers/watchdog then it's easier for me to maint=
ain
> them. (Definitely if we are doing clean-up work and API changes).

:-)

>> Besides, there is already precedence for very arch-specific drivers
>> living under arch/*/. =A0find ./arch -name *gpio*
>
> But in this case: I know where to find them and I will keep a mental note
> about this one. And yes indeed some very arch specific drivers can reside
> under arch/*/* .
>
> So please go ahead with pulling this one in a single driver.

Great, Thanks Wim.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

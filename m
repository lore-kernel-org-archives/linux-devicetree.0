From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] PCI: Rockchip: Add Rockchip PCIe controller
 support
Date: Thu, 23 Jun 2016 10:15:04 +0800
Message-ID: <a18b7027-5627-7827-ce28-059cc5819d08@rock-chips.com>
References: <1466041835-1695-1-git-send-email-shawn.lin@rock-chips.com>
 <20160623002919.GA21157@google.com>
 <dcdc3402-22d9-473a-d9ae-b9bd994c24a6@rock-chips.com>
 <20160623013527.GA46876@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623013527.GA46876-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/6/23 9:35, Brian Norris =E5=86=99=E9=81=93:
> Hi,
>
> On Thu, Jun 23, 2016 at 09:09:46AM +0800, Shawn Lin wrote:
>> =E5=9C=A8 2016/6/23 8:29, Brian Norris =E5=86=99=E9=81=93:
>>> On Thu, Jun 16, 2016 at 09:50:35AM +0800, Shawn Lin wrote:
>
> [...]
>
>>>> +	/* 500ms timeout value should be enough for gen1/2 taining */
>>>> +	timeout =3D jiffies + msecs_to_jiffies(500);
>>>> +
>>>> +	err =3D -ETIMEDOUT;
>>>> +	while (time_before(jiffies, timeout)) {
>>>> +		status =3D pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
>>>> +		if (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
>>>> +		      PCIE_CLIENT_LINK_STATUS_MASK) =3D=3D
>>>> +		      PCIE_CLIENT_LINK_STATUS_UP) {
>>>> +			dev_dbg(port->dev, "pcie link training gen1 pass!\n");
>>>> +			err =3D 0;
>>>> +			break;
>>>> +		}
>>>> +		msleep(20);
>>>> +	}
>>>
>>> Technically, the above timeout loop is not quite correct. Possible =
error
>>> case: we can fail with a timeout after 500 ms if the training compl=
etes
>>> between the 480-500 ms time window. This can happen because you're
>>> doing:
>>>
>>> (1) read register: if complete, then terminate successfully
>>> (2) delay
>>> (3) check for timeout: if time is up, return error
>>>
>>> You actually need:
>>>
>>> (1) read register: if complete, then terminate successfully
>>> (2) delay
>>> (3) check for timeout: if time is up, repeat (1), and then report e=
rror
>>>
>>> You can examine the logic for readx_poll_timeout() in
>>> include/linux/iopoll.h to see an example of a proper timeout loop. =
You
>>> could even try to use one of the helpers there, except that your
>>> pcie_read() takes 2 args.
>>
>> I see, thanks.
>>
>>>
>>>> +	if (err) {
>>>> +		dev_err(port->dev, "pcie link training gen1 timeout!\n");
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Enable retrain for gen2. This should be configured only after
>>>> +	 * gen1 finished.
>>>> +	 */
>>>> +	status =3D pcie_read(port,
>>>> +			   PCIR_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
>>>> +	status |=3D PCIE_CORE_LCSR_RETAIN_LINK;
>>>> +	pcie_write(port, status,
>>>> +		   PCIR_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
>>>
>>> I'm not really an expert on this, but how are you actually "retrain=
ing
>>> for gen2"? Is that just the behavior of the core, that it retries a=
t the
>>> higher rate on the 2nd training attempt? I'm just confused, since y=
ou
>>> set PCIE_CLIENT_GEN_SEL_2 above, so you've already allowed either g=
en1
>>> or gen2 negotiation AFAICT, and so seemingly you might already have
>>> negotiated at gen2.
>>
>>
>> Not really. I allow the core to enable gen2, but it needs a extra
>> setting of retrain after finishing gen1. It's not so strange as it
>> depends on the vendor's design. So I have to say it fits the
>> designer's expectation.
>
> OK.
>
>>>> +	err =3D -ETIMEDOUT;
>>>> +
>>>> +	while (time_before(jiffies, timeout)) {
>>>
>>> You never reset 'timeout' when starting this loop. So you only have=
 a
>>> cumulative 500 ms to do both the gen1 and gen2 loops. Is that
>>> intentional? (I feel like this comment was made on an earlier revis=
ion
>>> of this driver, though I haven't read everything thoroughly.)
>>
>> yes, I don't have any docs to let me know how long should I wait for
>> gen1/2 to be finished. Maybe someday it will be augmented to a large=
r
>> value if finding a device actually need a longer time. But the only
>> thing I can say is that it's from my test for many pcie devices
>> currently.
>>
>>
>> Do you agree?
>
> I'm not suggesting increasing the timeout, exactly; I'm suggesting th=
at
> you should set some minimum timeout for each training loop, instead o=
f
> reusing the same deadline. i.e., something like this before the secon=
d
> loop:
>
> 	/* Reset the deadline for gen2 */
> 	timeout =3D jiffies + msecs_to_jiffies(500);


ok, I will update it.

>
> As it stands, if the first loop takes 490 ms, that leaves you only 10=
 ms
> for the second loop. And I think it'd be confusing if we ever see the
> first loop take a "long" time, and then we time out on the second --
> we'd be blaming the gen2 training for gen1's slowness.
>
>>>> +		status =3D pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
>>>> +		if (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
>>>> +		      PCIE_CORE_PL_CONF_SPEED_MASK) =3D=3D
>>>> +		      PCIE_CORE_PL_CONF_SPEED_50G) {
>>>> +			dev_dbg(port->dev, "pcie link training gen2 pass!\n");
>>>> +			err =3D 0;
>>>> +			break;
>>>> +		}
>>>> +		msleep(20);
>>>> +	}
>>>
>>> Similar problem with your timeout loop, as mentioned above. Althoug=
h I
>>> confused about what you do in the error case here...
>>>
>>>> +	if (err)
>>>> +		dev_dbg(port->dev, "pcie link training gen2 timeout, force to g=
en1!\n");
>>>
>>> ... how are you forcing gen1? I don't see any code that indicates t=
his.
>>> Should you at least be checking that there aren't some kind of trai=
ning
>>> errors, and that we settled back on gen1/2.5G?
>>
>> yes, when failing gen2,  my pcie controller will fallback to gen1
>> automatically.
>
> OK. Well maybe the text should say something like "falling back" inst=
ead
> of "force"?
>

Sounds good, will fix. Thanks.

>> if we pass the gen1 then fail to train gen2, a dbg msg here is enoug=
h
>> here to let we know that we should check the HW signal. Of course we
>> should make sure that this device supports gen2.
>
> OK.
>
> [...]
>
> Brian
>
>
>


--=20
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

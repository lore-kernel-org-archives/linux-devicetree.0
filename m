From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RESEND] media: rc: gpio-ir-recv: add support for device
 tree parsing
Date: Fri, 08 Feb 2013 20:03:55 +0100
Message-ID: <51154C1B.1030604@samsung.com>
References: <1359400023-25804-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1360137832-13086-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <51125F44.3050603@samsung.com> <5112905E.3020400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <5112905E.3020400@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mauro Carvalho Chehab <mchehab@redhat.com>, Benoit Thebaudeau <benoit.thebaudeau@advansee.com>, David Hardeman <david@hardeman.nu>, Trilok Soni <tsoni@codeaurora.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/06/2013 06:18 PM, Sebastian Hesselbarth wrote:
>>> +Optional properties:
>>> +    - linux,allowed-rc-protocols: Linux specific u64 bitmask of al=
lowed
>>> +        rc protocols.
>>
>> You likely need to specify in these bindings documentation which bit
>> corresponds to which RC protocol.
>>
>> I'm not very familiar with the RC internals, but why it has to be
>> specified statically in the device tree, when decoding seems to be
>> mostly software defined ? I might be missing something though..
>=20
> Sylwester,
>=20
> I am not familiar with RC internals either. Maybe somebody with more
> insight in media/rc can clarify the specific needs for the rc subsyst=
em.
> I was just transferring the DT support approach taken by gpio_keys to
> gpio_ir_recv as I will be using it on mach-dove/cubox soon.
>=20
>> Couldn't this be configured at run time, with all protocols allowed
>> as the default ?
>=20
> Actually, this is how the internal rc code works. If there is nothing
> defined for allowed_protocols it assumes that all protocols are suppo=
rted.
> That is why above node properties are optional.
>=20
> About the binding documentation of allowed_protocols, rc_map, or the
> default behavior of current linux code, I don't think they will stay
> in-sync for long. I'd rather completely remove those os-specific prop=
erties
> from DT, but that hits the above statement about the needs of media/r=
c
> subsystem.

I think the bindings could define the bitmask, independently of the
RC code. I suppose it is correct to have a list of protocols defined
this way. Since, as Mauro pointed out, it is needed for some hardware
devices that support only selected protocols.
Then you could probably drop the 'linux,' prefix, but I'm not 100% sure
about it.

> Actually, I am not assigning the parsed gpio_ir_recv_platform_data to
> pdev->dev.platform_data but pdata ptr instead. Either I don't see the
> difference in pointer assignments between your code and mine or you
> were mislead from struct gpio_ir_recv_platform_data above.

Sorry, you're right. I think I was just trying to be to quick with this
review.. Your code is correct, however I would probably avoid the ERR_P=
TR()
pattern as much as possible.

> Anyway, I agree to test for pdev->dev.of_node and call gpio_ir_recv_p=
arse_dt
> if set.

--
Regards,
Sylwester




--=20
Sylwester Nawrocki
=EC=8B=A4=EB=B2=A0=EC=8A=A4=ED=84=B0 =EB=82=98=EB=B8=8C=EB=A1=9C=EC=B8=A0=
=ED=82=A4
Samsung Poland R&D Center

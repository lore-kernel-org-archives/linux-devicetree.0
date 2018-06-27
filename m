Return-Path: <SRS0=bntt=JN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:23936 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934304AbeF0Mcv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Jun 2018 08:32:51 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
In-Reply-To: <CADb+VZJVtfgSDD+7F1J6p2YG0dguN7BhP=bzz3r8jO7FT7dk8w@mail.gmail.com>
References: <20180531104710.23965-1-mgautam@codeaurora.org> <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org> <CADGp=Qc8EEHEHiUZA2W9x67Micy-af5xND6Mb-0f+387TvMGeQ@mail.gmail.com> <c13e4dae-aba3-727a-9242-a968af450794@codeaurora.org> <CADGp=QdjwY=9C26NtehXLk5V=k7f1fqorzQcx98Gtc4jK0hc+A@mail.gmail.com> <CADb+VZKtAspuvO64FVEBHUbcB0Nr57jWpBmpS5GfCE+QKD4CcA@mail.gmail.com> <87r2ksshod.fsf@linux.intel.com> <CADb+VZJVtfgSDD+7F1J6p2YG0dguN7BhP=bzz3r8jO7FT7dk8w@mail.gmail.com>
Date: Wed, 27 Jun 2018 15:30:12 +0300
Message-ID: <87in64s97v.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
To: Pierre LE MAGOUROU <plemagourou@softbankrobotics.com>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Julien Massot <jmassot@softbankrobotics.com>, Manu Gautam <mgautam@codeaurora.org>, andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Pierre LE MAGOUROU <plemagourou@softbankrobotics.com> writes:
>> >> Thanks a lot,
>> >> I will test this branch.
>> >>
>> >>
>> > I just tested USB gadget with this branch on the db820c.
>> >
>> > If I activate a USB composite gadget device with EEM function, I can s=
ee
>> > the 'usb0' Ethernet interfaces on the device and on the host and I can
>> ping
>> > the db820c from the host.
>> > When I create a USB composite gadget device with UAC2 function, I can =
see
>> > the audio cards on host and device but cannot play or record any sound.
>> >
>> > While looking at dwc3 traces with Ftrace, I noticed that the dwc3 driv=
er
>> is
>> > stuck on wait_event_lock_irq() in dwc3_gadget_ep_dequeue() function wh=
en
>> I
>> > use UAC2 gadget.
>>
>> can you share tracepoint data?
>>
>>
> Here are the trace results when I start the UAC2 gadget device (all dwc3
> functions and events are activated) : https://pastebin.com/NBP3tM8N
> The last line you see "before wait_event EP_END_TRANSFER_PENDING" is a
> trace_printk I added just before wait_event_lock_irq(). I also have a
> trace_printk after the wait_event_lock_irq() that is never called.

looks like we need to do away with the wait_event_lock_irq()
call. usb_ep_dequeue() can be called from within the controller's
interrupt handler, so we can't rely on wait_event_lock_irq(). I guess
the best thing here would be to mark TRBs as dirty (and not increment
dequeue pointer), so they aren't reused by accident, then let endpoint
continue processing. Once command completion interrupt fires, we
increment dequeue pointer.

This should work better, I suppose. Do you want a shot at implementing
this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlszg1QACgkQzL64meEa
mQaKhw/+Nx3JkblFpUbJs5FeLvh2jBpLIbgtNDaZJJhiPbQ8e1S29j4G7JJWs54h
omWoR3IlH0NeRrgfxZVGeNHgr1W/8L3zQDzNDShwHcIAiihL4wgdeJG0IUrUu57s
puiHMH6rG0CIpYaw1lIaD1zT6Ei3HK0dJibPhSD3fn6mrDF0pdqXeeaF9GsCpcI6
rQGSOZ6sYomdC2XbodwRtqfHaZD0yBmG16gTknbxDOs+Uavp5MIRUstq+DJvxM6b
VEJLcAtpzAtGiz3Szym2MJDKqtZxMSHUNNeDTWQYoEqs06Ut1Yq6sUcGFLNYtGCl
awIH6TGRSGl2EhNEeHTuipLSKIy9Zp4+1v60XHIgMhrLNt7vD3Ig2p97UHSFfTLK
IlGUlWySUA16x/IhMv/0X2KX8NvWK9Bpla34tkI7+5Chutd9Olb1DpvERJrnWLiW
jIKUK1Ba6YfPwMI+oW6dqqTVMY4p6XZ/+T9HVTEoX4oog9vLS9L6nVI+hfSfSwh1
eTUnxuZGL4i1nbSTAjEwZyUJsyve/EKqCyLOhPvJwZxXNjSJxQqIoASBpAUoESen
+XgC9XMgkvGpheEPv5zD6b2PqSdd/zlnJe2Qg19B6TT66xE5eqnbfK6FBlzMbruH
Woeoa+uUOsiogSVtWlZhOSkK+9wGU+hx5T8efNDaRcJSakXYtvM=
=Rb2l
-----END PGP SIGNATURE-----
--=-=-=--

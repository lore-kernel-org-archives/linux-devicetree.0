From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: Berlin: USB support
Date: Mon, 09 Jun 2014 12:14:43 +0200
Message-ID: <53958913.8080708@gmail.com>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com> <20140609043019.GA32255@shlinux1.ap.freescale.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140609043019.GA32255-KgLukfWpBlCctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, =?ISO-8859-1?Q?Antoine_T=E9n?= =?ISO-8859-1?Q?art?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/09/2014 06:30 AM, Peter Chen wrote:
> On Thu, Jun 05, 2014 at 05:48:37PM +0200, Antoine T=E9nart wrote:
>> This series adds the support for the Marvell Berlin USB controllers,
>> the USB PHYs and also adds a reset controller.
>>
>> The reset controller is used by the USB PHY driver and shares the
>> existing chip controller node with the clocks and one pin controller=
=2E
>>
>> The Marvell Berlin USB controllers are host only on the BG2Q and are
>> compatible with USB ChipIdea. We here add a glue to use the availabl=
e
>> common functions for this kind of controllers. A USB PHY driver is a=
lso
>> added to control the PHY.
[...]
>=20
> I am fine with 6/9, 7/9, will queue them if no other objections.
>=20

Thanks Peter,

we are early in the cycle and I feel there will be a v2 of the
chipidea stub. IMHO, controlling the vbus regulator should not
be business of the phy driver, so ci will have to deal with it.

Anyways, good to know you are fine with it already!

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

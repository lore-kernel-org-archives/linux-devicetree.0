From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] uio/pdrv_genirq: Add OF support
Date: Thu, 31 Mar 2011 13:48:32 -0600
Message-ID: <AANLkTin6iSVQtKo602hceod+4=cVUMG=GR7cCZvHg4nO@mail.gmail.com>
References: <1301574600-4861-1-git-send-email-monstr@monstr.eu>
 <1301574600-4861-2-git-send-email-monstr@monstr.eu> <20110331124925.GA2202@pengutronix.de>
 <4D948189.9070606@monstr.eu> <20110331170321.GA2734@local>
 <4D94C09B.4070506@monstr.eu> <20110331192302.GD2734@local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110331192302.GD2734@local>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Michal Simek <monstr@monstr.eu>, Wolfram Sang <w.sang@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@linutronix.de, gregkh@suse.de
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2011 at 1:23 PM, Hans J. Koch <hjk@hansjkoch.de> wrote:
> On Thu, Mar 31, 2011 at 07:57:47PM +0200, Michal Simek wrote:
>> Hans J. Koch wrote:
>> >On Thu, Mar 31, 2011 at 03:28:41PM +0200, Michal Simek wrote:
>> >>>>+ =A0 =A0 =A0 =A0 uioinfo->name =3D pdev->dev.of_node->name;
>> >>>>+ =A0 =A0 =A0 =A0 /* Use version for storing full IP name for id=
entification */
>> >>>>+ =A0 =A0 =A0 =A0 uioinfo->version =3D pdev->dev.of_node->full_n=
ame;
>> >>>I don't think this is apropriate, but will leave that to Hans.
>> >>I was thinking what to add and I choose full_name because I can re=
ad
>> >>this value and identify which UIO is this device.
>> >>I know that there should be version but there is no version string=
 in DTS.
>> >
>> >The purpose of uio_info->version is to give the userspace part of t=
he driver
>> >additional information. Kernel part and userspace part might be dev=
eloped
>> >independently, and there should be a chance for the userspace part =
to find
>> >out if a certain feature is already supported by the kernel part wi=
thout
>> >having to do dirty kernel version checks.
>> >
>> >So, uio_info->version is an information about the driver, not the h=
ardware.
>> >
>> >Example: You write a UIO driver for a chip you use in a project. Yo=
u don't
>> >need all the functionality of that chip. One year later you need ad=
ditional
>> >chip functionality, and it turns out that you have to do certain
>> >initializations in the kernel part. Your new userspace will need th=
e new
>> >kernel driver, but there are lots of older kernels around in your c=
ustomers
>> >devices. In that case, your userspace part can simply check the ver=
sion
>> >string in sysfs and require at least your new version.
>>
>> I understand reasons but this information is not in device tree and
>> it must be setup.
>> Grant suggested compatible string but it is not the best option too.
>
> In uio_pdrv_genirq, uio_info->version is hardcoded in platform data. =
Hardware
> initialization can also take place in the same platform specific file=
, which
> is common practice on archs like ARM. Therefore, a driver specific ve=
rsioning
> can make sense for UIO, even if the driver code itself doesn't change=
=2E
>
> If you have no equivalent for that in device tree, you should create =
a new
> generic driver (uio_of_genirq?) that simply doesn't support this kind=
 of
> versioning.

I'd avoid that.  Current trend is to move away from separate
of-specific data because the driver is essentially identical other
than the data source being different (platform_data vs. a device node
pointer).

g.

From: "ABRAHAM, KISHON VIJAY" <kishon@ti.com>
Subject: Re: [RFC PATCH v2 1/2] drivers: misc: omap: add a new driver for ocp2scp
Date: Mon, 25 Jun 2012 11:09:54 +0530
Message-ID: <CAAe_U6+dkiQw-i93pFapt6qKrArzaQoE8X3GjDzUDraziG8B2Q@mail.gmail.com>
References: <1340370942-23201-1-git-send-email-kishon@ti.com>
	<1340370942-23201-2-git-send-email-kishon@ti.com>
	<20120623044445.GA2993@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120623044445.GA2993@kroah.com>
Sender: linux-doc-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, linux@arm.linux.org.uk, arnd@arndb.de, b-cousson@ti.com, rnayak@ti.com, tony@atomide.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, balbi@ti.com
List-Id: devicetree@vger.kernel.org

Hi Greg,

On Sat, Jun 23, 2012 at 10:14 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> On Fri, Jun 22, 2012 at 06:45:41PM +0530, Kishon Vijay Abraham I wrot=
e:
>> Adds a new driver _ocp2scp_.
>
> That's not what you called this driver in the patch below :(
>
>> This driver takes the responsibility of creating
>> all the devices that is connected to OCP2SCP. In the case of OMAP4, =
USB2PHY
>> is connected to ocp2scp.
>>
>> This also includes device tree support for ocp2scp driver and
>> the documentation with device tree binding information is updated.
>
> Can't this live where the scp drivers live? =A0Actually, where is tha=
t at?
> Do we have scp drivers?
AFAIK, there isn't any driver for scp. But we have a driver for ocp
and it is present at arch/arm/mach-omap2/omap_l3_noc.c

Thanks
Kishon

From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device naming based on device tree
Date: Sat, 13 Apr 2013 13:48:38 +0100
Message-ID: <20130413124838.EADC63E2249@localhost>
References: <CAAXf6LVDGC_VszCqz992SmMhM6r2w3_4zLL=NkCuzJ8ep7kiMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAAXf6LVDGC_VszCqz992SmMhM6r2w3_4zLL=NkCuzJ8ep7kiMg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thomas De Schampheleire <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Ronny Meeus <Ronny.Meeus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Jan 2013 11:25:26 +0100, Thomas De Schampheleire <patrickdepinguin+devicetree-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
> 
> I'm trying to find a proper way for userspace to determine which
> devices to talk to. Say you have 4 SPI devices that are registered
> against spidev (the userspace SPI handling driver). The device tree
> obviously knows which device is which (e.g. a temperature sensor, a
> memory device, an actuator, ...) but userspace does not. In the case
> of SPI, it sees things like:
>     /sys/class/spidev/spidev32766.1/
> or worse
>     /sys/devices/ffe000000.soc/ffe110000.spi/spi32766.1
> but these are too specific.
> 
> The same problem occurs for devices using i2c-dev, uio, mtd, ...
> 
> For uio, it's possible to determine which device i (i.e. the userspace
> program needs to know that a) the device is an SPI devices which by
> checking the /sys/class/uio/uioX/name files.
> For mtd it is possible to do something similar by strategically
> choosing the mtd partition descriptions and creating device nodes or
> links based on that information.
> 
> Basically, I'm looking for a way to give device tree nodes a name, so
> that I can easily access or create devices like /dev/tempsensor0,
> /dev/actuator, /dev/serialnum_memory, etc. Ideally such a mechanism is
> bus-agnostic: on one board the temperature sensor may be using SPI, on
> another I2C.
> 
> I assume this is what udev is for, but I'm not sure if it fixes my
> problem. In order to name/rename devices with udev, there need to be
> rules, and these rules are part of userspace, I cannot dictate them
> from the device tree. In an embedded world, you may have three boards
> with the same userspace but with different hardware configurations and
> thus different device trees.

Yes, every time a new device is added to /sys/devices, a uevent will be
issued that lets udev know that a new device is ready to be handled. The
data associated with the uevent is exported via the 'uevent' attribute
in the new device.

The uevent attribute should have enough information to identify which
dt node is associated with the device. Check the OF_FULLNAME value in
uevent, and also the OF_ALIAS_* values.

g.

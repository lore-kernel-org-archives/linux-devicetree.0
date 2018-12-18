From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 2/2] misc: hx8837: add a HiMax HX8837 display controller
 driver
Date: Tue, 18 Dec 2018 16:28:05 +0100
Message-ID: <9e501c50ed5e9a965f7cbedd7079c24d2d95a352.camel@v3.sk>
References: <20181112023929.650002-1-lkundrak@v3.sk>
         <20181112023929.650002-2-lkundrak@v3.sk> <20181127074140.GB13965@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127074140.GB13965@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-11-27 at 08:41 +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 12, 2018 at 03:39:29AM +0100, Lubomir Rintel wrote:
> > HiMax HX8837 is a display controller used on OLPC platforms. It controls
> > backlight and is able to capture and freeze a frame when the LCD controller
> > (and the rest of the plaform) is powered off.
> > 
> > This driver is based on the same code as drivers/staging/olpc_dcon.
> > I modernized it to use managed GPIO, device-tree bindings, sysfs attribtue
> > groups, essentially fixing the staging driver's TODO.
> 
> You are creating custom sysfs files, with no Documentation/ABI/ update
> for us to know what those files are or how they are used :(
> 
> Why do you need custom sysfs files in the first place?  Isn't there
> already an api for this type of device in the kernel?

I am actually not sure. I certainly didn't find anything similar.

I've later discovered that this should perhaps be a DRM encoder driver,
because it sits between the LCDC and the panel; I'm submitting an
updated RFC version to the dri list.

Perhaps the color swizzling and frame freezing functionality that's
exposed via sysfs in this version could be exposed as a DRI property
instead.

> 
> thanks,
> 
> greg k-h

Lubo
